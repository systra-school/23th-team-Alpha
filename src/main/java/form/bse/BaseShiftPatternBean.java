/**
 * ファイル名：BaseShiftPatternBean.java
 *
 * 変更履歴
 * 1.0  2010/11/04 Kazuya.Naraki
 */
package form.bse;

/**
 * 説明：基本シフト凡例
 * @author nishioka
 *
 */
public class BaseShiftPatternBean {

    /** シフト名 */
    private String shiftName;
    /** シンボル */
    private String symbol;
//  8/26 花田　シンボルのセッターゲッターがリターンでshiftNameを返したりしてたので修正
    /** 時間帯 */
    private String timeZone;
    
    public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	/** 休憩 */
    private String breakTime;
    
	public String getShiftName() {
		return shiftName;
	}
	public void setShiftName(String shiftName) {
		this.shiftName = shiftName;
	}
//	public String getSymbol() {
//		return shiftName;
//	}
//	public void setSymbol(String shiftName) {
//		this.shiftName = shiftName;
//	}
	public String getTimeZone() {
		return timeZone;
	}
	public void setTimeZone(String timeZone) {
		this.timeZone = timeZone;
	}
	public String getBreakTime() {
		return breakTime;
	}
	public void setBreakTime(String breakTime) {
		this.breakTime = breakTime;
	}
}
