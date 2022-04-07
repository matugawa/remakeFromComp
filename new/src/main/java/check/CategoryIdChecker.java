package check;

public class CategoryIdChecker extends abChecker{
	


	private static final String errMsg="カテゴリーIDは１文字以上１０文字以内です<br>";
	public CategoryIdChecker() {
		super(errMsg);
	}
	
	@Override
	public boolean check(String data) {
		
		data=data.replaceAll(" ", "");
		if(data.length()==0 ||data.length()>10) {
			return false;
		}
		return true;
	}
	
	

}
