package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class MySQL {

    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/texttile_db", "root", "Asd#1214");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ResultSet execute(String query) throws Exception {

        if (query.startsWith("SELECT")) {
            return connection.createStatement().executeQuery(query);
        } else {
            connection.createStatement().executeUpdate(query);
            return null;
        }

    }
}
