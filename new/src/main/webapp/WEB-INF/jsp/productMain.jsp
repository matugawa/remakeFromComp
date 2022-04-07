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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>商品登録</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>

<body>
  <div style="background-color: #E0FFFF;">
  <div class="container">
  <div class="main">
<h1><span class="text-dark"><font size="7">商品管理画面</font></span></h1>
  </div>
<br>

<p class="text-success"><font size="5">◆既存の商品一覧◆</font></p>
<br>
<% if(msg!=null){ %>
<p><%=msg %></p>
<% } %>
<br>
<% if(productList!=null){ %>
 <select size="10">
  <% for(Product pr: productList){ %>
   <option>&nbsp;&nbsp;&nbsp;商品ID&nbsp;&nbsp;=&nbsp;&nbsp;<%=pr.getProductId()%>&nbsp;&nbsp;&nbsp;商品名&nbsp;&nbsp;=&nbsp;&nbsp;<%=pr.getProductName()%>&nbsp;&nbsp;&nbsp;単価&nbsp;&nbsp;=&nbsp;&nbsp;<%=pr.getIntPrice()%>&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;&nbsp;カテゴリーID&nbsp;&nbsp;=&nbsp;&nbsp;<%=pr.getCategoryId()%>&nbsp;&nbsp;)&nbsp;</option>
  <% } %>
 </select>

<% } %>
<br>
<form action="/new/ProductServlet?action=renewal" method="post">

<select name="sort" size="2">
<option value="product_id">&nbsp;商品ID  </option>
<option value="product_name">&nbsp;商品名 </option>
</select>
<br>
<select name="type" size="2">
<option value="asc"> &nbsp;降順</option>
<option value="desc"> &nbsp;昇順 </option>
</select>
<br>
<!--  <input type="submit" value="更新">-->
<button class="btn btn-warning" type="submit">更新</button>
</form>

<br>
<br>
<b><p class="text-danger">◆商品登録◆</p></b>
<span class="text-dark">※登録元のカテゴリーを選択してください。</span>
<br>

<form action="/new/ProductServlet?action=register" method="post">

<select name="categoryId" size="10">
<% for( Category category:categoryList){%>
<option value="<%= category.getCategoryId()%>">&nbsp;&nbsp;カテゴリー&nbsp;&nbsp;&nbsp;&nbsp;<%=category.getCategoryName() %>&nbsp;&nbsp;（&nbsp;&nbsp;ID&nbsp;&nbsp;=&nbsp;&nbsp;<%= category.getCategoryId()%>&nbsp;&nbsp;)</option>
<% } %>

</select>
<br>
<p>商品ID：<input type="text" name="productId"></p>
<p>商品名：<input type="text" name="productName"></p>
<p>単価：<input type="text" name="price"></p>
<button class="btn btn-warning" type="submit">登録</button>
</form>

<br>
<br>
<p class="text-danger"><b>◆商品削除◆</b></p>
<span class="text-dark">※削除したい商品を選択してください。</span>
<br>

<form action="/new/ProductServlet?action=delete" method="post">
<select name="productId" size="10">
<% for( Product pr: productList){%>
<option value="<%= pr.getProductId()%>">&nbsp;&nbsp;商品名&nbsp;=&nbsp;<%= pr.getProductName()%>&nbsp;&nbsp;&nbsp;商品ID&nbsp;=&nbsp;<%= pr.getProductId()%>&nbsp;</option>

<% } %>
</select>
<br>
<div class="clearfix mb-2">
<br>
<div class="float-left"><button class="btn btn-warning " type="submit">削除</button>
</div>
</div>

</form>

<br>
<br>
<p class="text-danger"><b>◆商品編集◆</b></p>
<span class="text-dark">※編集したい商品を選択してください。</span>
<br>

<br>

<form action="/new/ProductServlet?action=edit" method="post">


<select name="productId" size="10">
<% for( Product pr: productList){%>
<option value="<%= pr.getProductId()%>">&nbsp;&nbsp;&nbsp;商品ID&nbsp;=&nbsp;<%= pr.getProductId()%> &nbsp;&nbsp;&nbsp;商品名&nbsp;=&nbsp;<%= pr.getProductName()%>&nbsp;&nbsp;&nbsp;商品単価&nbsp;=&nbsp;<%= pr.getIntPrice()%>&nbsp;&nbsp;&nbsp;(&nbsp;カテゴリーID&nbsp;=&nbsp;<%= pr.getCategoryId()%>)&nbsp;</option>

<% } %>

</select>


<br>
<br>
<span class="text-dark">※変更後のカテゴリーを選択してください。</span>
<br>

<select name="categoryId" size="10">
<% for( Category category:categoryList){%>
<option value="<%= category.getCategoryId()%>">&nbsp;&nbsp;&nbsp;カテゴリー名&nbsp;=&nbsp;<%= category.getCategoryName()%>&nbsp;&nbsp;&nbsp;カテゴリーID&nbsp;=&nbsp;<%= category.getCategoryId()%>&nbsp; </option>
<% } %>
</select>
<br>

<p>変更後商品名:<input type="text" name="productName"></p>
<p>変更後単価:<input type="text" name="price"></p>



<button class="btn btn-warning" type="submit">編集</button>
</form>
<a href="/new/">TOPへ</a>
</div>
</div>

</body>
</html>