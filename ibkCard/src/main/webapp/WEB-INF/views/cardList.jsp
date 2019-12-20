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
<script src='https://www.ibsheet.com/ibleaders.js'></script>
<script src='https://www.ibsheet.com/demo/js/lib/sheet/ibsheetinfo.js'></script>
<script src='https://www.ibsheet.com/demo/js/lib/sheet/ibsheet.js'></script>
<script src='https://www.ibsheet.com/demo/js/lib/sheet/ibsheet-global.js'></script>
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
<body onload="sheet()">
<div id="ibcontainer"></div>
<div id='pagination' style='text-align:center;width:100%'></div>
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
<script>
function sheet2() {
    var ib = {
    initialize: function() {
        var initDate = {
            "Cfg": {
                "SearchMode": 2,
                "Page": 10,
                "FrozenCol": 0,
                "UseHeaderActionMenu": false,
                "MouseHoverMode": 0,
                "SelectionRowsMode": 1,
                "AutoFitColWidth": "resize",
                "DeferredVScroll": 1
            },
            "HeaderMode": {
                "Sort": 0,
                "ColMove": 0,
                "ColResize": 0,
                "HeaderCheck": 0
            },
            "Cols": [{
                "Header":"구분",
                "Type" : "Seq",
                "Width": 40,
                "SaveName" : "cSeq",
                "Align" : "Center"
            }, {
                "Header": "상품명",
                "Type": "Combo",
                "Width" : 60,
                "ComboText" : "card1|card2|card3",
                "ShowMobile": 0
            }, {
                "Header": "브랜드구분",
                "Type" : "Text"
            }, {
                "Header": "상품서비스",
                "Type" : "Text"
            }, {
                "Header": "고객번호",
                "Type" : "Text"
            }, {
                "Header": "카드번호",
                "Type" : "Text"
            }, {
                "Header":"카드디자인",
                "Type" : "Text"
            }, {
                "Header":"이미지",
                "Type" : "Text"
            }]
        };
        
    }
    }
}
function sheet() {
    var ib = {
    initialize: function() {
        var initData = {
            "Cfg": {
                "SearchMode": 2,
                "Page": 10,
                "FrozenCol": 0,
                "UseHeaderActionMenu": false,
                "MouseHoverMode": 0,
                "SelectionRowsMode": 1,
                "AutoFitColWidth": "resize",
                "DeferredVScroll": 1
            },
            "HeaderMode": {
                "Sort": 0,
                "ColMove": 0,
                "ColResize": 0,
                "HeaderCheck": 0
            },
            "Cols": [{
                "Header": "순위",
                "Type": "Seq",
                "Width": 50,
                "SaveName": "sSeq",
                "Align": "Right"
            }, {
                "Header": "상태",
                "Type": "Status",
                "Width": 60,
                "SaveName": "sStatus",
                "Align": "Center",
                "ShowMobile": 0
            }, {
                "Header": "삭제",
                "Type": "DelCheck",
                "Width": 60,
                "SaveName": "sDelCheck",
                "ShowMobile": 0
            }, {
                "Header": "국가",
                "Type": "Combo",
                "Width": 70,
                "SaveName": "sNation",
                "ComboText": "한국|미국|일본|영국|캐나다|이탈리아|스웨덴|중국|프랑스",
                "Align": "Center",
                "ShowMobile": 0
            }, {
                "Header": "영화명",
                "Type": "Text",
                "Width": 200,
                "SaveName": "sTitle",
                "Ellipsis": 1
            }, {
                "Header": "점유율",
                "Type": "Float",
                "Width": 50,
                "SaveName": "sShare",
                "Format": "#,##0.0\\%",
                "ShowMobile": 0
            }, {
                "Header": "상영횟수",
                "Type": "AutoSum",
                "Width": 100,
                "SaveName": "sCount",
                "Format": "#,##0"
            }, {
                "Header": "개봉일",
                "Type": "Date",
                "Width": 100,
                "SaveName": "sDate",
                "Align": "Center"
            }, {
                "Header": "추천",
                "Type": "CheckBox",
                "Width": 60,
                "SaveName": "sCheck"
            }]
        };


        // IBSheet 생성
        var container = $j('#ibcontainer')[0];
        createIBSheet2(container, 'mySheet', '95%', '284px');

        // IBSheet 초기화
        IBS_InitSheet(mySheet, initData);

        // 편집 가능 여부 설정
        mySheet.SetEditable(false);
        this.doAction();
    },
    data: {
        "data": [{
            "sSeq": 1,
            "sDelCheck": 0,
            "sTitle": "굿바이 싱글",
            "sShare": 23.1,
            "sCount": 1585651,
            "sDate": "20160629",
            "sNation": "한국",
            "sCheck": 0
        }, {
            "sSeq": 2,
            "sDelCheck": 0,
            "sTitle": "봉이 김선달",
            "sShare": 17.5,
            "sCount": 1240336,
            "sDate": "20160706",
            "sNation": "한국",
            "sCheck": 1
        }, {
            "sSeq": 3,
            "sDelCheck": 0,
            "sTitle": "도리를 찾아서",
            "sShare": 16.6,
            "sCount": 1136765,
            "sDate": "20160706",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 4,
            "sDelCheck": 0,
            "sTitle": "레전드 오브 타잔",
            "sShare": 10.6,
            "sCount": 692133,
            "sDate": "20160629",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 5,
            "sDelCheck": 0,
            "sTitle": "사냥",
            "sShare": 6,
            "sCount": 409543,
            "sDate": "20160629",
            "sNation": "한국",
            "sCheck": 0
        }, {
            "sSeq": 6,
            "sDelCheck": 0,
            "sTitle": "나우 유 씨 미 2",
            "sShare": 4.5,
            "sCount": 303108,
            "sDate": "20160713",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 7,
            "sDelCheck": 0,
            "sTitle": "인디펜던스 데이 : 리써전스",
            "sShare": 4.4,
            "sCount": 294139,
            "sDate": "20160622",
            "sNation": "미국",
            "sCheck": 1
        }, {
            "sSeq": 8,
            "sDelCheck": 0,
            "sTitle": "정글북",
            "sShare": 3.4,
            "sCount": 235827,
            "sDate": "20160609",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 9,
            "sDelCheck": 0,
            "sTitle": "컨저링 2",
            "sShare": 2.7,
            "sCount": 184519,
            "sDate": "20160609",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 10,
            "sDelCheck": 0,
            "sTitle": "특별수사: 사형수의 편지",
            "sShare": 1.8,
            "sCount": 124798,
            "sDate": "20160616",
            "sNation": "한국",
            "sCheck": 1
        }, {
            "sSeq": 11,
            "sDelCheck": 0,
            "sTitle": "아가씨",
            "sShare": 1.7,
            "sCount": 119240,
            "sDate": "20160601",
            "sNation": "한국",
            "sCheck": 0
        }, {
            "sSeq": 12,
            "sDelCheck": 0,
            "sTitle": "미 비포 유",
            "sShare": 1.5,
            "sCount": 102016,
            "sDate": "20160601",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 13,
            "sDelCheck": 0,
            "sTitle": "500일의 썸머",
            "sShare": 1.5,
            "sCount": 98727,
            "sDate": "20100121",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 14,
            "sDelCheck": 0,
            "sTitle": "잔예 - 살아서는 안되는 방",
            "sShare": 0.6,
            "sCount": 39707,
            "sDate": "20160707",
            "sNation": "일본",
            "sCheck": 1
        }, {
            "sSeq": 15,
            "sDelCheck": 0,
            "sTitle": "빅뱅 메이드",
            "sShare": 0.6,
            "sCount": 39147,
            "sDate": "20160630",
            "sNation": "한국",
            "sCheck": 0
        }, {
            "sSeq": 16,
            "sDelCheck": 0,
            "sTitle": "나이스 가이즈",
            "sShare": 0.3,
            "sCount": 23830,
            "sDate": "20160706",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 17,
            "sDelCheck": 0,
            "sTitle": "키즈모노가타리 I : 철혈편",
            "sShare": 0.2,
            "sCount": 15350,
            "sDate": "20160630",
            "sNation": "일본",
            "sCheck": 0
        }, {
            "sSeq": 18,
            "sDelCheck": 0,
            "sTitle": "곡성",
            "sShare": 0.2,
            "sCount": 14255,
            "sDate": "20160512",
            "sNation": "한국",
            "sCheck": 0
        }, {
            "sSeq": 19,
            "sDelCheck": 0,
            "sTitle": "비밀은 없다",
            "sShare": 0.2,
            "sCount": 12402,
            "sDate": "20160623",
            "sNation": "한국",
            "sCheck": 0
        }, {
            "sSeq": 20,
            "sDelCheck": 0,
            "sTitle": "벤허",
            "sShare": 0.2,
            "sCount": 12401,
            "sDate": "19720907",
            "sNation": "미국",
            "sCheck": 1
        }, {
            "sSeq": 21,
            "sDelCheck": 0,
            "sTitle": "서프러제트",
            "sShare": 0.2,
            "sCount": 11697,
            "sDate": "20160623",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 22,
            "sDelCheck": 0,
            "sTitle": "본 투 비 블루",
            "sShare": 0.2,
            "sCount": 10954,
            "sDate": "20160609",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 23,
            "sDelCheck": 0,
            "sTitle": "우리들",
            "sShare": 0.1,
            "sCount": 10605,
            "sDate": "20160616",
            "sNation": "한국",
            "sCheck": 0
        }, {
            "sSeq": 24,
            "sDelCheck": 0,
            "sTitle": "불의 전차",
            "sShare": 0.1,
            "sCount": 9517,
            "sDate": "20160616",
            "sNation": "영국",
            "sCheck": 0
        }, {
            "sSeq": 25,
            "sDelCheck": 0,
            "sTitle": "극장판 프리즘스톤 올스타 셀렉션",
            "sShare": 0.1,
            "sCount": 8151,
            "sDate": "20160707",
            "sNation": "일본",
            "sCheck": 0
        }, {
            "sSeq": 26,
            "sDelCheck": 0,
            "sTitle": "초속5센티미터",
            "sShare": 0,
            "sCount": 7098,
            "sDate": "20070621",
            "sNation": "일본",
            "sCheck": 0
        }, {
            "sSeq": 27,
            "sDelCheck": 0,
            "sTitle": "언어의 정원",
            "sShare": 0,
            "sCount": 7098,
            "sDate": "20130814",
            "sNation": "일본",
            "sCheck": 0
        }, {
            "sSeq": 28,
            "sDelCheck": 0,
            "sTitle": "밀림의 왕자 레오: 세상을 바꾸는 용기",
            "sShare": 0.1,
            "sCount": 6626,
            "sDate": "20120229",
            "sNation": "일본",
            "sCheck": 0
        }, {
            "sSeq": 29,
            "sDelCheck": 0,
            "sTitle": "환상의 빛",
            "sShare": 0.1,
            "sCount": 6536,
            "sDate": "20160707",
            "sNation": "일본",
            "sCheck": 0
        }, {
            "sSeq": 30,
            "sDelCheck": 0,
            "sTitle": "워크래프트: 전쟁의 서막",
            "sShare": 0.1,
            "sCount": 6393,
            "sDate": "20160609",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 31,
            "sDelCheck": 0,
            "sTitle": "로렐",
            "sShare": 0.1,
            "sCount": 4858,
            "sDate": "20160707",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 32,
            "sDelCheck": 0,
            "sTitle": "셀",
            "sShare": 0.1,
            "sCount": 4124,
            "sDate": "20160629",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 33,
            "sDelCheck": 0,
            "sTitle": "싱 스트리트",
            "sShare": 0,
            "sCount": 3496,
            "sDate": "20160519",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 34,
            "sDelCheck": 0,
            "sTitle": "본 얼티메이텀",
            "sShare": 0.1,
            "sCount": 3175,
            "sDate": "20070912",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 35,
            "sDelCheck": 0,
            "sTitle": "계춘할망",
            "sShare": 0,
            "sCount": 2720,
            "sDate": "20160519",
            "sNation": "한국",
            "sCheck": 0
        }, {
            "sSeq": 36,
            "sDelCheck": 0,
            "sTitle": "오베라는 남자",
            "sShare": 0,
            "sCount": 2581,
            "sDate": "20160525",
            "sNation": "스웨덴",
            "sCheck": 0
        }, {
            "sSeq": 37,
            "sDelCheck": 0,
            "sTitle": "리틀 폭스",
            "sShare": 0,
            "sCount": 2432,
            "sDate": "20160623",
            "sNation": "중국",
            "sCheck": 0
        }, {
            "sSeq": 38,
            "sDelCheck": 0,
            "sTitle": "앵그리버드 더 무비",
            "sShare": 0,
            "sCount": 2238,
            "sDate": "20160519",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 39,
            "sDelCheck": 0,
            "sTitle": "미친개들",
            "sShare": 0,
            "sCount": 1900,
            "sDate": "20160707",
            "sNation": "캐나다",
            "sCheck": 0
        }, {
            "sSeq": 40,
            "sDelCheck": 0,
            "sTitle": "트릭",
            "sShare": 0,
            "sCount": 1817,
            "sDate": "20160713",
            "sNation": "한국",
            "sCheck": 0
        }, {
            "sSeq": 41,
            "sDelCheck": 0,
            "sTitle": "크리미널",
            "sShare": 0,
            "sCount": 1736,
            "sDate": "20160622",
            "sNation": "영국",
            "sCheck": 0
        }, {
            "sSeq": 42,
            "sDelCheck": 0,
            "sTitle": "프렌치 캉캉",
            "sShare": 0,
            "sCount": 1729,
            "sDate": "",
            "sNation": "프랑스",
            "sCheck": 0
        }, {
            "sSeq": 43,
            "sDelCheck": 0,
            "sTitle": "부산행",
            "sShare": 0,
            "sCount": 1721,
            "sDate": "20160720",
            "sNation": "한국",
            "sCheck": 0
        }, {
            "sSeq": 44,
            "sDelCheck": 0,
            "sTitle": "소야곡",
            "sShare": 0,
            "sCount": 1618,
            "sDate": "",
            "sNation": "미국",
            "sCheck": 0
        }, {
            "sSeq": 45,
            "sDelCheck": 0,
            "sTitle": "유리의 꽃과 부수는 세계",
            "sShare": 0,
            "sCount": 1556,
            "sDate": "20160421",
            "sNation": "일본",
            "sCheck": 0
        }, {
            "sSeq": 46,
            "sDelCheck": 0,
            "sTitle": "헝그리 하트",
            "sShare": 0,
            "sCount": 1550,
            "sDate": "20160630",
            "sNation": "이탈리아",
            "sCheck": 0
        }, {
            "sSeq": 47,
            "sDelCheck": 0,
            "sTitle": "아이 인 더 스카이",
            "sShare": 0,
            "sCount": 1454,
            "sDate": "20160714",
            "sNation": "영국",
            "sCheck": 0
        }, {
            "sSeq": 48,
            "sDelCheck": 0,
            "sTitle": "일식",
            "sShare": 0,
            "sCount": 1387,
            "sDate": "",
            "sNation": "이탈리아",
            "sCheck": 0
        }, {
            "sSeq": 49,
            "sDelCheck": 0,
            "sTitle": "바다 탐험대 옥토넛 시즌4: 아슬아슬 구조대작전",
            "sShare": 0,
            "sCount": 1376,
            "sDate": "20160602",
            "sNation": "영국",
            "sCheck": 0
        }, {
            "sSeq": 50,
            "sDelCheck": 0,
            "sTitle": "우리 연애의 이력",
            "sShare": 0,
            "sCount": 1127,
            "sDate": "20160629",
            "sNation": "한국",
            "sCheck": 0
        }]
    },
    doAction: function() {
        // 데이터 로드
        mySheet.LoadSearchData(this.data, {
            Sync: 1
        });

        if ($j("#pro-options").val() == "frozen-col") {
            mySheet.SetColWidth("sTitle", 300);
        } else {
            mySheet.FitColWidth();
        }
    }
};
ib.initialize();

// jsfiddle에서 ib 접근을 위해 window에 등록
window.ib = ib;
}

</script>
</html>