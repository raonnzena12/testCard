<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>familyinfo</title>
</head>
<script type="text/javascript">
$j(document).ready(function(){
	$j('#modifyBtn').on('click', function(){
		var data = $j('.familyinfo input').serialize();
		console.log(data);
		$j.ajax({
			url:'/card/member/${ loginUser.memNo }/familyModify',
			data: data,
			type: 'POST',
			dataType: 'JSON',
			error: function(e) { console.log(e); },
			success: function(result) {
				if ( result.result == 'success' ) {
					alert('가족회원 정보가 수정 되었습니다');
					location.href='/card/member/${ loginUser.memNo }/familyList';
				} else {
					alert('가족회원 정보수정에 실패 하였습니다.');
				}
			}
		});
	});

	$j("input[name$=memLimit]").on("input", function(){
		fn_inputNumber($j(this), 10);
	});

	// 영어이름 입력시 영어만 받기/대문자로 변환
	$j("input[name$=memEname]").on("input", function(){
		$j(this).val($j(this).val().replace(/[^a-zA-Z\s]/,"").toUpperCase());
	});

	// 생년월일 체크하는 코드
	$j("input[name$=memBirth]").on("input", function(){
		fn_inputNumber($j(this), 8);
	}).on("blur",function(){
		// 생년월일을 이쁘게.. 보이게함
		var input = $j(this).val();
		if ( input.length > 6 ) {
			var year = input.substring(0,4);
			var month = input.substring(4,6);
			var day = input.substring(6);
			$j(this).val(year+'-'+month+'-'+day);
		} else if ( input.length > 4 ) {
			var year = input.substring(0,4);
			var month = input.substring(4);
			$j(this).val(year+'-'+month);
		}
	}).on("focus", function(){
		// 입력하게 편하게 바꿈
		$j(this).val($j(this).val().replace(/[^0-9]/g,""));
	});
});
// 한글이름 한글 미입력시 alert
function fn_inputKoren() {
	if ( event.keyCode < 12592 || event.keyCode > 12687) {
		alert("한글만 입력 가능합니다");
		Event.returnValue = false;
	}
}
// 숫자만 받는 함수
function fn_inputNumber(obj, leng) {
	var $input = obj.val();
	obj.val($input.replace(/[^0-9]/g,""));
	if ( $input.length > leng ) {
		obj.val($input.substring(0, leng));
	}
}
</script>
<body>
<form class="familyinfo">
	<table width="1130"> 
	<tr><td>가족목록수정</td></tr>
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
				이용중인서비스
			</td>
		</tr>
		<c:forEach var="mem" items="${ fList }" varStatus="status">
		<tr>
			<td><input type="text" name="mList[${ status.index }].memKname" id="mList[${ status.index }].memKname" value="${ mem.memKname }" onkeypress='fn_inputKoren();'></td>
			<td><input type="text" name="mList[${ status.index }].memEname" maxlength="25" id="mList[${ status.index }].memEname" value="${ mem.memEname }"></td>
			<td><input type="text" name="mList[${ status.index }].memFRe" id="mList[${ status.index }].memFRe" value="${ mem.memFamily }"></td>
			<td><input type="text" name="mList[${ status.index }].memBirth" id="mList[${ status.index }].memBirth" value="${ fn:substring(mem.memBirth,0,4) }-${ fn:substring(mem.memBirth,4,6) }-${ fn:substring(mem.memBirth,6,8) }"></td>
			<td><input type="text" name="mList[${ status.index }].memNo" id="mList[${ status.index }].memNo" readonly value="${ mem.memNo }"></td>
			<td><input type="text" name="mList[${ status.index }].memLimit" id="mList[${ status.index }].memLimit" value="${ mem.memLimit }"></td>
			<td><input type="text" name="mList[${ status.index }].memServiceCode" id="mList[${ status.index }].memServiceCode" readonly value="${ empty mem }"></td>
		</tr>
		</c:forEach>
	</table>
	<table>
		<tr>
			<td>환영합니다 고객번호 ${ loginUser.memNo } 고객님.</td>
		</tr>
		<tr>
			<td>
				<a href="javascript:history.back();">이전</a> 
				<a href="#" id="modifyBtn">완료</a>
			</td> 
		</tr>
	</table>
</form>	
</body>
</html>
