<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<html lang="ja">
<head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
    <script type="text/javascript" src="/kikin-for-Struts-bug/pages/js/message.js"></script>
    <title>ログイン画面Login</title>
    <style>
        /* 背景と全体のスタイル */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: radial-gradient(circle, #ff0000, #000000);
            color: #fff;
            text-align: center;
            position: relative;
            background-image: url('/kikin-for-Struts-bug/img/gamebird.gif');
            background-repeat: repeat; /* 画像を繰り返して敷き詰める */
            background-size: 100px 100px; /* 画像のサイズを調整 */
            animation: bgAnimation 5s infinite alternate;
        }

        @keyframes bgAnimation {
            0% { background-position: 0 0; }
            100% { background-position: 100px 100px; }
        }

        #wrapper {
            width: 100%;
            max-width: 600px;
            margin: 50px auto;
            background: linear-gradient(to right, #ff0000, #0000ff, #00ff00, #ff00ff);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
            position: relative;
            overflow: hidden;
            animation: wrapperAnimation 2s infinite alternate, wrapperShake 0.5s infinite;
        }

        @keyframes wrapperAnimation {
            0% { transform: rotate(0deg); }
            50% { transform: rotate(10deg); }
            100% { transform: rotate(0deg); }
        }

        @keyframes wrapperShake {
            0% { transform: translateX(0); }
            25% { transform: translateX(-15px); }
            50% { transform: translateX(15px); }
            75% { transform: translateX(-15px); }
            100% { transform: translateX(0); }
        }

        .outer-images {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            grid-template-rows: repeat(10, 1fr);
            gap: 10px; /* 画像間のスペースを調整 */
            animation: imageAnimation 3s infinite alternate;
        }

        @keyframes imageAnimation {
            0% { opacity: 0.5; }
            100% { opacity: 1; }
        }

        .outer-images img {
            width: 50px; /* 画像のサイズを調整 */
            height: 50px;
            object-fit: cover;
            animation: imageSpin 3s infinite linear;
        }

        @keyframes imageSpin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        h1 {
            font-size: 40px;
            margin-bottom: 20px;
            color: #ff0000;
            text-shadow: 2px 2px 4px #000, 0 0 25px rgba(255, 0, 0, 0.6);
            animation: textColorChange 1s infinite alternate;
        }

        @keyframes textColorChange {
            0% { color: #ff0000; }
            100% { color: #00ff00; }
        }

        .logo {
            width: 150px;
            margin-bottom: 20px;
            animation: logoBounce 1s infinite;
        }

        @keyframes logoBounce {
            0% { transform: translateY(0); }
            50% { transform: translateY(-15px); }
            100% { transform: translateY(0); }
        }

        label {
            display: inline-block;
            width: 150px;
            text-align: right;
            margin-right: 15px;
            font-size: 20px;
            color: #ff0000;
            font-weight: bold;
            animation: labelShake 0.5s infinite;
        }

        @keyframes labelShake {
            0% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            50% { transform: translateX(10px); }
            75% { transform: translateX(-10px); }
            100% { transform: translateX(0); }
        }

        input[type="text"], input[type="password"] {
            font-size: 20px;
            padding: 12px;
            border: 2px solid #ff0000;
            border-radius: 10px;
            width: 300px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            background: #ff0000;
            position: relative;
            z-index: 1;
            animation: inputShake 0.5s infinite;
        }

        @keyframes inputShake {
            0% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            50% { transform: translateX(10px); }
            75% { transform: translateX(-10px); }
            100% { transform: translateX(0); }
        }

        input[type="text"]::placeholder, input[type="password"]::placeholder {
            color: #000;
        }

        .button, .reset-button {
            font-family: 'Arial', sans-serif;
            font-size: 20px;
            font-weight: bold;
            color: #fff;
            border: none;
            border-radius: 10px;
            padding: 15px 30px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin: 10px;
            text-transform: uppercase;
            position: relative;
            z-index: 1;
            animation: buttonWobble 1s infinite;
        }

        @keyframes buttonWobble {
            0% { transform: rotate(0deg); }
            50% { transform: rotate(10deg); }
            100% { transform: rotate(0deg); }
        }

        .button {
            background: linear-gradient(to right, #ff0000, #0000ff);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
            animation: buttonGlow 1.5s infinite alternate, buttonBounce 1s infinite;
        }

        @keyframes buttonGlow {
            0% { box-shadow: 0 0 10px #ff0000; }
            50% { box-shadow: 0 0 25px #ff0000; }
            100% { box-shadow: 0 0 10px #ff0000; }
        }

        @keyframes buttonBounce {
            0% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0); }
        }

        .button:hover {
            background: linear-gradient(to right, #0000ff, #ff0000);
            transform: scale(1.1);
        }

        .reset-button {
            background: linear-gradient(to right, #000000, #555555);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        }

        .reset-button:hover {
            background: linear-gradient(to right, #555555, #000000);
            transform: scale(1.1);
        }

        .error-message {
            color: #ff0000;
            font-weight: bold;
            font-size: 18px;
            margin-top: 10px;
        }

        #footer {
            font-size: 12px;
            color: #666;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%-- セッションにエラーが存在する場合アラートで表示 --%>
    <%
    if (session.getAttribute("error") != null) {
    %>
    <script type="text/javascript">
        var msg = getMessageCodeOnly('E-MSG-000002');
        alert(msg);
        var audio = new Audio('/kikin-for-Struts-bug/sounds/error.mp3');
        audio.play();
        setTimeout(function() { 
            alert("再試行してください。");
            var audio2 = new Audio('/kikin-for-Struts-bug/sounds/error.mp3');
            audio2.play();
        }, 2000);
    </script>
    <%
    session.setAttribute("error", null);
    } %>

    <!-- 枠外に100体の画像を配置 -->
    <div class="outer-images">
        <% for (int i = 0; i < 100; i++) { %>
            <img src="/kikin-for-Struts-bug/img/gamebird.gif" alt="Gamebird Image <%= i %>">
        <% } %>
    </div>

    <div id="wrapper">
        <!-- ロゴ画像を挿入 -->
        <img src="/kikin-for-Struts-bug/img/gamebird.gif" alt="Company Logo" class="logo">

        <div id="businessBody">
            <html:form action="/login" onsubmit="return validateLoginForm(this)">
                <h1>ログイン画面</h1>

                <label>ID :</label>
                <html:text property="employeeId" size="16" style="font-size: 20px;" />
                <script>
                    document.getElementsByName('employeeId')[0].setAttribute('placeholder', 'sh＋４桁の数字');
                </script>
                <br />
                <label>パスワード :</label>
                <html:password property="password" size="16" redisplay="false" style="font-size: 20px;" />
                <script>
                    document.getElementsByName('password')[0].setAttribute('placeholder', '５桁のパスワード');
                </script>
                <br />
                <br />
                <html:submit property="submit" value="ログイン" styleClass="button" />
                <html:reset value="リセット" styleClass="reset-button" />
            </html:form>
        </div>
        <div id="footer">
            <!-- フッターの内容 -->
        </div>
    </div>

    <script>
        // 簡単なバリデーション
        function validateLoginForm(form) {
            var employeeId = form.employeeId.value.trim();
            var password = form.password.value.trim();
            
            if (employeeId === "" || password === "") {
                alert("IDとパスワードを入力してください。");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>

	
</body>
</html>