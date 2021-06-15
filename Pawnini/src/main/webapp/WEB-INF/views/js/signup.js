var checkID = false;
var checkPWD = false;

// 아이디 중복 체크
function idChk() {
	var member_id = $("#member_id").val();
	var oMsg = $("#idchk");
	if (member_id === null) {
		$("#idchk").text("아이디를 입력해 주세요.");
	} else {
		$.ajax({
			type : "POST",
			url : "checkID.do",
			data : {
				"member_id" : member_id
			},
			success : function(data) {
				if (data == 0) {
					$("#member_id").attr("disabled", true);
					oMsg.css("color", "green");
					oMsg.text("사용 가능한 아이디입니다.");
					checkID = true;
				} else if (data != 0) {
					$("#idchk").css("color", "red");
					$("#idchk").text("이미 존재하는 아이디입니다.");
					checkID = false;
				} else {
					console.log('ERROR');
				}
			},
			error : function(error) {
				alert("error");
			}
		});
	}
}
