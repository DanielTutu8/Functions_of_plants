
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
        <h1 align="center"> Tabela Caracteristici:</h1>
        <br/>
        <p align="center"><a href="nou_caracteristica.jsp"><b>Adauga o noua caracteristica.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            System.out.println("nu am ");
            jb.connect();
            String aux = request.getParameter("idcaracteristica");
            String Miros = request.getParameter("Miros");
            String Culoare = request.getParameter("Culoare");
            String Locatie = request.getParameter("Locatie");

            String[] valori = {Miros, Culoare, Locatie};
            String[] campuri = {"Miros", "Culoare", "Locatie"};
            System.out.println(Miros+" "+Culoare+" "+Locatie+"nu am ");
            jb.modificaTabela("caracteristici", "idcaracteristica", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>
