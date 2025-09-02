<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<body>
 <h1>Update Book</h1>
 <form:form method="post" action="/library/updateBook/${book.id}" modelAttribute="book">
  <table>
   <tr>
    <td>Book Name :</td>
    <td><input type="text" name="name" value="${book.name}" required></td>
   </tr>
   <tr>
    <td>Author :</td>
    <td><input type="text" name="author" value="${book.author}" required></td>
   </tr>
   <tr>
    <td>Price :</td>
    <td><input type="text" name="price" value="${book.price}" required></td>
   </tr>
   <tr>
    <td></td>
    <td><input type="submit" value="Update Book" /></td>
   </tr>
  </table>
 </form:form>
</body>
</html>
 