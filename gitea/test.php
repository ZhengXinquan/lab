<?php
header("Content-type: text/html; charset=utf-8");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
ini_set("display_errors", "On"); //打开错误提示
ini_set("error_reporting", E_ALL); //显示所有错误



$secret_key = '667788';


$repositoryName = 'nodeServe';


// $cmd = "cd C:\inetpub\\" . $repositoryName . "  && \"C:\Program Files\\nodejs\\npm.cmd\" -v  && \"C:\Program Files\\nodejs\\npm.cmd\" -i";
// echo $cmd;
// $output1 = shell_exec($cmd);

// $output1 = shell_exec("C:\inetpub\\" . $repositoryName . "\\" . $repositoryName . ".bat");

// // 显示所有文件和目录的列表

// echo "<br/><pre> =>" . $output1 . "</pre>";

echo $repositoryName;
