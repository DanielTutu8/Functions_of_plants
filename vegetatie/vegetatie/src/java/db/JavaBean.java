package db;

import java.sql.*;

/**
 *
 * @author vali
 */
public class JavaBean {

    String error;
    Connection con;

    public JavaBean() {
    }

    public void connect() throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vegetatie?useSSL=false", "root", "anaare0mere");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    } 

    public void connect(String bd) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "root", "parola");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    } // connect(String bd)

    public void connect(String bd, String ip) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "root", "parola");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    } // connect(String bd, String ip)

    public void disconnect() throws SQLException {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException sqle) {
            error = ("SQLException: Nu se poate inchide conexiunea la baza de date.");
            throw new SQLException(error);
        }
    } // disconnect()

    public void adaugaCaracteristica(String Miros, String Culoare, String Locatie)
            throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("insert into caracteristici(Miros, Culoare, Locatie) values('" + Miros + "'  , '" + Culoare + "', '" + Locatie + "');");

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } 
    
    public void adaugaPlanta(String Denumire, String Categorie, String Tip)
            throws SQLException, Exception {
        if (con != null) {
            try {

                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("insert into plante(Denumire, Categorie, Tip) "
                        + "values('" + Denumire + "'  , '" + Categorie + "', '" + Tip + "');");

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } 
    
        public void adaugaFunctie(String idcaracteristica, String idplanta, String DataDescoperire, String Daunatoare, String Dimensiune)
            throws SQLException, Exception {
       
        if (con != null) {
            try {
// create a prepared SQL statement
                System.out.println("Hai acasaa!");
                Statement stmt;
                stmt = con.createStatement();
                
                stmt.executeUpdate("insert into functii(idcaracteristica, idplanta, DataDescoperire, Daunatoare, Dimensiune) values('" + Integer.parseInt(idcaracteristica) + "'  , '" + Integer.parseInt(idplanta) + "', '" + DataDescoperire + "', '" + Daunatoare + "', '" + Dimensiune + "');");
                // se poate modifica valoarea datei astfel incat sa se ia data curenta a sistemului:
                // stmt.executeUpdate("insert into functii(idcaracteristica, idplanta, DataDescoperire, daunatoare, dimensiune) values('" + idcaracteristica + "'  , '" + idplanta + "', CURDATE(), '" + daunatoare + "', '" + dimensiune + "');");

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of adaugaFunctie()

    public ResultSet vedeTabela(String tabel) throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = ("select * from `vegetatie`.`" + tabel + "`;");
            Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // vedeTabela()
    
    public ResultSet vedeFunctie() throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = ("select a.Miros Miros, a.Culoare Culoare, a.Locatie,"
                    + " b.Denumire Denumire, b.Categorie Categorie, b.Tip, "
                    + "c.idfunctie, c.idplanta , c.idcaracteristica , c.DataDescoperire, c.Daunatoare, c.Dimensiune"
                    + " from caracteristici a, plante b, functii c "
                    + "where a.idcaracteristica = c.idcaracteristica and b.idplanta = c.idplanta;");
            Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // vedeFunctie()

    public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception {
        System.out.println("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
        for(int i=0;i<primaryKeys.length;i++)
            System.out.println(primaryKeys[i]);
        if (con != null) {
            try {
// create a prepared SQL statement
                long aux;
                PreparedStatement delete;
                delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
                
                for(int i = 0; i < primaryKeys.length; i++) {
                    aux = java.lang.Long.parseLong(primaryKeys[i]);
                    delete.setLong(1, aux);
                    delete.execute();
                }
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            } catch(NumberFormatException e) {
                error = "A aparut o exceptie in timp ce erau sterse inregistrarile.";
                throw new Exception(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of stergeDateTabela()

    public void stergeTabela(String tabela) throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("delete from " + tabela + ";");
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Stergere nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of stergeTabela()

    public void modificaTabela(String tabela, String IDTabela, String ID, String[] campuri, String[] valori) throws SQLException, Exception {
        String update = "update " + tabela + " set ";
        String temp = "";
        if (con != null) {
            try {
                for (int i = 0; i < campuri.length; i++) {
                    if (i != (campuri.length - 1)) {
                        temp = temp + campuri[i] + "='" + valori[i] + "', ";
                    } else {
                        temp = temp + campuri[i] + "='" + valori[i] + "' where " + IDTabela + " = '" + ID + "';";
                    }
                }
                update = update + temp;
// create a prepared SQL statement
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate(update);
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of modificaTabela()

    public ResultSet intoarceLinie(String tabela, int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Execute query
            String queryString = ("SELECT * FROM " + tabela + " where idcaracteristica=" + ID + ";");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinie()

    public ResultSet intoarceLinieDupaId(String tabela, String denumireId, String ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Execute query
            String queryString = ("SELECT * FROM " + tabela + " where " + denumireId + "=" + Integer.parseInt(ID) + ";");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinieDupaId()
    
    public ResultSet intoarceFunctieId(String ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Execute query
            String queryString = ("SELECT a.Miros Miros, a.Culoare Culoare, a.Locatie, "
                    + "b.Denumire Denumire, b.Categorie Categorie, b.Tip,"
                    + "c.idfunctie, c.idplanta, c.idcaracteristica, DataDescoperire, Daunatoare,"
                    + " Dimensiune FROM caracteristici a, plante b, functii c WHERE a.idcaracteristica = c.idcaracteristica "
                    + "AND b.idplanta = c.idplanta and idfunctie = '" + Integer.parseInt(ID) + "';");
            
     
            
            
            
            
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinieDupaId()
}
