<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main</title>
<style>
#test_modal {
	display: none;
}
</style>
</head>
<script type="text/javascript">
$j(document).ready(function(){
	$j("#mybtn1").on("click",function(){
		$j("#test_modal").modal();
	});
	$j("#mybtn2").on("click",function(){

	});
	$j("#mybtn3").on("click",function(){
		location.href='member/join/form';
	});
	$j('#loginBtn').on('click',function(){
		var memNo = $j('#memberNo').val().trim();
		var memBirth = $j('#memberBirth').val().trim();
		$j.ajax({
			url: 'member/login',
			type: 'POST',
			data: { memNo : memNo 
					,memBirth : memBirth},
			dataType: 'JSON',
			error: function(e) { console.log(e); },
			success: function(data) {
				console.log(data);
				if ( data.success == '성공' ) {
					alert('로그인에 성공 하였습니다\n'+data.memKname+'님 환영합니다.');
					location.href = '/card/member/'+data.memNo;
				} else {
					alert('로그인에 실패 하였습니다');
				}
			}
		});
	});
});
</script>
<body align="center">
	<img src="resources/images/bank.png" width="750" height="480">
<form class="credit">
	<table align="center">
		<tr>
			<td>
				<input id="mybtn1" type="button" value="고객번호로그인" >
				<input id="mybtn1" type="button" value="생년월일로그인" >
				<input id="mybtn3" type="button" value="카드신청" >
			</td>
		</tr>
	</table>
</form>
<div id="test_modal">
	<label for="memberNo">고객번호 </label><input type="text" name="memberNo" id="memberNo"><br>
	<label for="memberBirth">생년월일 </label><input type="text" name="memberBirth" id="memberBirth">
	<button type="button" id="loginBtn">로그인</button>
</div>
</body>
</html>
