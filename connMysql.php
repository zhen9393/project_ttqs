<?php
    date_default_timezone_set("Asia/Taipei");
    error_reporting(E_ALL ^ E_DEPRECATED ^ E_NOTICE);//顯示錯誤訊息的型別
    //資料庫主機設定
    $db_host = "localhost";
    $db_username = "root";
    $db_password = "";
    $db_name = "team_1";
    //連線資料庫
    $db_link = @new mysqli($db_host, $db_username, $db_password, $db_name);
    //錯誤處理
    if ($db_link->connect_error != "") {
        echo "資料庫連結失敗！";
    } else {
        //設定字元集與編碼
        $db_link->query("SET NAMES 'utf8'");
    }