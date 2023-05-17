<?php
class user
{
	public $id;
	public $uid;
	public $n;
	public $t;
	public $ct;
	public $ut;
	public $d;
	public $connectSql;
	public function __construct($connectSql)
	{
		$this->connectSql = $connectSql;
	}

	public function getNoneList()
	{
		$sql = "SELECT id,mail FROM zz_user WHERE mail IS NOT NULL AND TRIM(mail) <> ''";
		$result = mysqli_query($this->connectSql->con, $sql);
		if ($result) {
			if (mysqli_num_rows($result) >= 0) {
				$d = array();
				while ($row = mysqli_fetch_array($result)) {
					$d[$row['id']] = $row['mail'];
				}
				$json_data = array('tip' => 1, 'd' => $d);
			} else {
				$json_data = array('tip' => 0, 'd' => 'user null', 's' => 'mysqli_num_rows error');
			}
		} else {
			$json_data = array('tip' => 0, 'd' => 'user null', 's' => 'result error');
		}
		return $json_data;
	}
}
