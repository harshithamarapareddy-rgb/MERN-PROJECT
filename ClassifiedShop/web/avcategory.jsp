<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="adminheader.jsp" %>

<%!
PreparedStatement ps1 = null;
ResultSet rs1 = null;
%>

<style>
    .ss-category-page {
        padding: 30px 15px 50px;
        font-family: Arial, sans-serif;
        background: #f7f9fc;
    }

    .ss-category-heading {
        text-align: center;
        margin-bottom: 30px;
    }

    .ss-category-heading h1 {
        color: #14233f;
        font-size: 32px;
        font-weight: 800;
        margin-bottom: 10px;
    }

    .ss-category-heading p {
        color: #7b8494;
        font-size: 14px;
    }

    .ss-category-card {
        max-width: 850px;
        margin: auto;
        background: white;
        padding: 25px;
        border-radius: 14px;
        box-shadow: 0 5px 25px rgba(20,35,63,0.08);
        border: 1px solid #edf0f5;
    }

    .ss-category-card-title {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 22px;
        flex-wrap: wrap;
        gap: 10px;
    }

    .ss-category-card-title h3 {
        color: #14233f;
        font-size: 21px;
        font-weight: 700;
        margin: 0;
    }

    .ss-category-badge {
        background: #fff1e5;
        color: #e87924;
        padding: 9px 16px;
        border-radius: 20px;
        font-size: 13px;
        font-weight: 700;
    }

    .ss-category-table-wrapper {
        width: 100%;
        overflow-x: auto;
    }

    .ss-category-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 14px;
    }

    .ss-category-table thead {
        background: #14233f;
        color: white;
    }

    .ss-category-table th {
        padding: 16px;
        text-align: left;
        font-weight: 600;
    }

    .ss-category-table td {
        padding: 16px;
        color: #4b5565;
        border-bottom: 1px solid #edf0f5;
    }

    .ss-category-table tbody tr:hover {
        background: #f5f8fc;
    }

    .ss-category-delete {
        display: inline-block;
        padding: 9px 17px;
        color: white;
        background: #dc4545;
        border-radius: 6px;
        text-decoration: none;
        font-size: 12px;
        font-weight: 700;
        transition: 0.3s;
    }

    .ss-category-delete:hover {
        background: #b92e2e;
        color: white;
        text-decoration: none;
    }

    .ss-category-empty {
        text-align: center;
        padding: 35px !important;
        color: #8992a1 !important;
        font-size: 15px;
    }

    @media(max-width: 768px) {
        .ss-category-heading h1 {
            font-size: 25px;
        }

        .ss-category-card {
            padding: 15px;
        }
    }
</style>

<%
if(request.getParameter("cn") != null) {


    ps1 = conn.prepareStatement(
        "delete from categories where cname=?"
    );

    ps1.setString(1, request.getParameter("cn"));
    ps1.executeUpdate();
    ps1.close();
}

ps1 = conn.prepareStatement(
    "select * from categories"
);

rs1 = ps1.executeQuery();

boolean hasCategories = false;


%>

<div class="ss-category-page">

```
<div class="ss-category-heading">
    <h1>Category Management</h1>
    <p>View and manage all product categories in SHOP SPHERE.</p>
</div>

<div class="ss-category-card">

    <div class="ss-category-card-title">
        <h3>Available Categories</h3>
        <span class="ss-category-badge">Category Directory</span>
    </div>

    <div class="ss-category-table-wrapper">

        <table class="ss-category-table">

            <thead>
                <tr>
                    <th>Category Name</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>

            <%
                while(rs1.next()) {

                    hasCategories = true;
            %>

                <tr>
                    <td><%=rs1.getString(1)%></td>

                    <td>
                        <a
                            href="avcategory.jsp?cn=<%=java.net.URLEncoder.encode(rs1.getString(1), "UTF-8")%>"
                            class="ss-category-delete"
                            onclick="return confirm('Are you sure you want to delete this category?');">
                            Delete
                        </a>
                    </td>
                </tr>

            <%
                }

                if(!hasCategories) {
            %>

                <tr>
                    <td colspan="2" class="ss-category-empty">
                        No categories found.
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
