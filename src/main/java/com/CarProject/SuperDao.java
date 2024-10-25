package com.CarProject;

import java.sql.Connection;
import java.sql.DriverManager;

public class SuperDao {
    protected Connection conn = null; // 접속 객체

    public Connection getConnection() {
        // 접속 객체를 구해주는 범용 메소드
        try {
            String url = "jdbc:mysql://localhost:3306/carproject"; // 데이터베이스 이름 수정
            String id = "root"; // 사용자 ID 수정
            String password = "root"; // 비밀번호 수정

            this.conn = DriverManager.getConnection(url, id, password);
            if (conn == null) {
                System.out.println("접속 실패");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public SuperDao() { // MySQL 드라이버를 메모리에 로딩
        String driver = "com.mysql.cj.jdbc.Driver"; // MySQL 드라이버 클래스 이름
        try {
            Class.forName(driver);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
