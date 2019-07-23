/**
 * id와 pw 찾는 javascript, jquery 작성
 */

$(function() {

	var id_userName = $("#id_userName");
	var id_email = $("#id_email");
	var pw_userID = $("#pw_userID");
	var pw_email = $("#pw_email");

	$("#pw_modal").on("click", function(e) {
		$("#findUP").modal("hide");
		$("#findPW").modal("show");
	});
	
	$("#id_modal").on("click", function(e) {
		$("#findUP").modal("show");
		$("#findPW").modal("hide");
	});

	$("#find_ID").on("click", function(e) {
		e.preventDefault();
		if (id_userName.val() === "") {
			alert("이름을 입력해주세요.");
		} else if (id_email.val() === "") {
			alert("이메일을 입력해주세요.");
		} else {
			$("#id_form").submit();
			$("#findUP").modal("hide");
		}
	});

	$("#find_PW").on("click", function(e) {
		e.preventDefault();
		if (pw_userID.val() === "") {
			alert("아이디를 입력해주세요.");
		} else if (pw_email.val() === "") {
			alert("이메일을 입력해주세요.");
		} else {
			$("#pw_form").submit();
			$("#findPW").modal("hide");
		}
	});

	var result_id = "${find_id}";
	var result_pw = "${find_pw}";

	if (result_id != null) {
		$("#resultID_modal").trigger("click");
	}

	if (result_pw != null) {
		$("#resultPW_modal").trigger("click");
	}

});