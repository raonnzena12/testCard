<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>credit</title>
<style>
.unvisible {
	display: none;
}	
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<script type="text/javascript">
// 화면 이탈 확인용 TF // 정상 이탈시에는 false로 바꿔줄 것
var checkUnload = true;
$j(window).on("beforeunload" , function(){
	if ( checkUnload ) {
		return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다."
	}
});
$j(document).ready(function(){
	$j("#submitBtn").on("click",function(){
		var vail1 = fn_vali1();
		if ( !vail1 ) return false;
		var haddr = $j('#memHaddress').val().trim()+','+$j('#memHaddress2').val();
		$j('#addr0').val(haddr);
		if ( !$j('#memHpNone').is(":checked") ) {
			var hphone = $j('#memHphone1').val()+$j('#memHphone2').val().replace(/[^0-9]/g,"");
			$j('#addrPhone0').val(hphone);
		}
		var cphone = $j('#memCphone1').val()+$j('#memCphone2').val().replace(/[^0-9]/g,"");
		$j('input[name=memCphone]').val(cphone);
		var email = $j('#memEmail1').val()+'@'+$j('#memEmail2').val();
		$j('input[name=memEmail]').val(email);
		var bselect = $j('#BCetc').is(":checked");
		if ( bselect ) $j('input[name=memBankCode]').val($j('#BC002').val());
		else $j('input[name=memBankCode]').val($j('#BC001').val());
		var lselect = $j('#limitetc').is(":checked");
		if ( lselect ) $j('input[name=memLimit]').val($j('#limitetcinput').val());
		else $j('input[name=memLimit]').val($j('input[name=limit]:checked').val());
		$j('input[name=memBillCode]').val($j('input[name=bill]:checked').val());
		if ( $j('#memWaddr').val() != 0 ) {
			$j('#addr1').val($j('#memWaddr').val());
			var wphone = $j('#memWphone1').val() + $j('#memWphone1').val().replace(/[^0-9]/g,"");
			$j('#addrPhone1').val(wphone);
		}
		if ( $j('#oaddr').is(':checked') ) {
			$j('#addr2').val($j('#oAddrInput').val());
			$j('#addrPhone2').val($j('#oAddrPhone').val().replace(/[^0-9]/g,""));
		}
		var $frm = $j('.creditFrm :input');
		var param = $frm.serialize();
		$j.ajax({
			url : "modify",
			dataType: "json",
			type: "POST",
			data : param,
			success: function(data, textStatus, jqXHR)
			{
				console.log(data);
				checkUnload = false;
				location.href = 'memberMain';
			},
			error: function (jqXHR, textStatus, errorThrown)
			{
				alert("통신실패");
			}
		});
	});

	//* 영어이름 입력시 영어만 받기/대문자로 변환 */
	$j("#memEname").on("input", function(){
		$j(this).val($j(this).val().replace(/[^a-zA-Z\s]/,"").toUpperCase());
	});
	
	// 생년월일 체크하는 코드
	$j("#memBirth").on("input", function(){
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


	// 주소API 호출하는 코드
	$j("#doro1, #memHaddress").on("click", function(){
		execDaumPostcode("memHaddress", 0);
	});
	$j("#doro2, #memWaddr").on("click", function(){
		execDaumPostcode("memWaddr", 1);
	});
	$j('#oAddrInput').on("click", function(){
		execDaumPostcode('oAddrInput', 2);
	});	

	// 자택전화&휴대전화 확인하는 코드
	$j("#memHphone2,#memCphone2,#memWphone2").on("input", function(){
		fn_inputNumber($j(this), 8);
	}).on("blur", function(){
		var $input = $j(this).val();
		if ( $input.length == 7 ) {
			var mid = $input.substring(0,3);
			var end = $input.substring(3);
			$j(this).val(mid+'-'+end);
		} else if ( $input.length > 4 ) {
			var mid = $input.substring(0,4);
			var end = $input.substring(4);
			$j(this).val(mid+'-'+end);
		}
	}).on("focus", function(){
		$j(this).val($j(this).val().replace(/[^0-9]/g,""));
	});

	// 별도 SMS 확인하는 코드
	$j("#memSphone,#oAddrPhone").on({
		input: function(){
			fn_inputNumber($j(this), 11);
		},
		blur: function(){
			var $input = $j(this).val();
			if ( $input.length > 6 ) {
				var str = $input.substring(0,3);
				var mid = "", end = "";
				if ( $input.length == 11 ) {
					mid = $input.substring(3,7);
					end = $input.substring(7);
				} else {
					mid = $input.substring(3,6);
					end = $input.substring(6);
				}
				$j(this).val(str+'-'+mid+'-'+end);
			} else if ( $input.length > 3 ) {
				var str = $input.substring(0,3);
				var mid = $input.substring(3);
				$j(this).val(str+'-'+mid);
			}
		},
		focus: function(){
			$j(this).val($j(this).val().replace(/[^0-9]/g,""));
		}
	});

	// 자택전화|별도SMS 없음 체크박스 시 입력창 비활성화
	$j("#memHpNone, #memSpNone").on("click",function(){
		if ( $j(this).prop("checked") == true ) {
			$j(this).parent().prevAll().attr("disabled",true);
		} else {
			$j(this).parent().prevAll().attr("disabled",false);
		}
	});

	// 체크박스 선택시 타 체크박스 해제하고 해당 체크만 선택
	$j("input[name=memSmsCode],input[name=Bselect],input[name=limit],input[name=bill],input[name=cardBrandCode],input[name=cardOverseas]").on("click",function(){
		var name = $j(this).attr("name");
		$j("input:checkbox[name="+name+"]").prop("checked", false).change();
		$j(this).prop("checked", true);
	});

	// email 입력값 체크하는 코드
	$j('#memEmail1').on('input', function(){
		$input = $j(this).val().trim();
		$j(this).val($input.replace(/[^a-zA-Z0-9\._-]/g,""));
	})

	// 기타란 클릭시 타 인풋창 display바꾸기
	$j("#BCetc, #limitetc, #oaddr").on("change",function(){
		if ( $j(this).prop("checked") == true ) {
			$j(this).next().next().removeClass("unvisible");
		} else {
			$j(this).next().next().addClass("unvisible");
		}
	});

	// 계좌번호 입력
	$j("#memAccount").on("input", function(){
		fn_inputNumber($j(this),14);
	});
});
// 숫자만 받는 함수
function fn_inputNumber(obj, leng) {
	var $input = obj.val();
	obj.val($input.replace(/[^0-9]/g,""));
	if ( $input.length > leng ) {
		obj.val($input.substring(0, leng));
	}
}

// 한글이름 한글 미입력시 alert
function fn_inputKoren() {
	if ( event.keyCode < 12592 || event.keyCode > 12687) {
		alert("한글만 입력 가능합니다");
		Event.returnValue = false;
	}
}

function fn_selectCardDesign(num) {
	$j("#cd"+num).prop("checked", "checked");
}

// 다음 주소검색 서비스 오픈
function execDaumPostcode(idStr, index) {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 참고 항목 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !== '' && data.apartment === 'Y'){
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if(extraRoadAddr !== ''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			// document.getElementById('sample4_postcode').value = data.zonecode;
			// document.getElementById("sample4_roadAddress").value = roadAddr;
			// document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
			document.getElementById(idStr).value = roadAddr;
			document.getElementById('post1'+index).value = data.zonecode;
			document.getElementById('post2'+index).value = data.postcode;
			
			// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
			// if(roadAddr !== ''){
			// 	document.getElementById("sample4_extraAddress").value = extraRoadAddr;
			// } else {
			// 	document.getElementById("sample4_extraAddress").value = '';
			// }

			// var guideTextBox = document.getElementById("guide");
			// // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
			// if(data.autoRoadAddress) {
			// 	var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
			// 	guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
			// 	guideTextBox.style.display = 'block';

			// } else if(data.autoJibunAddress) {
			// 	var expJibunAddr = data.autoJibunAddress;
			// 	guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
			// 	guideTextBox.style.display = 'block';
			// } else {
			// 	guideTextBox.innerHTML = '';
			// 	guideTextBox.style.display = 'none';
			// }
		}
	}).open();
}

function fn_vali1(){
// 한글이름 검증
	var regExp = /^[가-힣]{2,5}$/g;
	var kname = $j("#memKname").val().trim();
	if ( !regExp.test(kname) || kname == 0 ) {
		alert("성명을 올바르게 입력 해 주세요");
		$j("#memKname").focus();
		return false;
	}
	// 영어이름 검증
	regExp = /^[A-Z ]{2,}$/g;
	var ename = $j("#memEname").val().trim();
	if ( ename == 0 || !regExp.test(ename) ){
		alert("영문성명을 올바르게 입력 해 주세요");
		$j("#memEname").focus();
		return false;
	}
	// 생일 검증
	regExp = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
	var birth = $j("#memBirth").val().replace(/[^0-9]/g,"");
	if ( birth == 0 || !regExp.test(birth) ) {
		alert("생년월일을 올바르게 입력 해 주세요");
		$j("#memBrith").focus();
		return false;
	}
	// 주소 검증
	regExp = /^[A-Za-z0-9가-힣 _-]{2,}$/g;
	var address1 = $j("#memHaddress").val().trim();
	var address2 = $j("#memHaddress2").val().trim();
	if ( address1 == 0 ) {
		alert('주소를 입력 해 주세요');
		return false;
	} else if ( address2 == 0 || !regExp.test(address2) ) {
		alert('상세주소를 올바르게 입력 해 주세요');
		$j('#memHaddress2').focus();
		return false;
	}
	// 자택전화번호 검증
	regExp = /^[0-9]{7,8}$/g;
	var hphone = $j("#memHphone2").val().replace(/[^0-9]/g,"");
	var hphoneN = $j('#memHpNone').is(":checked");
	if ( !hphoneN && !regExp.test(hphone) ) {
		alert('자택 전화번호를 올바르게 입력 해 주세요');
		$j('#memHphone2').focus();
		return false;
	}
	// 휴대전화번호 검증
	regExp = /^[0-9]{7,8}$/g;
	var yphone = $j('#memCphone2').val().replace(/[^0-9]/g,"");
	if ( !regExp.test(yphone) ) {
		alert('휴대전화번호를 올바르게 입력 해 주세요냠냠');
		$j('#memCphone2').focus();
		return false;
	}
	// 별도SMS 전화번호 검증
	regExp = /^[0-9]{10,11}$/g;
	var sphone = $j('#memSphone').val().replace(/[^0-9]/g,"");
	var sphoneN = $j('#memSpNone').is(":checked");
	if ( !sphoneN && !regExp.test(sphone) ) {
		alert('별도 SMS번호를 올바르게 입력 해 주세요\n사용하지 않을 경우에는 "없음"에 체크 해 주세요');
		$j('#memSphone').focus();
		return false;
	}
	// 이메일 검증
	regExp = /^[a-zA-Z0-9\._-]{4,20}$/g;
	var email = $j('#memEmail1').val();
	if ( email == 0 || !regExp.test(email) ) {
		alert('이메일을 올바르게 입력 해 주세요');
		$j('#memEmail1').focus();
		return false;
	}
	// 승인내역 알림서비스 검증
	var smsLeng = $j('input[name=memSmsCode]:checked').length;
	if ( smsLeng == 0 ) {
		alert('승인내역을 받을 알림서비스를 선택해 주세요');
		return false;
	}
	// 결제 은행 검증
	var bbankLeng = $j('input[name=Bselect]:checked').length;
	if ( bbankLeng == 0 ) {
		alert('결제 은행을 선택해 주세요');
		return false;
	}
	// 결제 계좌번호 검증
	regExp = /^[0-9]{11,14}$/g;
	var account = $j('#memAccount').val();
	if ( !regExp.test(account) ) {
		alert('결제 계좌번호를 정확하게 입력 해 주세요');
		return false;
	}
	// 요청 최고한도 검증
	var limitLeng = $j('input[name=limit]:checked').length;
	var limitEtc = $j('#limitetc').is(":checked");
	var limitInput = $j('#limitetcinput').val();
	if ( limitLeng == 0 || ( limitEtc && ( ( limitInput*1 < 10000 || limitInput*1 > 10000000000 ) || limitInput == 0 ) ) ) {
		alert('최고한도를 설정해 주세요');
		return false;
	}
	// 청구서 수령지 지정
	var billLeng = $j('input[name=bill]:checked').length;
	var billEtc = $j('#oaddr').is(":checked");
	var oAddr = $j('#oAddrInput').val().trim();
	var ophone = $j('#oAddrPhone').val().replace(/[^0-9]/g,"");
	regExp = /^[0-9]{10,11}$/g;
	var regExp1 = /^[0-9a-zA-Z가-힣 _-]{5,}$/g;
	if ( billLeng == 0 || (billEtc && ( oAddr == 0 || !regExp1.test(oAddr) || !regExp.test(ophone) )) ) {
		alert('별도 청구지를 정확하게 입력해주세요');
		return false;
	}
	// 직장주소 검증 ( 수령지 직장으로 선택 시 필수 입력 )
	regExp = /^[0-9]{7,8}$/g;
	var bTow = $j('#waddr').is(":checked");
	var wAddr = $j('#memWaddr').val();
	var wPhone = $j('#memWphone2').val().replace(/[^0-9]/g,"");
	var wName = $j('#memWname').val();
	if ( bTow ) {
		if ( wAddr == 0 ) {
			alert('직장 주소를 정확하게 입력 해 주세요');
			$j('#haddr').focus();
			return false;
		}
		if( !regExp.test(wPhone) ) {
			alert('직장 전화번호를 정확하게 입력 해주세요');
			return false;
		}
		if ( wName == 0 ) {
			alert('직장명을 정확하게 입력 해주세요');
			return false;
		}
	}
	return true;
}
</script>
<body>
<form class="credit creditFrm">
	<!--  -->
	<input type="hidden" name="addrList[0].addrCode" value="BR003">
	<input type="hidden" name="addrList[0].address" id="addr0">
	<input type="hidden" name="addrList[0].addrPhone" id="addrPhone0">
	<input type="hidden" name="addrList[0].addrPost1" id="post10">
	<input type="hidden" name="addrList[0].addrPost2" id="post20">
	<!--  -->
	<input type="hidden" name="addrList[1].addrCode" value="BR002">
	<input type="hidden" name="addrList[1].address" id="addr1">
	<input type="hidden" name="addrList[1].addrPhone" id="addrPhone1">
	<input type="hidden" name="addrList[1].addrPost1" id="post11">
	<input type="hidden" name="addrList[1].addrPost2" id="post21">
	<!--  -->
	<input type="hidden" name="memCphone">
	<input type="hidden" name="memEmail">
	<input type="hidden" name="memBankCode">
	<input type="hidden" name="memLimit">
	<input type="hidden" name="memBillCode">
	<table border="1" width="1200">  
	<tr>가입정보수정</tr>
	<tr>
 		<td width="5%" align="center">한글성명</td>
 		<td width="10%">
 			<input name="memKname" type="text" size="30" value="${ member.memKname }" id="memKname" onkeypress="fn_inputKoren()">
 		</td>
 		<td width="5%" align="center">영문명</td>
 		<td width="10%">
 			<input name="memEname" type="text" size="30" value="${ member.memEname }" id="memEname">
 		</td>
 		<td width="5%" align="center">생년월일</td>
 		<td width="10%">
			<input name="memBirth" type="text" size="40" value="${ fn:substring(member.memBirth,0,4) }-${fn:substring(member.memBirth,4,6)}-${fn:substring(member.memBirth,6,8)}" id="memBirth">
		</td>
	</tr>
	
	<tr>
		<td width="5%" align="center">자택주소</td>
 		<td width="10%" colspan='1'>
 			<input name="memHaddress1" type="text" size="10" value="${ hAddr1 }" id="memHaddress">
 			<input type="button" id="doro1" value="주소찾기 " width="30%" size="30">  
 		</td>  
 		<td width="5%" align="center">상세주소</td>
			<td width="10%" colspan='1' >
 			<input name="memHaddress2" type="text" size="30" value="${ hAddr2 }" id="memHaddress2">
 		</td> 
 		<td width="5%" align="center">자택전화</td>
 		<td width="10%">
			<c:set var="hp1" value="${ empty hPhone ? '': fn:substring(hPhone,0,3) }" />
 			<select name="memHphone1" id="memHphone1">
 				<option value="070" ${ ph1 == '070' ? 'selected' : '' }>070</option>
 				<option value="02" ${ fn:contains(ph1,'02') ? 'selected' : '' }>02</option>
 				<option value="031" ${ ph1 == '031' ? 'selected' : '' }>031</option>
 				<option value="032" ${ ph1 == '032' ? 'selected' : '' }>032</option>
 				<option value="033" ${ ph1 == '033' ? 'selected' : '' }>033</option>
 				<option value="041" ${ ph1 == '041' ? 'selected' : '' }>041</option>
 				<option value="042" ${ ph1 == '042' ? 'selected' : '' }>042</option>
 				<option value="044" ${ ph1 == '044' ? 'selected' : '' }>044</option>
 				<option value="051" ${ ph1 == '051' ? 'selected' : '' }>051</option>
 				<option value="052" ${ ph1 == '052' ? 'selected' : '' }>052</option>
 				<option value="053" ${ ph1 == '053' ? 'selected' : '' }>053</option>
 				<option value="054" ${ ph1 == '054' ? 'selected' : '' }>054</option>
 				<option value="055" ${ ph1 == '055' ? 'selected' : '' }>055</option>
 				<option value="061" ${ ph1 == '061' ? 'selected' : '' }>061</option>
 				<option value="062" ${ ph1 == '062' ? 'selected' : '' }>062</option>
 				<option value="063" ${ ph1 == '063' ? 'selected' : '' }>063</option>
 				<option value="064" ${ ph1 == '064' ? 'selected' : '' }>064</option>
			 </select>
			<c:set var = "phstr"/>
			<c:choose>
			<c:when test="${ !empty hPhone && fn:contains(ph1,'02') }" >
			 	<c:set var="phstr" value = "${ fn:substring(hPhone,2,fn:length(hPhone)) }" />
			</c:when>
			<c:when test="${ !empty hPhone }">
				<c:set var="phstr" value="${ fn:substring(hPhone,3,fn:length(hPhone)) }" />
			</c:when>
			</c:choose>
			<c:choose>
			<c:when test="${ fn:length(phstr) == 8 }">
				<input name="memHphone2" type="text" size="10" value="${ fn:substring(phstr,0,4) }-${ fn:substring(phstr,4,8) }" id="memHphone2">
			</c:when>
			<c:when test="${ fn:length(phstr) == 7 }" >
				<input name="memHphone2" type="text" size="10" value="${ fn:substring(phstr,0,3) }-${ fn:substring(phstr,3,7) }" id="memHphone2">
			</c:when>
			<c:otherwise>
				<input name="memHphone2" type="text" size="10" value="${ hPhone }" id="memHphone2">
			</c:otherwise>
			</c:choose>
 			<input type="checkbox" name="memHpNone" id="memHpNone" ${ empty hPhone ? 'checked' : '' }>없음
 		</td>
 		
	</tr>
	
	<tr>
 		<td width="5%" align="center">휴대전화</td>
 		<td width="10%">
			<c:set var="pn1" value="${ fn:substring(member.memCphone,0,3) }" />
 			<select name="memCphone1" id="memCphone1">
 				<option value="010" ${ pn1 == '010' ? 'selected' : '' }>010</option>
 				<option value="011" ${ pn1 == '011' ? 'selected' : '' }>011</option>
 				<option value="016" ${ pn1 == '016' ? 'selected' : '' }>016</option>
 				<option value="017" ${ pn1 == '017' ? 'selected' : '' }>017</option>
 				<option value="018" ${ pn1 == '018' ? 'selected' : '' }>018</option>
 				<option value="019" ${ pn1 == '019' ? 'selected' : '' }>019</option>
 			</select>
 			<input name="memCphone2" type="text" size="20" value="${fn:substring(member.memCphone,3,7)}-${fn:substring(member.memCphone,7,11)}" id="memCphone2">
 		</td>
 		<td width="5%" align="center">별도SMS</td>
 		<td width="10%">
 			<input name="memSphone" type="text" size="20" value="${ member.memSphone }" id="memSphone">
 			<input type="checkbox" name="memSpNone" id="memSpNone" ${ empty member.memSphone || member.memSphone == ""? 'checked' : '' }>없음
 		</td>
		 <td width="5%" align="center">이메일</td>
		<c:set var="mail" value="${ fn:split(member.memEmail,'@') }" />
 		<td width="10%">
			<input name="memEmail1" type="text" size="10" value="${ mail[0] }" id="memEmail1">
			@
			<select name="memEmail2" id="memEmail2">
				<option value="naver.com" ${ mail[1] == 'naver.com' ? 'selected' : '' }>naver.com</option>
				<option value="kakao.com" ${ mail[1] == 'kakao.com' ? 'selected' : '' }>kakao.com</option>
				<option value="daum.net" ${ mail[1] == 'daum.net' ? 'selected' : '' }>daum.net</option>
				<option value="gmail.com" ${ mail[1] == 'gmail.com' ? 'selected' : '' }>gmail.com</option>
 			</select>
		</td>
	</tr>

	<tr>
		<td width="5%" colspan='2'  align="center">승인내역알림서비스</td>
 		<td width="10%" colspan='7'> 
			<input type="checkbox" value="SA01" name="memSmsCode" id="SA01" ${ fn:contains(member.memSmsCode,'유료SMS') ? 'checked' : ''}><label for="SA01">유료SMS</label>
			<input type="checkbox" value="SA02" name="memSmsCode" id="SA02" ${ fn:contains(member.memSmsCode,'유료카카오') ? 'checked' : ''}><label for="SA02">유료카카오알림톡</label>
			<input type="checkbox" value="SA03" name="memSmsCode" id="SA03" ${ fn:contains(member.memSmsCode,'무료SMS') ? 'checked' : ''}><label for="SA03">무료SMS</label>
			<input type="checkbox" value="SA04" name="memSmsCode" id="SA04" ${ fn:contains(member.memSmsCode,'무료카카오') ? 'checked' : ''}><label for="SA04">무료카카오알림톡</label>
 		</td>  
	</tr>
	
	<tr>
 		<td width="5%" align="center">결제은행</td>
 		<td width="10%">
			<input type="checkbox"  value="BC001" name="Bselect" id="BC001" ${ member.memBankCode == 'IBK기업은행' ? 'checked' : '' }><label for="BC001">IBK기업은행</label>
			<input type="checkbox"  value="BCetc" name="Bselect" id="BCetc" ${ member.memBankCode != 'IBK기업은행' ? 'checked' : '' }><label for="BCetc">기타</label>
			<select name="bank" class="${ member.memBankCode == 'IBK기업은행' ? 'unvisible' : '' }" id="BC002">
				 <option value="BC002" ${ fn:contains(member.memBankCode,'국민')? 'selected' : '' }>국민은행</option>
				 <option value="BC003" ${ fn:contains(member.memBankCode,'신한')? 'selected' : '' }>신한은행</option>
				 <option value="BC004" ${ fn:contains(member.memBankCode,'우리')? 'selected' : '' }>우리은행</option>
				 <option value="BC005" ${ fn:contains(member.memBankCode,'하나')? 'selected' : '' }>KEB하나은행</option>
				 <option value="BC006" ${ fn:contains(member.memBankCode,'케이')? 'selected' : '' }>케이뱅크</option>
				 <option value="BC007" ${ fn:contains(member.memBankCode,'카카오')? 'selected' : '' }>카카오뱅크</option>
				 <option value="BC008" ${ fn:contains(member.memBankCode,'산업')? 'selected' : '' }>KDB산업은행</option>
				 <option value="BC010" ${ fn:contains(member.memBankCode,'한국수출입')? 'selected' : '' }>한국수출입은행</option>
				 <option value="BC011" ${ fn:contains(member.memBankCode,'농협')? 'selected' : '' }>NH농협은행</option>
				 <option value="BC012" ${ fn:contains(member.memBankCode,'수협')? 'selected' : '' }>수협은행</option>
				 <option value="BC013" ${ fn:contains(member.memBankCode,'대구')? 'selected' : '' }>대구은행</option>
				 <option value="BC014" ${ fn:contains(member.memBankCode,'부산')? 'selected' : '' }>BNK부산은행</option>
				 <option value="BC015" ${ fn:contains(member.memBankCode,'경남')? 'selected' : '' }>BNK경남은행</option>
				 <option value="BC016" ${ fn:contains(member.memBankCode,'광주')? 'selected' : '' }>광주은행</option>
				 <option value="BC017" ${ fn:contains(member.memBankCode,'전북')? 'selected' : '' }>전북은행</option>
				 <option value="BC018" ${ fn:contains(member.memBankCode,'제주')? 'selected' : '' }>제주은행</option>
 			</select>
 		</td>
 		<td width="5%" align="center">계좌번호</td>
 		<td width="10%">
 			<input name="memAccount" type="text" size="30" value="${ member.memAccount }" id="memAccount">
 		</td>
 		<td width="5%" align="center">결제일</td>
 		<td width="10%">
			<select name="payday" id="payday">
				<option value="1">01일</option> 
				<option value="10">10일</option> 
				<option value="15">15일</option> 
				<option value="20">20일</option> 
			</select>
		</td>
	</tr>
		
	<tr>
		<td width="5%" colspan='2'  align="center">요청최고한도</td>
 		<td width="10%" colspan='7'> 
		<c:set var="limitTF" value="${ member.memLimit != '50000000' && member.memLimit != '30000000' && member.memLimit != '10000000' ? true : false }" />
			<input type="checkbox" id="limitft" value="50000000" name="limit" ${ member.memLimit == '50000000' ? 'checked' : '' }><label for="limitft">5천만원</label>
			<input type="checkbox" id="limittt" value="30000000" name="limit" ${ member.memLimit == '30000000' ? 'checked' : '' }><label for="limittt">3천만원</label>
			<input type="checkbox" id="limitot" value="10000000" name="limit" ${ member.memLimit == '10000000' ? 'checked' : '' }><label for="limitot">1천만원</label>
			<input type="checkbox" id="limitetc" value="limitetc" name="limit" ${ limitTF ? 'checked' : '' }><label for="limitetc">기타 </label><label class="${ limitTF ? '' : 'unvisible' }"><input name="limitetcinput" type="text" size="20" id="limitetcinput" value="${ limitTF ? member.memLimit : '' }">만원</label>
 		</td>  
	</tr>

	<tr>
		<td width="10%" colspan='1'  align="center">청구서수령지</td>
 		<td width="10%" colspan='8'> 
			<input type="checkbox" value="BR001" name="bill" id="email" ${ member.memBillCode == '이메일' ? 'checked' : '' }><label for="email">이메일</label>
			<input type="checkbox" value="BR002" name="bill" id="waddr" ${ member.memBillCode == '직장' ? 'checked' : '' }><label for="waddr">직장</label>
			<input type="checkbox" value="BR003" name="bill" id="haddr" ${ member.memBillCode == '자택' ? 'checked' : '' }><label for="haddr">자택</label>
			<input type="checkbox" value="BR004" name="bill" id="except" ${ member.memBillCode == '발송제외' ? 'checked' : '' }><label for="except">발송제외</label>
			<input type="checkbox" value="BR005" name="bill" id="oaddr" ${ member.memBillCode == '별도청구지' ? 'checked' : '' }><label for="oaddr">별도청구지</label> 
			<span class="${ member.memBillCode == 'BR005' ? '' : 'unvisible' }">
				(<label>주소<input name="oAddrInput" type="text" size="20" id="oAddrInput" value="${ oAddr }"></label><label>전화번호 <input name="oAddrPhone" type="text" size="15" id="oAddrPhone" value="${ fn:substring(oPhone,0,3) }-${ fn:substring(oPhone,3,7) }-${fn:substring(oPhone,7,11)}"></label>)
				<!--  -->
				<input type="hidden" name="addrList[2].addrCode" value="BR005">
				<input type="hidden" name="addrList[2].address" id="addr2">
				<input type="hidden" name="addrList[2].addrPhone" id="addrPhone2">
				<input type="hidden" name="addrList[2].addrPost1" id="post12">
				<input type="hidden" name="addrList[2].addrPost2" id="post22">
			</span>
 		</td>  
	</tr>
	
	<table><tr></tr></table>
	
	</table>
		
		<table border="1" width="1200">
	
	<tr>
		<td width="5%" align="center">직장주소</td>
 		<td width="10%" colspan='3'>
			 <input name="memWaddr" id="memWaddr" type="text" size="60" value="${ wAddr }">
 			<input type="button" id="doro2" value="주소찾기 " width="30%" size="30">  
 		</td>  
 		<td width="5%" align="center">직장전화</td>
 		<td width="10%">
			<c:set var="wp1" value="${ fn:substring(wPhone,0,3) }"/>
			<select name="memWphone1" id="memWphone1">
				<option value="070" ${ wp1 == '070' ? 'selected' : '' }>070</option>
				<option value="02" ${ fn:contains(wp1, '02') ? 'selected' : '' } >02</option>
				<option value="031" ${ wp1 == '031' ? 'selected' : '' }>031</option>
				<option value="032" ${ wp1 == '032' ? 'selected' : '' }>032</option>
				<option value="033" ${ wp1 == '033' ? 'selected' : '' }>033</option>
				<option value="041" ${ wp1 == '041' ? 'selected' : '' }>041</option>
				<option value="042" ${ wp1 == '042' ? 'selected' : '' }>042</option>
				<option value="044" ${ wp1 == '044' ? 'selected' : '' }>044</option>
				<option value="051" ${ wp1 == '051' ? 'selected' : '' }>051</option>
				<option value="052" ${ wp1 == '052' ? 'selected' : '' }>052</option>
				<option value="053" ${ wp1 == '053' ? 'selected' : '' }>053</option>
				<option value="054" ${ wp1 == '054' ? 'selected' : '' }>054</option>
				<option value="055" ${ wp1 == '055' ? 'selected' : '' }>055</option>
				<option value="061" ${ wp1 == '061' ? 'selected' : '' }>061</option>
				<option value="062" ${ wp1 == '062' ? 'selected' : '' }>062</option>
				<option value="063" ${ wp1 == '063' ? 'selected' : '' }>063</option>
				<option value="064" ${ wp1 == '064' ? 'selected' : '' }>064</option>
			</select>
			<c:set var = "wpstr"/>
			<c:choose>
			<c:when test="${ !empty wPhone && fn:contains(wp1,'02') }" >
			 	<c:set var="wpstr" value = "${ fn:substring(wPhone,2,fn:length(wPhone)) }" />
			</c:when>
			<c:when test="${ !empty wPhone }">
				<c:set var="wpstr" value="${ fn:substring(wPhone,3,fn:length(wPhone)) }" />
			</c:when>
			</c:choose>
			<c:choose>
			<c:when test="${ fn:length(wpstr) == 8 }">
				<input name="memWphone2" type="text" size="10" value="${ fn:substring(wpstr,0,4) }-${ fn:substring(wpstr,4,8) }" id="memWphone2">
			</c:when>
			<c:when test="${ fn:length(wpstr) == 7 }" >
				<input name="memWphone2" type="text" size="10" value="${ fn:substring(wpstr,0,3) }-${ fn:substring(wpstr,3,7) }" id="memWphone2">
			</c:when>
			<c:otherwise>
				<input name="memWphone2" type="text" size="10" value="${ wPhone }" id="memWphone2">
			</c:otherwise>
			</c:choose>
		</td>
	</tr>
	 
	<tr>
 		<td width="5%" align="center">직장명</td>
 		<td width="10%">
 			<input name="memWname" type="text" size="20" value="${ member.memWname }" id="memWname">
 		</td>
 		<td width="5%" align="center">부서명</td>
 		<td width="10%">
 			<input name="memDept" type="text" size="30" value="${ member.memDept }" id="memDept">
 		</td>
 		<td width="5%" align="center">부서명</td>
 		<td width="10%">
			<input name="memJobposition" type="text" size="20" value="${ member.memJobposition }" id="memJobposition"> 
		</td>
	</tr>

	
	</table>
	
	<table><tr></tr></table>
	
	
		
	
	
	<table>
		<tr>
			<td>
				<a href="javascript:history.back();">이전화면</a>
				<a href="#" id="submitBtn">수정완료</a>	
		</tr>
	</table>
</form>	
</body>
</html>
