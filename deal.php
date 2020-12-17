<?php
  header('Content-Type: application/json;charset=utf-8');
  require_once("connMysql.php");
  if ($_SERVER['REQUEST_METHOD'] == "POST") {
      $area = $_POST['area']; // 取得 ajax 傳過來的值
      $jarray = array(); // 使用array儲存結果，再以json_encode一次回傳
      $name_query = "SELECT com_a FROM committee_a WHERE com_area = $area";
      $res_name = $db_link -> query($name_query);
      $i = 0;
      while ($row = $res_name -> fetch_array(MYSQLI_ASSOC)) {
          $jarray[] .= $row["com_a"]; // 將名單放進陣列
      }
      echo json_encode($jarray); // 轉為json格式傳遞
  }
?>

