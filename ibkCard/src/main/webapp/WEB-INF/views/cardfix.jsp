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
	$j('#modifyBtn').on('click', function(){
		var data = $j('.creditsub :input').serialize();
		console.log(data);
		$j.ajax({
			url: 'modify',
			data: data,
			dataType: 'JSON',
			type: 'POST',
			error: function(e) { console.log(e); },
			success: function(result) {
				if ( result.result == 'success' ) {
					alert('카드정보가 수정 되었습니다');
					location.href='./';
				} else {
					alert('카드정보 수정 실패\n담당자에게 문의하세요');
				}
			}
		});
	});

	// 체크박스 선택시 타 체크박스 해제하고 해당 체크만 선택
	$j("input[name=cardBrandCode],input[name=cardOverseas]").on("click",function(){
		var name = $j(this).attr("name");
		$j("input:checkbox[name="+name+"]").prop("checked", false).change();
		$j(this).prop("checked", true);
	});
});
</script>
<body>
<form class="creditsub">
	<table id="target2" border="1" width="1000">
	<tr><td>카드정보수정</td></tr>
		<tr>
 			<td width="10%" align="center">상품명</td>
 			<td width="20%">
 				<select name="cardName" id="cardName">
				<option value="card1" ${ card.cardName == 'card1' ? 'selected' : '' }>card1</option>
				<option value="card2" ${ card.cardName == 'card2' ? 'selected' : '' }>card2</option>
				<option value="card3" ${ card.cardName == 'card3' ? 'selected' : '' }>card3</option>
				<option value="card4" ${ card.cardName == 'card4' ? 'selected' : '' }>card4</option>
 			</select>
 			</td>
 			<td width="6%" align="center" rowspan="2">상품관련추가사항</td>
 			<td width="40%" colspan="3">상품서비스 - 
			<select name="cardServiceCode" id="cardServiceCode">
				<option value="CS001" ${ card.cardServiceCode == 'CS001' ? 'selected' : '' }>신용카드</option>
				<option value="CS002" ${ card.cardServiceCode == 'CS002' ? 'selected' : '' }>체크카드</option>
 			</select>
			</td>
		</tr>
		<tr>
 			<td width="10%" align="center">브랜드구분</td>
 			<td width="=50%"> 
				<input type="checkbox" value="CB001" name="cardBrandCode" id="CB001" ${ card.cardBrandCode == 'CB001' ? 'checked' : '' }><label for="CB001">국내</label>
				<input type="checkbox" value="CB002" name="cardBrandCode" id="CB002" ${ card.cardBrandCode == 'CB002' ? 'checked' : '' }><label for="CB002">마스터</label>
				<input type="checkbox" value="CB003" name="cardBrandCode" id="CB003" ${ card.cardBrandCode == 'CB003' ? 'checked' : '' }><label for="CB003">비자</label>
				<input type="checkbox" value="CB004" name="cardBrandCode" id="CB004" ${ card.cardBrandCode == 'CB004' ? 'checked' : '' }><label for="CB004">Unionpay</label>
				<input type="checkbox" value="CB005" name="cardBrandCode" id="CB005" ${ card.cardBrandCode == 'CB005' ? 'checked' : '' }><label for="CB005">BC글로벌</label>
 			</td>  
 			<td width="10%" align="center" colspan='2'>카드디자인선택</td>
 			<td width="10%">
				<input name="cardDesignCode" type="Radio" size="20" value="CD001" id="cd1" ${ card.cardDesignCode == 'CD001' ? 'checked' : '' }>1
				<input name="cardDesignCode" type="Radio" size="20" value="CD002" id="cd2" ${ card.cardDesignCode == 'CD002' ? 'checked' : '' }>2
				<input name="cardDesignCode" type="Radio" size="20" value="CD003" id="cd3" ${ card.cardDesignCode == 'CD003' ? 'checked' : '' }>3
 			</td>
		</tr>
		<tr>
			<td width="10%" align="center" >추가기능
			</td>
			<td>
				<input type="checkbox" value="Y" name="cardAdditional1" id="traffic" ${ card.cardAdditional1 == 'Y' ? 'checked' : '' }><label for="traffic">교통카드</label>
				<input type="checkbox" value="Y" name="cardAdditional2" id="cash" ${ card.cardAdditional2 == 'Y' ? 'checked' : '' }><label for="cash">현금카드</label>
			</td>
 			<td width="6%" align="center">해외이용 on/off</td>
 			<td width="10%" colspan='3'>
				<input type="checkbox" value="Y" name="cardOverseas" id="osY" ${ card.cardOverseas == 'Y' ? 'checked' : '' }><label for="osY">ON</label>
				<input type="checkbox" value="N" name="cardOverseas" id="osN" ${ card.cardOverseas == 'N' ? 'checked' : '' }><label for="osN">OFF</label>
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
	<a href="#" id="modifyBtn">수정완료</a>
	<a href="javascript:history.back();">이전화면</a>
</form>	
</body>
</html>