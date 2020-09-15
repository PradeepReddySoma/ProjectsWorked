<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/add-customer.css" />
</head>
<body>
<div id="wrapper">
   <div id="header">
      <div id="image">
          <img  id="image1" alt="" src="${pageContext.request.contextPath}/resources/images/police.jpg" align="left">
      </div>
      <h2>PCB - Police Control Board </h2>
      <i>Yergatla,503308</i>
       <img  id="image2" alt="" src="${pageContext.request.contextPath}/resources/images/police.jpg">
   </div>
</div>

<div id="container">
   <h3>Save Customer</h3>
   
   <form:form action="saveCustomer" modelAttribute="customer" method="POST" >
      <form:hidden path="id"/>
      
      <table>
         <tbody>
	            <tr>
		            <td><label>First Name</label></td>
		            <td><form:input path="firstName"/></td>
	            </tr>
	            
	            <tr>
		            <td><label>Last Name</label></td>
		            <td><form:input path="lastName"/></td>
	            </tr>
	            
	            <tr>
		           <td><label>Email</label>
		            <td><form:input path="email"/></
	            </tr>
	            
	            <tr>
		           <td><label></label></td>
		            <td><input type="submit" class="save" value="Save"/></td>
	            </tr>
            
         </tbody>
      </table>
   
   </form:form>
   
   <div style="clear: both;"></div>
   
   <p>
	   <a href="${pageContext.request.contextPath}/customer/list">Back to List</a>
   </p>
</div>
</body>
</html>