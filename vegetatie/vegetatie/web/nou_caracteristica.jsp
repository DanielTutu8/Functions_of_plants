<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga caracteristica</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String Miros = request.getParameter("Miros");
            String Culoare = request.getParameter("Culoare");
            String Locatie = request.getParameter("Locatie");
            if (Miros != null) {
                jb.connect();
                jb.adaugaCaracteristica(Miros, Culoare, Locatie);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Caracteristica.</h1>
        <form action="nou_caracteristica.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Miros: </td>
                    <td> <input type="text" name="Miros" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Culoare:</td>
                    <td> <input type="text" name="Culoare" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Locatie</td>
                    <td> <input type="text" name="Locatie" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga caracteristica" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>
