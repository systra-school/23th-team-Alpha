/**
 * ファイル名：check.js
 * 共通処理
 *
 * 変更履歴
 * 1.0  2010/09/10 Kazuya.Naraki
 */

/**
 *  ログアウトボタンサブミット
 */
function logout() {
    document.forms[0].action = "/kikin-for-Struts-bug/logout.do";
    document.forms[0].submit();
}

/**
 *  戻るボタンサブミット
 */
// document.forms[0].action = "/kikin-for-Struts-bug/logout.do";
// 8/23　花田　障害No023　logoutActionが実行される原因のパスを修正まる。
function doSubmit(action) {
    document.forms[0].action = action;
    document.forms[0].submit();
}