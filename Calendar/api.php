<?php
ini_set("display_errors", "On"); //打开错误提示
ini_set("error_reporting", E_ALL); //显示所有错误
header("Access-Control-Allow-Origin: *");
ini_set('session.cookie_path', '/');
ini_set('session.cookie_domain', '.nanshanqiao.com');
ini_set('session.cookie_lifetime', '1800');
header("Content-type: text/html; charset=utf-8");


if (isset($_REQUEST['info'])) {
    require 'class.Calendar.php';
    $Calendar = new Calendar();
    $postInfo = $_REQUEST['info'];
    switch ($postInfo) {
        case 'son':
            if (isset($_REQUEST['y']) and isset($_REQUEST['m']) and isset($_REQUEST['d'])) {
                $re = $Calendar->solar2lunar($_REQUEST['y'], $_REQUEST['m'], $_REQUEST['d']);
                $json_data = array('tip' => 1, 'd' => $re);
                echo json_encode($json_data);
            } else {
                $json_data = array('tip' => 0, 'd' => 'not y-m-d');
                echo json_encode($json_data);
            }
            break;
        case 'moon':
            if (isset($_REQUEST['y']) and isset($_REQUEST['m']) and isset($_REQUEST['d'])) {
                $isRunYue =   !!isset($_REQUEST['r']);
                $re = $Calendar->lunar2solar($_REQUEST['y'], $_REQUEST['m'], $_REQUEST['d'],  $isRunYue);
                $json_data = array('tip' => 1, 'd' => $re);
                echo json_encode($json_data);
            } else {
                $json_data = array('tip' => 0, 'd' => 'not y-m-d');
                echo json_encode($json_data);
            }
            break;
        default:
            $json_data = array('tip' => 0, 'd' => 'not info');
            echo json_encode($json_data);
    }
}
