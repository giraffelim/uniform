/**
 * 
 */
var num;
var num2;
var str;
var str2;
var moreFlag = 1;
var myMno = $("#mno").val();
var sinchung_tbody = $(".sinchung_tbody");
var Isinchung_tbody = $(".Isinchung_tbody");
var sinchung_PagingBtn = $("#sinchung_PagingBtn"); 
var I_tableCount = 4;
var S_tableCount= 4;
var sclickCount = 0;
var iclickCount = 0;
var pageCount = 0;
var IpageCount = 0;
var size;

$(function() {
	
	
	/* 핫토픽 프로필 등록 */
	var firstBestShareProfileIP = $("#firstBestShareProfileIP").val();
	var secondBestShareProfileIP = $("#secondBestShareProfileIP").val();
	var thirdBestShareProfileIP = $("#thirdBestShareProfileIP").val();

	var firstBestImdeProfileIP = $("#firstBestImdeProfileIP").val();
	var secondBestImdeProfileIP = $("#secondBestImdeProfileIP").val();
	var thirdBestImdeProfileIP = $("#thirdBestImdeProfileIP").val();

	/*공유 등록자 프로필 사진 */ 
	
	if (firstBestShareProfileIP == "") {
		$("#firstBestShareProfile").css("background-image",
				"url(/resources/images/default.png)");
	} else {
		var profileImg = $("#firstBestImdeProfileIP").val();

		$("#firstBestShareProfile").append("<img class='bestProfileImg' src='/uniform/display?fileName="+profileImg+"'>");
		$(".bestProfileImg").css("width","3em").css("height","3em").css("border-radius","50%");
		
	}

	if (secondBestShareProfileIP == "") {
		$("#secondBestShareProfile").css("background-image",
				"url(/resources/images/default.png)");
	} else {	
		var profileImg2 = $("#secondBestShareProfileIP").val();
		
		$("#secondBestShareProfile").append("<img class='bestProfileImg' src='/uniform/display?fileName="+ profileImg2+"'>");
		$(".bestProfileImg").css("width","3em").css("height","3em").css("border-radius","50%");
	}

	if (thirdBestShareProfileIP == "") {
		$("#thirdBestShareProfile").css("background-image",
				"url(/resources/images/default.png)");
	} else {
		var profileImg3 = $("#thirdBestShareProfileIP").val();
	
		$("#thirdBestShareProfile").append("<img class='bestProfileImg' src='/uniform/display?fileName="+ profileImg3+"'>");
		$(".bestProfileImg").css("width","3em").css("height","3em").css("border-radius","50%");
	}

	/*임대 등록자 프로필 사진*/
	
	if (firstBestImdeProfileIP == "") {
		$("#firstBestImdeProfile").css("background-image",
				"url(/resources/images/default.png)");		
	} else {
		var profileImgImde = $("#firstBestImdeProfileIP").val();		
		$("#firstBestImdeProfile").append("<img class='bestProfileImg' src='/uniform/display?fileName="+ profileImgImde+"'>");
		$(".bestProfileImg").css("width","3em").css("height","3em").css("border-radius","50%");

	}

	if (secondBestImdeProfileIP == "") {
		$("#secondBestImdeProfile").css("background-image",
				"url(/resources/images/default.png)");
	} else {
		var profileImgImde2 = $("#secondBestImdeProfileIP").val();		
		$("#secondBestImdeProfile").append("<img class='bestProfileImg' src='/uniform/display?fileName="+ profileImgImde2+"'>");
		$(".bestProfileImg").css("width","3em").css("height","3em").css("border-radius","50%");
	}

	if (thirdBestImdeProfileIP == "") {
		$("#thirdBestImdeProfile").css("background-image",
				"url(/resources/images/default.png)");
	} else {
		var profileImgImde3 = $("#thirdBestImdeProfileIP").val();		
		$("#thirdBestImdeProfile").append("<img class='bestProfileImg' src='/uniform/display?fileName="+ profileImgImde3+"'>");
		$(".bestProfileImg").css("width","3em").css("height","3em").css("border-radius","50%");
	}
	
	
	var firstBestShareImg = $("#firstBestShareImg").val();
	var secondBestShareImg = $("#secondBestShareImg").val();
	var thirdBestShareImg = $("#thirdBestShareImg").val();
	
	var firstBestImg = $("#firstBestImg").val();
	var secondBestImg = $("#secondBestImg").val();
	var thirdBestImg = $("#thirdBestImg").val();
	
	var firstBestImgEncode = encodeURIComponent(firstBestImg);
	var secondBestImgEncode = encodeURIComponent(secondBestImg);
	var thirdBestImgEncode = encodeURIComponent(thirdBestImg);
	
	var firstBestShareImgEncode = encodeURIComponent(firstBestShareImg);
	var secondBestShareImgEncode = encodeURIComponent(secondBestShareImg);
	var thirdBestShareImgEncode = encodeURIComponent(thirdBestShareImg);
	
	
	$("#firstImdeImg").append("<img src='/display?fileName="+firstBestImgEncode+"'>");
	$("#secondImdeImg").append("<img src='/display?fileName="+secondBestImgEncode+"'>");
	$("#thirdImdeImg").append("<img src='/display?fileName="+thirdBestImgEncode+"'>");
	
	$("#firstShareImg").append("<img src='/display?fileName="+firstBestShareImgEncode+"'>");
	$("#secondShareImg").append("<img src='/display?fileName="+secondBestShareImgEncode+"'>");
	$("#thirdShareImg").append("<img src='/display?fileName="+thirdBestShareImgEncode+"'>");
	
	/*	마이페이지 프로필 사진*/
	
	var userid = $("#userid").val();
	var memberPhoto = $("#memberPhoto").val();
	
	console.log(userid);
	console.log(memberPhoto);
	
	if(userid.length  > 20 ){	

		$(".profile-icon").append("<img src='"+memberPhoto+"'>");		
		
	}else if(memberPhoto == ""){
		console.log("이미지가 없습니다.");
		$(".profile-icon").append("<img src='/resources/images/default.png'>");
	}
	else{
		
		$(".profile-icon").append("<img src='/uniform/display?fileName="+memberPhoto+"'>");
		
	}
	

	$("#moreShare").on("click", function() {

		if (moreFlag === 1) {

			console.log("공유 더보기 클릭");

			if (sclickCount <= 0) {
				$.getJSON("/uniform/moreInfo", {
					mno : myMno
				}, function(data) {
					console.log(data);

					$.each(data, function(i, obj) {
						if (i > 2 && i<5) {
							str = "<tr>";
							str += "<td>" + S_tableCount++ + "</td>";
							str += "<td><a class='sinchungBtn' data-sno='"+obj.sno+"'>" + obj.title + " </a> </td>";
							str += "<td>" + obj.name + "</td>";
							str += "<td>" + obj.phone + "</td>";
							str += "<td>" + obj.reservation + "</td>";
							str += "</tr>";
						
							
							sinchung_tbody.append(str);
						}
					});
					
					$(document).on("click",".next",function(){					
						console.log("next버튼 클릭");

						
						 pageCount += 5;
						 console.log("공유첫번째 인덱스  : " +pageCount);
						 console.log("공유마지막 인덱스 : " +(pageCount+4));
					
						sinchung_tbody.html("");
				
						size = data.length;
						
						if(pageCount > size){
					
							alert("더이상 정보가 없습니다.");		
							pageCount -=5;
							console.log("공유첫번째 인덱스 : " +  pageCount);
						
						}

					
						$.each(data, function(i, obj){
				
							
							if(i>=pageCount && i<=pageCount +4){
								
								console.log("인덱스 번호 : " + i);
								
														
								str = "<tr>";
								str += "<td>" + (i+1) + "</td>";
								str += "<td> <a class='sinchungBtn' data-sno='"+obj.sno+"'>" + obj.title + " </a> </td>";
								str += "<td>" + obj.name + "</td>";
								str += "<td>" + obj.phone + "</td>";
								str += "<td>" + obj.reservation + "</td>";
								str += "</tr>";
								
								 sinchung_tbody.append(str);
								
							}
						});
						
					});
					
					/*페이징 prev버튼 클릭*/
					
					$(document).on("click", ".prev", function(){
						console.log("이전 버튼 클릭");
						
						pageCount -= 5;
						
						if(pageCount < 0){
							alert("처음 페이지 입니다.");
					
							pageCount = 0;
							console.log("임대 첫번째 인덱스 : " + IpageCount);
							console.log("공유 첫번재 인덱스 : "  +pageCount);
							return;
							
						}
						
						 console.log("pageCount : " + pageCount);
						 console.log("공유 첫번째 인덱스 : " +pageCount);
						 console.log("공유 마지막 인덱스 : " + (pageCount+4));
						sinchung_tbody.html("");
						
							$.each(data, function(i, obj){
							
							if(i >= pageCount && i<=pageCount +4){
								str = "<tr>";
								str += "<td>" + (i+1) + "</td>";
								str += "<td> <a class='sinchungBtn' data-sno='"+obj.sno+"'>" + obj.title + " </a> </td>";
								str += "<td>" + obj.name + "</td>";
								str += "<td>" + obj.phone + "</td>";
								str += "<td>" + obj.reservation + "</td>";
								str += "</tr>";
								
								 sinchung_tbody.append(str);
								
							}
						});

						
					});
				});
				sclickCount++;
			}
			
			$(".hr").css("margin-bottom","4em").css("margin-top","4em");			
			$("#sinchung_PagingBtn").css("padding-left","45%").css("padding-right","45%").css("margin-top","2em");
			$("#sinchung_PagingBtn span:nth-child(1)").addClass("carousel-control-prev-icon prev").css("margin-right","20%");
			$("#sinchung_PagingBtn span:nth-child(2)").addClass("carousel-control-next-icon next");


			
			
		} else {
			console.log("임대 더보기 클릭");
			if (iclickCount <= 0) {
				$.getJSON("/uniform/moreInfoImde", {
					mno : myMno
				}, function(data) {
					console.log(data);
					console.log(IpageCount);

					$.each(data, function(i, obj) {
						if (i>2 && i<5) {
							str = "<tr>";
							str += "<td>" + I_tableCount++ + "</td>";
							str += "<td> <a class='IsinchungBtn' data-ino='"+obj.ino+"'>" + obj.title + " </a> </td>";
							str += "<td>" + obj.name + "</td>";
							str += "<td>" + obj.phone + "</td>";
							str += "<td>" + obj.reservation + "</td>";
							str += "</tr>"; 

							Isinchung_tbody.append(str);
						
						}
						
					});
					
					/*페이징 next 버튼 클릭*/

					$(document).on("click",".Inext",function(){					
						console.log("next버튼 클릭");

						
						 IpageCount += 5;
						 console.log("임대 첫번째 인덱스  : " +IpageCount);
						 console.log("임대 마지막 인덱스 : " +(IpageCount+4));
					
						Isinchung_tbody.html("");
				
						size = data.length;
						console.log("데이터 개수 : " + size + " : " + IpageCount); 
						
						if(IpageCount > size){
							IpageCount -=5;
							alert("더이상 정보가 없습니다.");			
							console.log("임대 첫번재 인덱스 : "  +IpageCount);
							
						}

					
						$.each(data, function(i, obj){
				
							
							if(i>=IpageCount && i<=IpageCount +4){
								
	
								
														
								str = "<tr>";
								str += "<td>" + (i+1) + "</td>";
								str += "<td> <a class='IsinchungBtn' data-ino='"+obj.ino+"'>" + obj.title + " </a> </td>";
								str += "<td>" + obj.name + "</td>";
								str += "<td>" + obj.phone + "</td>";
								str += "<td>" + obj.reservation + "</td>";
								str += "</tr>";
								
								 Isinchung_tbody.append(str);
								
							}
						});
						
					});
					
					/*페이징 prev버튼 클릭*/
					
					$(document).on("click", ".Iprev", function(){
						console.log("이전 버튼 클릭");
						
						IpageCount -= 5;
						if(IpageCount <= -5){
							alert("처음 페이지 입니다.");
							IpageCount = 0;
						
							console.log("임대 첫번째 인덱스 :" + IpageCount);
							console.log("공유 첫번재 인덱스  :" + pageCount);
							return;
						}
						
						
						 console.log("임대첫번째 인덱스 : " +IpageCount);
						 console.log("임대마지막 인덱스 : " + (IpageCount+4));
						Isinchung_tbody.html("");
						
							$.each(data, function(i, obj){
							
							if(i >= IpageCount && i<=IpageCount +4){
								str = "<tr>";
								str += "<td>" + (i+1) + "</td>";
								str += "<td> <a class='IsinchungBtn' data-ino='"+obj.ino+"'>" + obj.title + " </a> </td>";
								str += "<td>" + obj.name + "</td>";
								str += "<td>" + obj.phone + "</td>";
								str += "<td>" + obj.reservation + "</td>";
								str += "</tr>";
								
								 Isinchung_tbody.append(str);
								
							}
						});

						
					});
					
					

				});
				iclickCount++;
			}
			
			$(".hr").css("margin-bottom","4em").css("margin-top","4em");			
			$("#Isinchung_PagingBtn").css("padding-left","45%").css("padding-right","45%").css("margin-top","2em");
			$("#Isinchung_PagingBtn span:nth-child(1)").addClass("carousel-control-prev-icon Iprev").css("margin-right","20%");
			$("#Isinchung_PagingBtn span:nth-child(2)").addClass("carousel-control-next-icon Inext");
	
			
		}
	});
	

	/* 마이페이지 신청 리스트 */

	var sList_title = $("#sList_title").val();

	console.log(sList_title);

	/* 마이페이지 신청 리스트 끝 */
	$(".sinchung_tab_2").css("color", "black").css("border-bottom",
			"1px solid #ddd").css("background-color", "inherit");
	$(".sinchung_tab_1").css("color", "white").css("border-bottom",
			"1px solid #aaa").css("background-color", "#aaa");

	$(".confirm_tab_2").css("color", "black").css("border-bottom",
			"1px solid #ddd").css("background-color", "inherit");
	$(".confirm_tab_1").css("color", "white").css("border-bottom",
			"1px solid #aaa").css("background-color", "#aaa");

	$(".sinchung_tab_1").on(
			"click",
			function() {
				moreFlag = 1;
				$("#sinchung_imde").css("display", "none");
				$("#sinchung_share").css("display", "block");
				$(".sinchung_tab_2").css("color", "black").css("border-bottom",
						"1px solid #ddd").css("background-color", "inherit");
				$(".sinchung_tab_1").css("color", "white").css("border-bottom",
						"1px solid #aaa").css("background-color", "#aaa");
			});
	$(".sinchung_tab_2").on(
			"click",
			function() {
				moreFlag = 2;
				$("#sinchung_share").css("display", "none");
				$("#sinchung_imde").css("display", "block");
				$(".sinchung_tab_1").css("color", "black").css("border-bottom",
						"1px solid #ddd").css("background-color", "inherit");
				$(".sinchung_tab_2").css("color", "white").css("border-bottom",
						"1px solid #aaa").css("background-color", "#aaa");
			});

	$(".confirm_tab_1").on(
			"click",
			function() {
				$("#confirm_imde").css("display", "none");
				$("#confirm_share").css("display", "block");
				$(".confirm_tab_2").css("color", "black").css("border-bottom",
						"1px solid #ddd").css("background-color", "inherit");
				$(".confirm_tab_1").css("color", "white").css("border-bottom",
						"1px solid #aaa").css("background-color", "#aaa");
			});

	$(".confirm_tab_2").on(
			"click",
			function() {
				$("#confirm_share").css("display", "none");
				$("#confirm_imde").css("display", "block");
				$(".confirm_tab_1").css("color", "black").css("border-bottom",
						"1px solid #ddd").css("background-color", "inherit");
				$(".confirm_tab_2").css("color", "white").css("border-bottom",
						"1px solid #aaa").css("background-color", "#aaa");
			});

	$("#shareBtn").on("click", function() {
		console.log("공유 등록 버튼 클릭!!");
		location.href = "/uniform/goShare"
	});

	$("#imdeBtn").on("click", function() {
		console.log("임대 버튼 클릭 !!");
		location.href = "/uniform/goImde";
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
		


		var width = num * 15;
		var width2 = num2 * 15;


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
		if (windowSize <= 1090) {

			$(".profile-div").removeClass("col-md-5");
			$(".profile-div").addClass("col-md-12").css("width", "30em");
		} else {
			$(".profile-div").addClass("col-md-5").css("width", "30em");
			$(".profile-div").removeClass("col-md-12");
		}
	});

	var operForm = $("#operForm");
	var typeChoic = $("#typeChoice");

	// 수정 버튼 클릭시 데이터를 회원정보 수정 뷰로 보내줌
	$("button[data-oper='modify']").click(function(e) {
		operForm.attr("action", "/uniform/updateMember").submit();


	});

	/*
	 * ----------------날짜비교 (오늘 날짜 보다 전 날짜는 선택 불가능, 끝날짜가 시작날짜보다 전일 수
	 * 없음)----------------
	 */
	var currentDate = $("#currentDate").val();

	var splitDate = currentDate.split('-');

	var currentYear = splitDate[0];
	var currentMonth = splitDate[1];
	var currentDay = splitDate[2];



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


				var firstDate = $("#inputFirstDate").val();

				var splitFirstSelectDate = firstDate.split('-');

				var selectFirstYear = splitFirstSelectDate[0];
				var selectFirstMonth = splitFirstSelectDate[1];
				var selectFirstDay = splitFirstSelectDate[2];

	

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
				
				e.preventDefault();
				if ($("#typeChoice").val() == "select"
						|| $("#inputLocation").val() == "") {
					alert("위치와 종류는 필수 선택 항목입니다.");
					return;
				} else {
					$("#select_form").submit();
				}
			});
	

	
	

});
