<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 전송 시스템</title>
<style>
.area{
width:300px;
height : 300px;
resize: none;
}
</style>
<script src="./js/jquery.js"></script>
<script>
$(function(){
//	console.log("체크");
//	$("#btn").on("click",function(){	옛날 표현
	$("#btn").click(function(){
//		alert("test");
		if($("#to_name").val()==""){
			alert("담당자 성함을 입력하세요.");
		}else if($("#to_mail").val()==""){
			alert("회신받을 메일주소를 입력해주세요.");
		}else if($("#subject").val()==""){
			alert("제목을 입력해주세요.");
		}else if($("#context").val()==""){
			alert("내용을 입력해주세요.");		
		}else{
			// var $word = "abc53d2";
			// var $reg = /[0-9]/g;
			// var $reg = /[^0-9]/g;	0~9 이외의 숫자가 있는지 확인
			// var $reg = /^[0-9]/;	[]밖에 ^를 표시하면 $word의 첫번째 단어를 검토하여 0~9사이의 문자인지 검토, g를 넣어도 의미 없음 => 첫 번째 글자만 검토하기 때문
			// var $reg = /[a-z]/g;
			// var $reg = /[a-zA-Z]/g;
			// var $reg = /[a-z]/gi;
			// console.log($reg.test($word));	// test() : 단어를 검색하여 true 또는 false를 출력하며, 정규식 코드를 확인함
			
			// 정규식 코드에 역슬래시(\)를 사용하는 이유는 특정문자를 기준으로 하기 위해
			// ^[] 뒤에 ()가 오는 것은 첫 문자 이외의 뒤 문자를 검토하는 것
			var $reg = /^[a-z0-9]([a-z0-9-_.])+\@[a-z0-9ㄱ-힣]+\.[a-z0-9ㄱ-힣-_]{2,}/i;	// @를 기준으로 다음[]를 검토, + 사이를 띄우면 안됨
//			console.log($reg.test($("#to_mail").val()));
			if($reg.test($("#to_mail").val())==false){
				alert("올바른 이메일 주소를 입력하세요");
				$("#to_mail").val("");	// jquery로 사용자가 입력한 값을 초기화
			}else{
				frm.submit();	//자바스크립트 언어
//				$("frm").submit();	// jquery 언어, jquery 전용 id값으로 form 태그를 실행
			}
		}
	});
});
</script>
</head>
<body>

<form id="frm" method="post" action="./mailok.do">
담당자 성함 : <input type="text" name="to_name" id="to_name"><br>
회신 받을 메일주소 : <input type="text" name="to_mail" id="to_mail"><br>
제목 : <input type="text" name="subject" id="subject"><br>
제휴내용 : <textarea name="context" class="area" id="context"></textarea><br>
<input type="button" value="제휴문의" id="btn">
</form>

</body>
</html>