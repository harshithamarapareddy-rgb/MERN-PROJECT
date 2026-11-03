<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="adminheader.jsp" %>

<%!
PreparedStatement ps1 = null;
ResultSet rs1 = null;
%>

<style>
    .ss-shop-page {
        padding: 30px 15px 50px;
        font-family: Arial, sans-serif;
        background: #f7f9fc;
    }

    .ss-shop-heading {
        text-align: center;
        margin-bottom: 30px;
    }

    .ss-shop-heading h1 {
        color: #14233f;
        font-size: 32px;
        font-weight: 800;
        margin-bottom: 10px;
    }

    .ss-shop-heading p {
        color: #7b8494;
        font-size: 14px;
    }

    .ss-shop-nav {
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 15px;
        flex-wrap: wrap;
        margin: 0 auto 30px;
    }

    .ss-shop-nav a {
        display: inline-flex;
        justify-content: center;
        align-items: center;
        min-width: 150px;
        padding: 12px 22px;
        border: 1px solid #14233f;
        border-radius: 8px;
        color: #14233f;
        text-decoration: none;
        font-size: 14px;
        font-weight: 700;
        transition: 0.3s;
    }

    .ss-shop-nav a:hover,
    .ss-shop-nav .active {
        background: #14233f;
        color: white;
    }

    .ss-shop-card {
        max-width: 1200px;
        margin: auto;
        background: white;
        padding: 25px;
        border-radius: 14px;
        box-shadow: 0 5px 25px rgba(20,35,63,0.08);
        border: 1px solid #edf0f5;
    }

    .ss-shop-card-title {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 22px;
        flex-wrap: wrap;
        gap: 10px;
    }

    .ss-shop-card-title h3 {
        color: #14233f;
        font-size: 21px;
        font-weight: 700;
        margin: 0;
    }

    .ss-shop-badge {
        background: #fff1e5;
        color: #e87924;
        padding: 9px 16px;
        border-radius: 20px;
        font-size: 13px;
        font-weight: 700;
    }

    .ss-shop-table-wrapper {
        width: 100%;
        overflow-x: auto;
    }

    .ss-shop-table {
        width: 100%;
        min-width: 850px;
        border-collapse: collapse;
        font-size: 14px;
    }

    .ss-shop-table thead {
        background: #14233f;
        color: white;
    }

    .ss-shop-table th {
        padding: 16px 12px;
        text-align: left;
        white-space: nowrap;
        font-weight: 600;
    }

    .ss-shop-table td {
        padding: 15px 12px;
        color: #4b5565;
        border-bottom: 1px solid #edf0f5;
    }

    .ss-shop-table tbody tr:hover {
        background: #f5f8fc;
    }

    .ss-shop-delete {
        display: inline-block;
        padding: 8px 16px;
        color: white;
        background: #dc4545;
        border-radius: 6px;
        text-decoration: none;
        font-size: 12px;
        font-weight: 700;
        transition: 0.3s;
        white-space: nowrap;
    }

    .ss-shop-delete:hover {
        background: #b92e2e;
        color: white;
        text-decoration: none;
    }

    .ss-shop-empty {
        text-align: center;
        padding: 35px !important;
        color: #8992a1 !important;
        font-size: 15px;
    }

    @media(max-width: 768px) {
        .ss-shop-heading h1 {
            font-size: 25px;
        }

        .ss-shop-card {
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
    "select * from newuser where utype='shop'"
);

rs1 = ps1.executeQuery();

boolean hasShops = false;


%>

<div class="ss-shop-page">

```
<div class="ss-shop-heading">
    <h1>Shops Management</h1>
    <p>View and manage all registered shops in SHOP SPHERE.</p>
</div>

<div class="ss-shop-nav">
    <a href="adminhome.jsp">Users List</a>
    <a href="avsellers.jsp">Sellers List</a>
    <a href="avshops.jsp" class="active">Shop List</a>
</div>

<div class="ss-shop-card">

    <div class="ss-shop-card-title">
        <h3>Registered Shops</h3>
        <span class="ss-shop-badge">Shop Directory</span>
    </div>

    <div class="ss-shop-table-wrapper">

        <table class="ss-shop-table">

            <thead>
                <tr>
                    <th>Shop Name</th>
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

                    hasShops = true;
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
                            href="avshops.jsp?duserid=<%=java.net.URLEncoder.encode(rs1.getString(6), "UTF-8")%>"
                            class="ss-shop-delete"
                            onclick="return confirm('Are you sure you want to delete this shop?');">
                            Delete
                        </a>
                    </td>
                </tr>

            <%
                }

                if(!hasShops) {
            %>

                <tr>
                    <td colspan="7" class="ss-shop-empty">
                        No registered shops found.
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
