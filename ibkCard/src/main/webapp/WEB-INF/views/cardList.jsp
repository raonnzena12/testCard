<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CardList</title>
<style>
.float-right {
    float: right;
}
.cardImg {
    width: 100px;
}
.list td {
    cursor: pointer;
}
</style>
<script>
$j(function(){
    $j('.list td:not(:first-child)').on('click', function(){
        var cNo = $j(this).parent().attr('index');
        console.log(cNo);
        location.href=cNo;
    });
});
</script>
</head>
<body>
<table style="margin: auto;">
    <tr>
        <td>
            카드목록
        </td>
    </tr>
    <tr>
        <td>
            <table border="1" style="width:1000px">
                <thead align="center">
                    <tr>
                        <td>구분</td>
                        <td>상품명</td>
                        <td>브랜드구분</td>
                        <td>상품서비스</td>
                        <td>고객번호</td>
                        <td>카드번호</td>
                        <td>카드디자인</td>
                        <td>이미지</td>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                    <c:when test="${ empty cList }">
                    <tr>
                        <td colspan="8" align="center"> 카드 정보가 없습니다 </td>
                    </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="card" items="${ cList }" varStatus="status">
                        <tr align="center" class='list' index="${ card.cardNo }">
                            <td><label>${ status.count }<input type="checkbox" name="card" index="${ status.index }" ></label></td>
                            <td>${ card.cardName }</td>
                            <td>${ card.cardBrandName }</td>
                            <td>${ card.cardServiceName }</td>
                            <td>${ card.memNo }</td>
                            <td>${ fn:substring(card.cardNo,0,4) }-${ fn:substring(card.cardNo,4,8) }-${ fn:substring(card.cardNo,8,12) }-${ fn:substring(card.cardNo,12,16) }</td>
                            <td>${ card.cardDesignCode }</td>
                            <td>
                            <c:choose>
                                <c:when test="${ card.cardDesignCode == 'CD001' }">
                                <img src="/card/resources/images/credit-card1.png" class='cardImg'>
                                </c:when>
                                <c:when test="${ card.cardDesignCode == 'CD002' }">
                                <img src="/card/resources/images/credit-card2.png" class='cardImg'>
                                </c:when>
                                <c:when test="${ card.cardDesignCode == 'CD003' }">
                                <img src="/card/resources/images/credit-card3.png" class='cardImg'>
                                </c:when>
                            </c:choose>
                            </td>
                        </tr>
                        </c:forEach>
                    </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <span><a href="javascript:history.back();">이전화면</a></span>
            <span class="float-right">
                <a href="#">수정</a>
                <a href="#">카드추가신청</a>
            </span>
        </td>
    </tr>
</table>
</body>
</html>