<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main2</title>
</head>
<script type="text/javascript">
$j(document).ready(function(){
	$j("#mybtn1").on("click",function(){
		location.href='/card/member/${ loginUser.memNo }/modifyLog';
	});
	$j('#mybtn2').on('click',function(){
		location.href='/card/member/${ loginUser.memNo }/familyList';
	});
	$j('#mybtn3').on('click',function(){
		location.href = '/card/member/${ loginUser.memNo }/mypage';
	});
	$j('#mybtn4').on('click',function(){
		location.href = '/card/member/${ loginUser.memNo }/cardList';
	});
	$j('#mybtn5').on("click", function(){
		if ( confirm('로그아웃 하시겠습니까?') ) {
			location.href = '/card/member/${ loginUser.memNo }/logout';
		}
	});
});
</script>
<body align="center">
	<img src="/card/resources/images/public.jpg" width="450" height="380">
<form class="credit">
	<table align="center">
	<tr>
		<td>
			<input id="mybtn1" type="button" value="수정내역관리" >
			<input id="mybtn2" type="button" value="가족목록" >
			<input id="mybtn3" type="button" value="가입정보">
			<input id="mybtn4" type="button" value="카드목록" >
			<input id="mybtn5" type="button" value="로그아웃" >
		</td>
	</tr>
	<tr>
	<td align="center">환영합니다 고객번호 ${ member.memNo } 고객님.</td>
	</tr>
	</table>
</form>	
</body>
</html>
