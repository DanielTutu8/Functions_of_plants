<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga functie</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            
            String idcaracteristica, idplanta;
            String id1, id2, Miros, Culoare, Locatie, Denumire, Categorie, Tip, Daunatoare, Dimensiune, DataDescoperire;
            id1 = request.getParameter("idcaracteristica");
            id2 = request.getParameter("idplanta");
            DataDescoperire = request.getParameter("DataDescoperire");
            Daunatoare = request.getParameter("Daunatoare");
            Dimensiune = request.getParameter("Dimensiune");
            if (id1 != null) {
                System.out.println(id1+id2+DataDescoperire+Daunatoare+Dimensiune);
                jb.connect();
                jb.adaugaFunctie(id1,id2, DataDescoperire, Daunatoare, Dimensiune);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("caracteristici");
        ResultSet rs2 = jb.vedeTabela("plante");
        %>
        <h1> Suntem in tabela Functie.</h1>
        <form action="nou_functie.jsp" method="post">
            <table>
                <tr>
                    <td align="right">IdCaracteristica:</td>
                    <td> 
                        Selectati Caracteristica:
			<SELECT NAME="idcaracteristica">
                                <%
                                    while(rs1.next()){
                                        idcaracteristica = rs1.getString("idcaracteristica");
                                        Miros = rs1.getString("Miros");
                                        Culoare = rs1.getString("Culoare");
                                        Locatie = rs1.getString("Locatie");
                                %>
                                    <OPTION VALUE="<%= idcaracteristica%>"><%= idcaracteristica%>,<%= Miros%>,<%= Culoare%>,<%= Locatie%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td align="right">IdPlanta:</td>
                    <td> 
                        Selectati planta:
			<SELECT NAME="idplanta">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        idplanta = rs2.getString("idplanta");
                                        Denumire = rs2.getString("Denumire");
                                        Categorie = rs2.getString("Categorie");
                                        Tip = rs2.getString("Tip");
                                %>
                                    <OPTION VALUE="<%= idplanta%>"><%= idplanta%>,<%= Denumire%>,<%= Categorie%>,<%= Tip%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr>
                    <td align="right">Data descoperire:</td>
                    <td> <input type="text" name="DataDescoperire" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Daunatoare</td>
                    <td> <input type="text" name="Daunatoare" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Dimensiune:</td>
                    <td> <input type="text" name="Dimensiune" size="30" /></td>
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
