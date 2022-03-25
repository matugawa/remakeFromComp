package test;

import beans_entity.Category;
import dao.CategoryDAO;

public class test {

	public static void main(String[] args) {
		// TODO 自動生成されたメソッド・スタブ
		
		Category ca=new Category("12", "12");
		CategoryDAO da=new CategoryDAO();
		
		if(da.isExistIdorName(ca)) {
			System.out.println("y");
		}else {
			System.out.println("n");
		}
		
		
		
		
		
	}

}
