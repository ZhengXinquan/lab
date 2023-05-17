<?php

/**
 * day 日期备忘录 项目
 * 
 * 发送邮件
 * 
 * 使用window计划任务，执行test.bat，调用此send.php
 * 
 * 依赖 day 项目的 class.sql.php 和 class.myDays.php，数据支持
 * 依赖 class.Calendar.php  ，日期转换支持
 * 依赖 ../PHPMailer/Email.php ， 邮件服务支持
 */
header("Content-type: text/html; charset=utf-8");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
header("Access-Control-Allow-Origin: *");
ini_set("display_errors", "On"); //打开错误提示
ini_set("error_reporting", E_ALL); //显示所有错误  E_ERROR | E_WARNING | E_PARSE  E_ALL
ini_set('session.cookie_path', '/');
ini_set('session.cookie_domain', '.nanshanqiao.com');
ini_set('session.cookie_lifetime', '1800');

require_once("../../db/class.sql.php");
$connectSqlDays = new sql('days');
$connectSqlUser = new sql();
require_once("../../day/dist/zz_services/class.myDays.php");
$myClassDays = new myDays($connectSqlDays);
require_once("../../lab/zz_services/class.user.php");
$myClassUsers = new user($connectSqlUser);



$sleepTime = 30; //邮件重试间隔
$sendTimes = 5; //邮件重试最大次数
if (isset($_REQUEST['info'])) {
    $sleepTime = 2;
}

$sStr = array('0' => '公历', '1' => '农历', '2' => '农历闰月');

function getDays($myDate, $s = 0)
{

    $max = 15; //提前几天提醒

    require_once("class.Calendar.php");
    $Calendar = new Calendar();

    $tArray = explode("-", $myDate);
    $yy =  $tArray[0];
    $mm =  $tArray[1];
    $dd =  $tArray[2];
    // 公历
    if ($s == 0) {
        $solar = $myDate;
    }
    // 农历
    if ($s == 1) {
        $tempArray = $Calendar->lunar2solar($yy, $mm, $dd, false);
        $solar =  $tempArray['date'];
    }
    // 农历闰月
    if ($s == 2) {
        $tempArray = $Calendar->lunar2solar($yy, $mm, $dd, true);
        $solar =  $tempArray['date'];
    }
    // 转公历后，求相差天数
    $days = (strtotime($solar) - strtotime(date("Y-m-d"), time())) / 60 / 60 / 24;

    if ($days < $max && $days >= 0) {
        return $days;
    }
    // 跨年情况
    if ($days <  0) {
        return  getDays(($yy + 1) . '-' . $mm . '-' . $dd, $s);
    }
    if ($days > 365) {
        return getDays(($yy - 1) . '-' . $mm . '-' . $dd, $s);
    }
    return false;
}

$daysResult  = $myClassDays->getNoneList();
mysqli_close($connectSqlDays->con);

$usersResult  = $myClassUsers->getNoneList();
mysqli_close($connectSqlUser->con);

if ($usersResult['tip'] == 1) {
    $user2mailObj = $usersResult['d'];
} else {
    $user2mailObj = array();
}

echo "<br><hr>daysResult<br>";
echo json_encode($daysResult['d']);
echo "<br><hr>user2mailObj<br>";
echo json_encode($user2mailObj);


if ($daysResult['tip'] == 1) {
    $d = $daysResult['d'];

    // 过滤出近 $max 天的日程
    $allEmailsDateList = array();
    foreach ($d as $x => $json) {

        $json['mail'] =  array();

        $uid = $json['uid']; //创建
        $sid = $json['suid']; //订阅
        $isPublic = $json['p']; // 0=不公开  1公开'

        $creatorEmail = null;
        if (isset($user2mailObj[$uid])) {
            $creatorEmail = $user2mailObj[$uid];
            array_push($json['mail'], $creatorEmail);
        }
        $subscriberEmail = null;
        if (isset($user2mailObj[$sid]) && $isPublic == '1') { // 有订阅者，并且 这条提醒是公开的
            $subscriberEmail = $user2mailObj[$sid];
            if ($uid != $sid && $subscriberEmail != $creatorEmail) {
                array_push($json['mail'], $subscriberEmail);
            }
        }

        $s = $json['s']; //'0:公历;1:农历;2:农历闰月'
        $t = $json['t'];  //日期
        $n = $json['n']; // name
        $c = $json['c']; // '提醒频率：0从不； 1一次； 2每年； 3每月'
        if ($c == '0') {
            // 不提醒
            continue;
        }
        // 剩余几天，不符合要求的返回false
        $left =  getDays($t, $s);
        if ($left !== false) {
            $json['l'] =  $left;
            array_push($allEmailsDateList, $json);
        } else {
            // echo  $n . '( ' . $sStr[$s] . ' ' .  $t . ' )-- 还没有到时间---' . PHP_EOL;
        }
    }
    echo "<br><hr>allEmailsDateList<br>";
    echo json_encode($allEmailsDateList);

    // 获取不重复的email数组
    $emailList = array_unique(array_values($user2mailObj));
    // 定义结果的数组结构： [{email:dayList}]
    $TEMP_EMAIL_2_DAY = array();
    foreach ($emailList as $emailValue) {
        // 从 allEmailsDateList 中 过滤出 对应 emailValue 的 项
        $temp = array_values(array_filter($allEmailsDateList,  function ($o) use ($emailValue) {
            return   in_array($emailValue, $o['mail']);
        }));
        // 对id去重复
        $temp =  uniquArr($temp, 'i');
        // 结果放入key-value中
        $TEMP_EMAIL_2_DAY[$emailValue] =   $temp;
    }

    echo "<br><hr>TEMP_EMAIL_2_DAY<br>";
    echo json_encode($TEMP_EMAIL_2_DAY);

    foreach ($TEMP_EMAIL_2_DAY as $oneEmail => $myDateList) {

        sleep(5);

        if (count($myDateList) > 0) {
            $today_to_delete = array(); //当天要删除的
            $today_list =  array(); //今天的日程
            $other_list = array(); //其它的日程
            $today_title_list = array(); //今天的日程标题
            foreach ($myDateList as $k => $json) {
                if ($json['l'] == 0) {
                    array_push($today_list, $json['n'] . ' ( ' . $sStr[$json['s']] . ' ' .   $json['t'] . ' )');
                    array_push($today_title_list, $json['n']);

                    if ($json['c'] == '1') {
                        array_push($today_to_delete, $json['i']);
                    }
                } else {
                    array_push($other_list, '<b>' . $json['l'] . '</b>  天：' . $json['n'] . ' ( ' . $sStr[$json['s']] . ' ' .   $json['t'] . ' )');
                }
            }

            // 组装email内容
            $title = "";
            $emailText = "";
            if (count($today_list) > 0) {

                $title .= '日程提醒：' . implode('，', $today_title_list);

                $emailText .= "<h4>今天</h4>";
                $emailText .= '<ul><li>' . implode('</li><li>', $today_list) . '</li></ul>';
            }
            if (count($other_list) > 0) {

                if (!$title) {
                    $title = '有' . count($other_list) . '个日程，即将到来 (' . date("Y-m-d") . ')';
                }

                $emailText .= "<h4>即将到来</h4>";
                $emailText .=  '<ul><li>' . implode('</li><li>', $other_list) . '</li></ul>';
            }


            // 发送 email
            if ($emailText != '') {

                $json_data = array('tip' => 0, 'emails' => $oneEmail, 'title' => $title, 'emailText' => $emailText);

                require_once('../PHPMailer/Email.php');
                $myEmail = new Email();

                // 最多 重试 $sendTimes 次
                $i = 0;
                $go = true;
                do {
                    $i++;
                    $json_data =   $myEmail->send($oneEmail, $title, $emailText);
                    if ($json_data['tip'] == 1) {
                        $go = false;
                    } else {
                        sleep($sleepTime);
                    }
                } while ($i < $sendTimes && $go);

                $json_data['runTimes'] = $i;
                // 结束重试

                if ($json_data['tip'] == '1') {
                    $ids = implode(',', $today_to_delete);
                    $reIds = $myClassDays->deleteIdsForCalendar($ids);
                }
            } else {
                $json_data = array('tip' => 0, 'd' => 'no days to email');
            }
        } else {
            $json_data = array('tip' => 0, 'd' => $myDateList, 'info' => 'myDateList ( selected done ) count <0');
        }
        logTxt($json_data);
    }
} else {
    $daysResult['info'] = "myDays->getNoneList err";
    $json_data = $daysResult;
    logTxt($json_data);
}


function logTxt($json_data)
{

    echo "<br><hr>json_data  test = >>>>  <br>";
    echo json_encode($json_data);
    $fileName = "test.txt";
    if (file_exists($fileName)) {
        file_put_contents($fileName, date("Y 年 m 月 d 日 H 点 i 分 s 秒") . json_encode($json_data) . PHP_EOL, FILE_APPEND);
    } else {
        file_put_contents($fileName, 'first'  . json_encode($json_data) . PHP_EOL, FILE_APPEND);
    }
}


/**
 * 二维数组根据某个字段去重
 * @param array $array  二维数组
 * @para array  去重后的数组
 */
function uniquArr($array, $item)
{
    $result = array();
    foreach ($array as $k => $val) {
        $code = false;
        foreach ($result as $_val) {
            if ($_val[$item] == $val[$item] && $val[$item] != 0) {
                $code = true;
                break;
            }
        }
        if (!$code) {
            $result[] = $val;
        }
    }
    return $result;
}
