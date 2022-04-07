<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="beans_entity.Category, java.util.List, java.util.ArrayList" %>
<%

String msg=(String) request.getAttribute("msg");
List<Category> categoryList=(List<Category>) request.getAttribute("categoryList");
List<Category> delCategoryList=(List<Category>) request.getAttribute("delCategoryList");
%>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
   

<title>カテゴリー登録</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</head>
<body>
   <div style="background-color: #E0FFFF;">
   <div class="container bg-left">
   <div class="main">
     <h1><span class="text-primary"><font size="7">カテゴリー設定画面</font></span></h1>
   </div>
  <br>
	
<p class="text-success"><font size="5">◆既存カテゴリーリスト一覧◆</font></p>
	
 <br>
 <% if(msg!=null){ %>
<p><%=msg %></p>
<% } %>
 

<% if(categoryList!=null){ %>
 <select size="10">
  <% for(Category ca: categoryList){ %>
   <option>&nbsp;&nbsp;カテゴリーID&nbsp;=&nbsp;<%=ca.getCategoryId()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; カテゴリー名&nbsp;=&nbsp;<%=ca.getCategoryName() %>&nbsp;</option>
   
  <% } %>
 </select>
<% } %>
<br>


<form action="/new/CategoryServlet?action=renewal" method="post">

<select name="sort" size="2">
<option value="category_id">&nbsp;&nbsp;カテゴリID  &nbsp;</option>
<option value="category_name">&nbsp;&nbsp;カテゴリ名 &nbsp;</option>
</select>
<br>
<select name="type" size="2">
<option value="asc"> &nbsp;&nbsp;降順&nbsp;</option>
<option value="desc"> &nbsp;&nbsp;昇順&nbsp;</option>
</select>
<br>
<!--
<input type="submit" value="更新">
-->
    <button type="submit" class="btn btn-warning">更新</button>
</form>
<br>


<p class="text-danger">◆カテゴリー登録◆</p>
<span class="text-dark">※登録したいカテゴリーIDとカテゴリー名を入力してください。</span>
<form action="/new/CategoryServlet?action=register" method="post">
<p>カテゴリーID：<input type="text" name="categoryId"></p>
<p>カテゴリー名:<input type="text" name="categoryName"></p>

 <div class="col-12">
    <button type="submit" class="btn btn-warning">登録</button>
  </div>
</form>


<br>

<p class="text-danger">◆カテゴリー削除◆</p>
<span class="text-dark">※削除したいカテゴリーを選択してください。</span>
<br>
<span class="text-dark">※商品を含むカテゴリーは削除できません。</span>
<form action="/new/CategoryServlet?action=delete" method="post">
<select name="categoryId" size="10">

<% for(Category d: delCategoryList){%>
<option value="<%= d.getCategoryId()%>">&nbsp;&nbsp;カテゴリーID&nbsp;=&nbsp;<%= d.getCategoryId()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;カテゴリー名&nbsp;=&nbsp;<%= d.getCategoryName()%>&nbsp;</option>
<% } %>

</select>
<p>
 <div class="col-12">
    <button type="submit" class="btn btn-warning">削除</button>
  </div>
  
</form>

<br>

<p class="text-danger">◆カテゴリー編集◆</p>

<span class="text-dark">※変更したいカテゴリーIDを選択してください</span>
<br>


<form action="/new/CategoryServlet?action=edit" method="post">

<select name="categoryId" size="10">
<% for( Category category:categoryList){%>
<option value="<%= category.getCategoryId()%>">&nbsp;&nbsp;カテゴリーID&nbsp;=&nbsp;<%= category.getCategoryId()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;カテゴリー名&nbsp;=&nbsp;<%= category.getCategoryName() %>&nbsp;</option>


<% } %>
</select>
<p>編集後のカテゴリー名：<input type="text" name="categoryName"></p>
 <div class="col-12">
    <button type="submit" class="btn btn-warning">編集</button>
  </div>
</form>

<a href="/new/">TOPへ</a>
</div>
</div>
</body>
</html>