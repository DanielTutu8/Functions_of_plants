<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela functie</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela functie:</h1>
        <br/>
        <p align="center"><a href="nou_functie.jsp"><b>Adauga o noua funtie.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String aux = request.getParameter("idfunctie");
            String idcaracteristica = request.getParameter("idcaracteristica");
            String idplanta = request.getParameter("idplanta");
            String DataDescoperire = request.getParameter("DataDescoperire");
            String Daunatoare = request.getParameter("Daunatoare");
            String Dimensiune = request.getParameter("Dimensiune");

            String[] valori = {idcaracteristica, idplanta, DataDescoperire, Daunatoare, Dimensiune};
            String[] campuri = {"idcaracteristica", "idplanta", "DataDescoperire", "Daunatoare", "Dimensiune"};
            for(int i=0; i<valori.length; i++)
                System.out.println(valori[i]);
            jb.modificaTabela("functii", "idfunctie", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate!</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>
