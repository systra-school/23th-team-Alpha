<!-- workRecordInput.jsp -->
<%@page import="constant.CommonConstant.DayOfWeek"%>
<%
/**
 * ファイル名：workRecordInput.jsp
 *
 * 変更履歴
 * 1.0  2010/09/13 Kazuya.Naraki
 */
%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<bean:define id="color" value="" type="java.lang.String"/>
<bean:size id="workRecordListSize" name="workRecordInputForm"  property="workRecordInputList"/>
<bean:size id="dateBeanListSize" name="workRecordInputForm"  property="dateBeanList"/>
<html lang="ja">
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/common.js"></script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/checkCommon.js"></script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/message.js"></script>
    <script type="text/javascript" >
    
	/**
	 * 登録へ
	 */
	    function register() {

	        // 一覧のサイズ
	        var listSize = <%= workRecordListSize %>;

	        // 開始時間エラーメッセージ
	        var startTimeErrMsg = '';
	        // 終了時間エラーメッセージ
	        var endTimeErrMsg = '';
	        // 休憩時間エラーメッセージ
	        var breakTimeErrMsg = '';
	        // From - To エラーメッセージ
	        var fromToErrMsg = '';
	        // エラーメッセージ
	        var errorMsg = '';


	        with(document.forms[0].elements) {

	            for (var i = 0; i < listSize; i++) {

	                // 開始時間を取得する。
	                var startTime = namedItem('workRecordInputList['+ i +'].startTime').value;
	                // 終了時間を取得する。
	                var endTime = namedItem('workRecordInputList['+ i +'].endTime').value;
	                // 休憩時間を取得する。
	                var breakTime = namedItem('workRecordInputList['+ i +'].breakTime').value;

	                // 背景色をクリアする
	                namedItem('workRecordInputList['+ i +'].startTime').style.backgroundColor = 'white';
	                namedItem('workRecordInputList['+ i +'].endTime').style.backgroundColor = 'white';
	                namedItem('workRecordInputList['+ i +'].breakTime').style.backgroundColor = 'white';

	                if(startTime == "" && endTime == "" && breakTime == ""){
	                	continue;
	                }
	                
	                // 時間チェック
	                if (!startTimeErrMsg) {
	                    if (!checkTime(startTime)) {
	                        var strArr = ['開始時間'];
	                        startTimeErrMsg = getMessage('E-MSG-000004', strArr);
	                        namedItem('workRecordInputList['+ i +'].startTime').style.backgroundColor = 'red';
	                    }
	                }
	                if (!endTimeErrMsg) {
	                    if (!checkTime(endTime)) {
	                        var strArr = ['終了時間'];
	                        endTimeErrMsg = getMessage('E-MSG-000004', strArr);
	                        namedItem('workRecordInputList['+ i +'].endTime').style.backgroundColor = 'red';
	                    }
	                }
	                if (!breakTimeErrMsg) {
	                    if (!checkTime(breakTime)) {
	                        var strArr = ['休憩時間'];
	                        breakTimeErrMsg = getMessage('E-MSG-000004', strArr);
	                        namedItem('workRecordInputList['+ i +'].breakTime').style.backgroundColor = 'red';
	                    }
	                }

	                // from - to のチェック
	                if (!checkTimeCompare(startTime, endTime)) {
	                  if (checkTime(startTime) && checkTime(endTime)) {
	                      fromToErrMsg = getMessageCodeOnly('E-MSG-000005');
	                      namedItem('workRecordInputList['+ i +'].startTime').style.backgroundColor = 'red';
	                      namedItem('workRecordInputList['+ i +'].endTime').style.backgroundColor = 'red';
	                  }
	                }

	            }
	        }

	        // エラーメッセージ
	        errorMsg = startTimeErrMsg + endTimeErrMsg + breakTimeErrMsg + fromToErrMsg;

	        if (errorMsg) {
	            alert(errorMsg);
	            // エラー
	            return false;
	        }

	        doSubmit('/kikin-for-Struts-bug/workRecordInputRegister.do');
	    }

    /**
     * 検索
     */
    function submitSearch() {
        doSubmit('/kikin-for-Struts-bug/workRecordInputSearch.do');
    }
    
    </script>
    
    <title>勤務実績入力画面</title>

    <link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Bakbak+One&family=Gajraj+One&family=Gotu&display=swap" rel="stylesheet">
    
     <style>
      #businessBody {
        display: flex;
        justify-content: center;
      }
      .tableContainer {
        width: 1080px;
      }
      .tableHeader,.tableBody {
        margin: 0 auto;
      }
    </style>
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <table class="full-width">
          <tr>
            <td id="headLeft">
              <input value="戻る" type="image" src="img/タージ.png"  style="widows: 100px; height: 100px" onclick="doSubmit('/kikin-for-Struts-bug/menu.do')" />
            </td>
            <td id="headCenter">
              कर्मचारियों का प्रदर्शन दर्ज करें
            </td>
            <td id="headRight">
                <input value="ログアウト" type="image" src="img/カレーさん.png"  style="widows: 100px; height: 100px"  onclick="logout()" />
              </td>
          </tr>
        </table>
      </div>
      <div id="businessBody">
        <html:form action="/employeeMstMntRegister" >
          <div style="width: 100%;">
            <div style="float: left; width: 720px; text-align: left; margin-left:100px;">
              <html:select name="workRecordInputForm" property="yearMonth" onchange="submitSearch()">
              <html:optionsCollection name="workRecordInputForm"
                                      property="yearMonthCmbMap"
                                      value="key"
                                      label="value"/>
              </html:select>
            </div>
            
            <div style="float: left; width: 400px; text-align: left; font-family: Bakbak One; color: #9900CC;">
              कर्मचारीID&nbsp;<bean:write name="workRecordInputForm" property="employeeId"/>
              ：कर्मचारी का नाम&nbsp;<bean:write name="workRecordInputForm" property="employeeName"/>
              <%-- 8/26　花田　障害No025　残念エラーですを削除して、<bean:write name="workRecordInputForm" property="employeeName"/>を追加 --%>
            </div>
          </div>
          <div  id="data">
            <div>
            <table class="tableHeader">
              <tr>
                <td width="80px" align="center">
                  तारीख
                </td>
                <td width="50px" align="center" style="font-size: 7px;">
                  सप्ताह का दिन
                </td>
                <td width="100px" align="center">
                  बदलाव
                </td>
                <td width="100px" align="center">
                  समय शुरू
                </td>
                <td width="100px" align="center">
                  अंत समय
                </td>
                <td width="100px" align="center">
                  तोड़ना
                </td>
                <td width="100px" align="center" style="font-size: 12px;">
                  वास्तविक कार्य
                </td>
                <td width="100px" align="center" style="font-size: 12px;">
                  बाहर के घंटे
                </td>
                <td width="100px" align="center">
                  छुट्टी
                </td>
                <td width="220px" align="center">
                  टिप्पणी
                </td>
              </tr>
            </table>
          </div>
            
            
           <%--　8/26　花田　障害No008　余計な記述のあったdivタグを修正 --%>
	  <%--  <div style="height:450px;  margin-left: 18px "> --%>
            	<div>
            	<table class="tableBody">
            	<logic:iterate id="workRecordInputList" name="workRecordInputForm" property="workRecordInputList" indexId="idx">
             
                <tr>
                  <html:hidden name="workRecordInputList" property="employeeId" />
                  <td width="80px" align="center">
                    <bean:write name="workRecordInputList" property="workDayDisp" /><br>
                  </td>
                  <bean:define id="weekDay" name="workRecordInputList" property="weekDay"/>
				  <bean:define id="publicHolidayFlg" name="workRecordInputList" property="publicHolidayFlg"/>
				  
                  <%
                  if (DayOfWeek.SATURDAY.getWeekdayShort().equals(weekDay)) {
                      color = "fontBlue";
                  } else if (DayOfWeek.SUNDAY.getWeekdayShort().equals(weekDay) || ((boolean)publicHolidayFlg)) {
                      color = "fontRed";
                  } else {
                      color = "fontBlack";
                  }
                  %>

                  <td width="50px" align="center" class="<%=color %>">
                    <bean:write name="workRecordInputList" property="weekDay" /><br>
                  </td>
                  <td width="100px" align="center">
                    <bean:write name="workRecordInputList" property="symbol" /><br>
                  </td>
                  <td width="100px" align="center">
                  
                  <%-- 8/23　坂本　障害No006　勤務実績入力一覧表の4列目を bean:write から html:textへ変更>
                  <%-- <bean:write style="text-align:center" size="5" maxlength="5" name="workRecordInputList" property="endTime" indexed="true"></bean:write><br> --%>
                  
                  <%--
                   9/2 掛江 障害No073 プロパティ属性のendTimeとstartTimeを入れ替え
                  
                  <html:text style="text-align:center" size="5" maxlength="5" name="workRecordInputList" property="endTime" indexed="true"></html:text><br>
                  --%>
                  
                    <html:text style="text-align:center" size="5" maxlength="5" name="workRecordInputList" property="startTime" indexed="true"></html:text><br>
                  </td>
                  <td width="100px" align="center">
                  
                  <%--
                   9/2 掛江 障害No073 プロパティ属性のendTimeとstartTimeを入れ替え
                  
                  <html:text style="text-align:center" size="5" maxlength="5" name="workRecordInputList" property="startTime" indexed="true"></html:text><br>
                  --%>
                   
                    <html:text style="text-align:center" size="5" maxlength="5" name="workRecordInputList" property="endTime" indexed="true"></html:text><br>
                
                  </td>
                  <td width="100px" align="center">
                    <html:text style="text-align:center" size="5" maxlength="5" name="workRecordInputList" property="breakTime" indexed="true"></html:text><br>
                  </td>
                  <td width="100px" align="center">
                  
                  <%-- 9/3 掛江 障害No075 順番入れ替え
                  
                   <bean:write name="workRecordInputList" property="overTime" /><br>
                  </td>
                  <td width="100px" align="center">
                    <bean:write name="workRecordInputList" property="actualWorkTime" /><br>
                   --%>
                   
                    <bean:write name="workRecordInputList" property="actualWorkTime" /><br>
                  </td>
                  
                  <td width="100px" align="center">
                    <bean:write name="workRecordInputList" property="overTime" /><br>
                  </td>
                  
                  <td width="100px" align="center">
                    <bean:write name="workRecordInputList" property="holidayTime" /><br>
                    <%-- 8/26　花田　障害No038　property="holidayTime"を追加 --%>
                    
                  </td>
                  <td width="220px" align="left">
                    <html:text style="text-align:left" size="26" name="workRecordInputList" property="remark" indexed="true">備考がいっぱい</html:text><br>
                  </td>
                </tr>
             
            </logic:iterate>
            </table>
          </div>
          </div>
        </html:form>
      </div>
      <div id="footer">
        <table>
          <tr>
              <td id="footLeft">
                
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 32px; height: 32px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 34px; height: 34px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 36px; height: 36px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 38px; height: 38px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 40px; height: 40px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 42px; height: 42px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 44px; height: 44px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 46px; height: 46px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 48px; height: 48px" />
              </td>
              <td id="footCenter">
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 50px; height: 50px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 52px; height: 52px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 54px; height: 54px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 56px; height: 56px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 58px; height: 58px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 60px; height: 60px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 62px; height: 62px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 64px; height: 64px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 66px; height: 66px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 68px; height: 68px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 70px; height: 70px" />
              </td>
              <td id="footRight">
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 72px; height: 72px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 74px; height: 74px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 76px; height: 76px" />
                <input value="登録"  type="image" src="img/ガンジー2.png" style="widows: 78px; height: 78px" />
                <input value="登録"  type="image" src="img/ラブガンジー.png" style="widows: 80px; height: 80px" onclick="register()" />
              </td>
          </tr>
        </table>
    </div>
    </div>
  </body>
</html>