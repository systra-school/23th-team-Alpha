/**
 * ファイル名：WorkDateRequestAbstractAction.java
 *
 * 変更履歴
 * 1.0  2010/11/22 Kazuya.Naraki
 */
package action.shk;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.Action;

/**
 * 説明：ログイン処理のロジック
 * @author naraki
 *
 */
public abstract class WorkDateRequestAbstractAction extends Action {
    // ログ出力クラス
    protected Log log = LogFactory.getLog(this.getClass());
    // 表示データ数
    
//    9/7　障害No112　出勤云々の原因はだいたいこいつ、18から19に修正しました
    protected final int SHOW_LENGTH = 19;
}
