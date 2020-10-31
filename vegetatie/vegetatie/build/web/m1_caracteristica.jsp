<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Caracteristici</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Caracteristici:</h1>
        <br/>
        <p align="center"><a href="nou_caracteristica.jsp"><b>Adauga o noua caracteristica.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String aux = request.getParameter("primarykey");
            ResultSet rs = jb.intoarceLinieDupaId("caracteristici", "idcaracteristica", aux);
            rs.first();
            String Miros = rs.getString("Miros");
            String Culoare = rs.getString("Culoare");
            String Locatie = rs.getString("Locatie");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_caracteristica.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdCaracteristica:</td>
                    <td> <input type="text" name="idcaracteristica" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Miros:</td>
                    <td> <input type="text" name="Miros" size="30" value="<%= Miros%>"/></td>
                </tr>
                <tr>
                    <td align="right">Culoare:</td>
                    <td> <input type="text" name="Culoare" size="30" value="<%= Culoare%>"/></td>
                </tr>
                <tr>
                    <td align="right">Locatie:</td>
                    <td> <input type="text" name="Locatie" size="30" value="<%= Locatie%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>
