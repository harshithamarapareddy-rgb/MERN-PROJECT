<%@include file="userheader.jsp" %>

<%!
PreparedStatement ps1 = null;
ResultSet rs1 = null;
%>

<style>
    .interest-page {
        padding: 30px 4%;
        background: #f6f8fc;
        min-height: 75vh;
    }

    .interest-heading {
        color: #14233f;
        font-size: 27px;
        font-weight: 700;
        margin: 15px 0 5px;
    }

    .interest-subtitle {
        color: #788398;
        font-size: 14px;
        margin-bottom: 25px;
    }

    .interest-section {
        margin-bottom: 45px;
    }

    .interest-title {
        display: flex;
        align-items: center;
        gap: 12px;
        color: #14233f;
        font-size: 21px;
        font-weight: 700;
        margin: 25px 0 18px;
    }

    .interest-title span {
        background: #fff0e5;
        color: #ff8a35;
        padding: 9px 12px;
        border-radius: 10px;
        font-size: 17px;
    }

    .interest-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(245px, 1fr));
        gap: 22px;
    }

    .interest-card {
        background: #ffffff;
        border-radius: 15px;
        overflow: hidden;
        border: 1px solid #e9edf4;
        box-shadow: 0 5px 18px rgba(20, 35, 63, 0.06);
        transition: 0.3s ease;
    }

    .interest-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 25px rgba(20, 35, 63, 0.12);
    }

    .interest-image {
        height: 190px;
        background: #f1f3f7;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
    }

    .interest-image img {
        width: 100%;
        height: 100%;
        object-fit: contain;
        padding: 10px;
    }

    .interest-details {
        padding: 18px;
    }

    .interest-category {
        display: inline-block;
        background: #fff0e5;
        color: #ed7929;
        padding: 5px 10px;
        border-radius: 20px;
        font-size: 11px;
        font-weight: 700;
        margin-bottom: 10px;
    }

    .interest-model {
        font-size: 17px;
        font-weight: 700;
        color: #14233f;
        margin: 5px 0;
    }

    .interest-brand {
        color: #7c8798;
        font-size: 13px;
        margin-bottom: 13px;
    }

    .interest-price {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        gap: 9px;
        margin-bottom: 15px;
    }

    .offer-price {
        color: #14233f;
        font-size: 19px;
        font-weight: 700;
    }

    .original-price {
        color: #9ba3af;
        font-size: 13px;
        text-decoration: line-through;
    }

    .interest-info {
        border-top: 1px solid #edf0f5;
        padding-top: 12px;
        margin-top: 10px;
        color: #657186;
        font-size: 13px;
        line-height: 1.8;
    }

    .interest-date {
        color: #8b95a5;
        font-size: 12px;
        margin-bottom: 8px;
    }

    .remove-btn {
        display: block;
        width: 100%;
        text-align: center;
        text-decoration: none;
        background: #fff0ef;
        color: #dc4545;
        padding: 10px;
        border-radius: 8px;
        font-size: 13px;
        font-weight: 700;
        margin-top: 15px;
        transition: 0.3s;
    }

    .remove-btn:hover {
        background: #dc4545;
        color: white;
        text-decoration: none;
    }

    .empty-interest {
        background: white;
        border: 1px dashed #d7deea;
        border-radius: 13px;
        padding: 35px 15px;
        text-align: center;
        color: #8792a4;
        font-size: 14px;
    }

    .empty-interest strong {
        display: block;
        color: #14233f;
        font-size: 16px;
        margin-bottom: 7px;
    }

    @media(max-width: 600px) {
        .interest-page {
            padding: 20px 15px;
        }

        .interest-heading {
            font-size: 23px;
        }

        .interest-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<%
if (request.getParameter("npid") != null) {
ps1 = conn.prepareStatement("DELETE FROM ninterest WHERE id=?");
ps1.setString(1, request.getParameter("npid"));
ps1.executeUpdate();
ps1.close();
}


if (request.getParameter("opid") != null) {
    ps1 = conn.prepareStatement("DELETE FROM ointerest WHERE id=?");
    ps1.setString(1, request.getParameter("opid"));
    ps1.executeUpdate();
    ps1.close();
}


%>

<div class="interest-page">

```
<h1 class="interest-heading">My Interested Products</h1>
<p class="interest-subtitle">All the products you have saved in one place.</p>

<!-- NEW PRODUCTS -->

<div class="interest-section">

    <h2 class="interest-title">
    <span>NEW</span> Interested New Products
</h2>

    <div class="interest-grid">

    <%
        boolean newProductsFound = false;

        ps1 = conn.prepareStatement(
            "SELECT i.id, i.dt, cname, brand, modelname, price, oprice, name, mobile, fn1 " +
            "FROM ninterest i " +
            "JOIN newproduct p ON i.pid = p.id " +
            "JOIN newuser n ON p.shopid = n.userid " +
            "WHERE i.userid = ?");

        ps1.setString(1, session.getAttribute("userid").toString().trim());
        rs1 = ps1.executeQuery();

        while (rs1.next()) {
            newProductsFound = true;
    %>

        <div class="interest-card">

            <div class="interest-image">
                <img src="uploads/<%=rs1.getString(10)%>" alt="Product Image">
            </div>

            <div class="interest-details">

                <span class="interest-category">
                    <%=rs1.getString(3)%>
                </span>

                <div class="interest-model">
                    <%=rs1.getString(5)%>
                </div>

                <div class="interest-brand">
                    Brand: <%=rs1.getString(4)%>
                </div>

                <div class="interest-price">
                    <span class="offer-price">
                        Rs. <%=rs1.getString(7)%>
                    </span>

                    <span class="original-price">
                        Rs. <%=rs1.getString(6)%>
                    </span>
                </div>

                <div class="interest-info">
                    <div>? Shop: <%=rs1.getString(8)%></div>
                    <div>? Mobile: <%=rs1.getString(9)%></div>
                </div>

                <div class="interest-date">
                    Added on: <%=rs1.getString(2)%>
                </div>

                <a href="vuinterest.jsp?npid=<%=rs1.getString(1)%>"
                   class="remove-btn"
                   onclick="return confirm('Are you sure you want to remove this product?')">
                    Remove Interest
                </a>

            </div>
        </div>

    <%
        }

        rs1.close();
        ps1.close();

        if (!newProductsFound) {
    %>

        <div class="empty-interest">
            <strong>No New Products Yet!</strong>
            You haven't added any new products to your interests.
        </div>

    <%
        }
    %>

    </div>
</div>


<!-- USED PRODUCTS -->

<div class="interest-section">

    <h2 class="interest-title">
    <span>USED</span> Interested Used Products
</h2>

    <div class="interest-grid">

    <%
        boolean oldProductsFound = false;

        ps1 = conn.prepareStatement(
            "SELECT i.id, i.dt, cname, brand, modelname, price, oprice, name, mobile, fn1 " +
            "FROM ointerest i " +
            "JOIN oldproduct p ON i.pid = p.id " +
            "JOIN newuser n ON p.sellerid = n.userid " +
            "WHERE i.userid = ?");

        ps1.setString(1, session.getAttribute("userid").toString().trim());
        rs1 = ps1.executeQuery();

        while (rs1.next()) {
            oldProductsFound = true;
    %>

        <div class="interest-card">

            <div class="interest-image">
                <img src="uploads/<%=rs1.getString(10)%>" alt="Product Image">
            </div>

            <div class="interest-details">

                <span class="interest-category">
                    <%=rs1.getString(3)%>
                </span>

                <div class="interest-model">
                    <%=rs1.getString(5)%>
                </div>

                <div class="interest-brand">
                    Brand: <%=rs1.getString(4)%>
                </div>

                <div class="interest-price">
                    <span class="offer-price">
                        Rs. <%=rs1.getString(7)%>
                    </span>

                    <span class="original-price">
                        Rs. <%=rs1.getString(6)%>
                    </span>
                </div>

                <div class="interest-info">
                    <div>? Owner: <%=rs1.getString(8)%></div>
                    <div>? Mobile: <%=rs1.getString(9)%></div>
                </div>

                <div class="interest-date">
                    Added on: <%=rs1.getString(2)%>
                </div>

                <a href="vuinterest.jsp?opid=<%=rs1.getString(1)%>"
                   class="remove-btn"
                   onclick="return confirm('Are you sure you want to remove this product?')">
                    Remove Interest
                </a>

            </div>
        </div>

    <%
        }

        rs1.close();
        ps1.close();

        if (!oldProductsFound) {
    %>

        <div class="empty-interest">
            <strong>No Used Products Yet!</strong>
            You haven't added any used products to your interests.
        </div>

    <%
        }
    %>

    </div>
</div>
```

</div>

<%@include file="footer.jsp" %>
