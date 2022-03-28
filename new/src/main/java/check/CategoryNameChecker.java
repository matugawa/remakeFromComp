package check;

public class CategoryNameChecker extends abChecker{


	private static final String errMsg="カテゴリIDは１文字以上５０文字以内です<br>";
	public CategoryNameChecker() {
		super(errMsg);
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public boolean check(String data) {
		if(data.length()==0 ||data.length()>50) {
			return false;
		}
		return true;
	}
	
	

}
