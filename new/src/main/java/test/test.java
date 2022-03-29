package test;

import java.util.ArrayList;
import java.util.List;

import beans_entity.Product;
import dao.ShopDAO;

public class test {

	public static void main(String[] args) {
		// TODO 自動生成されたメソッド・スタブ
		
		
		Product pr=new Product("a11", "dummy", "dummy", 0);
		Product prr=new Product("a12", "dummy", "dummy", 0);
		List<Product> li=new ArrayList<>();
		li.add(pr);
		li.add(prr);
		
		ShopDAO da=new ShopDAO();
		
		List<Product> lii=new ArrayList<>();
		lii=da.collectProductByProductId(li);
		
		for(Product p: lii) {
			p.viewProduct();
		}
		
		
		
		


	
		



		


		
		
		
		

		

		
		
	}

}
