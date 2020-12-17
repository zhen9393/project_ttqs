$(function () {
	$('#area').change(function () {
		$('#name').empty().append("<option disabled selected value=''>請先選取地區</option>");
		$.ajax({ // 利用 ajax 傳值
			url: 'deal.php', // 呼叫的網址
			method: 'POST', // 傳遞方式
			dataType: 'json',
			data: { // 要傳遞的資料
				area: $('#area').val()
			},
			success: function (res) { // server端有回傳資料
				$('#name:first-child').empty(); // 刪除原本的選項
				for (i = 0; i < res.length; i++) {
					if (i == 0) {
						$('#name').append('<option selected>' + res[i] + '</option>');
					} else {
						$('#name').append('<option>' + res[i] + '</option>');
					}
				}
			},
			error: function (xhr, status, msg) {
				console.error(xhr);
				console.error(msg);
			}
		})
	});
})