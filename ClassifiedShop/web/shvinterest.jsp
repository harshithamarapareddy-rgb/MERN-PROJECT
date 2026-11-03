<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="shopheader.jsp" %>

<%!
    PreparedStatement ps1 = null;
    ResultSet rs1 = null;
%>

<style>
    .interest-page {
        padding: 25px 10px;
        min-height: 450px;
    }

    .interest-title {
        color: #14233f;
        font-size: 30px;
        font-weight: 700;
        margin-bottom: 8px;
    }

    .interest-subtitle {
        color: #777;
        font-size: 14px;
        margin-bottom: 25px;
    }

    .interest-card {
        background: #ffffff;
        padding: 25px;
        border-radius: 14px;
        box-shadow: 0 5px 25px rgba(20, 35, 63, 0.08);
        border: 1px solid #edf0f5;
    }

    .interest-table-wrapper {
        width: 100%;
        overflow-x: auto;
    }

    .interest-table {
        width: 100%;
        border-collapse: collapse;
        min-width: 1100px;
        font-size: 14px;
    }

    .interest-table thead {
        background: #14233f;
        color: white;
    }

    .interest-table th {
        padding: 16px 12px;
        text-align: left;
        white-space: nowrap;
        font-weight: 600;
    }

    .interest-table td {
        padding: 14px 12px;
        border-bottom: 1px solid #edf0f5;
        color: #444;
        vertical-align: middle;
    }

    .interest-table tbody tr:hover {
        background: #f5f8fc;
    }

    .product-img {
        width: 65px;
        height: 55px;
        object-fit: cover;
        border-radius: 8px;
        border: 1px solid #eee;
    }

    .offer-price {
        color: #e87924;
        font-weight: 700;
    }

    .empty-message {
        text-align: center;
        padding: 35px;
        color: #777;
        font-size: 16px;
    }

    .interest-count {
        background: #fff1e5;
        color: #e87924;
        padding: 7px 14px;
        border-radius: 20px;
        font-size: 13px;
        font-weight: 600;
    }

    @media(max-width: 768px) {
        .interest-title {
            font-size: 24px;
        }

        .interest-card {
            padding: 15px;
        }
    }
</style>

<div class="interest-page">

    <h1 class="interest-title">Interested Users</h1>

    <p class="interest-subtitle">
        View customers who have shown interest in your products.
    </p>

    <div class="interest-card">

        <div class="interest-table-wrapper">

<%
    if(request.getParameter("npid") != null) {
        ps1 = conn.prepareStatement("delete from ninterest where id=?");
        ps1.setString(1, request.getParameter("npid"));
        ps1.executeUpdate();
        ps1.close();
    }

    ps1 = conn.prepareStatement(
        "select i.id,i.dt,i.userid,n.name,n.city,n.mobile," +
        "p.cname,p.brand,p.modelname,p.oprice,p.fn1 " +
        "from ninterest i,newuser n,newproduct p " +
        "where i.userid=n.userid and i.pid=p.id " +
        "and i.pid in (select id from newproduct where shopid=?)"
    );

    ps1.setString(1, session.getAttribute("shopid").toString().trim());

    rs1 = ps1.executeQuery();

    boolean hasRecords = false;
%>

            <table class="interest-table">

                <thead>
                    <tr>
                        <th>Date</th>
                        <th>User ID</th>
                        <th>Name</th>
                        <th>City</th>
                        <th>Mobile</th>
                        <th>Category</th>
                        <th>Brand</th>
                        <th>Model Name</th>
                        <th>Offer Price</th>
                        <th>Product Image</th>
                    </tr>
                </thead>

                <tbody>

<%
    while(rs1.next()) {
        hasRecords = true;
%>

                    <tr>
                        <td><%=rs1.getString(2)%></td>
                        <td><%=rs1.getString(3)%></td>
                        <td><%=rs1.getString(4)%></td>
                        <td><%=rs1.getString(5)%></td>
                        <td><%=rs1.getString(6)%></td>
                        <td><%=rs1.getString(7)%></td>
                        <td><%=rs1.getString(8)%></td>
                        <td><%=rs1.getString(9)%></td>

                        <td class="offer-price">
                            &#8377; <%=rs1.getString(10)%>
                        </td>

                        <td>
                            <img
                                src="uploads/<%=rs1.getString(11)%>"
                                class="product-img"
                                alt="Product Image">
                        </td>
                    </tr>

<%
    }

    if(!hasRecords) {
%>

                    <tr>
                        <td colspan="10" class="empty-message">
                            No interested users found yet.
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
</div>

<%@include file="footer.jsp" %>