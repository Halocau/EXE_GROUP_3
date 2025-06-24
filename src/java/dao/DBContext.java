/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.EnvLoader;

/**
 *
 * @author kienb
 */
public class DBContext {

    protected Connection connection;//kết nối giữa ứng dụng Java và cơ sở dữ liệu
    protected PreparedStatement statement;//thực thi các câu lệnh SQL trước khi thực sự thực thi
    protected ResultSet resultSet;// giống như 1 cái bảng , như sql manager

    public DBContext() {
        try {
            String user = EnvLoader.get("DB_USER");
            String pass = EnvLoader.get("DB_PASS");
            String url = EnvLoader.get("DB_URL");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (Exception ex) {
            ex.printStackTrace(); // In log stacktrace
        }
    }
}
