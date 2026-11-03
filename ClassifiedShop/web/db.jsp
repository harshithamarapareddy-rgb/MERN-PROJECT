<%@page import="java.sql.*"%>
<%!
Connection conn = null;
%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");

if (conn == null || conn.isClosed()) {

    String dbUrl = System.getenv("SHOPSPHERE_DB_URL");
    String dbUser = System.getenv("SHOPSPHERE_DB_USER");
    String dbPassword = System.getenv("SHOPSPHERE_DB_PASSWORD");

    // Local development fallback
    if (dbUrl == null || dbUrl.trim().isEmpty()) {
        dbUrl = "jdbc:mysql://localhost:3306/jsp_ocs";
    }

    if (dbUser == null || dbPassword == null) {
        throw new Exception("Database environment variables are not configured.");
    }

    conn = DriverManager.getConnection(
        dbUrl,
        dbUser,
        dbPassword
    );
}
%>