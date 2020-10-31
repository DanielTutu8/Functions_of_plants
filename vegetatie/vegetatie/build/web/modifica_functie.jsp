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
        <h1 align="center"> Tabela Functii</h1>
        <br/>
        <p align="center"><a href="nou_functie.jsp"><b>Adauga o noua functie.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="m1_functie.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdFunctie:</b></td>
                    <td><b>IdCaracteristica:</b></td>
                    <td><b>Miros:</b></td>
                    <td><b>CuloareCaracteristica:</b></td>
                    <td><b>LocatieCaracteristica:</b></td>
                    <td><b>idplanta:</b></td>
                    <td><b>DenumirePlanta:</b></td>
                    <td><b>CategoriePlanta:</b></td>
                    <td><b>TipPlanta:</b></td>
                    <td><b>DataDescoperire</b></td>
                    <td><b>Daunatoare:</b></td>
                    <td><b>Dimensiune:</b></td>
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
                    <td><%= rs.getString("Miros")%></td>
                    <td><%= rs.getString("Culoare")%></td>
                    <td><%= rs.getString("Locatie")%></td>
                    <td><%= rs.getInt("idplanta")%></td>
                    <td><%= rs.getString("Denumire")%></td>
                    <td><%= rs.getString("Categorie")%></td>
                    <td><%= rs.getString("Tip")%></td>
                    <td><%= rs.getString("DataDescoperire")%></td>
                    <td><%= rs.getString("Daunatoare")%></td>
                    <td><%= rs.getString("Dimensiune")%></td>
                    <%
                        System.out.println(rs.getInt("idcaracteristica")+rs.getString("Denumire")+rs.getString("Miros")
                        +rs.getString("Culoare")+rs.getString("Locatie")+rs.getInt("idplanta")+
                                rs.getString("Categorie")+rs.getString("Tip")+rs.getString("DataDescoperire")
                        +rs.getString("Daunatoare")+rs.getString("Dimensiune"));
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <%
    jb.disconnect();%>
        <br/>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>

