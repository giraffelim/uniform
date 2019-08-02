/**
 * review에서 사용할 javascript, jquery
 */

var result_star;

$(function() {

	/*후기 작성 시 마우스를 이동해서 별점을 설정하면 값을 가져가는 부분*/
	var starRating = function() {
		var $star = $(".star-input"), $result = $star.find("output>b");

		$(document).on("focusin", ".star-input>.input", function() {
			$(this).addClass("focus");
		})

		.on("focusout", ".star-input>.input", function() {
			var $this = $(this);
			setTimeout(function() {
				if ($this.find(":focus").length === 0) {
					$this.removeClass("focus");
				}
			}, 100);
		})

		.on("change", ".star-input :radio", function() {
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

				$("#review_insert").on("click", function(e) {
					e.preventDefault();
					$("#review_star").attr("value", result_star);
					console.log($("#review_star").val());
					$("#review_form").submit();
					$("#review").modal("hide");
				});
			}
		});
	};

	starRating();
	
	/*마이페이지 신청 내역에서 제목을 클릭하면 상세페이지에 정보를 띄워줌*/
	var workplaceNo = 1;
	var sinchungListstr = "";
	var loginMno = $("#mno").val();
	console.log(loginMno);

	$(".sinchungBtn").on("click", function() {
		$("#sinchung").modal("show");
		var workplaceNo = $(this).data("ino");
		console.log(workplaceNo);
		$.getJSON("/uniform/sinchung.json", {
			no : workplaceNo
		}, function(result) {
			$.each(result, function(index, item) {
				$("#title").val(item.title);
				$("#location").val(item.location);
				$("#price").val(item.price);
				$("#hname").val(item.hname);
				$("#hphone").val(item.hphone);
				if (loginMno == item.mno + "") {
					$("#reservation").val(item.reservation);
				}
			});
		});
	});

});