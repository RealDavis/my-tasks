<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <table border="1">
	    <thead>
	    	<tr>
	    		<th>Tarefa</th>
		    	<th>Data</th>
		    	<th>Hora</th>
		    	<th>Observações</th>
		    	<th>Status</th>
		    	<th>Opções</th>
	    	</tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${pastTasks}" var="task">
	    		<tr>
	    			<td>${task.name}</td>
	    			<td>
	    				<javatime:format value="${task.date}" pattern="dd/MM/yyyy" />
	    			</td>
	    			<td>${task.hour}</td>
	    			<td>${task.details}</td>
	    			<td>
	    				<c:choose>
				    		<c:when test="${task.finished}">
				    			<c:out value="Concluido"/>
				    		</c:when>
				    		<c:otherwise>
				    			<c:out value="Em aberto"/>
				    		</c:otherwise>
				    	</c:choose>
	    			</td>
	    			<td>
	    				<c:if test="${not task.finished}">
	    					<a href="${linkTo[TaskController].finish(task.id)}">Finalizar</a>
	    				</c:if>
	    				<a href="${linkTo[TaskController].edit(task.id)}">Editar</a>
	    				<a href="${linkTo[TaskController].remove(task.id)}">Excluir</a>
	    			</td>
	    		</tr>
	    	</c:forEach>
	    </tbody>
	</table>
