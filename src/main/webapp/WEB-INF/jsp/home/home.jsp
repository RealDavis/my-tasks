<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:import url="../commons/head.jsp" />
	
	<c:import url="../commons/navbar.jsp" />
    
    <div class="container">
	    <div class="row">
	    	<div class="col s12">
		    	<c:if test="${not empty successMessage}">
					<c:import url="../commons/msgSuccessAlert.jsp" />
				</c:if>
				
	    		<main>
		    		<ul class="tabs" id="task-tabs">
					    <li class="tab col s6">
					    	<a class="active" href="#notFinishedTasks">Tarefas em aberto</a>
					    </li>
					    <li class="tab col s6">
					    	<a href="#finishedTasks">Tarefas finalizadas</a>
					    </li>
				    </ul>
	    		</main>
	    	</div>
	    </div>
	    
		<div id="notFinishedTasks">
			<c:choose>
				<c:when test="${not empty alertMessage}">
					<c:import url="../commons/msgAlertAlert.jsp" />
				</c:when>
				<c:otherwise>
					<table class="striped">
					    <thead>
					    	<tr>
					    		<th>Tarefa</th>
						    	<th>Data</th>
						    	<th>Hora</th>
						    	<th>Observações</th>
						    	<th>Opções</th>
					    	</tr>
					    </thead>
					    <tbody>
					    	<c:forEach items="${notFinishedTasks}" var="task">
					    		<tr>
					    			<td>${task.name}</td>
					    			<td>
					    				<javatime:format value="${task.date}" pattern="dd/MM/yyyy" />
					    			</td>
					    			<td>${task.hour}</td>
					    			<td>${task.details}</td>
					    			<td>
					    				<a class="btn-floating green tooltipped" data-position="bottom" data-tooltip="Finalizar"
					    					href="${linkTo[TaskController].finish(task.id)}">
					    						<i class="material-icons">check</i>
					    				</a>
					    				<a class="btn-floating orange tooltipped" data-position="bottom" data-tooltip="Editar"
					    					href="${linkTo[TaskController].edit(task.id)}">
					    						<i class="material-icons">edit</i>
					    				</a>
					    				<a class="btn-floating red tooltipped" data-position="bottom" data-tooltip="Excluir"
					    					href="${linkTo[TaskController].remove(task.id)}">
					    						<i class="material-icons">clear</i>
					    				</a>
					    			</td>
					    		</tr>
					    	</c:forEach>
					    </tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div id="finishedTasks">
			<c:choose>
				<c:when test="${not empty alertMessage}">
					<c:import url="../commons/msgAlertAlert.jsp" />
				</c:when>
				<c:otherwise>
					<table class="striped">
					    <thead>
					    	<tr>
					    		<th>Tarefa</th>
						    	<th>Data</th>
						    	<th>Hora</th>
						    	<th>Observações</th>
						    	<th>Opções</th>
					    	</tr>
					    </thead>
					    <tbody>
					    	<c:forEach items="${finishedTasks}" var="task">
					    		<tr>
					    			<td>${task.name}</td>
					    			<td>
					    				<javatime:format value="${task.date}" pattern="dd/MM/yyyy" />
					    			</td>
					    			<td>${task.hour}</td>
					    			<td>${task.details}</td>
					    			<td>
					    				<a class="btn-floating orange tooltipped"  data-position="bottom" data-tooltip="Editar"
					    					href="${linkTo[TaskController].edit(task.id)}">
					    						<i class="material-icons">edit</i>
					    				</a>
					    				<a class="btn-floating red tooltipped"  data-position="bottom" data-tooltip="Excluir"
					    					href="${linkTo[TaskController].remove(task.id)}">
					    						<i class="material-icons">clear</i>
					    				</a>
					    			</td>
					    		</tr>
					    	</c:forEach>
					    </tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	
    
    <c:import url="../commons/endBody.jsp" />