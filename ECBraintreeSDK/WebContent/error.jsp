<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>


<%@ include file="incl.header.jsp" %>

		<div class="container-fluid">

            <div class="row">

  				<div class="col-xs-12">
                	<div style="text-align:center;">
	                
	                	<br/>
						<br/>
			   
	
	    <% String error = (String)request.getAttribute("error"); %>
	    
	    <% if (! (error == null || error.isEmpty()) ) { %> 
						<div style="max-width: 600px; margin: 0 auto; text-align: left;" class="alert alert-danger">
							<h3>An error occurred</h3>
							<%= error %>
						</div>
			
	    <% } %>	
	
		
		
	    <% String message = request.getParameter("message"); %>
	    
	    <% if (! (message == null || message.isEmpty()) ) { %> 
	    
						<div style="max-width: 600px; margin: 0 auto; text-align: left;" class="alert alert-danger">
							<h3>An error occurred</h3>
							<%= message %>
						</div>
	    <% } %>	
		
		                <br/>
						<br/>

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
