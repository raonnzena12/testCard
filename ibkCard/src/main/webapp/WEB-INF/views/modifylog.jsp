<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyLog</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
#backBtn {
    cursor: pointer;
    text-decoration: underline;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-1">
        </div>
        <div class="col-md-10">
            <h2 class="my-3">회원정보 수정이력</h2>
            <table class="table table-hover table-sm">
                <thead>
                    <tr>
                        <th>
                            No
                        </th>
                        <th>
                            수정항목
                        </th>
                        <th>
                            수정전 내용
                        </th>
                        <th>
                            수정후 내용
                        </th>
                        <th>
                            수정 일자
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                    <c:when test='${ fn:length(mList) != 0 }'>
                    <c:forEach var='log' items='${ mList }' varStatus='status' >
                    <tr>
                        <td>
                            ${ status.count }
                        </td>
                        <td>
                            ${ log.logModiCol }
                        </td>
                        <td>
                            ${ log.logBefore }
                        </td>
                        <td>
                            ${ log.logAfter }
                        </td>
                        <td>
                            ${ log.logModiDate }
                        </td>
                    </tr>
                    </c:forEach>
                    </c:when>
                    <c:otherwise>
                    <tr>
                        <td colspan="5">
                            수정 이력이 없습니다.
                        </td>
                    </tr>
                    </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
            <div>
                <span id="backBtn" onclick="javascript:history.back()">이전</span>
            </div>
        </div>
        <div class="col-md-1">
        </div>
    </div>
</div>
</body>
</html>