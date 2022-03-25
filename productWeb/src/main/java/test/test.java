package test;

import model.ProductBeans;
import model.ProductLogic;

public class test {

	public static void main(String[] args) {
		// TODO 自動生成されたメソッド・スタブ
		
		ProductBeans pr=new ProductBeans("11", "1", "12", 1);
		ProductLogic pL=new ProductLogic();
		String msg=pL.preProductCheck(pr);
		
		System.out.println(msg);
		
		
/*
		CategoryDAO dao=new CategoryDAO();
		List<CategoryBeans> li =new ArrayList<>();
		li=dao.collectCategory();
		
		
		for(CategoryBeans q: li) {
			q.viewCategoryBeans();
		}
		for(int i=0; i< li.size(); i++) {
		  li.get(i).viewCategoryBeans();
			
		}*/
		
		/*
		ArrayList<String> li=new ArrayList<>();
		ArrayList<String> lii=new ArrayList<>();


		
		CategoryDAO dao=new CategoryDAO();
		li=dao.collectCategoryId();
		for(String q: li) {
			System.out.println(q);
		}
		
		ProductDAO daoo=new ProductDAO();
		lii=daoo.collectProductId();
		
		for(String q: lii) {
			System.out.println(q);
		}
		
		li.removeAll(lii);
		System.out.println();

		for(String q: li) {
			System.out.println(q);
		}
		*/
	
	
	}

}
