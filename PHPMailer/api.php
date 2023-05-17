<?php
ini_set("display_errors", "On"); //打开错误提示
ini_set("error_reporting", E_ALL); //显示所有错误
if (isset($_REQUEST['info'])) {
    $postInfo = $_REQUEST['info'];
    switch ($postInfo) {
        case 'email':
            if (isset($_REQUEST['e']) and isset($_REQUEST['t']) and isset($_REQUEST['c'])) {
                $email = $_REQUEST['e'];
                $title = $_REQUEST['t'];
                $content = $_REQUEST['c'];
                require 'Email.php';
                $myEmail = new Email();
                $json_data = $myEmail->send($email, $title, $content);
                echo json_encode($json_data);
            } else {
                $json_data = array('tip' => 0, 'd' => 'not e / t / c');
                echo json_encode($json_data);
            }
            break;
    }
}
