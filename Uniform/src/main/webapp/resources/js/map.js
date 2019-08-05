/**
 * 지도 생성을 위한 javascript, jquery
 */
var count = 0;
// 15 30 45 60 75 90 105 120 135 150
var result;
var resultList = [];
var str;
$(function() {

	/*무한 스크롤 구현 및 검색 jquery*/
	var firstCount = 0;
	var lastCount = 5;

	var jsonLocation = $("input[id*='location']").val();
	var jsonType = $("input[id*='type']").val();
	var jsonFirst = $("input[id*='firstDate']").val();
	var jsonLast = $("input[id*='lastDate']").val();
	if (jsonFirst == null || jsonFirst == " ") {
		jsonFirst = "fail";
	}
	if (jsonLast == null || jsonLast == " ") {
		jsonLast = "fail";
	}

	$.getJSON('/uniform/scroll_result.json', {
		location : jsonLocation,
		type : jsonType,
		SfirstDate : jsonFirst,
		SlastDate : jsonLast
	}, function(data) {
		$.getJSON("/uniform/getStar.json", {
			location : jsonLocation,
			type : jsonType
		}, function(result) {
			if (jsonType === 'share') {
				$(".star-wrap").each(
						function(i, obj) {
							if (i < $(result).length) {
								var snos = result[i].sno;
								var objSno = $(this).data("sno");
								if (snos == objSno) {
									var num = result[i].avg;
									var width = num * 15;
									$(".star-input" + snos + ">.input").css(
											"background-position", "0 bottom")
											.css("width", width + "px").css(
													"z-index", "100");
								}
							}
						});
			} else {
				$(".star-wrap").each(
						function(i, obj) {
							if (i < $(result).length) {
								var snos = result[i].ino;
								var objSno = $(this).data("ino");
								if (snos == objSno) {
									var num = result[i].avg;
									var width = num * 15;
									$(".star-input" + snos + ">.input").css(
											"background-position", "0 bottom")
											.css("width", width + "px").css(
													"z-index", "100");
								}
							}
						});
			}
		})

		$.each(data, function(i, item) {
			resultList.push(item);
		});

		showList(resultList, firstCount, lastCount, jsonType);

	});

	/*스크롤이 하단에 닿았을 때 이벤트 발생*/
	$(window).scroll(
			function() {
				if ($(document).height() - $(window).height() == $(window)
						.scrollTop()) {

					if (resultList.length > 5) {
						firstCount += 5;
						lastCount += 5;

						showList(resultList, firstCount, lastCount, jsonType);
					}

				}
			});

	/*작업실 정보를 검색한 만큼 append해주는 함수*/
	function showList(resultList, firstCount, lastCount, jsonType) {
		if (jsonType === 'share') {

			$
					.each(
							resultList,
							function(index, item) {
								var regDates = resultList[index].rdate.substring(0, 10);
								if (index >= firstCount && index < lastCount) {
									str = '<div class="col-md-12"> <div class="blog-entry"> ';
									str += '<a href="#" class="img img-2" style="background-image: url(/resources/images/image_1.jpg);"> </a> ';
									str += '<div class="text pt-3"> <h2 class="mb-2">'
											+ resultList[index].title
											+ '</h2> ';
									str += '<div class="meta-wrap"> <span>등록일 : '
											+ regDates + '</span> ';
									str += '<span>가격 : '
											+ resultList[index].price
											+ ' 원 </span> ';
									str += '<div class="star-wrap" data-sno = "'
											+ resultList[index].sno
											+ '"> <span class="star-input'
											+ resultList[index].sno
											+ '"> <span class="input"> </span> </span> </div>';
									str += '<div class="result-wrap"> <span class="star-input'
											+ resultList[index].sno
											+ '"> <span class="result"> </span> </span> </div> </div>';
									str += '<p> <a href="/uniform/rentDetail?type='
											+ jsonType
											+ '&no='
											+ resultList[index].sno
											+ '" class="btn btn-primary">Read More <span class="ion-ios-arrow-forward"></span></a> </p>';
									str += '</div> </div> </div>';
									$(".resultList").append(str);
								}
							});
		} else {
			$
					.each(
							resultList,
							function(index, item) {
								var regDates = resultList[index].regDate
										.substring(0, 10);
								if (index >= firstCount && index < lastCount) {
									str = '<div class="col-md-12"> <div class="blog-entry"> ';
									str += '<a href="#" class="img img-2" style="background-image: url(/resources/images/image_1.jpg);"> </a> ';
									str += '<div class="text pt-3"> <h2 class="mb-2">'
											+ resultList[index].title
											+ '</h2> ';
									str += '<div class="meta-wrap"> <span>등록일 : '
											+ regDates + '</span> ';
									str += '<span>가격 : '
											+ resultList[index].price
											+ ' 원 </span> ';
									str += '<div class="star-wrap" data-ino = "'
											+ resultList[index].ino
											+ '"> <span class="star-input'
											+ resultList[index].ino
											+ '"> <span class="input"> </span> </span> </div>';
									str += '<div class="result-wrap"> <span class="star-input'
											+ resultList[index].ino
											+ '"> <span class="result"> </span> </span> </div> </div>';
									str += '<p> <a href="/uniform/rentDetail?type='
											+ jsonType
											+ '&no='
											+ resultList[index].ino
											+ '" class="btn btn-primary">Read More <span class="ion-ios-arrow-forward"></span></a> </p>';
									str += '</div> </div> </div>';
									$(".resultList").append(str);
								}
							});
		}
	}

	/*하단일 때 상단으로 올라가는 버튼*/
	$("#topBtn").on("click", function() {
		$("html, body").animate({
			scrollTop : 0
		}, 300);
	});

	/*상단일 때 하단으로 내러가는 버튼*/
	$("#bottomBtn").on("click", function() {
		$("html, body").animate({
			scrollTop : $(document).height()
		}, 300);
	});

	/*검색을 눌렀을 때 체크하고 submit 해줌*/
	$("#btnSearch").on("click", function(e) {
		e.preventDefault();
		if ($("#selectType").val() === "imde") {
			if ($("input[id*='Date']").val() != "") {
				alert("종류가 임대일 경우엔 날짜를 선택하실수없습니다.");
				$("input[id*='Date']").val("");
			} else {
				$("#select_form").submit();
			}
		} else {
			$("#select_form").submit();
		}
	})

	/*검색 시 날짜 input을 선택하면 datepicker를 사용해서 캘린더를 띄워줌*/
	var dateFormat = "yy-mm-dd";
	var from = $("input[id*='firstDate']").datepicker({
		minDate : 0,
		dateFormat : dateFormat,
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 2
	}).on("change", function() {
		to.datepicker("option", "minDate", getDate(this));
	}), to = $("input[id*='lastDate']").datepicker({
		minDate : 0,
		dateFormat : dateFormat,
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 2
	}).on("change", function() {
		from.datepicker("option", "maxDate", getDate(this));
	});

	function getDate(element) {
		var date;
		try {
			date = $.datepicker.parseDate(dateFormat, element.value);
		} catch (error) {
			date = null;
		}

		return date;
	}
	
	/*스크롤 값에 따라 지도 fixed*/
	$(window).scroll(function() {
		var position = $(document).scrollTop();
		if (position >= 418) {
			$(".mapWrap").removeClass("map-bottom");
			$(".mapWrap").addClass("map-position");
		}
		if (position <= 417) {
			$(".mapWrap").removeClass("map-bottom");
			$(".mapWrap").removeClass("map-position");
		}
	});

	var location = []; // 받아올 데이터를 저장할 배열 선언
	var title = [];

	/*지도를 띄우고 가져온 주소를 위경도화해서 마커를 찍어주는 부분*/
	$.getJSON("/uniform/map_list.json", {
		location : jsonLocation,
		type : jsonType,
		SfirstDate : jsonFirst,
		SlastDate : jsonLast
	}, function(data) {
		$.each(data, function(key, value) {
			location.push(value.location);
			title.push(value.title);
		});
		map(location, title);
	});

});

function map(location, title) {
	var mapContainer = document.getElementById('resultMap'), // 지도를 표시할 div
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 8
	};

	// 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	for (var i = 0; i < location.length; i++) {
		geocoder
				.addressSearch(
						location[i],
						function(result, status) {
							if (count == count) {
								i = count;
							}

							// 정상적으로 검색이 완료됐으면
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:5px 0;">'
													+ title[count] + '</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);

								count++;
							}
						});
	}

}