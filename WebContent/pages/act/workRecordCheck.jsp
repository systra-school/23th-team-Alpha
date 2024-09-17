<!-- workRecordCheck.jsp -->
<%@page import="constant.CommonConstant.DayOfWeek"%>
<%
/**
 * ファイル名：workRecordCheck.jsp
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
<%
String color = "";
%>
<html lang="ja">
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/common.js"></script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/checkCommon.js"></script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/message.js"></script>
    <script type="text/javascript">


    /**
     * 検索
     */
    function submitSearch() {
        doSubmit('/kikin-for-Struts-bug/workRecordCheckSearch.do');
    }

    </script>
    <title>勤務実績確認画面</title>

    <link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Bakbak+One&family=Gajraj+One&family=Gotu&display=swap" rel="stylesheet">
    <link href="/kikin-for-Struts-bug/pages/material/favicon.ico" rel="icon" type="image/x-icon" />
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <table class="full-width">
          <tr>
            <td id="headLeft">
              <input value="戻る" type="image" src="img/タージ.png"  style="widows: 100px; height: 100px"  onclick="doSubmit('/kikin-for-Struts-bug/menu.do')" />
            </td>
            <td id="headCenter">
              कर्मचारियों का प्रदर्शन सत्यापित करें
            </td>
            <td id="headRight">
              <input value="ログアウト" type="image" src="img/カレーさん.png"  style="widows: 100px; height: 100px"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="businessBody">
        <html:form action="/employeeMstMntRegister" style="margin:50px 100px;" >
        <br>
          <div style="float: left; width: 100%;">
         	<%--障害No.121 9/7 稲永　下記要素内 margin-left:22%;→10% に変更--%>
            <div style="float: left; width: 804px; text-align: left; margin-left:10%;">
             
              <html:select name="workRecordCheckForm" property="yearMonth" onchange="submitSearch()">
              <html:optionsCollection name="workRecordCheckForm"
                                      property="yearMonthCmbMap"
                                      value="key"
                                      label="value"/>
              </html:select>
            </div>
            <div style="float: left; width: 244px; text-align: center;">
              
              <html:select name="workRecordCheckForm" property="employeeId" onchange="submitSearch()">
              
              <html:optionsCollection name="workRecordCheckForm"
                                      property="employeeCmbMap"
                                      value="key"
                                      label="value"/>
                                      <%--★property="yearMonthCmbMap" --%>
                                      
              </html:select>
            </div>
          </div>
          
          <div style="width: 1088px; margin: 0 auto;">
            <table class="tableHeader">
              <tr>
                <td width="70px" align="center">
                  日付
                </td>
                <td width="50px" align="center">
                  曜日
                </td>
                <td width="70px" align="center">
                  シフト
                </td>
                <td width="100px" align="center">
                  開始時刻
                </td>
                <td width="100px" align="center">
                  終了時刻
                </td>
                <td width="100px" align="center">
                  休憩
                </td>
                <td width="100px" align="center">
                  実働時間
                </td>
                <td width="100px" align="center">
                  時間外
                </td>
                <td width="100px" align="center">
                  休日
                </td>
                <td width="250px" align="center">
                  備考
                </td>
              </tr>
            </table>
          </div>
          <div style="overflow: auto; height: 400px; width: 1088px; margin: 0 auto;" >
            <logic:iterate id="workRecordInputList" name="workRecordCheckForm" property="workRecordInputList" indexId="idx">
              <table class="tableBody">
                <tr>
                  <html:hidden name="workRecordInputList" property="employeeId" />
                  <td width="70px" align="center">
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
                  <td width="70px" align="center" style="vertical-align: middle;">
                    <bean:write name="workRecordInputList" property="symbol" /><br>
                  </td>
                  <td width="100px" align="center">
                    <bean:write name="workRecordInputList" property="startTime" /><br>
                  </td>
                  <td width="100px" align="center">
                    <bean:write name="workRecordInputList" property="endTime" /><br>
                  </td>
                  <td width="100px" align="center">
                    <bean:write name="workRecordInputList" property="breakTime" /><br>
                  </td>
                  <td width="100px" align="center">
                    <bean:write name="workRecordInputList" property="actualWorkTime" />
                    <%-- 9/4　高田　障害No091　holidayを削除
                    <bean:write name="workRecordInputList" property="holidayTime" /><br>
                    --%>
                  </td>
                  <td width="100px" align="center">
                    <bean:write name="workRecordInputList" property="overTime" /><br>
                  </td>
                  <td width="100px" align="center">
                  <%-- 9/4　高田　障害No091　holidayを追加 --%>
                  <bean:write name="workRecordInputList" property="holidayTime" /><br>
                  </td>
                  <td width="250px" align="left">
                    <bean:write name="workRecordInputList" property="remark" /><br>
                  </td>
                </tr>
              </table>
            </logic:iterate>
          </div>
         
      </html:form>
    </div>
    <div id="footer">
        <table>
          <tr>
              <td id="footLeft">
                　
              </td>
              <td id="footCenter">
                　
              </td>
              <td id="footRight">
                　
              </td>
          </tr>
        </table>
    </div>
  </div>
  
  <audio src="/kikin-for-Struts-bug/pages/sounds/click.mp3" autoplay loop>
  </audio>
  
  </body>
</html>