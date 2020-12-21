<?php
session_start();
require_once "connMysql.php";
//預設每頁筆數
$pageRow_records = 5;
//預設頁數
$num_pages = 1;
//若已經有翻頁，將頁數更新
if (isset($_GET['page'])) {
	$num_pages = $_GET['page'];
}
// 本頁開始記錄筆數 = (頁數-1)*每頁記錄筆數
$startRow_records = ($num_pages - 1) * $pageRow_records;
// 查詢要顯示在選單的區域資料
$area = $db_link->query("SELECT * FROM area");
// 取現在日期
$now_date = date("Y-m-d");
$date_arr = explode("-", $now_date);
$now_year = $date_arr[0];
$now_month = $date_arr[1];
$now_day = $date_arr[2];
// 設定SESSION暫存值（換頁）
if (isset($_POST["action"]) && $_POST["action"] == "search") {
	$_SESSION["action"] = $_POST["action"];
	$_SESSION["month"] = $_POST["month"];
	$_SESSION["name"] = $_POST["name"];
	header("Location: index.php");
}

$sql_query_search = "SELECT case_number.c_no, case_number.c_id, case_number.c_sign, object.ob_office, object.ob_ver, object.ob_add_c, object.ob_count, object.ob_evcount, committee_a.com_a, committee_a.com_a_addr, committee_a.com_a_mail, committee_b.com_b, committee_b.com_b_addr, committee_b.com_b_mail, assistant.ass_actual, assistant.ass_addr, assistant.ass_mail, `date`.d_date, `date`.`d_week`, `date`.`d_per`, contact.con_name, contact.con_phone,  contact.con_email, job.job_upload, job.job_closed FROM case_number JOIN committee_a ON committee_a.com_a_id = case_number.c_com_a LEFT OUTER JOIN committee_b ON committee_b.com_b_id = case_number.c_com_b LEFT OUTER JOIN assistant ON case_number.c_ass = assistant.ass_id LEFT OUTER JOIN object ON object.ob_no = case_number.c_id JOIN `date` ON `date`.`d_no` = case_number.c_id LEFT OUTER JOIN contact ON contact.con_id = object.ob_con_name LEFT OUTER JOIN job ON case_number.c_job = job.job_id";

// 若執行查詢
if ((isset($_SESSION["action"]) && $_SESSION["action"] == "search") || ($_GET["page"] && isset($_SESSION["action"]) && $_SESSION["action"] == "search")) {
	// 同時查詢月份及委員名字
	if (isset($_SESSION["month"]) && isset($_SESSION["name"])) {
		// 未加限制
		$condition_query_search = "{$sql_query_search} WHERE (d_date LIKE ? AND committee_a.com_a = ?) OR (d_date LIKE ? AND committee_b.com_b = ?) ORDER BY case_number.c_id ASC";
		// 加限制
		$limit_query_search = "{$condition_query_search} LIMIT {$startRow_records}, {$pageRow_records}";
		// 預處理
		$stmt_limit = $db_link->prepare($limit_query_search);
		$stmt_limit->bind_param("ssss", $s_month, $s_name, $s_month, $s_name);
		$s_month = "%-" . $_SESSION["month"] . "-%";
		$s_name = $_SESSION["name"];
		// 以未加限制語法查詢總筆數
		$all_RecBoard = $db_link->query("{$sql_query_search} WHERE (d_date LIKE '{$s_month}' AND committee_a.com_a = '{$s_name}') OR (d_date LIKE '{$s_month}' AND committee_b.com_b = '{$s_name}')");
		$total_rec = $all_RecBoard->num_rows;
		// 預處理執行
		$stmt_limit->execute();
		$stmt_limit->bind_result($caseno, $casecid, $csign, $oboffice, $obver, $obaddc, $obcount, $obevcount, $coma, $comaaddr, $comamail, $comb, $comabaddr, $combmail, $assactual, $assaddr, $assmail, $ddate, $dweek, $dper, $conname, $conphone, $conemail, $jobupload, $jobclosed);
		$show_month = $_SESSION["month"];
		// 只查詢月份或委員名字
	} else {
		$condition_query_search = "{$sql_query_search} WHERE d_date LIKE ? OR committee_a.com_a = ? OR committee_b.com_b = ? ORDER BY case_number.c_id ASC";
		$limit_query_search = "{$condition_query_search} LIMIT {$startRow_records}, {$pageRow_records}";
		$stmt_limit = $db_link->prepare($limit_query_search);
		$stmt_limit->bind_param("sss", $s_month, $s_name, $s_name);
		if (empty($_SESSION["month"])) { // 若沒有選擇月份
			$s_month = $_SESSION["month"];
		} else {
			$s_month = "%-" . $_SESSION["month"] . "-%";
		}
		$s_name = $_SESSION["name"];
		$all_RecBoard = $db_link->query("{$sql_query_search} WHERE d_date LIKE '{$s_month}' OR committee_a.com_a = '{$s_name}' OR committee_b.com_b = '{$s_name}'");
		$total_rec = $all_RecBoard->num_rows;
		$stmt_limit->execute();
		$stmt_limit->bind_result($caseno, $casecid, $csign, $oboffice, $obver, $obaddc, $obcount, $obevcount, $coma, $comaaddr, $comamail, $comb, $comabaddr, $combmail, $assactual, $assaddr, $assmail, $ddate, $dweek, $dper, $conname, $conphone, $conemail, $jobupload, $jobclosed);
		$show_month = $_SESSION["month"];
	}
} else { // 若未執行查詢
	// 加條件SQL語法
	$condition = "{$sql_query_search} WHERE d_date LIKE ? ORDER BY case_number.c_id ASC";
	// 加限制SQL語法
	$limit_query = "{$condition} LIMIT {$startRow_records}, {$pageRow_records}";
	$stmt_limit = $db_link->prepare($limit_query);
	$stmt_limit->bind_param("s", $s_month);
	$s_month = "%-" . $now_month . "-%";
	// 未加限制條件
	$all_RecBoard = $db_link->query("{$sql_query_search} WHERE d_date LIKE '{$s_month}'");
	$total_rec = $all_RecBoard->num_rows;
	// 加限制條件預處理執行
	$stmt_limit->execute();
	$stmt_limit->bind_result($caseno, $casecid, $csign, $oboffice, $obver, $obaddc, $obcount, $obevcount, $coma, $comaaddr, $comamail, $comb, $comabaddr, $combmail, $assactual, $assaddr, $assmail, $ddate, $dweek, $dper, $conname, $conphone, $conemail, $jobupload, $jobclosed);
	$show_month = $now_month; // 顯示月份
}
// 計算頁數（無條件進位）
$total_pages = ceil($total_rec / $pageRow_records);
if (isset($_GET["page"])) {
	$_SESSION["total"] = $total_rec - $startRow_records;
} else {
	$_SESSION["total"] = $total_rec;
}
if ($show_month < 10) {
	$show_month = substr($show_month, 1, 1);
}
?>
<!DOCTYPE html>
<html lang="zh-tw">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- CSS =============================
			Bootstrap 4.1.3
	====================================== -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="additional.css">
	<!-- FontAwesome -->
	<script src="https://kit.fontawesome.com/dbf2c17434.js" crossorigin="anonymous"></script>
	<!-- JavaScript =======================
	Bootstrap 4.1.3
	======================================= -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<!-- ajax jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>TTQS</title>
</head>

<body>
	<div align="center"><img src="logo_1211.png" class="img-fluid" alt="Responsive image"></div>
	<div id="all" class="container">
		<div class="row">
			<div class="col-lg-12 searchbar">
				<form action="" method="post" name="form1" class="table-responsive">
					<table class="conatiner">
						<tbody class="row">
							<tr class="col-lg-12 mb-3">
								<td class="">查詢
									<!-- 顯示查詢條件 -->
									<?php if (!empty($show_month)) { //當月份不是空值
										if (empty($_SESSION["name"])) { //有月份，沒名字
											echo '【<span class="clr">' . $show_month . '月</span>】的結果';
										} else {
											echo '【<span class="clr">' . $show_month . '月</span>】【<span class="clr">' . $_SESSION["name"] . '</span>】的結果';
										}
									} else { //僅有查詢名字的顯示
										echo '【<span class="clr">' . $_SESSION["name"] . '</span>】的結果';
									} ?>
								</td>
							</tr>
							<tr class="col-lg-12 row">
								<td class="col-lg-3">
									<label for="month">月份：</label>
									<select name="month" id="month">
										<option disabled selected value="">請選擇月份</option>
										<?php for ($i = 1; $i <= 12; $i++) {
											if ($i < 10) { ?>
												<option value="<?php echo '0' . $i; ?>">
													<?php echo $i . '月'; ?>
												</option>
											<?php 	} else { ?>
												<option value="<?php echo $i; ?>">
													<?php echo $i . '月'; ?>
												</option>
										<?php 	}
										} ?>
									</select>
								</td>
								<td class="col-lg-4">
									<label for="area">地區：</label>
									<select name="area" id="area">
										<option disabled selected value="">請選擇委員區域</option>
										<?php while ($row = $area->fetch_assoc()) { ?>
											<option value="<?php echo $row['a_id']; ?>">
												<?php echo $row["a_name"]; ?>
											</option>
										<?php }
										$area->close();
										?>
									</select>
								</td>
								<td class="col-lg-4">
									<label for="name">委員：</label>
									<select name="name" id="name">
										<option disabled selected value="">請先選取地區</option>
									</select>
								</td>
								<td class="col-lg-1 searchbtn">
									<input name="action" type="hidden" id="action" value="search">
									<input type="submit" id="button" value="&#xf002"> <!-- U+F002 (fontawesome icon) -->
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="col-lg-12 container">
				<div class="row justify-content-center table-responsive">
					<table class="table content">
						<thead>
							<tr>
								<th class="text-center" colspan="10">評核時程表，共<span class="clr"><?php echo $total_rec; ?></span>筆資料</th>
							</tr>
							<tr>
								<th class="d-none d-lg-table-cell">序</th>
								<th class="d-none d-lg-table-cell">案</th>
								<th class="d-none d-lg-table-cell">案號</th>
								<th class="d-lg-table-cell">受評單位/聯絡人/地點</th>
								<th class="d-lg-table-cell">評核日期</th>
								<th class="d-lg-table-cell">評核時間</th>
								<th class="d-lg-table-cell">A委員</th>
								<th class="d-lg-table-cell">B委員</th>
								<th class="d-lg-table-cell">助理</th>
								<th class="d-none d-lg-table-cell">其他</th>
							</tr>
						</thead>
						<tbody>
							<?php while ($stmt_limit->fetch()) { ?>
								<tr>
									<!-- 序 -->
									<td class="d-none d-lg-table-cell"><?php echo $_SESSION["total"]--; ?></td>
									<!-- 案 -->
									<td class="d-none d-lg-table-cell"><?php echo $casecid; ?></td>
									<!-- 案號 -->
									<td class="d-none d-lg-table-cell">
										<?php echo $caseno; ?><br><?php echo $obver; ?><br>(第<?php echo $obevcount; ?>次評核)
									</td>
									<!-- 受評單位/聯絡人/地點 -->
									<td class="d-lg-table-cell">
										<?php echo $oboffice; ?><br><?php echo $conname; ?>&nbsp;<?php echo $conphone; ?><br><a href="https://www.google.com/maps/dir/?api=1&origin=台中市東區仁和路482號&destination=<?php echo $obaddc; ?>&travelmode=driving" target="_blank">[由所]</a>&nbsp;<a href="https://www.google.com/maps/search/?api=1&query=<?php echo $obaddc; ?>&travelmode=driving" target="_blank">[由前]</a><br><?php echo $obaddc; ?><br>未上傳:<span style="color: red;font-weight: bolder;"><?php echo $jobupload; ?></span>&nbsp;未發文:<span style="color: red;font-weight: bolder;"><?php echo $jobclosed; ?></span>
									</td>
									<!-- 評核日期 -->
									<td class="d-lg-table-cell">
										<?php echo $ddate; ?><br><?php echo $dweek; ?>
									</td>
									<!-- 評核時間 -->
									<td class="d-lg-table-cell">
										<?php echo $dper; ?>
									</td>
									<!-- A委員 -->
									<td class="d-lg-table-cell">
										<?php echo $coma; ?>
										<br><?php echo $comaaddr; ?>
										<a href="https://www.google.com/maps/dir/?api=1&waypoints=台中市東區仁和路482號&destination=<?php echo $comaaddr; ?>&travelmode=driving" target="_blank">[經所]
										</a>
										<br><?php echo $comamail; ?>
									</td>
									<!-- B委員 -->
									<?php if (!empty($obcount)) { ?>
										<td class="d-lg-table-cell">
											第<?php echo $obcount; ?>次輔導
											<br><?php echo $combaddr; ?>
											<a href="https://www.google.com/maps/dir/?api=1&waypoints=台中市東區仁和路482號&destination=<?php echo $combaddr; ?>&travelmode=driving" target="_blank">[經所]
											</a>
											<br><?php echo $combmail; ?>
										<?php } else { ?>
										<td class="d-lg-table-cell">
											<?php echo $comb; ?>
											<br><?php echo $combaddr; ?>
											<a href="https://www.google.com/maps/dir/?api=1&waypoints=台中市東區仁和路482號&destination=<?php echo $combaddr; ?>&travelmode=driving" target="_blank">[經所]
											</a>
											<br><?php echo $combmail; ?>
										<?php } ?>
										</td>
										<!-- 助理 -->
										<td class="d-lg-table-cell">
											公假單-檢核
											<br><?php echo $assactual; ?>
											<br><?php echo $assaddr; ?>
											<br><?php echo $assmail; ?>
										</td>
										<!-- 其他 -->
										<td class="d-none d-lg-table-cell">
											<?php if (empty($assactual)) {
												echo '(簽名：' . $csign . ')';
											} else {
												echo '(簽名：)';
											} ?>
										</td>
								</tr>
							<?php }
							$stmt_limit->close();
							?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 顯示頁數 -->
		<nav aria-label="Page navigation example col-12">
			<ul class="pagination justify-content-center">
				<?php if ($num_pages > 1) { // 若不是第一頁顯示 
				?>
					<li class="page-item">
						<a class="page-link" href="?page=1" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<li>
						<a class="page-link" href="?page=<?php echo $num_pages - 1; ?>">
							<span aria-hidden="true">&lsaquo;</span>
						</a>
					</li>
				<?php } ?>
				<?php for ($i = 1; $i <= $total_pages; $i++) {
					if ($i == $num_pages) {
						echo '<li class="page-item"><a class="page-link">' . $i . '</a></li>';
					} else {
						echo '<li class="page-item"><a class="page-link" href="?page=' . $i . '">' . $i . '</a><input type="hidden" name="action" value="search"></li>';
					}
				} ?>
				<?php if ($num_pages < $total_pages) { // 若不是最後一頁顯示 
				?>
					<li>
						<a class="page-link" href="?page=<?php echo $num_pages + 1; ?>">
							<span aria-hidden="true">&rsaquo;</span>
						</a>
					<li class="page-item">
						<a class="page-link" href="?page=<?php echo $total_pages; ?>" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				<?php } ?>
			</ul>
		</nav>
	</div>
	<script src="option.js"></script>
</body>

</html>
<?php
$db_link->close();
?>