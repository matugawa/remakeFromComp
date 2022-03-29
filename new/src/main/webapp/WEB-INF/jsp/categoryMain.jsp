<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="beans_entity.Category, java.util.List, java.util.ArrayList" %>
<%

String msg=(String) request.getAttribute("msg");
List<Category> categoryList=(List<Category>) request.getAttribute("categoryList");
List<String> delCategoryList=(List<String>) request.getAttribute("delCategoryList");
%>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">





<title>カテゴリ登録</title>
</head>
<body>



<h1>カテゴリ設定画面</h1>

<p>既存カテゴリーリスト一覧</p>
<br>
<% if(categoryList!=null){ %>
 <select size="10">
  <% for(Category ca: categoryList){ %>
   <option>カテゴリID= <%=ca.getCategoryId()%> カテゴリ名= <%=ca.getCategoryName() %></option>
  <% } %>
 </select>
<% } %>
<br>





<% if(msg!=null){ %>
<p><%=msg %></p>
<% } %>



<p>カテゴリー登録</p>


<form action="/new/CategoryServlet?action=register" method="post">
<p>カテゴリーID：<input type="text" name="categoryId"></p>
<p>カテゴリー名:<input type="text" name="categoryName"></p>
<br>
<input type="submit" value="登録">


</form>



<br>



<form action="/new/CategoryServlet?action=delete" method="post">
<select name="categoryId" size="10">

<% for(String d: delCategoryList){%>
<option value="<%= d%>">カテゴリID=<%= d%> </option>
<% } %>

</select>
<p>
<br>
<input type="submit" value="削除">
</p>
</form>




<br>



<form action="/new/CategoryServlet?action=edit" method="post">

<select name="categoryId" size="10">
<% for( Category category:categoryList){%>
<option value="<%= category.getCategoryId()%>">カテゴリID<%= category.getCategoryId()%> </option>
<% } %>
</select>
<p>編集後のカテゴリー名：<input type="text" name="categoryName"></p>
<input type="submit" value="編集">
</form>




</body>
</html>