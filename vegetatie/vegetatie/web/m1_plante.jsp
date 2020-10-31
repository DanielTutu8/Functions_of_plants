<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Plante</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Plante:</h1>
        <br/>
        <p align="center"><a href="nou_plante.jsp"><b>Adauga o noua planta.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String aux = request.getParameter("primarykey");
            ResultSet rs = jb.intoarceLinieDupaId("plante", "idplanta", aux);
            rs.first();
            String Denumire = rs.getString("Denumire");
            String Categorie = rs.getString("Categorie");
            String Tip = rs.getString("Tip");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_plante.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdPlanta:</td>
                    <td> <input type="text" name="idplanta" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Denumire:</td>
                    <td> <input type="text" name="Denumire" size="30" value="<%= Denumire%>"/></td>
                </tr>
                <tr>
                    <td align="right">Categorie:</td>
                    <td> <input type="text" name="Categorie" size="30" value="<%= Categorie%>"/></td>
                </tr>
                <tr>
                    <td align="right">Tip:</td>
                    <td> <input type="text" name="Tip" size="30" value="<%= Tip%>"/></td>
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
