<?php
header("Content-type: text/html; charset=utf-8");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');
ini_set("display_errors", "On"); //打开错误提示
ini_set("error_reporting", E_ALL); //显示所有错误



$secret_key = '667788';



// check for POST request
if ($_SERVER['REQUEST_METHOD'] != 'POST') {
    error_log('FAILED - not POST - ' . $_SERVER['REQUEST_METHOD']);
    exit();
}

// get content type
$content_type = isset($_SERVER['CONTENT_TYPE']) ? strtolower(trim($_SERVER['CONTENT_TYPE'])) : '';

if ($content_type != 'application/json') {
    error_log('FAILED - not application/json - ' . $content_type);
    exit();
}

// get payload
$payload = trim(file_get_contents("php://input"));

if (empty($payload)) {
    error_log('FAILED - no payload');
    exit();
}

// get header signature
$header_signature = isset($_SERVER['HTTP_X_GITEA_SIGNATURE']) ? $_SERVER['HTTP_X_GITEA_SIGNATURE'] : '';

if (empty($header_signature)) {
    error_log('FAILED - header signature missing');
    exit();
}

// calculate payload signature
$payload_signature = hash_hmac('sha256', $payload, $secret_key, false);

// check payload signature against header signature
if ($header_signature !== $payload_signature) {
    error_log('FAILED - payload signature');
    exit();
}

// convert json to array
$decoded = json_decode($payload, true);

// check for json decode errors
if (json_last_error() !== JSON_ERROR_NONE) {
    error_log('FAILED - json decode - ' . json_last_error());
    exit();
}


// success, do something
$repositoryName = $decoded['repository']['name'];
$dir = $repositoryName;
// if ($repositoryName == "nsq") {
//     $dir = "wwwroot";
// }
// if ($repositoryName == "api") {
//     $dir = "webApi";
// }


echo $repositoryName;

$cmd = "cd C:\project\\" . $dir . "  && C:\MyProgram\Git\cmd\git.exe --version && C:\MyProgram\Git\cmd\git.exe remote set-url origin http://gr:123qwe@nanshanqiao.com:3000/gr/" . $repositoryName . ".git  && C:\MyProgram\Git\cmd\git.exe pull --force origin master:master";

if ($repositoryName == "node-serve") {
    $cmd .= " && \"C:\Program Files\\nodejs\\npm.cmd\" install";
}

if ($repositoryName == "demo") {
    $cmd .= " && \"C:\Program Files\\nodejs\\npm.cmd\" install && \"C:/Program Files/nodejs/npm.cmd\" run build";
}
echo $cmd;

try {
    //code...
    $output1 = shell_exec($cmd);

    echo "<pre> =>" . $output1 . "</pre>";
} catch (\Throwable $th) {
    throw $th;
}
