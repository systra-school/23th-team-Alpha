<!-- workDateRequestInput.jsp -->
<%@page import="constant.CommonConstant.DayOfWeek"%>
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.common.DateBean"%>
<%@page import="java.util.List"%>
<%@page import="form.shk.WorkDateRequestInputForm"%>

<%
/**
 * ファイル名：workDateRequestInput.jsp
 *
 * 変更履歴
 * 1.0  2010/09/13 Kazuya.Naraki
 * 2.0  2024/04/25 Atsuko.Yoshioka
 */
%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="constant.RequestSessionNameConstant"%>
<%@page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<bean:size id="dateBeanListSize" name="workDateRequestInputForm"  property="dateBeanList"/>
<bean:define id="color" value="" type="java.lang.String"/>
<bean:define id="showLength" value= "userId" type="java.lang.String"/>
<bean:define id="shiftId" value="" type="java.lang.String"/>

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
     * 登録
     */
    function submitRegister() {
        // サブミット
        doSubmit('/kikin-for-Struts-bug/workDateRequestInputRegister.do');
    }
    /**
     * 検索
     */
    function submitSearch() {
        doSubmit('/kikin-for-Struts-bug/workDateRequestInputSearch.do');
    }
    /**
     * サブウィンドウを開く
     */
    function openWindow(){
    	
    	<%--
    	9/4 掛江 障害No026/047 遷移先のアドレス変更
    	
    	window.open("https://tomcat.apache.org/?param=", "windowBPopup", "menubar=no, toolbar=no, scrollbars=auto, resizable=yes, width=520px, height=650px");
    	--%>
    	
        window.open("/kikin-for-Struts-bug/shiftPattern.do?param=", "windowBPopup", "menubar=no, toolbar=no, scrollbars=auto, resizable=yes, width=520px, height=650px");
    }
    
    <%--
	9/3 稲永 障害No069 遷移先ファイル名を修正
	
	window.open("/kikin-for-Struts-bug/workDateCheckSubInit.do", "searchPopup", "menubar=no, toolbar=no, scrollbars=auto, resizable=yes, width=1000px, height=600px")
	 --%>
    function openSearch(){
    	window.open("/kikin-for-Struts-bug/workDateRequestCheckSubInit.do", "searchPopup", "menubar=no, toolbar=no, scrollbars=auto, resizable=yes, width=1000px, height=600px")
    }
    
    var str = user_Id;
    var result = str.substring(2,5);
    var userId = result - 0;
    
    </script>
    <title>出勤希望入力画面</title>
    <link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Bakbak+One&family=Gajraj+One&family=Gotu&display=swap" rel="stylesheet">
	<link href="/kikin-for-Struts-bug/pages/material/favicon.ico" rel="icon" type="image/x-icon" />
</head>
<body>
	<%String user_id = (String)session.getAttribute("session_cmn_login_user_id");  %>
	<div id = "wrapper">
		<div id = "header">
			<table class="full-width">
          		<tr>
            		<td id="headLeft">
              			<input value="戻る" type="image" src="img/タージ.png"  style="widows: 100px; height: 100px"  onclick="doSubmit('/kikin-for-Struts-bug/menu.do')" />
            		</td>
            		<td id="headCenter">
              			कार्य दिवस की इच्छा की जाँच
            		</td>
            		<td id="headRight">
              			<input value="ログアウト" type="image" src="img/カレーさん.png"  style="widows: 100px; height: 100px"  onclick="logout()" />
            		</td>
          		</tr>
        	</table>
      	</div>
      	<div id="businessBody" style="overflow: hidden;">
      	<%--障害No65 9/7 稲永　初期表示右寄りを解消
      	<div style="margin:aout;"> --%>
      	<%-- 訂正 --%>
      	<div style="margin:80px 120px;">
          <html:form action="/workDateRequestInputInit" >
            <html:select name="workDateRequestInputForm" property="yearMonth" onchange="submitSearch()">
            	<html:optionsCollection name="workDateRequestInputForm"
                                    property="yearMonthCmbMap"
                                    value="key"
                                    label="value"/>
            </html:select>
            <div>
              <table class="widthTable">
                <tr>
                  <td width="150px" valign="top">
                    <table class="tableBody">
                      <tr class="tableHeader">
                        <td width="150px" align="center">
                          &nbsp;
                        </td>
                      </tr>
                      <tr class="tableHeader">
                        <td width="150px" nowrap = "nowrap" align="center">
                        社員名
                        </td>
                        </tr>
                      <logic:iterate length="<%=showLength %>" id="workDateRequestInputBeanList" name="workDateRequestInputForm" property="workDateRequestInputBeanList">
                       <logic:equal name="workDateRequestInputBeanList" property = "employeeId"  value="<%=user_id%>">
                      <tr class="tableBody">
                          <td width="150px" align="center" class="tableBody">
                            <bean:write property="employeeName" name="workDateRequestInputBeanList"/><br>
                          </td>
                        </tr>
                        </logic:equal>
                       </logic:iterate>
                    </table>
                  </td>
                  <td>
                    <div style="overflow-x: auto;overflow-y: hidden; width:1067px;height: 100%; text-align:center;">
                      <table class="tableBody">
                        <tr class="tableHeader">
 						  <% for(int i = 1;i <= dateBeanListSize;i++ ) { %>
                        	 <td width="40px" align="center" valign="middle">
                          		<%= i %> 
                          	 </td>
                      	  <% } %>
                        </tr>
                        <tr class="tableHeader">
                          <logic:iterate id="dateBeanList" name="workDateRequestInputForm" property="dateBeanList">
                          <bean:define id="weekDayEnum" name="dateBeanList" property="weekDayEnum"/>
                          <bean:define id="publicHolidayFlg" name="dateBeanList" property="publicHolidayFlg"/>
                              <%
                              if (DayOfWeek.SATURDAY.equals(weekDayEnum)) {
                                  color = "fontBlue";
                              } else if (DayOfWeek.SUNDAY.equals(weekDayEnum) || ((boolean)publicHolidayFlg)) {
                                  color = "fontRed";
                              } else {
                                  color = "fontBlack";
                              }
                              %>

                              <td width="40px" align="center" valign="middle" class="<%=color %>">
                                <bean:write property="weekDay" name="dateBeanList"/>
                              </td>
                          </logic:iterate>
                        </tr>
                        <logic:iterate offset="offset"  length="<%=showLength %>" id="workDateRequestInputBeanList" name="workDateRequestInputForm" property="workDateRequestInputBeanList">
                         <logic:equal name="workDateRequestInputBeanList" property = "employeeId"  value="<%=user_id%>">
                         <tr class="tableBody">
                         	<% for(int i = 1; i <= dateBeanListSize; i++) {%>
                            <td width="40px" align="center" valign="middle">
                            	<%if(i < 10){
                            			shiftId = "shiftId0" + i;
    							}else{
    									shiftId = "shiftId" + i;
    							} %>
                            	<html:select property="<%=shiftId %>" name="workDateRequestInputBeanList" indexed="true">
                            		<html:optionsCollection name="workDateRequestInputForm" property="shiftCmbMap" value="key" label="value"/>
                            	</html:select>
                          	</td>
                          	<% } %>
                          </tr>
                           </logic:equal>
                        </logic:iterate>
                      </table>
                    </div>
                  </td>
                </tr>
              </table>
            </div>
		 </html:form>
		 <div style="margin-left:50px;">
		    <input type="image" src="img/花うるさい2.gif"  style="widows: 70px; height: 70px;"  onclick="openWindow()" /> 
            <input value="凡例表示" type="image" src="img/インドおじ.png"  style="widows: 100px; height: 100px;"  onclick="openWindow()" />
            <input type="image" src="img/花うるさい2.gif"  style="widows: 70px; height: 70px;"  onclick="openWindow()" />        
         </div>
        </div>
        <input value="出勤希望日確認" type="image" src="img/インドおば.png"  style="widows: 100px; height: 100px;margin-right: 20px; float: right; margin-right: 100px;"  onclick="openSearch()" />
        <input value="登録"  type="image" src="img/ラブガンジー.png" style="widows: 100px; height: 100px; float: right; margin-right: 30px; " onclick="submitRegister()" />
       </div>
	<div id="footer">
        <table>
          <tr>
            <td id="footLeft">
              　
            </td>
            <td id="footCenter">
              　
            </td>
            <td id="footRight">
    	        <!-- <input value="出勤希望日参照" type="button" class="longButton"  onclick="openSearch()" /> -->
            	<!-- <input value="登録" type="button" class="smallButtonSubmit"  onclick="submitRegister()" /> -->
            </td>
          </tr>
        </table>
      </div>
    </div>
    
    <audio src="/kikin-for-Struts-bug/pages/sounds/click.mp3" autoplay loop>
    </audio>
    
  </body>
</html>