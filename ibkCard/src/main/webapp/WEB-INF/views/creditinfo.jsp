<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>creditsub</title>
</head>
<script type="text/javascript">
$j(function(){
	$j('#modifyBtn').on('click',function(){
		location.href='./modify';
	});
});
</script>
<body>
<form class="creditsub">
	<table id="target2" border="1" width="1000">
	<tr>카드정보조회</tr>
		<tr>
 			<td width="10%" align="center">상품명</td>
 			<td width="20%">
 			${ card.cardName }
 			</td>
 			<td width="6%" align="center" rowspan="2">상품관련추가사항</td>
 			<td width="40%" colspan="3">상품서비스 - 
 			${ card.cardServiceName }
			</td>
		</tr>
		<tr>
 			<td width="10%" align="center">브랜드구분</td>
 			<td width="=50%"> 
				 ${ card.cardBrandName }
 			</td>  
 			<td width="10%" align="center" colspan='2'>카드디자인선택</td>
 			<td width="10%">
 				${ card.cardDesignCode }
 			</td>
		</tr>
		<tr>
			<td width="10%" align="center" >추가기능
			</td>
			<td>
			<c:if test="${ card.cardAdditional1 == 'Y' }">교통카드</c:if>
			<c:if test="${ card.cardAdditional2 == 'Y' }">현금카드</c:if>
			<c:if test="${ card.cardAdditional1 == 'N' && card.cardAdditional2 == 'N' }"> 없음 </c:if>
			</td>
 			<td width="6%" align="center">해외이용 on/off</td>
 			<td width="10%" colspan='3'>
				<c:choose>
					<c:when test="${ card.cardOverseas == 'Y' }">
					ON
					</c:when>
					<c:otherwise>
					OFF
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td width="10%" align="center">카드번호</td>
			<td colspan='2' align="center">
 				${ fn:substring(card.cardNo,0,4) } - ${ fn:substring(card.cardNo,4,8) } - ${ fn:substring(card.cardNo,8,12) } - ${ fn:substring(card.cardNo,12,16) } 
			</td>
 			<td width="6%" align="center">고객번호</td>
 			<td width="10%" colspan='3'>
				${ card.memNo }
			</td>
		</tr>
	</table>
	<a href="#" id="modifyBtn">수정</a>
	<a href="/card/member/${ loginUser.memNo }/cardList">카드목록</a>
	<a href="/card/member/${ loginUser.memNo }">이전화면</a>
</form>	
</body>
</html>
