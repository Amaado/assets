import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// Press Shift twice to open the Search Everywhere dialog and type `show whitespaces`,
// then press Enter. You can now see whitespace characters in your code.
public class Main {
    public static void muestraErrorSQL(SQLException e) {
        // SQL Error mensaje
        System.out.println("SQL ERROR mensaje: "+e.getMessage());
        // SQL Estado
        System.out.println("SQL estado : "+e.getSQLState());
        // SQL ErrorCode
        System.out.println("SQL código especifico: "+e.getErrorCode());
    }
    public static void main(String[] args) {
        String basedatos = "proyecto_orm";
        String host = "127.0.0.1";
        String port = "3306";
        String parAdic = "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String urlConnection = "jdbc:mysql://" + host + ":" + port + "/" + basedatos + parAdic;
        String user = "andres";
        String pwd = "abc123.";

        try (Connection c= DriverManager.getConnection(urlConnection, user, pwd)){
            System.out.println("Conexión realizada");
        }catch (SQLException e)
        {
            muestraErrorSQL (e);
        }catch (Exception e)
        {
            e.printStackTrace(System.err);
        }

    }
}