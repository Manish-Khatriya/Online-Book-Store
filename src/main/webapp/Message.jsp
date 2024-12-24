<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    String message = request.getParameter("message");
    if (message != null && !message.isEmpty()) {
%>
    <div style="color: red; text-align: center; margin-top: 20px;">
        <strong><%= message %></strong>
    </div>
<%
    }
%>
