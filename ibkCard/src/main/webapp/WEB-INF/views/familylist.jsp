<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>familyinfo</title>
<style>
input[type=text] {
	text-align: center;
}
</style>
</head>
<script type="text/javascript">
$j(document).ready(function(){
	$j('#modifyBtn').on('click', function(){
		if ( ${ fn:length(fList) != 0 } ) {
			location.href='/card/member/${ loginUser.memNo }/familyModify';
		} else {
			return false;
		}
	});
});
</script>
<body>
<form class="familyinfo">
	가족목록
	</table>
	<table id="boardTable" border = "1">
		<tr>
			<td width="100" align="center"> 
				한글이름 
			</td>
			<td width="100" align="center">
				영문명
			</td>
			<td width="80" align="center">
				관계
			</td>
			<td width="100" align="center">
				생년월일
			</td>
			<td width="80" align="center">
				고객번호
			</td>
			<td width="80" align="center"> 
				가족한도
			</td>
			<td width="130" align="center">
				이용중인 서비스
			</td>
		</tr>
		<c:choose>
		<c:when test="${ fn:length(fList) != 0 }">
		<c:forEach var="mem" items="${ fList }" varStatus="status">
		<tr>
			<td><input type="text" name="memKname" id="memKname" value="${ mem.memKname }" readonly></td>
			<td><input type="text" name="memEname" id="memEname" value="${ mem.memEname }" readonly></td>
			<td><input type="text" name="memFRe" id="memFRe" value="${ mem.memFamily }" readonly></td>
			<td><input type="text" name="memBirth" id="memBirth" value="${ mem.memBirth }" readonly></td>
			<td><input type="text" name="memNo" id="memNo" value="${ mem.memNo }" readonly></td>
			<td><input type="text" name="memLimit" id="memLimit" value="${ mem.memLimit }" readonly></td>
			<td><input type="text" name="memServiceCode" id="memServiceCode" value="${ empty mem }" readonly></td>
		</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
		<tr>
			<td colspan="7">등록된 가족 회원이 없습니다</td>
		</tr>	
		</c:otherwise>
		</c:choose>
	</table>
	환영합니다 고객번호 ${ loginUser.memNo } 고객님.<br>
	<a href="#" id="modifyBtn">수정</a>
</form>	
</body>
</html>
