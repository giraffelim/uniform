/**
 * review에서 사용할 javascript, jquery
 */

var result_star = 0;

var moreFlag = 1;
var confirmStr;
var SfirstCount = 0;
var SlastCount = 5;
var IfirstCount = 0;
var IlastCount = 5;

var StableCount = 4;
var ItableCount = 4;

var SoneClick = 0;
var IoneClick = 0;

var SfirstFlag = 0;
var IfirstFlag = 0;

var lastFlag = 0;

var reviewSno;
var reviewIno;

var reviewFlag;

var cNo;

var iconfirmThumbnail;
var sconfirmThumbnail;

$(function() {

	/* 후기 작성 시 마우스를 이동해서 별점을 설정하면 값을 가져가는 부분 */

	$("#review button.close").on("click", function() {
		if (moreFlag == 1) {
			$("#SConfirm").modal("show");
		} else {
			$("#IConfirm").modal("show");
		}
	});
	

	$("button[class*='reviewBtn']").on("click", function() {
		if (moreFlag == 1) {
			$("#SConfirm").modal("hide");
		} else {
			$("#IConfirm").modal("hide");
		}
	});
	
	$(".SreviewBtn").on("click", function() {
		reviewSno = $(".confirm_form #sno").val();
		starRating(reviewSno, reviewIno);
	});
	
	$(".IreviewBtn").on("click", function() {
		reviewIno = $(".confirm_form #ino").val();
		starRating(reviewSno, reviewIno);
	});
	
	$("#review_insert").on("click", function(e) {
		e.preventDefault();
		if (result_star == 0) {
			alert("별점을 등록해주세요.");
			return;
		}
	});

	function starRating(reviewSno, reviewIno) {
		var $star = $(".star-input"), $result = $star.find("output>b");

		$(document).on("focusin", ".star-input>.input", function() {
			$(this).addClass("focus");
		}).on("focusout", ".star-input>.input", function() {
			var $this = $(this);
			setTimeout(function() {
				if ($this.find(":focus").length === 0) {
					$this.removeClass("focus");
				}
			}, 100);
		}).on("change", ".star-input :radio", function() {
			$result.text($(this).next().text());
		}).on("mouseover", ".star-input label", function() {
			$result.text($(this).text());
		}).on("mouseleave", ".star-input>.input", function() {
			var $checked = $star.find(":checked");
			if ($checked.length === 0) {
				$result.text("0");
			} else {
				$result.text($checked.next().text());
				result_star = $checked.next().text();
				reviewInsert(result_star);
			}
		});
	};
	
	function reviewInsert(result_star) {
		$("#review_insert").on("click", function(e) {
			e.preventDefault();
			$("#review_star").attr("value", result_star);
			if ($("#review-content").val() == null || $("#review-content").val() == "") {
				alert("내용을 입력해주세요.");
				return;
			}
			$("#review_form #cno").val(cNo);
			if (reviewSno != null) {
				$("#review_form #ino").val(0);
				$("#review_form #sno").val(reviewSno);
				reviewFlag = "sno";
			} else {
				$("#review_form #ino").val(reviewIno);
				$("#review_form #sno").val(0);
				reviewFlag = "ino";
			}

			console.log("result : " + result_star + " :" + $("#review-content").val()+":");

			$.ajax({
		        type:"POST",
		        url:"/uniform/new_review",
		        data : {
		        	content : $("#review-content").val(),
					star : result_star,
					cno : $("#review_form #cno").val(),
					mno : $("#review_form #mno").val(),
					ino : $("#review_form #ino").val(),
					sno : $("#review_form #sno").val(),
					flag : reviewFlag},
				beforeSend : function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
		        dataType : "text",
		        success: function(result) {
		            $("#review").modal("hide");
		        }
		    });
		});
	}
	
	console.log($("#myPageUserid").val());
	
	if ($("#myPageUserid").val().length < 20) {
		if($("#myPagePhoto").val() === "") {
			$("#reviewProfile").append("<img src='/resources/images/default.png'>");
		} else {
			$("#reviewProfile").append("<img src='/uniform/display?fileName="+$("#myPagePhoto").val()+"'>");
		}
	} else {
		$("#reviewProfile").append("<img src='"+$("#myPagePhoto").val()+"'>");
	}

	/* 마이페이지 신청 내역에서 제목을 클릭하면 상세페이지에 정보를 띄워줌 */
	$(document).on("click",".SsinchungBtn",function(){
		var workplaceNo = $(this).data("sno");
		location.href = "/uniform/rendDetail?type=share&no="+workplaceNo;
	});
	
	var loginMno = $("#mno").val();

	$(".sinchungBtn").on("click", function() {
		$("#sinchung").modal("show");
		var workplaceNo = $(this).data("ino");
		$.getJSON("/uniform/sinchung.json", {
			no : workplaceNo
		}, function(result) {
			var thumbnailEncode, iSinchungStr;
			$.each(result, function(index, item) {
				$("#title").val(item.title);
				$("#location").val(item.location);
				$("#price").val(item.price);
				$("#hname").val(item.hname);
				$("#hphone").val(item.hphone);
				$("#reservation").val(item.reservation);
				thumbnailEncode = encodeURIComponent(item.thumbnail);
				console.log(item.thumbnail + " : " + thumbnailEncode);
				
				var reservations = item.reservation.split(",");

				if (loginMno == item.mno + "") {
					switch(reservations.length) {
					case 1:
						$("#reservation").val(reservations[0]);
						break;
					case 2:
						$("#reservation").val(reservations[0]);
						$("#reservation1").val(reservations[1]);
						$(".apply_content").eq(6).css("display","block");
						break;
					case 3:
						$("#reservation").val(reservations[0]);
						$("#reservation1").val(reservations[1]);
						$("#reservation2").val(reservations[2]);
						$(".apply_content").eq(6).css("display","block");
						$(".apply_content").eq(7).css("display","block");
						break;
					}
				}
				
			});
				$("#iSinchungStr").append(iSinchungStr);
				$("#sinchungThumbnail").append('<img src="/display?fileName='+thumbnailEncode+'">');
			});
		});

	/* 마이페이지 확정 내역에서 제목을 클릭하면 상세페이지에 정보를 띄워줌 */

	$(".confirm_tab_1").on("click", function() {
		moreFlag = 1;
		if (SoneClick == 0) {
			$("#confirm_prev").css("display", "none");
			$("#confirm_next").css("display", "none");	
		}
	});

	$(".confirm_tab_2").on("click", function() {
		moreFlag = 2;
		if (IoneClick == 0) {
			$("#confirm_prev").css("display", "none");
			$("#confirm_next").css("display", "none");	
		}
	});

	$("#moreConfirm").on("click", function() {
		if (moreFlag == 1) {
			if (SoneClick == 0) {
				$("#confirm_prev").css("display", "inline");
				$("#confirm_next").css("display", "inline");
				SoneClick++;
				sConfirm_getJson(SfirstCount, SlastCount);
			}
		} else {
			if(IoneClick == 0) {
				$("#confirm_prev").css("display", "inline");
				$("#confirm_next").css("display", "inline");
				IoneClick++;
				iConfirm_getJson(IfirstCount, IlastCount);
			}
		}
	});
	
	$("#confirm_prev").on("click", function() {
		if (moreFlag == 1) {
			SfirstCount -= 5;
			SlastCount -= 5;
			StableCount = SfirstCount + 1;
			if (SfirstCount < 0) {
				SfirstCount = 0;
				SlastCount = 5;
				StableCount = SfirstCount + 1;
				alert("첫번째 페이지입니다.");
				sConfirm_getJson(SfirstCount, SlastCount);
			} else if (lastFlag == 1) {
				lastFlag = 0;
				SfirstCount -= 5;
				SlastCount -= 5;
				StableCount = SfirstCount + 1;
				sConfirm_getJson(SfirstCount, SlastCount);
			} else {
				sConfirm_getJson(SfirstCount, SlastCount);
			}
		} else {
			IfirstCount -= 5;
			IlastCount -= 5;
			ItableCount = IfirstCount + 1;
			if (IfirstCount < 0) {
				IfirstCount = 0;
				IlastCount = 5;
				ItableCount = IfirstCount + 1;
				alert("첫번째 페이지입니다.");
				iConfirm_getJson(IfirstCount, IlastCount);
			} else if (lastFlag == 1) {
				lastFlag = 0;
				IfirstCount -= 5;
				IlastCount -= 5;
				ItableCount = IfirstCount + 1;
				iConfirm_getJson(IfirstCount, IlastCount);
			} else {
				iConfirm_getJson(IfirstCount, IlastCount);
			}
		}
	})
	
	$("#confirm_next").on("click", function() {
		if (moreFlag == 1) {
			SfirstCount += 5;
			SlastCount += 5;
			StableCount = SfirstCount + 1;
			sConfirm_getJson(SfirstCount, SlastCount);
		} else {
			IfirstCount += 5;
			IlastCount += 5;
			ItableCount = IfirstCount + 1;
			iConfirm_getJson(IfirstCount, IlastCount);
		}
	});
	
	function sConfirm_getJson(SfirstCount, SlastCount) {
		$.getJSON("/uniform/SConfirmList.json", {
			mno : loginMno
		}, function(result) {
			if (result.length > SfirstCount) {
				if (SfirstFlag === 0) {
					$.each(result, function(index, item) {
						index++;
						if (index > 3 && index <= SlastCount) {
							confirmStr = '<tr> <td>'+ StableCount++ +'</td>';
							confirmStr += '<td><a class="SConfirmBtn" style="color: black" data-cno="'+item.cno+'">'+item.title+'</a></td>';
							confirmStr += '<td>'+item.name+'</td>';
							confirmStr += '<td>'+item.phone+'</td>';
							confirmStr += '<td>'+item.reservation+'</td> </tr>';
							
							$(".Sconfirm_body").append(confirmStr);
						}
					});
					SfirstFlag++;
				} else {
					confirmStr = "";
					$.each(result, function(index, item) {
						index++;
						if (index > SfirstCount && index <= SlastCount) {
							confirmStr += '<tr> <td>'+ StableCount++ +'</td>';
							confirmStr += '<td><a class="SConfirmBtn" style="color: black" data-cno="'+item.cno+'">'+item.title+'</a></td>';
							confirmStr += '<td>'+item.name+'</td>';
							confirmStr += '<td>'+item.phone+'</td>';
							confirmStr += '<td>'+item.reservation+'</td> </tr>';
						}
					});
					$(".Sconfirm_body").html(confirmStr);
				}
			} else {
				lastFlag = 1;
				alert("마지막 페이지입니다.");
			}
				
			});
		}
	
	function iConfirm_getJson(IfirstCount, IlastCount) {
		$.getJSON("/uniform/IConfirmList.json", {
			mno : loginMno
		}, function(result) {
			if (result.length > IfirstCount) {
				if (IfirstFlag === 0) {
					$.each(result, function(index, item) {
						index++;
						if (index > 3 && index <= IlastCount) {
							confirmStr = '<tr> <td>'+ ItableCount++ +'</td>';
							confirmStr += '<td><a class="IConfirmBtn" style="color: black" data-cno="'+item.cno+'">'+item.title+'</a></td>';
							confirmStr += '<td>'+item.name+'</td>';
							confirmStr += '<td>'+item.phone+'</td>';
							confirmStr += '<td>'+item.reservation+'</td> </tr>';
							
							$(".Iconfirm_body").append(confirmStr);
						}
					});
					IfirstFlag++;
				} else {
					confirmStr = "";
					$.each(result, function(index, item) {
						index++;
						if (index > IfirstCount && index <= IlastCount) {
							confirmStr += '<tr> <td>'+ ItableCount++ +'</td>';
							confirmStr += '<td><a class="IConfirmBtn" style="color: black" data-cno="'+item.cno+'">'+item.title+'</a></td>';
							confirmStr += '<td>'+item.name+'</td>';
							confirmStr += '<td>'+item.phone+'</td>';
							confirmStr += '<td>'+item.reservation+'</td> </tr>';
						}
					});
					$(".Iconfirm_body").html(confirmStr);
				}
			} else {
				lastFlag = 1;
				alert("마지막 페이지입니다.");

			}
				
			});
	}
	

	var sconfirmStr = "";
	var iconfirmStr = "";
	
	$("table").on("click", ".SConfirmBtn", function() {
		$("#SConfirm").modal("show");
		cNo = $(this).data("cno");
		
		$.getJSON("/uniform/confirm.json", {
			cno : cNo,
			mno : loginMno,
			flag : moreFlag
		}, function(result) {
			sconfirmStr = "<h3>사용자</h3>";
			$.each(result, function(index, item) {
				$("#sno").val(item.sno);
				$("#Stitle").val(item.title);
				$("#Slocation").val(item.location);
				$("#Sprice").val(item.price);
				$("#Sname").val(item.name);
				$("#Sphone").val(item.phone);
				$("#Shtime").val(item.myTime);
				$("#Shdate").val(item.myDate);
				var thumbnailEncode = encodeURIComponent(item.thumbnail);
				sconfirmThumbnail = '<img src="/display?fileName='+thumbnailEncode+'">';
				sconfirmStr += '<label>이름</label><input type="text" id="Scname'+item.cno+'" name="cname" value="'+item.cname+'"/>';
				sconfirmStr += '<label>번호</label><input type="text" id="Scphone'+item.cno+'" name="cphone"  value="'+item.cphone+'"/>';
				sconfirmStr += '<label>시간</label><input type="text" id="Sreservation'+item.cno+'" name="reservation"  value="'+item.reservation+'"/> <br>';
			});
			$("#SThumbnail").html(sconfirmThumbnail);
			$(".sconfirmStr").html(sconfirmStr);
		});

	});

	$("table").on("click", ".IConfirmBtn", function() {
		$("#IConfirm").modal("show");
		cNo = $(this).data("cno");
		$.getJSON("/uniform/confirm.json", {
			cno : cNo,
			mno : loginMno,
			flag : moreFlag
		}, function(result) {
			iconfirmStr = "<h3>사용자</h3>";
			$.each(result, function(index, item) {
				$("#ino").val(item.ino);
				$("#Ititle").val(item.title);
				$("#Ilocation").val(item.location);
				$("#Iprice").val(item.price);
				$("#Iname").val(item.name);
				$("#Iphone").val(item.phone);
				var thumbnailEncode = encodeURIComponent(item.thumbnail);
				iconfirmThumbnail = '<img src="/display?fileName='+thumbnailEncode+'">';
				iconfirmStr += '<label>이름</label><input type="text" id="Scname'+item.cno+'" name="cname" value="'+item.cname+'"/>';
				iconfirmStr += '<label>번호</label><input type="text" id="Scphone'+item.cno+'" name="cphone"  value="'+item.cphone+'"/>';
				iconfirmStr += '<label>시간</label><input type="text" id="Sreservation'+item.cno+'" name="reservation"  value="'+item.reservation+'"/> <br>';
			});
			$("#IThumbnail").html(iconfirmThumbnail);
			$(".iconfirmStr").html(iconfirmStr);
		});

	});
	
	
});