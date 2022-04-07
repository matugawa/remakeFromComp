package model;

import java.util.List;

import beans_entity.Product;
import check.IChecker;
import check.IntChecker;
import check.ProductIdChecker;
import check.ProductNameChecker;
import dao.ProductDAO;

public class ProductLogic {
	public List<Product> collectSortedProductLogic(String sort, String type){
		sort =sort==null? "product_id":sort;
		type =type==null? "desc":type;
		
		ProductDAO da=new ProductDAO();
		return da.collectSortedProduct(sort, type);
		
	}
	public String createProductLogic(Product product) {
		String msg="";
		String temp=product.getProductId();
		IChecker ck =new ProductIdChecker();
		
		if(product.getCategoryId()==null) {
			msg="カテゴリーを選択してください。<br>";
		}
		if(!ck.check(temp)) {
			msg+=ck.getErrMsg();
		}
		temp=product.getProductName();
		ck=new ProductNameChecker();
		if(!ck.check(temp)) {
			msg+=ck.getErrMsg();
		}
		temp=product.getStringPrice();
		ck=new IntChecker();
		if(!ck.check(temp)) {
			msg+=ck.getErrMsg();
		}
		if(msg.length()!=0) {
			return msg;
		}
		product.setIntPrice( Integer.parseInt( product.getStringPrice()));
		ProductDAO da=new ProductDAO();
		msg=da.isExistProduct(product);
		if(msg.length()!=0) {
			return msg;
		}
		if(!da.createProduct(product)) {
			msg="登録できませんでした。";
		}
		return msg="登録しました。";
	}
	public String deleteProductLogic(Product product) {
		ProductDAO da=new ProductDAO();
		if(!da.deleteProduct(product)) {
			return "削除に失敗しました。";
		}
		return "削除しました。";
	}
	
	public String updateProductLogic(Product product) {
		String msg="";
		if(product.getProductId()==null) {
			return "編集したい商品を選択してください。<br>";
		}
		if(product.getCategoryId()==null) {
			return "変更後のカテゴリーを選択してください。<br)";
		}
		ProductDAO da=new ProductDAO();
		/*
		IChecker ck=new ProductNameChecker();
		if(!ck.check(product.getProductName())) {
			msg= ck.getErrMsg();
		}*/
		
		
		if(product.getProductName().length()==0) {
			
			product.setProductName( da.detectProductByPID(product.getProductId()).getProductName());
		}
		
		
		if(product.getStringPrice().length()==0) {
			product.setIntPrice(da.detectProductByPID(product.getProductId()).getIntPrice());
		}else {
			IChecker ck=new IntChecker();
			if(!ck.check(product.getStringPrice())) {
				msg+=ck.getErrMsg();
			}
			if(msg.length()!=0) {
				return msg;
			}
			product.setIntPrice( Integer.parseInt(product.getStringPrice()));
		}
		
		da=new ProductDAO();
		return da.updateProduct(product);
		
	}
	public List<Product> collectProductLogic(){
		ProductDAO da=new ProductDAO();
		return da.collectProduct();
	}
}
