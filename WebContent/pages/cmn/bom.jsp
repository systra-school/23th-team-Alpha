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

    <title>システムトランジスタ</title>
    <link href="/kikin-for-Struts-bug/pages/css/common.css" rel="stylesheet" type="text/css" />


<style>
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
      }
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
            <td id="headCenter">
              <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                           property="authorityId"
                           value="<%=CommonConstant.Authority.ADMIN.getId() %>">
                システムトランジスタ
              </logic:equal>

              <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                           property="authorityId"
                           value="<%=CommonConstant.Authority.USER.getId() %>">
                システムトランジスタ
              </logic:equal>
            </td>
          </tr>
        </table>
      </div>


<!-- 		自爆ボタン　ひな形 -->
<!-- 				<div class="menuBlock"> -->
<%-- 			<html:form action="/bom"> --%>
<!-- 				<input type="submit" value="自爆" class="bigButton" /> -->
<%-- 			</html:form> --%>
<!-- 		</div> -->

		<!--       動画を表示 -->
<!--       <div id="videoContainer"> -->
<!--         <video id="explosionVideo" width="927" height="580" controls> -->
<!--           <source src="/kikin-for-Struts-bug/pages/material/explosion.mp4" type="video/mp4"> -->
<!--         </video> -->
<!--       </div> -->
      
      
     <div id="videoContainer">
        <video id="explosionVideo" controls>
          <source src="/kikin-for-Struts-bug/pages/material/へいしゃ.mp4" type="video/mp4">
        </video>
      </div>

		

		<div id="footer">
        <table>
          <tr>
            <td id="footLeft"></td>
            <td id="footCenter"></td>
            <td id="footRight"></td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>
