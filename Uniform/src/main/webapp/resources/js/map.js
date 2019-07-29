/**
 * 지도 생성을 위한 javascript, jquery
 */
var count = 0;
// 15 30 45 60 75 90 105 120 135 150
var result;

$(function() {

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

	result = $("div");

	result.each(function(index, item) {
		index = index + 1;
		var list = $("#avg_star" + index).next().val();
		var num = $("input[id*='avg_star" + list + "']").val();
		var width = num * 15;
		$(".star-input" + list + ">.input").css("background-position",
				"0 bottom").css("width", width + "px").css("z-index", "100");

	});

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
		if (position >= 1720) {
			$(".mapWrap").removeClass("map-position");
			$(".mapWrap").addClass("map-bottom");
		}
	});

	var location = []; // 받아올 데이터를 저장할 배열 선언
	var title = [];

	var jsonLocation = $("input[id*='Location']").val();
	var jsonType = $("input[id*='Type']").val();
	var jsonFirst = $("input[id*='firstDate']").val();
	var jsonLast = $("input[id*='lastDate']").val();
	if (jsonFirst == null || jsonFirst == " ") {
		jsonFirst = "fail";
	}
	if (jsonLast == null || jsonLast == " ") {
		jsonLast = "fail";
	}
	console.log(jsonLocation + " : " + jsonType + " : " + jsonFirst + " : "
			+ jsonLast);

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
		level : 7
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
													+ title[i] + '</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);

							}
							count++;
						});
	}

}