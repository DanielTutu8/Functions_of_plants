<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Functie</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Functie:</h1>
        <br/>
        <p align="center"><a href="nou_functie.jsp"><b>Adauga o noua functie.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String Miros, Culoare, Locatie, Denumire, Categorie, Tip, Daunatoare, Dimensiune, DataDescoperire;

            String aux = request.getParameter("primarykey");
            ResultSet rs = jb.intoarceFunctieId(aux);
            rs.first();
            int id1 = rs.getInt("idcaracteristica");
            int id2 = rs.getInt("idplanta");
             System.out.println("Hai acasa acum!");
            Miros = rs.getString("Miros");
            Culoare = rs.getString("Culoare");
            Locatie = rs.getString("Locatie");
            Denumire = rs.getString("Denumire");
            Categorie = rs.getString("Categorie");
            Tip = rs.getString("Tip");
            DataDescoperire = rs.getString("DataDescoperire");
            Daunatoare = rs.getString("Daunatoare");
            Dimensiune = rs.getString("Dimensiune");

            ResultSet rs1 = jb.vedeTabela("caracteristici");
            ResultSet rs2 = jb.vedeTabela("plante");
            int idcaracteristica, idplanta;


        %>
        <form action="m2_functie.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">idfunctie</td>
                    <td> <input type="text" name="idfunctie" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">idcaracteristica:</td>
                    <td> 
                        <SELECT NAME="idcaracteristica">
                            <%
                                while (rs1.next()) {
                                    idcaracteristica = rs1.getInt("idcaracteristica");
                                    Miros = rs1.getString("Miros");
                                    Culoare = rs1.getString("Culoare");
                                    Locatie = rs1.getString("Locatie");
                                    if (idcaracteristica != id1) {
                            %>
                            <OPTION VALUE="<%= idcaracteristica%>"><%= idcaracteristica%>, <%= Miros%>, <%= Culoare%>, <%= Locatie%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idcaracteristica%>"><%= idcaracteristica%>, <%= Miros%>, <%= Culoare%>, <%= Locatie%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">idplanta:</td>
                    <td> 
                        <SELECT NAME="idplanta">
                            <%
                                while (rs2.next()) {
                                    idplanta = rs2.getInt("idplanta");
                                    Denumire = rs2.getString("Denumire");
                                    Categorie = rs2.getString("Categorie");
                                    Tip = rs2.getString("Tip");
                            if (idplanta != id2) {
                            %>
                            <OPTION VALUE="<%= idplanta%>"><%= idplanta%>, <%= Denumire%>, <%= Categorie%>, <%= Tip%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idplanta%>"><%= idplanta%>, <%= Denumire%>, <%= Categorie%>, <%= Tip%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">DataDescoperire</td>
                    <td> <input type="text" name="DataDescoperire" size="30" value="<%= DataDescoperire%>"/></td>
                </tr>
                <tr>
                    <td align="right">Daunatoare:</td>
                    <td> <input type="text" name="Daunatoare" size="30" value="<%= Daunatoare%>"/></td>
                </tr>
                <tr>
                    <td align="right">Dimensiune</td>
                    <td> <input type="text" name="Dimensiune" size="30" value="<%= Dimensiune%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>
