package test;

import beans_entity.Product;
import model.ProductLogic;

public class test {

	public static void main(String[] args) {
		// TODO 自動生成されたメソッド・スタブ
		
		
		Product pr=new Product("112", "dummy", "dummy", 0);
		ProductLogic pL=new ProductLogic();
		String msg=pL.deleteProductLogic(pr);
		
		System.out.println(msg);
		
		
		


	
		



		


		
		
		
		

		

		
		
	}

}
