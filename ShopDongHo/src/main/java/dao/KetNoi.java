package dao;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.stream.Collectors;

public class KetNoi {
  public Connection cn;

  public void KetNoi() {
    try {
      Class.forName("org.h2.Driver");
      String url = "jdbc:h2:mem:ShopDongHo;DB_CLOSE_DELAY=-1"; // H2 in-memory database
      String user = "sa";
      String pass = "";
      cn = DriverManager.getConnection(url, user, pass);
      System.out.println("Đã kết nối H2");

      // Execute schema.sql
      InputStream is = getClass().getClassLoader().getResourceAsStream("schema.sql");
      if (is == null) {
        System.err.println("schema.sql not found in classpath.");
      } else {
        String sqlScript = new BufferedReader(new InputStreamReader(is))
            .lines().collect(Collectors.joining("\n"));
        Statement stmt = cn.createStatement();
        stmt.execute(sqlScript);
        System.out.println("schema.sql executed successfully.");
      }

    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
