<%@page import="com.sun.xml.rpc.processor.modeler.j2ee.xml.string"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       </head>
    <body>
        <%
        String f=request.getParameter("pic");
        %>
        <img src="../User/files/<%=f%>">
    </body>
</html>
