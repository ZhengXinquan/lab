<?php
//header("Content-type: text/html; charset=utf-8");
error_reporting(E_ERROR | E_PARSE);
class localInfo {
	public $local_ip;
	public $location;
	public $local_time;
	public function __construct() {
		$this->local_time=date("Y-m-d H:i:s");
		$unknown = 'unknown';
		if (isset($_SERVER['HTTP_X_FORWARDED_FOR']) && $_SERVER['HTTP_X_FORWARDED_FOR'] && strcasecmp($_SERVER['HTTP_X_FORWARDED_FOR'], $unknown)) {
			$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
		} elseif (isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], $unknown)) {
			$ip = $_SERVER['REMOTE_ADDR'];
		}
		/*
		 处理多层代理的情况
		 或者使用正则方式：$ip = preg_match("/[\d\.]{7,15}/", $ip, $matches) ? $matches[0] : $unknown;
		 */
		if (false !== strpos($ip, ','))
			$ip = reset(explode(',', $ip));
		
//		 if(!empty($_SERVER['<a href="https://www.baidu.com/s?wd=HTTP_CLIENT_IP&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1dbnAwbuWN-PAPBP1n3mWIW0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnHTvn1DsnH6snHcknHndPHcY" target="_blank" class="baidu-highlight">HTTP_CLIENT_IP</a>']))
//  {
//      $ip = $_SERVER['<a href="https://www.baidu.com/s?wd=HTTP_CLIENT_IP&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1dbnAwbuWN-PAPBP1n3mWIW0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnHTvn1DsnH6snHcknHndPHcY" target="_blank" class="baidu-highlight">HTTP_CLIENT_IP</a>'];
//  }
//  else if(!empty($_SERVER["HTTP_X_FORWARDED_FOR"]))
//  {
//      $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
//  }
//  else if(!empty($_SERVER["REMOTE_ADDR"]))
//  {
//      $ip = $_SERVER["REMOTE_ADDR"];
//  }
//  else
//  {
//      $ip = '';
//  }
//  preg_match("/[\d\.]{7,15}/", $ip, $ips);
//  $cip = isset($ips[0]) ? $ips[0] : 'unknown';
//  unset($ips);

		$this -> local_ip = $ip;

		$timeout = array('http' => array('timeout' => 3//设置一个超时时间，单位为秒
		));
		$ctx = stream_context_create($timeout);
		$response = file_get_contents('http://ip.taobao.com/service/getIpInfo.php?ip=' . $ip, 0, $ctx);
		$result = json_decode($response);
		if ($result -> data -> city) {
			$this -> location = $result -> data -> city;
		} elseif ($result -> data -> country) {
			$this -> location = $result -> data -> country;
		} else {
			$this -> location = "Mars";
		}
		if($this -> location=="内网IP"){
			$this -> location = "Mars";
		}
	}
}
?>