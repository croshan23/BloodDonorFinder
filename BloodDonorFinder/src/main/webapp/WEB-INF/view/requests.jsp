<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="container">
	<div class="jumbotron">
		<h2>The List of Requests</h2>
		<div class="table-responsive">
			<table class="table table-condensed table-bordered table-hover">
				<thead class="">
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Request Date</th>
						<th>Username</th>
						<th>Confirmation Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${donations}" var="donation">
						<tr>
							<td><c:out value="${donation.receiver.firstName}" /></td>
							<td><c:out value="${donation.receiver.lastName}" /></td>
							<td><c:out value="${donation.date}" /></td>
							<td><c:out value="${donation.receiver.username}" /></td>
							<td><c:choose>
									<c:when test="${donation.confirmed}">CONFIRMED</c:when>
									<c:otherwise>PENDING</c:otherwise>
								</c:choose></td>
							<td><a class="btn btn-danger btn-xs"
								href="<c:url value='/requests/cancel/${donation.id}' />">Cancel</a>
								<a class="btn btn-primary btn-xs"
								href="<c:url value='/requests/confirm/${donation.id}' />">Confirm</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
