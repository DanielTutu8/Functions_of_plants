<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Functii</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Functii:</h1>
        <br/>
        <p align="center"><a href="nou_functie.jsp"><b>Adauga o noua functie.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="sterge_functie.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>idfunctie:</b></td>
                    <td><b>idcaracteristica:</b></td>
                    <td><b>miros:</b></td>
                    <td><b>culoare</b></td>
                    <td><b>locatie</b></td>
                    <td><b>idplanta</b></td>
                    <td><b>denumire:</b></td>
                    <td><b>categorie:</b></td>
                    <td><b>tip:</b></td>
                    <td><b>datadescoperire:</b></td>
                    <td><b>daunatoare:</b></td>
                    <td><b>dimensiune:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeFunctie();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idfunctie");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getInt("idcaracteristica")%></td>
                    <td><%= rs.getString("miros")%></td>
                    <td><%= rs.getString("culoare")%></td>
                    <td><%= rs.getString("locatie")%></td>
                    <td><%= rs.getInt("idplanta")%></td>
                    <td><%= rs.getString("denumire")%></td>
                    <td><%= rs.getString("categorie")%></td>
                    <td><%= rs.getString("tip")%></td>
                    <td><%= rs.getString("datadescoperire")%></td>
                    <td><%= rs.getString("daunatoare")%></td>
                    <td><%= rs.getString("dimensiune")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Sterge liniile marcate">
            </p>
        </form>
        <%
            rs.close();
            jb.disconnect();
        %>
        <br/>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>

