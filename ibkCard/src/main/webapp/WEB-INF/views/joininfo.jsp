<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>credit</title>
</head>
<script type="text/javascript">
$j(document).ready(function(){
	$j("#submit").on("click",function(){
		var $frm = $j('.boardWrite :input');
		var param = $frm.serialize();
		$j.ajax({
			url : "/board/boardWriteAction.do",
			dataType: "json",
			type: "POST",
			data : param,
			success: function(data, textStatus, jqXHR)
			{
				alert("작성완료");
				alert("메세지:"+data.success);
				location.href = "/board/boardList.do"
			},
			error: function (jqXHR, textStatus, errorThrown)
			{
				alert("실패");
			}
		});
	}),
});
</script>
<body>
<form class="credit">
	<table border="1" width="1200">  
	<tr>가입정보</tr>
	<tr>
 		<td width="5%" align="center">한글성명</td>
 		<td width="10%">
 			${ member.memKname }
 		</td>
 		<td width="5%" align="center">영문명</td>
 		<td width="10%">
 			${ member.memEname }
 		</td>
 		<td width="5%" align="center">생년월일</td>
 		<td width="10%">
			${ member.memBirth }
		</td>
	</tr>
	
	<tr>
		<td width="5%" align="center">자택주소</td> 
 		<td width="10%" colspan='1'>
 			${ hAddr1 }
 			
 		</td>  
 		<td width="5%" align="center">상세주소</td>
			<td width="10%" colspan='1' >
			${ hAddr2 }
 		</td> 
 		<td width="5%" align="center">자택전화</td>
 		<td width="10%">
			${ empty hPhone || hPhone == "" ? '없음' : hPhone }
 		</td>
 		
	</tr>
	
	<tr>
 		<td width="5%" align="center">휴대전화</td>
 		<td width="10%">
 			${ member.memCphone }
 		</td>
 		<td width="5%" align="center">별도SMS</td>
 		<td width="10%">
 			${ empty member.memSphone || member.memSphone == "" ? '없음' : member.memSphone }
 		</td>
 		<td width="5%" align="center">이메일</td>
 		<td width="10%">
			${ member.memEmail }
		</td>
	</tr>

	<tr>
		<td width="5%" colspan='2'  align="center">승인내역알림서비스</td>
 		<td width="10%" colspan='7'> 
			${ member.memSmsCode }
 		</td>  
	</tr>
	
	<tr>
 		<td width="5%" align="center">결제은행</td>
 		<td width="10%">
 			${ member.memBankCode }
 		</td>
 		<td width="5%" align="center">계좌번호</td>
 		<td width="10%">
 			${ member.memAccount }
 		</td>
 		<td width="5%" align="center">결제일</td>
 		<td width="10%">
 				01일
		</td>
	</tr>
		
	<tr>
		<td width="5%" colspan='2'  align="center">요청최고한도</td>
 		<td width="10%" colspan='7'> 
			${ member.memLimit }
 		</td>  
	</tr>

	<tr>
		<td width="10%" colspan='1'  align="center">청구서수령지</td>
 		<td width="10%" colspan='8'> 
			${ member.memBillCode }
 		</td>  
	</tr>
	
	<table><tr></tr></table>
	
	</table>
		
		<table border="1" width="1200">
	
	<tr>
		<td width="5%" align="center">직장주소</td>
 		<td width="10%" colspan='3'>
 		${ wAddr }
 		</td>  
 		<td width="5%" align="center">직장전화</td>
 		<td width="10%">
 		${ wPhone }
 		</td>
	</tr>
	 
	<tr>
 		<td width="5%" align="center">직장명</td>
 		<td width="10%">
 		${ member.memWname }
 		</td>
 		<td width="5%" align="center">부서명</td>
 		<td width="10%">
 		${ member.memDept }
 		</td>
 		<td width="5%" align="center">직위</td>
 		<td width="10%">
		${ member.memJobposition } 
		</td>
	</tr>
	</table>
	<table><tr>
		<td>
			환영합니다. 고객번호 ${ member.memNo } ${ member.memKname } 고객님.
		</td>
	</tr></table>
	<table>
		<tr>
			<td>
				<a href="javascript:history.back();">이전화면</a>
				<a href="modifyInfo">수정</a>	
		</tr>
	</table>
</form>	
</body>
</html>
