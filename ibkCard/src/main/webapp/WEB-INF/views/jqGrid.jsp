<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jqgridTest</title>
<link rel="stylesheet" href="/card/resources/jqGrid/css/ui.jqgrid-bootstrap-ui.css">
<link rel="stylesheet" href="/card/resources/jqGrid/css/ui.jqgrid-bootstrap4.css">
<link rel="stylesheet" type="text/css" media="screen" href="/card/resources/jqGrid/css/ui.jqgrid-bootstrap-ui.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/card/resources/jqGrid/css/ui.jqgrid.css" />
<link rel="stylesheet" type='text/css' href="/card/resources/jqGrid/plugins/ui.multiselect.css" />
<script src="/card/resources/jqGrid/js/jquery-1.11.0.min.js"></script>
<script src="/card/resources/jqGrid/js/i18n/grid.locale-kr.js"></script>
<script src="/card/resources/jqGrid/js/jquery.jqGrid.min.js"></script>
</head>
<body>
<table id="grid"></table>
<div class="row">
    <div>
        <select name="selectId" id="selectId">
            <option value="">전체</option>
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="C">C</option>
            <option value="D">D</option>
        </select>
        <span><a href="#" onclick='goSearch();'>조회</a></span>
    </div>
    <div>
        <table id="jqgridTest"></table>
        <div id="jqgridPager"></div>
    </div>
</div>
</body>
<script>
function goSearch() {
    var jsonObj = {};

    if ( $('#selectId').val() != '' ) {
        jsonObj.serviceImplYn = $('#selectId').val();
    }
    console.log(JSON.stringify(jsonObj));
    $('#jqgridTest').setGridParam({
        datatype: 'json',
        postData: { 'param' : JSON.stringify(jsonObj),
                    'serviceImplYn': $('#selectId').val()},
        loadComplete: function(data) {
            console.log(data);
        },
        gridComplete: function() {

        }
    }).trigger('reloadGrid');
}

$(function() {
    var cnames = [ '멤버번호', '이름', '전화번호', '생일', '가입일'];

    $('#jqgridTest').jqGrid({
        url: "jqgridStart",
        datatype: 'json',
        colNames: cnames,
        colModel: [
            { name: 'memNo', index: 'memNo', width: 100, key: true, align: 'center' },
            { name: 'memKname', index: 'memKname', width: 120, align: 'center' },
            { name: 'memCphone', index: 'memCphone', width: 100, align: 'center' },
            { name: 'memBirth', index: 'memBirth', width: 100, align: 'center' },
            { name: 'memRegDate', index: 'memRegDate', width: 100, align: 'center' }
        ],
        height: 480,
        rowNum: 10,
        rowList: [10, 20, 30],
        pager: "#jqgridPager",
        rownumbers: true,
        ondblClickRow: function(rowId, iRow, iCol, e) {
            if ( iCol == 1 ) {
                alert(rowId+'쨰줄 입니다');
            }
        },
        viewrecords: true,
        caption: '실습용 테이블'
    });
});
</script>
<script>
$(function () {
    $("#grid").jqGrid({
        dataType: 'local',
        height: 'auto',
        colNames: [ 'firstName', 'lastName'],
        colModel: [
            { name: "firstName" },
            { name: "lastName" }
        ],        
        multiselect: true,
        caption: 'jqGrid Test'
    });

    var data =  [
            { id: 10, firstName: "Angela", lastName: "Merkel" },
            { id: 20, firstName: "Vladimir", lastName: "Putin" },
            { id: 30, firstName: "David", lastName: "Cameron" },
            { id: 40, firstName: "Barack", lastName: "Obama" },
            { id: 50, firstName: "François", lastName: "Hollande" }
    ];

    for ( var i = 0 ; i < data.length ; i++ ) {
        $('#grid').jqGrid('addRowData', i+1, data[i]);
    }
});
</script>
</html>