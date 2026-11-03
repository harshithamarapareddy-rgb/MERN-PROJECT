<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="adminheader.jsp" %>

<style>
    .ss-category-create-page {
        padding: 35px 15px 55px;
        font-family: Arial, sans-serif;
        background: #f7f9fc;
    }

    .ss-category-create-heading {
        text-align: center;
        margin-bottom: 30px;
    }

    .ss-category-create-heading h1 {
        color: #14233f;
        font-size: 32px;
        font-weight: 800;
        margin-bottom: 10px;
    }

    .ss-category-create-heading p {
        color: #7b8494;
        font-size: 14px;
    }

    .ss-category-create-card {
        max-width: 650px;
        margin: auto;
        padding: 30px;
        background: white;
        border: 1px solid #edf0f5;
        border-radius: 15px;
        box-shadow: 0 5px 25px rgba(20,35,63,0.08);
    }

    .ss-category-top {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 12px;
        flex-wrap: wrap;
        margin-bottom: 25px;
    }

    .ss-category-top h3 {
        color: #14233f;
        font-size: 21px;
        font-weight: 700;
        margin: 0;
    }

    .ss-category-view-btn {
        display: inline-block;
        padding: 11px 18px;
        background: #14233f;
        color: white;
        text-decoration: none;
        border-radius: 7px;
        font-size: 13px;
        font-weight: 600;
        transition: 0.3s;
    }

    .ss-category-view-btn:hover {
        background: #ff872f;
        color: white;
        text-decoration: none;
    }

    .ss-category-label {
        display: block;
        color: #14233f;
        font-size: 14px;
        font-weight: 700;
        margin-bottom: 10px;
    }

    .ss-category-input {
        width: 100%;
        padding: 14px 15px;
        border: 1px solid #dce2eb;
        border-radius: 8px;
        font-size: 14px;
        outline: none;
        box-sizing: border-box;
        transition: 0.3s;
    }

    .ss-category-input:focus {
        border-color: #ff872f;
        box-shadow: 0 0 0 3px rgba(255,135,47,0.12);
    }

    .ss-category-create-btn {
        width: 100%;
        margin-top: 22px;
        padding: 14px;
        background: #ff872f;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 15px;
        font-weight: 700;
        cursor: pointer;
        transition: 0.3s;
    }

    .ss-category-create-btn:hover {
        background: #e96f17;
        transform: translateY(-2px);
    }

    .ss-category-message {
        max-width: 550px;
        margin: 50px auto;
        padding: 30px;
        background: white;
        text-align: center;
        border-radius: 14px;
        box-shadow: 0 5px 25px rgba(20,35,63,0.08);
    }

    .ss-category-message h2 {
        color: #14233f;
        font-size: 24px;
        margin-bottom: 12px;
    }

    .ss-category-message p {
        color: #7b8494;
        font-size: 14px;
        margin-bottom: 22px;
    }

    .ss-category-back-btn {
        display: inline-block;
        padding: 12px 25px;
        background: #14233f;
        color: white;
        text-decoration: none;
        border-radius: 7px;
        font-weight: 600;
    }

    .ss-category-back-btn:hover {
        background: #ff872f;
        color: white;
        text-decoration: none;
    }

    @media(max-width: 600px) {
        .ss-category-create-heading h1 {
            font-size: 25px;
        }

        .ss-category-create-card {
            padding: 20px;
        }
    }
</style>

<%
if(request.getParameter("submit1") == null) {
%>

<div class="ss-category-create-page">

```
<div class="ss-category-create-heading">
    <h1>Category Management</h1>
    <p>Create and manage product categories in SHOP SPHERE.</p>
</div>

<div class="ss-category-create-card">

    <div class="ss-category-top">
        <h3>Create New Category</h3>

        <a href="avcategory.jsp" class="ss-category-view-btn">
            View Categories
        </a>
    </div>

    <form name="f" action="category.jsp" method="post">

        <label class="ss-category-label">
            Category Name
        </label>

        <input
            type="text"
            name="cname"
            class="ss-category-input"
            placeholder="Enter category name"
            required
            autofocus
        >

        <input
            type="submit"
            name="submit1"
            value="Create Category"
            class="ss-category-create-btn"
        >

    </form>

</div>
```

</div>

<%
} else {


    PreparedStatement ps = null;
    int k = 0;

    try {

        ps = conn.prepareStatement(
            "insert into categories(cname) values(?)"
        );

        ps.setString(1, request.getParameter("cname"));

        k = ps.executeUpdate();

    } catch(Exception e) {
        k = 0;
    } finally {
        if(ps != null) {
            try {
                ps.close();
            } catch(Exception e) {}
        }
    }

    if(k > 0) {


%>

<div class="ss-category-message">
    <h2>Category Created Successfully!</h2>
    <p>Your new category has been added to SHOP SPHERE.</p>
    <a href="category.jsp" class="ss-category-back-btn">Add Another Category</a>
    <a href="avcategory.jsp" class="ss-category-back-btn">View Categories</a>
</div>

<%
} else {
%>

<div class="ss-category-message">
    <h2>Category Already Exists!</h2>
    <p>This category could not be created. Please check whether the category name already exists.</p>
    <a href="category.jsp" class="ss-category-back-btn">Go Back</a>
</div>

<%
}
}
%>

<%@include file="footer.jsp" %>
