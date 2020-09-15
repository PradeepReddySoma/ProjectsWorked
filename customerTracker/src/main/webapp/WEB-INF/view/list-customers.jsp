<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<title>List Customers</title>
</head>
<body>
<div id="wrapper">
   <div id="header">
      <div id="image">
          <img id="image1" alt="" src="${pageContext.request.contextPath}/resources/images/police.jpg" align="left">
      </div>
         <h2> PCB - Police Control Board </h2>
          <i>Yergatla,503308</i>
      <img  id="image2" alt="" src="${pageContext.request.contextPath}/resources/images/police.jpg">
      
   </div>
</div>

<div id="container">
   <div id="content">
   
   <input type=="button" class="add-button" onClick="window.location.href='addCustomer';return false;" value="Add Cusstomer" />
   
       <table>
          <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Action</th>
         </tr>
         
         <c:forEach var="tempCustomer" items="${customers}">
         
         <c:url var="updateLink" value="/customer/showFormForUpdate">
            <c:param name="customerId" value="${tempCustomer.id}" />
         </c:url>
         
         <c:url var="deleteLink" value="/customer/showFormForDelete">
             <c:param name="customerId" value="${tempCustomer.id}" />
         </c:url>
         
            <tr>
               <td> ${tempCustomer.firstName} </td>
               <td> ${tempCustomer.lastName} </td>
               <td> ${tempCustomer.email} </td>
               <td>
                 <a href="${updateLink}">Update</a>
                 |
                 <a href="${deleteLink}" onClick="if(!(confirm('Are you sure you want to Delete this Customer ?'))) return false">Delete</a>
<%--                  <a href="${deleteLink}" onclick="if(!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
 --%>               </td>  
            </tr>
         </c:forEach>
         
       </table>
   </div>
</div>
</body>
</html>