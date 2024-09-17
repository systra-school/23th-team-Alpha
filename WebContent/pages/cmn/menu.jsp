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
    <link href="/kikin-for-Struts-bug/pages/material/favicon.ico" rel="icon" type="image/x-icon" />
    <style>
        .hidden {
            display: none;
        }
        
        /* 動画コンテナのスタイル */
      #videoContainer {
        display: flex;
        justify-content: center; /* 中央に配置 */
        align-items: center; /* 垂直方向に中央揃え（必要ならば） */
        width: 100%; /* ページ全体の幅に対応 */
        height: auto;
      }

      /* 動画のスタイル */
      #explosionVideo {
        max-width: 80%; /* ページサイズに応じて幅を調整 */
        height: auto; /* 高さを自動調整 */
        margin: 0 auto; /* 水平方向に中央揃え */
        
    </style>
   <script type="text/javascript">
      window.onload = function() {
        var video = document.getElementById('explosionVideo');
        video.play(); // ページ読み込み後に動画を再生
      };
    </script>
  </head>
  <body>
     <div id="wrapper">    
      <div id="header">
        <table class="full-width">
          <tr>
            <td id="headLeft" style="display: flex;">
               <a href="https://ciao-curry.com/">
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px" />
              </a>
              <a href="https://100hourscurry.jp/">
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px" />
              </a>
              <a href="https://tokyomixcurry.com/">
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px" />
              </a>
              <a href="https://www.soupcurry-king.shop/">
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px" />
              </a>
              <input type="image" src="img/カレーさん.png" name="翻訳" style="widows: 70px; height: 70px"  onclick="tranText()" />
            </td>
            <td id="headCenter" style="font-family: Gotu;">
            <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                         property="authorityId"
                         value="<%=CommonConstant.Authority.ADMIN.getId() %>">
                         <div id="content"><p id="hiText">प्रशासक</p>
                         <p id="jaText" class="hidden">メニュー</p></div>
            </logic:equal>

            <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                         property="authorityId"
                         value="<%=CommonConstant.Authority.USER.getId() %>">
                         <div id="content"><p id="hiText">प्रशासक</p>
                         <p id="jaText" class="hidden">メニュー</p></div>
            </logic:equal>
            </td>
            <td id="headRight" style="display: flex">
              <a href="http://yoyogi-curry.com/">
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px" />
              </a>
              <a href="https://bishnu.co.jp/">
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px" />
              </a>
              <a href="https://higemeganecurry.com/">
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px" />
              </a>
              <a href="https://mikazuki-curry.com/">
              <input type="image" src="img/カレーさん.png" style="widows: 70px; height: 70px" />
              </a>
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
              <input type="image" src="img/神1.png" style="widows: 150px; height: 150px"/>
              <br/>
              <input type="submit" id="button1" value="कर्मचारियों का प्रदर्शन दर्ज करें" class="button1" onclick="workRecordInputInit()" style="font-family: Bakbak One;" />
            </html:form>
            </div> 
            
            <!-- 勤務実績確認 -->
            <div class="menuBlock">	
            <html:form action="/workRecordCheckInit">
              <input type="image" src="img/神2.png " style="widows: 150px; height: 150px"/>
              <br/>
              <input type="submit" id="button2" value="कर्मचारियों का प्रदर्शन सत्यापित करें" class="button2" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
             
             <!-- 月別シフト確認 -->
            <div class="menuBlock">	
            <html:form action="/monthlyShiftCheckInit">
              <input type="image" src="img/神3.png" style="widows: 150px; height: 150px"/>
              <br/>
              <input type="submit" id="button3" value="मासिक शिफ्ट की जाँच" class="button3" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
             
             <!-- 日別シフト確認 -->
            <div class="menuBlock">	
            <html:form action="/dailyShiftInit">
              <input type="image" src="img/神4.png" style="widows: 150px; height: 150px"/>
              <br/>
              <input type="submit" id="button4" value="दैनिक शिफ्ट की जाँच" class="button4" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
            
            <!-- 月別シフト入力 -->
            <div class="menuBlock">	
            <html:form action="/monthlyShiftInputInit">
              <input type="image" src="img/神5.png" style="widows: 150px; height: 150px"/>
              <br/>
              <input type="submit" id="button5" value="मासिक शिफ्ट इनपुट" class="button5" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
            
            <!-- 出勤希望日確認 -->
            <div class="menuBlock">	
            <html:form action="/workDateRequestCheckInit">
              <input type="image" src="img/神6.png" style="widows: 150px; height: 150px"/>
              <br/>
              <input type="submit" id="button6" value="कार्य दिवस की इच्छा की जाँच" class="button6" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
            
            <!-- 基本シフト登録 -->
            <div class="menuBlock">	
            <html:form action="/baseShiftInit">
              <input type="image" src="img/神7.png" style="widows: 150px; height: 150px"/>
              <br/>
              <input type="submit" id="button7" value="मूल शिफ्ट पंजीकरण" class="button7" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
            
            <!-- シフトマスタメンテナンス -->
            <div class="menuBlock">	
            <html:form action="/shiftMstMnt">
              <input type="image" src="img/神8.png" style="widows: 150px; height: 150px"/>
              <br/>
              <input type="submit" id="button8" value="शिफ्ट मास्टर मेंटेनेंस" class="button8" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
            
            <!-- 社員マスタメンテナンス -->
             <div class="menuBlock">	
            <html:form action="/employeeMstMnt">
              <input type="image" src="img/神9.png" style="widows: 150px; height: 150px"/>
              <br/>
              <input type="submit" id="button9" value="कर्मचारी मास्टर मेंटेनेंस" class="button9" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
            
<!--             自爆ボタン　ひな形 -->
				<div class="menuBlock">
			<html:form action="/bom">
				<input type="submit" value="弊社" class="bigButton" />
			</html:form>
		</div>
		
		 <div id="videoContainer">
        <video id="explosionVideo" controls>
          <source src="/kikin-for-Struts-bug/pages/material/爆発.mp4" type="video/mp4">
        </video>
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
          
          <!-- 勤務実績入力 -->
            <div class="menuBlock">	
            <html:form action="/workRecordInputInit">
              <input type="image" src="img/神1.png" style="widows: 150px; height: 150px"/>
              <br/>
              <input type="submit" id="button1" value="कर्मचारियों का प्रदर्शन दर्ज करें" class="button1" onclick="workRecordInputInit()" style="font-family: Bakbak One;" />
            </html:form>
            </div> 
            
            <!-- 出勤希望日入力 -->
            <div class="menuBlock">	
            <html:form action="/workDateRequestInputInit">
              <input type="image" src="img/神6.png" style="widows: 150px; height: 150px"/>
              <br/>
              <input type="submit" id="button6" value="कार्य दिवस की इच्छा की जाँच" class="button6" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
            
            <!-- 月別シフト確認 -->
            <div class="menuBlock">	
            <html:form action="/monthlyShiftCheckInit">
              <input type="image" src="img/神3.png" style="widows: 150px; height: 150px"/>
              <br/>
              <input type="submit" id="button3" value="मासिक शिफ्ट की जाँच" class="button3" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
             
             <!-- 日別シフト確認 -->
            <div class="menuBlock">	
            <html:form action="/dailyShiftInit">
              <input type="image" src="img/神4.png" style="widows: 150px; height: 150px"/>
              <br/>
              <input type="submit" id="button4" value="दैनिक शिफ्ट की जाँच" class="button4" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
            
            <!-- 基本シフト確認 -->
            <div class="menuBlock">	
            <html:form action="/baseShiftCheckInit">
              <input type="image" src="img/神7.png" style="widows: 150px; height: 150px"/>
              <br/>
              <input type="submit" id="button7" value="मूल शिफ्ट पंजीकरण" class="button7" onclick="workRecordInputInit()" style="font-family: Bakbak One;"/>
            </html:form>
            </div>
          
          
<!--           自爆ボタン　ひな形 -->
				<div class="menuBlock">
			<html:form action="/bom">
				<input type="submit"  value="弊社" class="bigButton" />
			</html:form>
		</div>
          
          
           <div id="videoContainer">
        <video id="explosionVideo" controls>
          <source src="/kikin-for-Struts-bug/pages/material/爆発.mp4" type="video/mp4">
        </video>
      </div>
          
          
          <%-- <div class="menuBlock">
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
          </div> --%>
          
          
          
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
         <audio src="/kikin-for-Struts-bug/pages/sounds/click.mp3" autoplay loop>
 
    </audio>
    
    <script>
      function tranText() {
    		var hiText = document.getElementById('hiText');
    	    var jaText = document.getElementById('jaText');
    	    var button1 =document.getElementById('button1');
    	    var button2 =document.getElementById('button2');
    	    var button3 =document.getElementById('button3');
    	    var button4 =document.getElementById('button4');
    	    var button5 =document.getElementById('button5');
    	    var button6 =document.getElementById('button6');
    	    var button7 =document.getElementById('button7');
    	    var button8 =document.getElementById('button8');
    	    var button9 =document.getElementById('button9');
    	    
    	    if (hiText.classList.contains('hidden')) {
    	    	hiText.classList.remove('hidden');
    	    	jaText.classList.add('hidden');
    	    	button1.value = "कर्मचारियों का प्रदर्शन दर्ज करें";
    	    	button2.value = "कर्मचारियों का प्रदर्शन सत्यापित करें";
    	    	button3.value = "मासिक शिफ्ट की जाँच";
    	    	button4.value = "दैनिक शिफ्ट की जाँच";
    	    	button5.value = "मासिक शिफ्ट इनपुट";
    	    	button6.value = "कार्य दिवस की इच्छा की जाँच";
    	    	button7.value = "मूल शिफ्ट पंजीकरण";
    	    	button8.value = "शिफ्ट मास्टर मेंटेनेंस";
    	    	button9.value = "कर्मचारी मास्टर मेंटेनेंस";
    	    	
    	    } else {
    	    	hiText.classList.add('hidden');
    	    	jaText.classList.remove('hidden');
    	    	button1.value = "勤務実績入力";
    	    	button2.value = "勤務実績確認";
    	    	button3.value = "月別シフト確認";
    	    	button4.value = "日別シフト確認";
    	    	button5.value = "月別シフト入力";
    	    	button6.value = "出勤希望日確認";
    	    	button7.value = "基本シフト登録";
    	    	button8.value = "シフトマスタメンテナンス";
    	    	button9.value = "社員マスタメンテナンス";
    		}
    	    
    	}
    </script>

  </body>
</html>