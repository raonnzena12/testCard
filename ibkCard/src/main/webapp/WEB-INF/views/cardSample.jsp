<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
<head>
    <meta charset="UTF-8">
    <title>카드 샘플</title>
    <style>
.sampleTable {
    text-align: center;
}
label img {
    width: 200px;
    height: 128px;
}
</style>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
</head>
<body>
<table class="sampleTable">
    <tr>
        <td>
            <table>
                <tr>
                    <td colspan="3">카드 디자인 선택</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>
                        <label>
                            <img src="../resources/images/credit-card1.png"><br>
                            skyblue color<br>
                            <input type="radio" name="design" id="1" value="1">
                        </label>
                    </td>
                    <td>
                        <label>
                            <img src="../resources/images/credit-card2.png"><br>
                            gold&red color<br>
                            <input type="radio" name="design" id="2" value="2">
                        </label>
                    </td>
                    <td>
                        <label>
                            <img src="../resources/images/credit-card3.png"><br>
                            black color<br>
                            <input type="radio" name="design" id="3" value="3">
                        </label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <br><button type="button" id="selectBtn">디자인 선택하기</button>
        </td>
    </tr>
</table>
<script>
$j(function(){
    $j("#selectBtn").on("click", function(){
        if ($j("input[name=design]:checked").length == 0 ) return false;
        var num = $j("input[name=design]:checked").val();
        opener.parent.fn_selectCardDesign(num);
        self.close();
    });
});
</script>
</body>
</html>