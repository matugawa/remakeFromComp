<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="beans_entity.Product, beans_entity.Category, java.util.List" %>
<%

String msg=(String) request.getAttribute("msg");

List<Category> categoryList=(List<Category>) request.getAttribute("categoryList");

List<Product> productList=(List<Product>) request.getAttribute("productList");

%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プロダクト登録</title>
</head>
<body>

<h1>プロダクト登録</h1>


<% if(msg!=null){ %>
<p><%=msg %></p>
<% } %>



<form action="/new/ProductServlet?action=register" method="post">

<select name="categoryId" size="10">
<% for( Category category:categoryList){%>
<option value="<%= category.getCategoryId()%>">カテゴリID<%= category.getCategoryId()%> </option>
<% } %>
</select>
<p>商品ID：<input type="text" name="productId"></p>
<p>商品名:<input type="text" name="productName"></p>
<p>単価:<input type="text" name="price"></p>
<input type="submit" value="登録">
</form>
<br>
<br>
<form action="/new/ProductServlet?action=delete" method="post">
<select name="productId" size="10">
<% for( Product pr: productList){%>
<option value="<%= pr.getProductId()%>">プロダクトID＝<%= pr.getProductId()%> </option>
<% } %>
</select>
<input type="submit" value="削除">
</form>

<br>
<br>



<form action="/new/ProductServlet?action=edit" method="post">

<select name="productId" size="10">
<% for( Product pr: productList){%>
<option value="<%= pr.getProductId()%>">プロダクトID＝<%= pr.getProductId()%> </option>
<% } %>

</select>

<br>
変更後のカテゴリIDを選択
<br>

<select name="categoryId" size="10">
<% for( Category category:categoryList){%>
<option value="<%= category.getCategoryId()%>">カテゴリID<%= category.getCategoryId()%> </option>
<% } %>
</select>

<p>変更後商品名:<input type="text" name="productName"></p>
<p>変更後単価:<input type="text" name="price"></p>

<input type="submit" value="編集">
</form>






</body>
</html>