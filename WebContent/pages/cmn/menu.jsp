<!-- menu.jsp -->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<html lang="ja">
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
    <html:javascript formName="loginForm" />
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/common.js"></script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/checkCommon.js"></script>
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/message.js"></script>

    <title>メニュー画面</title>
    <link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Bakbak+One&family=Gajraj+One&family=Gotu&display=swap" rel="stylesheet">
  </head>
  <body>
    <div id="wrapper">    
      <div id="header">
        <table class="full-width">
          <tr>
            <td id="headLeft" style="display: flex;">
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px"/>
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px"/>
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px"/>
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px"/>
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px"/>
            </td>
            <td id="headCenter" style="font-family: Gotu;">
            <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                         property="authorityId"
                         value="<%=CommonConstant.Authority.ADMIN.getId() %>">
                MENU（प्रशासक）
            </logic:equal>

            <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                         property="authorityId"
                         value="<%=CommonConstant.Authority.USER.getId() %>">
                MENU（सामान्य）
            </logic:equal>
            </td>
            <td id="headRight" style="display: flex">
  
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px"/>
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px"/>
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px"/>
              <html:form action="/logout">
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px"/>
              </html:form>
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="businessBody" >
        <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                     property="authorityId"
                     value="<%=CommonConstant.Authority.ADMIN.getId() %>">
                     
          <%-- 9/2 稲永　障害No.059 marginを変更 --%>          
          <div  style="margin:auto;">
          
            <!-- 勤務実績入力 -->
            <div class="menuBlock">	
            <html:form action="/workRecordInputInit">
              <input type="image" src="img/神1.png" style="widows: 170px; height: 170px"/>
              <br/>
              <input type="submit" value="कर्मचारियों का प्रदर्शन दर्ज करें" class="button1" onclick="workRecordInputInit()" style="font-family: Bakbak One;" />

            </html:form>
            </div> 
            
            <!-- 勤務実績確認 -->
            <div class="menuBlock">	
            <html:form action="/workRecordCheckInit">
              <input type="image" src="img/神2.png " style="widows: 170px; height: 170px"/>
              <br/>
              <input type="submit" value="कर्मचारियों का प्रदर्शन सत्यापित करें" class="button2" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
             
             <!-- 月別シフト確認 -->
            <div class="menuBlock">	
            <html:form action="/monthlyShiftCheckInit">
              <input type="image" src="img/神3.png" style="widows: 170px; height: 170px"/>
              <br/>
              <input type="submit" value="मासिक शिफ्ट की जाँच" class="button3" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
             
             <!-- 日別シフト確認 -->
            <div class="menuBlock">	
            <html:form action="/dailyShiftInit">
              <input type="image" src="img/神4.png" style="widows: 170px; height: 170px"/>
              <br/>
              <input type="submit" value="दैनिक शिफ्ट की जाँच" class="button4" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
            
            <!-- 月別シフト入力 -->
            <div class="menuBlock">	
            <html:form action="/monthlyShiftInputInit">
              <input type="image" src="img/神5.png" style="widows: 170px; height: 170px"/>
              <br/>
              <input type="submit" value="मासिक शिफ्ट इनपुट" class="button5" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
            
            <!-- 出勤希望日確認 -->
            <div class="menuBlock">	
            <html:form action="/workDateRequestCheckInit">
              <input type="image" src="img/神6.png" style="widows: 170px; height: 170px"/>
              <br/>
              <input type="submit" value="कार्य दिवस की इच्छा की जाँच" class="button6" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
            
            <!-- 基本シフト登録 -->
            <div class="menuBlock">	
            <html:form action="/baseShiftInit">
              <input type="image" src="img/神7.png" style="widows: 170px; height: 170px"/>
              <br/>
              <input type="submit" value="मूल शिफ्ट पंजीकरण" class="button7" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
            
            <!-- シフトマスタメンテナンス -->
            <div class="menuBlock">	
            <html:form action="/shiftMstMnt">
              <input type="image" src="img/神8.png" style="widows: 170px; height: 170px"/>
              <br/>
              <input type="submit" value="शिफ्ट मास्टर मेंटेनेंस" class="button8" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
            
            <!-- 社員マスタメンテナンス -->
             <div class="menuBlock">	
            <html:form action="/employeeMstMnt">
              <input type="image" src="img/神9.png" style="widows: 170px; height: 170px"/>
              <br/>
              <input type="submit" value="कर्मचारी मास्टर मेंटेनेंस" class="button9" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
            
            
            
          	<%-- <br/>
          	<div class="menuBlock">
          	<html:form action="/workRecordInputInit">
              <input type="submit" value="勤務実績入力" class="bigButton" />
            </html:form>
            <html:form action="/workRecordCheckInit">
              <input type="submit" value="勤務実績確認" class="bigButton" />
            </html:form>
            <br/>
            <html:form action="/monthlyShiftCheckInit">
              <input type="submit" value="月別シフト確認" class="bigButton" />
            </html:form>
            <html:form action="/dailyShiftInit">
              <input type="submit" value="日別シフト確認" class="bigButton" />
            </html:form>
            <br/>
            <html:form action="/monthlyShiftInputInit">
              <input type="submit" value="月別シフト入力" class="bigButton" />
            </html:form>
            <html:form action="/workDateRequestCheckInit">
              <input type="submit" value="出勤希望日確認" class="bigButton" />
            </html:form>
            <br/>
            <html:form action="/baseShiftInit">
              <input type="submit" value="基本シフト登録" class="bigButton" />
            </html:form> 
            <html:form action="/shiftMstMnt">
              <input type="submit" value="シフトマスタメンテナンス" class="bigButton" />
            </html:form>
            <html:form action="/employeeMstMnt">
              <input type="submit" value="社員マスタメンテナンス" class="bigButton" />
            </html:form>
          </div> --%>





          <%-- <div class="menuBlock">
            <html:form action="/workRecordCheckInit">
              <input type="submit" value="勤務実績確認" class="bigButton" />
            </html:form>
            <html:form action="/workRecordInputInit">
              <input type="submit" value="勤務実績入力" class="bigButton" />
            </html:form>
          </div> --%>

          <%-- <div class="menuBlock">
            <html:form action="/workDateRequestCheckInit">
              <input type="submit" value="出勤希望日確認" class="bigButton" />
            </html:form>
            <html:form action="/monthlyShiftInputInit">
              <input type="submit" value="月別シフト入力" class="bigButton" />
            </html:form>
          </div> --%>

         <%--  <div class="menuBlock">
            <html:form action="/employeeMstMnt">
              <input type="submit" value="社員マスタメンテナンス" class="bigButton" />
            </html:form>
            
            <html:form action="/shiftMstMnt">
              <input type="submit" value="シフトマスタメンテナンス" class="bigButton" />
            </html:form>
            8/28　稲永　出勤希望日入力を削除して、基本シフト登録に修正
            <html:form action="/baseShiftInit">
              <input type="submit" value="基本シフト登録" class="bigButton" />
            </html:form> 
          </div> --%>
          </div>
        </logic:equal>

        <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                     property="authorityId"
                     value="<%=CommonConstant.Authority.USER.getId() %>">
                     
          <%-- 9/2 稲永　障害No.060 marginを変更 --%>
          <div  style="margin:auto;">
          <div class="menuBlock">
          	<br/>
          	<html:form action="/workRecordInputInit">
              <input type="submit" value="勤務実績入力" class="bigButton" />
            </html:form>
            <html:form action="/workDateRequestInputInit">
              <input type="submit" value="出勤希望日入力" class="bigButton" />
            </html:form>
            <br/>
            <html:form action="/monthlyShiftCheckInit">
              <input type="submit" value="月別シフト確認" class="bigButton" />
            </html:form>
            <html:form action="/dailyShiftInit">
              <input type="submit" value="日別シフト確認" class="bigButton" />
            </html:form>
            <html:form action="/baseShiftCheckInit">
              <input type="submit" value="基本シフト確認" class="bigButton" />
            </html:form>
          </div>
          
          <%-- <div class="menuBlock">
            <html:form action="/workRecordInputInit">
              <input type="submit" value="勤務実績入力" class="bigButton" />
            </html:form>
          </div> --%>
		  
		  <%--〇 --%>
          <%-- <div class="menuBlock">
            <html:form action="/workDateRequestInputInit">
              <input type="submit" value="出勤希望日入力" class="bigButton" />
            </html:form>
          </div> --%>

          <%-- <div class="menuBlock">
            <html:form action="/baseShiftCheckInit">
              <input type="submit" value="基本シフト確認" class="bigButton" />
            </html:form>
          </div> --%>
          
          
          <%-- 8/28 稲永　障害No049　下記をコメントアウトして不要個所を削除 
          
           <html:form action="/shiftMstMnt">
              <input type="submit" value="シフトマスタメンテナンス" class="bigButton" />
            </html:form>
          --%>
          
          </div>
           </logic:equal>
        </div>          
       
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
  </body>
</html>