<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:import url="../commons/head.jsp" />
    
    <div class="row">
    	<div class="col s12 m5 g5">
	    	<main>
	    		<div class="card-panel">
       				<c:if test="${not empty errorMessage}">
						<c:import url="../commons/msgErrorAlert.jsp" />
					</c:if>
				    
				    <c:import url="form.jsp" />
				    
				    <div class="center-align">
						Ainda não tem uma conta? 
						<a href="${linkTo[UserController].register}">
							<span class="strong">Criar conta</span>
						</a>
					</div>
     			</div>
	    	</main>
    	</div>
    </div>
    
    <c:import url="../commons/endBody.jsp" />