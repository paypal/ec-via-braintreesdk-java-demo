<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="incl.header.jsp" %>

		<div class="container-fluid">
 	 	 	<div class="row">

 	 	 	 	<div class="col-sm-5" >
 	 	 	 		<div class="divBorder" style="min-height: 460px;">

	 					<h3> Order Complete </h3>
	 					<br />
	 					
	 					<h4>Order details:</h4>
	
						<strong>Item:</strong> <%= request.getAttribute("item-description") %> <br />
	 					<strong>Transaction ID:</strong> <%= request.getAttribute("transactionid") %> <br />
	 					<strong>Status:</strong> <%= request.getAttribute("status") %> <br />
	 					<strong>Total Amount:</strong> <%= request.getAttribute("total-amount") %>  <%= request.getAttribute("currency") %><br />
	 	 	 	 	 	
	 					<br />
	 					<br />
	 					
	 					<h4>Ship to:</h4>
	 					 
	 					<address>
							<strong><%= request.getAttribute("recipient") %></strong><br />
							<%= request.getAttribute("line1") %><br />
							<%= (request.getAttribute("line2") == null || request.getAttribute("line2") == "") ? "" : request.getAttribute("line2") + "<br />" %> 
							<%= request.getAttribute("city") %>, <%= request.getAttribute("state") %>  <%= request.getAttribute("postal-code") %><br />
	 						<%= request.getAttribute("country-code") %>
						</address>

					</div>
					
  				</div>
  				
  				<div class="col-sm-7">
 	 	 	 	 	<div class="divBorder" style="min-height: 460px;">
 	 	 	 	 		<h3>Payment Flow</h3>
 	 	 	 	 	 	
						<c:choose>
							<c:when test="${param.checkout == 'classic'}">
 	 							<img class="img-responsive" id="flow-step" src="img/classic-flow-4.png">
 							</c:when>
 							<c:otherwise>
								<img class="img-responsive" id="flow-step" src="img/pay-now-flow-4.png">
 							</c:otherwise>
						</c:choose>

					</div>
 	 	 	 	</div>
 	 	 	 	

 	 	 	 	<div class="col-xs-12">
 	 	 	 		<div style="text-align:center;">
 	 	 	 	   		<h3>Return to <a href='index.jsp'>Home Page</a></h3>
 	 	 	 		</div>
 	 	 	 	</div>

 	 	 	 	
  			</div>
		</div>
		
<%@ include file="incl.footer.jsp" %>
