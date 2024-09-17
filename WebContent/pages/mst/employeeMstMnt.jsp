<!-- employeeMstMnt.jsp -->
<%
/**
 * ファイル名：employeeMstMnt.jsp
 *
 * 変更履歴
 * 1.0  2010/09/13 Kazuya.Naraki
 */
%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.mst.EmployeeMstMntForm"%>
<%@page import="java.util.List"%>
<%@page import="form.mst.EmployeeMstMntBean"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>

<bean:size id="employeeMstMntBeanListSize" name="employeeMstMntForm" property="employeeMstMntBeanList"/>
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
     * チェックボックスがチェックされたら true、されていなければ false
     * param index 対象行番号
     */
    function checkDeleteFlg(index) {
        var deleteEmployeeId = document.forms[0].elements.deleteEmployeeId;
        var isCheck = false;

        if (deleteEmployeeId.length > 1) {
            isCheck = document.forms[0].elements.deleteEmployeeId[index].checked;
        } else {
            isCheck = deleteEmployeeId.checked;
        }

        document.forms[0].elements.namedItem('employeeMstMntBeanList['+ index +'].deleteFlg').value = isCheck;
    }

    /**
     * 新規登録画面へ
     */
    function employeeMstMntRegisterInit() {
        document.forms[0].action = "/kikin-for-Struts-bug/employeeMstMntRegisterInit.do";
        document.forms[0].submit();
    }

    /**
     * 更新処理を行う
     */
    function employeeMstMntUpdate() {
        // 一覧のサイズ
        var listSize = <%= employeeMstMntBeanListSize %>;

        // パスワードエラーメッセージ
        var passwordErrorMsg = '';
        // 9/9 坂本　障害No.127　社員名エラーメッセージ追加
        // 社員名エラーメッセージ
        var employeeNameErrorMsg = '';
        // 社員名カナエラーメッセージ
        var employeeNameKanaErrorMsg = '';
        var errorMsg = '';

        with(document.forms[0].elements) {
            for (var i = 0; i < listSize; i++) {
                // パスワードを取得する。
                var password = namedItem('employeeMstMntBeanList['+ i +'].password').value;
                // 9/9 坂本　障害No.127　社員名取得を追加
                // 社員名を取得する。
                var employeeName = namedItem('employeeMstMntBeanList['+ i +'].employeeName').value;
                // 社員名カナを取得する。
                var employeeNameKana = namedItem('employeeMstMntBeanList['+ i +'].employeeNameKana').value;

                // 背景色をクリアする
                namedItem('employeeMstMntBeanList['+ i +'].password').style.backgroundColor = 'white';
                namedItem('employeeMstMntBeanList['+ i +'].employeeNameKana').style.backgroundColor = 'white';
                namedItem('employeeMstMntBeanList['+ i +'].employeeName').style.backgroundColor = 'white';

                
                
                // パスワードチェック
                if (!passwordErrorMsg) {
                    if (!checkRequired(password)) {
                        var strArr = ['パスワード'];
                        passwordErrorMsg = getMessage('E-MSG-000001', strArr);
                        namedItem('employeeMstMntBeanList['+ i +'].password').style.backgroundColor = 'red';
                    }
                }
                // 9/9 坂本　障害No.127　社員名の必須チェック追加
                // 社員名チェック
                if (!employeeNameErrorMsg) {
                    if (!checkRequired(employeeName)) {
                        var strArr = ['社員名'];
                        employeeNameErrorMsg = getMessage('E-MSG-000001', strArr);
                        namedItem('employeeMstMntBeanList['+ i +'].employeeName').style.backgroundColor = 'red';
                    }
                }
                // 社員名カナチェック
                // 必須チェック
                // 9/9 坂本　障害No.127　社員名カナの必須チェック追加
                if (!employeeNameKanaErrorMsg) {
                    if (!checkRequired(employeeNameKana)) {
                        var strArr = ['社員名カナ'];
                        employeeNameKanaErrorMsg = getMessage('E-MSG-000001', strArr);
                        namedItem('employeeMstMntBeanList['+ i +'].employeeNameKana').style.backgroundColor = 'red';
                    }
                }
                // 半角チェック
                if (!employeeNameKanaErrorMsg) {
                    if (!checkHalfWidthKana(employeeNameKana)) {
                        var strArr = ['社員名カナ'];
                        employeeNameKanaErrorMsg = getMessage('E-MSG-000003', strArr);
                        namedItem('employeeMstMntBeanList['+ i +'].employeeNameKana').style.backgroundColor = 'red';
                    }
                }

                if (passwordErrorMsg && employeeNameKanaErrorMsg && employeeNameKanaErrorMsg) {
                    // パスワード 、社員名カナが共にエラーの場合
                    break;
                }
            }
        }
        // エラーメッセージ
        errorMsg = passwordErrorMsg + employeeNameErrorMsg + employeeNameKanaErrorMsg;

        if (errorMsg) {
            alert(errorMsg);
            // エラー
            return false;
        }

        document.forms[0].submit();
    }
    </script>

    <title>社員マスタメンテナンス画面</title>

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
              कर्मचारी मास्टर मेंटेनेंस
            </td>
            <td id="headRight">
              <input value="ログアウト" type="image" src="img/カレーさん.png"  style="widows: 100px; height: 100px"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="businessBody" style="margin:50px 0px 0px 0px;">
        <html:form action="/employeeMstMntUpdate">
          <div style="overflow:hidden;  margin: 0 auto; width:1030px;">
            <table class="tableHeader">
              <tr>
                <td width="200px" align="center">
                  社員ＩＤ
                </td>
                <td width="200px" align="center">
                  パスワード
                </td>
                <td width="200px" align="center">
                  社員名
                </td>
                <td width="200px" align="center">
                  社員名カナ
                </td>
                
                
                <%-- 8/22 障害No020対応　掛江　「権限」項目がtdタグで囲んだ --%>
                <td width="100px" align="center">
                  権限
                </td>
                
                
                <td width="100px" align="center">
                  削除
                </td>
              </tr>
            </table>
          </div>
          <%-- 9/9　障害No126　height:420px;に変更 --%>
          <div style="overflow: auto; height:420px; width:1030px;  margin: 0 auto; ">
            <table class="tableBody" >
              <logic:iterate indexId="idx" id="employeeMstMntBeanList" name="employeeMstMntForm"  property="employeeMstMntBeanList">
                <bean:define id="employeeId" name= "employeeMstMntBeanList" property="employeeId" type="java.lang.String"/>
                <bean:define id="selectAuthorityId" name= "employeeMstMntBeanList" property="authorityId" type="java.lang.String"/>
               <tr> 
                  <td width="200px"  align="center">
                    <bean:write property="employeeId" name="employeeMstMntBeanList"/>
                    <html:hidden property="employeeId" name="employeeMstMntBeanList" indexed="true"/>
                  </td>
                  <td width="200px"  align="center">
                  
                  <%-- 8/26　掛江　障害No034　html:text → html:password へ変更 --%>
                  <%-- <html:text property="password" name="employeeMstMntBeanList"  size="10" maxlength="6" indexed="true" /> --%>
                  
                    <html:password property="password" name="employeeMstMntBeanList"  size="10" maxlength="6" indexed="true" />
                  </td>
                  <td width="200px"  align="center">
                    <html:text property="employeeName" name="employeeMstMntBeanList" size="20" maxlength="10" indexed="true" />
                  </td>
                  <td width="200px"  align="center">
                    <html:text property="employeeNameKana" name="employeeMstMntBeanList"  size="20" maxlength="10" indexed="true" />
                  </td>
                  <td width="100px"  align="center">
                  
                  <%-- 8/26　掛江　障害No043　disabled="true" → disabled="false" へ変更 --%>
                  <%-- <html:text property="password" name="employeeMstMntBeanList"  size="10" maxlength="6" indexed="true" /> --%>
                  
                    <html:select property="authorityId" name="employeeMstMntBeanList" value="<%= selectAuthorityId %>" indexed="true" disabled="false">
                      <html:optionsCollection name="employeeMstMntForm"
                                              property="authorityCmbMap"
                                              value="key"
                                              label="value"/>
                    </html:select>
                  </td>
                  <td width="100px"  align="center">
                    <html:checkbox property="deleteEmployeeId" name="employeeMstMntBeanList" value="<%= employeeId %>" onchange='<%="checkDeleteFlg(" + idx + ")" %>' ></html:checkbox>
                    <html:hidden property="deleteFlg" name="employeeMstMntBeanList" value="false" indexed="true"/>
                  </td>
                </tr>
              </logic:iterate>
            </table>
          </div>
        </html:form>
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input value="新規登録"  type="image" src="img/ラブガンジー.png" style="widows: 70px; height: 70px; float: right;" onclick="employeeMstMntUpdate()" />
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input value="更新"  type="image" src="img/ラブガンジー2.png" style="widows: 70px; height: 70px; float: right; " onclick="employeeMstMntRegisterInit()" />
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
        <input type="image" src="img/花うるさい2.gif" style="widows: 70px; height: 70px; float: right;">
      </div>
      <div id="footer">
        <table>
          <tr>
            <td id="footLeft">
              　
            </td>
            <td id="footCenter">
              　
            </td>
            <td id="footRight">
              <!-- <input value="新規登録" type="button" class="smallButtonSubmit"  onclick="employeeMstMntRegisterInit()" />
              <input value="更新" type="button" class="smallButtonSubmit"  onclick="employeeMstMntUpdate()" /> -->
            </td>
          </tr>
        </table>
      </div>
    </div>
    
    <audio src="/kikin-for-Struts-bug/pages/sounds/click.mp3" autoplay loop>
    </audio>
    
  </body>
</html>