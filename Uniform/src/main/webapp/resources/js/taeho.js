/**
 * 
 */
var num;
var num2;
$(function() {
	
	$("#shareBtn").on("click",function(){
		console.log("공유 등록 버튼 클릭!!");
		location.href="/uniform/goShare"
	});
	
	$("#imdeBtn").on("click",function(){
		console.log("임대 버튼 클릭 !!");
		location.href="/uniform/goImde";
	});

	/*
	 * var star1 = $("#firstBestShareStar").val(); var star2 =
	 * $("#secondBestShareStar").val();
	 * 
	 * console.log("첫번재 공유 이미지의 star :" + star1); // 8 평균값 console.log("두번재 공유
	 * 이미지의 star :" + star2); // 5
	 */

	var result = $(".stardiv");

	result.each(function(index, item) {

		index = index + 1;

		var num = $("#bestShareStar" + index).val();
		var num2 = $("#bestImdeStar" + index).val();

		console.log("num:" + num);
		console.log("num 2:" + num2);

		var width = num * 15;
		var width2 = num2 * 15;
		console.log(width);
		console.log(width2);

		$("#bestShareStar" + index).next().find(".star-input>.input").css(
				"background-position", "0 bottom").css("width", width + "px")
				.css("z-index", "100");

		$("#bestImdeStar" + index).next().find(".star-input>.input").css(
				"background-position", "0 bottom").css("width", width2 + "px")
				.css("z-index", "100");

	});

	$(window).resize(function() {
		var windowSize = $(window).width() + 17;
		console.log(windowSize);
		if (windowSize <= 900) {

			$(".profile-div").removeClass("col-md-6");
			$(".profile-div").addClass("col-md-12");
		} else {
			$(".profile-div").addClass("col-md-6");
			$(".profile-div").removeClass("col-md-12");
		}
	});

	var operForm = $("#operForm");
	var typeChoic = $("#typeChoice");

	// 수정 버튼 클릭시 데이터를 회원정보 수정 뷰로 보내줌
	$("button[data-oper='modify']").click(function(e) {
		operForm.attr("action", "/uniform/updateMember").submit();
		console.log("수정버튼 클릭");

	});

	/*
	 * ----------------날짜비교 (오늘 날짜 보다 전 날짜는 선택 불가능, 끝날짜가 시작날짜보다 전일 수
	 * 없음)----------------
	 */
	var currentDate = $("#currentDate").val();

	console.log("taeho.JS");
	console.log(currentDate);

	var splitDate = currentDate.split('-');

	var currentYear = splitDate[0];
	var currentMonth = splitDate[1];
	var currentDay = splitDate[2];

	console.log("현재 년도 :" + currentYear);
	console.log("현재 월 :" + currentMonth);
	console.log("현재 일:" + currentDay);

	$("#inputFirstDate, #inputLastDate").datepicker({
		minDate : 0,
		dateFormat : 'yy-mm-dd'

	});

	$("#inputFirstDate").change(function() {

		var firstDate = $("#inputFirstDate").val();

		var splitSelectDate = firstDate.split('-');

		var selectYear = splitSelectDate[0];
		var selectMonth = splitSelectDate[1];
		var selectDay = splitSelectDate[2];

		console.log(selectYear);
		console.log(selectMonth);
		console.log(selectDay);

		if (selectYear < currentYear) {
			alert("선택할 수 없는 날짜 입니다.");
			$("#inputFirstDate").val("");

		} else if (selectMonth < currentMonth) {
			alert("선택할 수 없는 날짜 입니다.");
			$("#inputFirstDate").val("");

		} else if (selectMonth == currentMonth && selectDay < currentDay) {
			alert("선택할 수 없는 날짜 입니다.");
			$("#inputFirstDate").val("");

		} else {
			return true;
		}

	});

	$("#inputLastDate").change(
			function() {

				var lastDate = $("#inputLastDate").val();

				var splitSelectDate = lastDate.split('-');

				var selectYear = splitSelectDate[0];
				var selectMonth = splitSelectDate[1];
				var selectDay = splitSelectDate[2];

				console.log(selectYear);
				console.log(selectMonth);
				console.log(selectDay);

				var firstDate = $("#inputFirstDate").val();

				var splitFirstSelectDate = firstDate.split('-');

				var selectFirstYear = splitFirstSelectDate[0];
				var selectFirstMonth = splitFirstSelectDate[1];
				var selectFirstDay = splitFirstSelectDate[2];

				console.log("selectFirstYear :" + selectFirstYear);
				console.log("selectFirstYear :" + selectFirstMonth);
				console.log("selectFirstYear :" + selectFirstDay);

				if (selectYear < currentYear) {
					alert("선택할 수 없는 날짜 입니다.");
					$("#inputLastDate").val("");
					return false;
				} else if (selectMonth < currentMonth) {
					alert("선택할 수 없는 날짜 입니다.");
					$("#inputLastDate").val("");
					return false;
				} else if (selectDay < currentDay
						&& selectMonth == currentMonth) {
					alert("선택할 수 없는 날짜 입니다.");
					$("#inputLastDate").val("");
					return false;
				} else if (selectYear < selectFirstYear) {
					alert("끝 날짜가 시작 날짜보다 이전일 수 없습니다. ");
					$("#inputLastDate").val("");
					return false;
				} else if (selectMonth < selectFirstMonth) {
					alert("끝 날짜가 시작 날짜보다 이전일 수 없습니다. ");
					$("#inputLastDate").val("");
					return false;
				} else if (selectDay < selectFirstDay
						&& selectMonth == selectFirstMonth) {
					alert("끝 날짜가 시작 날짜보다 이전일 수 없습니다. ");
					$("#inputLastDate").val("");
					return false;
				} else {
					return true;
				}

			});

	/*--날짜비교 끝--*/

	/* 검색버튼을 클릭했을 경우 이벤트 */

	$("#btnSelect").on(
			"click",
			function(e) {
				console.log($("#inputLocation").val());
				e.preventDefault();
				if ($("#typeChoice").val() == "select"
						|| $("#inputLocation").val() == "") {
					alert("위치와 종류는 필수 선택 항목입니다.");
					return;
				} else {
					$("#select_form").submit();
				}
			});

	/* 핫토픽 프로필 등록 */
	var firstBestShareProfileIP = $("#firstBestShareProfileIP").val();
	var secondBestShareProfileIP = $("#secondBestShareProfileIP").val();
	var thirdBestShareProfileIP = $("#thirdBestShareProfileIP").val();

	var firstBestImdeProfileIP = $("#firstBestImdeProfileIP").val();
	var secondBestImdeProfileIP = $("#secondBestImdeProfileIP").val();
	var thirdBestImdeProfileIP = $("#thirdBestImdeProfileIP").val();

	if (firstBestShareProfileIP == "") {
		$("#firstBestShareProfile").css("background-image",
				"url(/resources/images/default.png)");
	} else {
		$("#firstBestShareProfile").css("background-image",
				"url(" + firstBestShareProfileIP + ")");
	}

	if (secondBestShareProfileIP == "") {
		$("#secondBestShareProfile").css("background-image",
				"url(/resources/images/default.png)");
	} else {
		$("#secondBestShareProfile").css("background-image",
				"url(" + firstBestShareProfileIP + ")");
	}

	if (thirdBestShareProfileIP == "") {
		$("#thirdBestShareProfile").css("background-image",
				"url(/resources/images/default.png)");
	} else {
		$("#thirdBestShareProfile").css("background-image",
				"url(" + firstBestShareProfileIP + ")");
	}

	if (firstBestImdeProfileIP == "") {
		$("#firstBestImdeProfile").css("background-image",
				"url(/resources/images/default.png)");
	} else {
		$("#firstBestImdeProfile").css("background-image",
				"url(" + firstBestImdeProfileIP + ")");
	}

	if (secondBestImdeProfileIP == "") {
		$("#secondBestImdeProfile").css("background-image",
				"url(/resources/images/default.png)");
	} else {
		$("#secondBestImdeProfile").css("background-image",
				"url(" + secondBestImdeProfileIP + ")");
	}

	if (thirdBestImdeProfileIP == "") {
		$("#thirdBestImdeProfile").css("background-image",
				"url(/resources/images/default.png)");
	} else {
		$("#thirdBestImdeProfile").css("background-image",
				"url(" + thirdBestImdeProfileIP + ")");
	}

});
