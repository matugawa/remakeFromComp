package test;

import dao.CategoryDAO;

public class test {

	public static void main(String[] args) {
		
		CategoryDAO da=new CategoryDAO();
		da.collectSortedCategory(";", "delete from category where category_id=tes");
		

	}
}
