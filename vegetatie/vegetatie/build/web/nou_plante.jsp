<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Planta</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String Denumire = request.getParameter("Denumire");
            String Categorie = request.getParameter("Categorie");
            String Tip = request.getParameter("Tip");
            if (Denumire != null) {
                jb.connect();
                jb.adaugaPlanta(Denumire, Categorie, Tip);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Planta.</h1>
        <form action="nou_plante.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Denumire planta:</td>
                    <td> <input type="text" name="Denumire" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">categorie planta:</td>
                    <td> <input type="text" name="Categorie" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">tip:</td>
                    <td> <input type="text" name="Tip" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga planta" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>
