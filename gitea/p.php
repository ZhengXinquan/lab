<?php
header("Content-type: text/html; charset=utf-8");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
ini_set("display_errors", "On"); //打开错误提示
ini_set("error_reporting", E_ALL); //显示所有错误

if (isset($_REQUEST['gr'])) {
    $repositoryName = $_REQUEST['gr'];

    $dir = $repositoryName;

    echo $repositoryName;

    $cmd = "cd C:\project\\" . $dir . "  && C:\MyProgram\Git\cmd\git.exe --version && C:\MyProgram\Git\cmd\git.exe remote set-url origin http://gr:123qwe@nanshanqiao.com:3000/gr/" . $repositoryName . ".git  && C:\MyProgram\Git\cmd\git.exe pull --force origin master:master";
    if ($repositoryName == "demo") {
        $cmd .= " && \"C:\Program Files\\nodejs\\npm.cmd\" install && \"C:/Program Files/nodejs/npm.cmd\" run build";
    }
    echo $cmd;
    $output1 = shell_exec($cmd);

    // 显示所有文件和目录的列表

    echo "<pre> =>" . $output1 . "</pre>";
} else {
    echo 'request repositoryName and dir';
}
