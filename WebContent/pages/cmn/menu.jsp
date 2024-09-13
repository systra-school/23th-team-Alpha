<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<!DOCTYPE html>
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
    <audio src="/kikin-for-Struts-bug/pages/sounds/click.mp3" autoplay loop>
 
    </audio>
    <div id="wrapper">    
        <div id="header">
            <table class="full-width">
                <tr>
                    <td id="headLeft" style="display: flex;">
                        <a href="https://ciao-curry.com/">
                            <input type="image" src="img/カレーさん.png" style="width: 70px; height: 70px" onclick="playButtonClickSound()"/>
                        </a>
                        <a href="https://100hourscurry.jp/">
                            <input type="image" src="img/カレーさん.png" style="width: 70px; height: 70px" onclick="playButtonClickSound()"/>
                        </a>
                        <a href="https://tokyomixcurry.com/">
                            <input type="image" src="img/カレーさん.png" style="width: 70px; height: 70px" onclick="playButtonClickSound()"/>
                        </a>
                        <a href="https://www.soupcurry-king.shop/">
                            <input type="image" src="img/カレーさん.png" style="width: 70px; height: 70px" onclick="playButtonClickSound()"/>
                        </a>
                        <a href="https://chancurry.com/">
                            <input type="image" src="img/カレーさん.png" style="width: 70px; height: 70px" onclick="playButtonClickSound()"/>
                        </a>
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
                        <a href="http://yoyogi-curry.com/">
                            <input type="image" src="img/カレーさん.png" style="width: 70px; height: 70px" onclick="playButtonClickSound()"/>
                        </a>
                        <a href="https://bishnu.co.jp/">
                            <input type="image" src="img/カレーさん.png" style="width: 70px; height: 70px" onclick="playButtonClickSound()"/>
                        </a>
                        <a href="https://higemeganecurry.com/">
                            <input type="image" src="img/カレーさん.png" style="width: 70px; height: 70px" onclick="playButtonClickSound()"/>
                        </a>
                        <a href="https://mikazuki-curry.com/">
                            <input type="image" src="img/カレーさん.png" style="width: 70px; height: 70px" onclick="playButtonClickSound()"/>
                        </a>
                        <input type="image" src="img/カレーさん.png" style="width: 70px; height: 70px" onclick="playButtonClickSound(); logout()" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="businessBody">
            <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                         property="authorityId"
                         value="<%=CommonConstant.Authority.ADMIN.getId() %>">

                <div style="margin:auto;">
                    <!-- 勤務実績入力 -->
                    <div class="menuBlock">    
                        <html:form action="/workRecordInputInit">
                            <input type="image" src="img/神1.png" style="width: 150px; height: 150px" onclick="playButtonClickSound()"/>
                            <br/>
                            <input type="submit" value="कर्मचारियों का प्रदर्शन दर्ज करें" class="button1" onclick="playButtonClickSound()" style="font-family: Bakbak One;" />
                        </html:form>
                    </div> 

                    <!-- 勤務実績確認 -->
                    <div class="menuBlock">    
                        <html:form action="/workRecordCheckInit">
                            <input type="image" src="img/神2.png" style="width: 150px; height: 150px" onclick="playButtonClickSound()"/>
                            <br/>
                            <input type="submit" value="कर्मचारियों का प्रदर्शन सत्यापित करें" class="button2" onclick="playButtonClickSound()" style="font-family: Bakbak One;"/>
                        </html:form>
                    </div>

                    <!-- 月別シフト確認 -->
                    <div class="menuBlock">    
                        <html:form action="/monthlyShiftCheckInit">
                            <input type="image" src="img/神3.png" style="width: 150px; height: 150px" onclick="playButtonClickSound()"/>
                            <br/>
                            <input type="submit" value="मासिक शिफ्ट की जाँच" class="button3" onclick="playButtonClickSound()" style="font-family: Bakbak One;"/>
                        </html:form>
                    </div>

                    <!-- 日別シフト確認 -->
                    <div class="menuBlock">    
                        <html:form action="/dailyShiftInit">
                            <input type="image" src="img/神4.png" style="width: 150px; height: 150px" onclick="playButtonClickSound()"/>
                            <br/>
                            <input type="submit" value="दैनिक शिफ्ट की जाँच" class="button4" onclick="playButtonClickSound()" style="font-family: Bakbak One;"/>
                        </html:form>
                    </div>

                    <!-- 月別シフト入力 -->
                    <div class="menuBlock">    
                        <html:form action="/monthlyShiftInputInit">
                            <input type="image" src="img/神5.png" style="width: 150px; height: 150px" onclick="playButtonClickSound()"/>
                            <br/>
                            <input type="submit" value="मासिक शिफ्ट इनपुट" class="button5" onclick="playButtonClickSound()" style="font-family: Bakbak One;"/>
                        </html:form>
                    </div>

                    <!-- 出勤希望日確認 -->
                    <div class="menuBlock">    
                        <html:form action="/workDateRequestCheckInit">
                            <input type="image" src="img/神6.png" style="width: 150px; height: 150px" onclick="playButtonClickSound()"/>
                            <br/>
                            <input type="submit" value="कार्य दिवस की इच्छा की जाँच" class="button6" onclick="playButtonClickSound()" style="font-family: Bakbak One;"/>
                        </html:form>
                    </div>
                </div>

            </logic:equal>

            <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                         property="authorityId"
                         value="<%=CommonConstant.Authority.USER.getId() %>">

                <div style="margin:auto;">
                    <!-- 勤務実績確認 -->
                    <div class="menuBlock">    
                        <html:form action="/workRecordCheckInit">
                            <input type="image" src="img/神2.png" style="width: 150px; height: 150px" onclick="playButtonClickSound()"/>
                            <br/>
                            <input type="submit" value="कर्मचारियों का प्रदर्शन सत्यापित करें" class="button2" onclick="playButtonClickSound()" style="font-family: Bakbak One;"/>
                        </html:form>
                    </div>

                    <!-- 月別シフト確認 -->
                    <div class="menuBlock">    
                        <html:form action="/monthlyShiftCheckInit">
                            <input type="image" src="img/神3.png" style="width: 150px; height: 150px" onclick="playButtonClickSound()"/>
                            <br/>
                            <input type="submit" value="मासिक शिफ्ट की जाँच" class="button3" onclick="playButtonClickSound()" style="font-family: Bakbak One;"/>
                        </html:form>
                    </div>

                    <!-- 日別シフト確認 -->
                    <div class="menuBlock">    
                        <html:form action="/dailyShiftInit">
                            <input type="image" src="img/神4.png" style="width: 150px; height: 150px" onclick="playButtonClickSound()"/>
                            <br/>
                            <input type="submit" value="दैनिक शिफ्ट की जाँच" class="button4" onclick="playButtonClickSound()" style="font-family: Bakbak One;"/>
                        </html:form>
                    </div>

                    <!-- 出勤希望日確認 -->
                    <div class="menuBlock">    
                        <html:form action="/workDateRequestCheckInit">
                            <input type="image" src="img/神6.png" style="width: 150px; height: 150px" onclick="playButtonClickSound()"/>
                            <br/>
                            <input type="submit" value="कार्य दिवस की इच्छा की जाँच" class="button6" onclick="playButtonClickSound()" style="font-family: Bakbak One;"/>
                        </html:form>
                    </div>
                </div>

            </logic:equal>
        </div>
    </div>
</body>
</html>
