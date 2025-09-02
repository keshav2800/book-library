<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<body>

 <h1>Welcome to Java Training School Library</h1>

<div> ${msg}  </div>

<table border="2" width="90%" cellpadding="2">
<tr>
<th>Id</th>
<th>Book Name</th>
<th>Author</th>
<th>Price</th>
<th>Status</th>
<th>Borrow</th>
<th>Update</th>
<th>Delete</th>
</tr>
<c:forEach var="book" items="${books}">
<tr>
<td>${book.id}</td>
<td>${book.name}</td>
<td>${book.author}</td>
<td>${book.price}</td>
<td>${book.status}</td>

<c:if test="${book.status == 'available'}">  
<td><a href="/library/borrowForm/${book.id}">Borrow</a></td> 
</c:if> 
<c:if test="${book.status != 'available'}">
<td>Not Available</td>
</c:if>


<td><a href="/library/updateBookForm/${book.id}">Update</a></td>


<td><a href="/library/deleteBook/${book.id}" onclick="return confirm('Are you sure you want to delete this book?');">Delete</a></td>
</tr>
</c:forEach>
</table>


<a href="/library/addBookForm">Add a Book</a>
</body>
</html>
 