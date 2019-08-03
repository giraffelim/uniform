/**
 * review에서 사용할 javascript, jquery
 */

var result_star;

$(function() {

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
	$("#review button.close").on("click", function() {
		$("#sinchung").modal("show");
	});

	$(".reviewBtn").on("click", function() {
		$("#sinchung").modal("hide");
	});

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
				var reservations = item.reservation.split(",");
				if (loginMno == item.mno + "") {
					switch(reservations.length){
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
		});
	});

});