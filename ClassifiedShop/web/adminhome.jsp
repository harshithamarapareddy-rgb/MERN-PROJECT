<%@include file="adminheader.jsp" %>

<%!
PreparedStatement ps1 = null;
ResultSet rs1 = null;
%>

<title>Shop Sphere | Admin Dashboard</title>

<style>
    .ss-admin-page {
        background: #f4f6fa;
        min-height: 80vh;
        padding: 40px 5%;
        font-family: Arial, sans-serif;
    }

    .ss-admin-container {
        max-width: 1450px;
        margin: auto;
    }

    .ss-admin-top {
        margin-bottom: 30px;
    }

    .ss-admin-heading {
        color: #14233f;
        font-size: 32px;
        font-weight: 700;
        margin: 0 0 10px;
    }

    .ss-admin-subtitle {
        color: #7d8798;
        font-size: 15px;
        margin: 0;
    }

    .ss-admin-nav {
        display: flex;
        flex-wrap: wrap;
        gap: 12px;
        margin-bottom: 30px;
    }

    .ss-admin-nav a {
        padding: 13px 25px;
        border-radius: 10px;
        text-decoration: none;
        color: #14233f;
        background: white;
        border: 1px solid #e3e8f0;
        font-size: 14px;
        font-weight: 700;
        transition: 0.3s ease;
    }

    .ss-admin-nav a:hover,
    .ss-admin-nav a.active {
        background: #14233f;
        color: white;
        border-color: #14233f;
        transform: translateY(-2px);
    }

    .ss-admin-card {
        background: white;
        border-radius: 18px;
        padding: 30px;
        box-shadow: 0 8px 30px rgba(20,35,63,0.07);
        border: 1px solid #edf0f5;
    }

    .ss-admin-card-heading {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        gap: 15px;
        margin-bottom: 25px;
    }

    .ss-admin-card-heading h2 {
        color: #14233f;
        font-size: 23px;
        margin: 0;
        font-weight: 700;
    }

    .ss-admin-badge {
        background: #fff0e5;
        color: #ed7929;
        padding: 10px 17px;
        border-radius: 30px;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0.5px;
    }

    .ss-admin-table-wrapper {
        width: 100%;
        overflow-x: auto;
        border-radius: 10px;
    }

    .ss-admin-table {
        width: 100%;
        border-collapse: collapse;
        min-width: 750px;
    }

    .ss-admin-table th {
        background: #14233f;
        color: white;
        padding: 17px 15px;
        text-align: left;
        font-size: 13px;
        font-weight: 700;
    }

    .ss-admin-table td {
        padding: 18px 15px;
        color: #536075;
        font-size: 14px;
        border-bottom: 1px solid #edf0f5;
    }

    .ss-admin-table tbody tr {
        transition: background 0.2s ease;
    }

    .ss-admin-table tbody tr:hover {
        background: #fffaf6;
    }

    .ss-admin-table tbody tr:last-child td {
        border-bottom: none;
    }

    .ss-delete-btn {
        display: inline-block;
        background: #fff0ef;
        color: #dc4545;
        padding: 9px 17px;
        border-radius: 8px;
        text-decoration: none;
        font-size: 12px;
        font-weight: 700;
        transition: 0.3s ease;
    }

    .ss-delete-btn:hover {
        background: #dc4545;
        color: white;
        text-decoration: none;
    }

    .ss-empty-message {
        padding: 40px;
        text-align: center;
        color: #8792a4;
        background: #fafbfe;
        border-radius: 10px;
    }

    @media(max-width: 600px) {
        .ss-admin-page {
            padding: 25px 12px;
        }

        .ss-admin-heading {
            font-size: 25px;
        }

        .ss-admin-card {
            padding: 17px;
        }

        .ss-admin-card-heading h2 {
            font-size: 20px;
        }
    }
</style>

<%
if(request.getParameter("duserid") != null) {
ps1 = conn.prepareStatement("delete from newuser where userid=?");
ps1.setString(1, request.getParameter("duserid"));
ps1.executeUpdate();
ps1.close();
}

ps1 = conn.prepareStatement("select * from newuser where utype='user'");
rs1 = ps1.executeQuery();
%>

<div class="ss-admin-page">
    <div class="ss-admin-container">

```
    <div class="ss-admin-top">
        <h1 class="ss-admin-heading">Admin Dashboard</h1>
        <p class="ss-admin-subtitle">
            Manage and monitor registered Shop Sphere users.
        </p>
    </div>

    <div class="ss-admin-nav">
        <a href="adminhome.jsp" class="active">Users List</a>
        <a href="avsellers.jsp">Sellers List</a>
        <a href="avshops.jsp">Shop List</a>
    </div>

    <div class="ss-admin-card">

        <div class="ss-admin-card-heading">
            <h2>Registered Users</h2>
            <span class="ss-admin-badge">USER MANAGEMENT</span>
        </div>

        <div class="ss-admin-table-wrapper">
            <table class="ss-admin-table">

                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Area</th>
                        <th>City</th>
                        <th>Mobile</th>
                        <th>User ID</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

                <%
                boolean usersFound = false;

                while(rs1.next()) {
                    usersFound = true;
                %>

                    <tr>
                        <td><%=rs1.getString(1)%></td>
                        <td><%=rs1.getString(2)%></td>
                        <td><%=rs1.getString(3)%></td>
                        <td><%=rs1.getString(4)%></td>
                        <td><%=rs1.getString(5)%></td>
                        <td><%=rs1.getString(6)%></td>

                        <td>
                            <a class="ss-delete-btn"
                               href="adminhome.jsp?duserid=<%=rs1.getString(6)%>"
                               onclick="return confirm('Are you sure you want to delete this user?')">
                                Delete
                            </a>
                        </td>
                    </tr>

                <%
                }

                rs1.close();
                ps1.close();

                if(!usersFound) {
                %>

                    <tr>
                        <td colspan="7">
                            <div class="ss-empty-message">
                                No registered users found.
                            </div>
                        </td>
                    </tr>

                <%
                }
                %>

                </tbody>
            </table>
        </div>

    </div>

</div>
```

</div>

<%@include file="footer.jsp" %>
