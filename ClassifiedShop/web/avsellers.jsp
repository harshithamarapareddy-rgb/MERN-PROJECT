<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="adminheader.jsp" %>

<%!
PreparedStatement ps1 = null;
ResultSet rs1 = null;
%>

<style>
    .ss-seller-page {
        padding: 25px 10px 45px;
        font-family: Arial, sans-serif;
    }

    .ss-seller-heading {
        text-align: center;
        margin-bottom: 30px;
    }

    .ss-seller-heading h1 {
        color: #14233f;
        font-size: 32px;
        font-weight: 800;
        margin-bottom: 8px;
    }

    .ss-seller-heading p {
        color: #7b8494;
        font-size: 14px;
    }

    .ss-seller-nav {
        display: flex;
        justify-content: center;
        gap: 12px;
        flex-wrap: wrap;
        margin-bottom: 30px;
    }

    .ss-seller-nav a {
        padding: 12px 22px;
        border: 1px solid #14233f;
        border-radius: 8px;
        color: #14233f;
        text-decoration: none;
        font-size: 14px;
        font-weight: 600;
        transition: 0.3s;
    }

    .ss-seller-nav a:hover,
    .ss-seller-nav .active {
        background: #14233f;
        color: white;
    }

    .ss-seller-card {
        background: white;
        padding: 25px;
        border-radius: 14px;
        box-shadow: 0 5px 25px rgba(20,35,63,0.08);
        border: 1px solid #edf0f5;
    }

    .ss-seller-card-title {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 22px;
        flex-wrap: wrap;
        gap: 10px;
    }

    .ss-seller-card-title h3 {
        color: #14233f;
        font-size: 20px;
        font-weight: 700;
        margin: 0;
    }

    .ss-seller-badge {
        background: #fff1e5;
        color: #e87924;
        padding: 8px 15px;
        border-radius: 20px;
        font-size: 13px;
        font-weight: 700;
    }

    .ss-seller-table-wrapper {
        width: 100%;
        overflow-x: auto;
    }

    .ss-seller-table {
        width: 100%;
        min-width: 850px;
        border-collapse: collapse;
        font-size: 14px;
    }

    .ss-seller-table thead {
        background: #14233f;
        color: white;
    }

    .ss-seller-table th {
        padding: 16px 12px;
        text-align: left;
        white-space: nowrap;
        font-weight: 600;
    }

    .ss-seller-table td {
        padding: 15px 12px;
        color: #4b5565;
        border-bottom: 1px solid #edf0f5;
    }

    .ss-seller-table tbody tr:hover {
        background: #f5f8fc;
    }

    .ss-delete-btn {
        display: inline-block;
        padding: 8px 15px;
        color: white;
        background: #dc4545;
        border-radius: 6px;
        text-decoration: none;
        font-size: 12px;
        font-weight: 700;
        transition: 0.3s;
    }

    .ss-delete-btn:hover {
        background: #b92e2e;
        color: white;
        text-decoration: none;
    }

    .ss-empty-message {
        text-align: center;
        padding: 35px !important;
        color: #8992a1 !important;
        font-size: 15px;
    }

    @media(max-width: 768px) {
        .ss-seller-heading h1 {
            font-size: 25px;
        }

        .ss-seller-card {
            padding: 15px;
        }
    }
</style>

<%
if(request.getParameter("duserid") != null) {


    ps1 = conn.prepareStatement(
        "delete from newuser where userid=?"
    );

    ps1.setString(1, request.getParameter("duserid"));
    ps1.executeUpdate();
    ps1.close();
}

ps1 = conn.prepareStatement(
    "select * from newuser where utype='seller'"
);

rs1 = ps1.executeQuery();

boolean hasSellers = false;


%>

<div class="ss-seller-page">

```
<div class="ss-seller-heading">
    <h1>Sellers Management</h1>
    <p>View and manage all registered sellers in SHOP SPHERE.</p>
</div>

<div class="ss-seller-nav">
    <a href="adminhome.jsp">Users List</a>
    <a href="avsellers.jsp" class="active">Sellers List</a>
    <a href="avshops.jsp">Shop List</a>
</div>

<div class="ss-seller-card">

    <div class="ss-seller-card-title">
        <h3>Registered Sellers</h3>
        <span class="ss-seller-badge">Seller Directory</span>
    </div>

    <div class="ss-seller-table-wrapper">

        <table class="ss-seller-table">

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
                while(rs1.next()) {

                    hasSellers = true;
            %>

                <tr>
                    <td><%=rs1.getString(1)%></td>
                    <td><%=rs1.getString(2)%></td>
                    <td><%=rs1.getString(3)%></td>
                    <td><%=rs1.getString(4)%></td>
                    <td><%=rs1.getString(5)%></td>
                    <td><%=rs1.getString(6)%></td>

                    <td>
                        <a
                            href="avsellers.jsp?duserid=<%=java.net.URLEncoder.encode(rs1.getString(6), "UTF-8")%>"
                            class="ss-delete-btn"
                            onclick="return confirm('Are you sure you want to delete this seller?');">
                            Delete
                        </a>
                    </td>
                </tr>

            <%
                }

                if(!hasSellers) {
            %>

                <tr>
                    <td colspan="7" class="ss-empty-message">
                        No registered sellers found.
                    </td>
                </tr>

            <%
                }

                rs1.close();
                ps1.close();
            %>

            </tbody>

        </table>

    </div>

</div>
```

</div>

<%@include file="footer.jsp" %>
