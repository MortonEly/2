package Servlet1;

import java.sql.*;

public class JDBC {
    public static void main(String[] args) throws SQLException {
        Connection conn = null;
        PreparedStatement preStmt = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/webtest?serverTimezone=GMT%2b8";
                String username = "root";
                String password = "061872";
                conn = DriverManager.getConnection(url, username, password);
//执行SQL语句
                stmt = conn.createStatement();
                String sql = "select * from user";
                rs = stmt.executeQuery(sql);
                System.out.println("id+name+password+email+birthday");
                while (rs.next()){
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String psw = rs.getString("password");
                    String email = rs.getString("email");
//                    Date birthday = rs.getDate("birthday");
                    String birthday = rs.getString("birthday");
                    System.out.println(id+"|"+name+"|"+psw+"|"+email+"|"+birthday);
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

        } finally {
            if (preStmt != null) {
                try {
                    preStmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                preStmt = null;
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                conn = null;
            }
        }
    }
}
