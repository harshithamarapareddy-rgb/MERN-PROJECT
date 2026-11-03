<%@include file="header.jsp" %>

<%!
PreparedStatement ps = null;
ResultSet rs = null;
%>

<title>Shop Sphere | Seller Login</title>

<style>
    .ss-seller-login-page {
        min-height: 85vh;
        background: linear-gradient(110deg, #f3f6fb, #fff5ed);
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 50px 20px;
        font-family: Arial, sans-serif;
    }

    .ss-seller-login-container {
        width: 100%;
        max-width: 1240px;
        min-height: 650px;
        display: grid;
        grid-template-columns: 1fr 1fr;
        background: white;
        border-radius: 25px;
        overflow: hidden;
        box-shadow: 0 20px 55px rgba(20,35,63,0.12);
    }

    .ss-seller-welcome {
        background: #14233f;
        color: white;
        padding: 65px 55px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        position: relative;
        overflow: hidden;
    }

    .ss-seller-brand {
        color: #ff872f;
        font-size: 15px;
        font-weight: 800;
        letter-spacing: 2px;
        margin-bottom: 48px;
    }

    .ss-seller-welcome h1 {
        font-size: 43px;
        line-height: 1.25;
        font-weight: 800;
        margin: 0 0 22px;
        color: white;
    }

    .ss-seller-welcome h1 span {
        color: #ff872f;
    }

    .ss-seller-welcome p {
        color: #d4dceb;
        font-size: 16px;
        line-height: 1.9;
        max-width: 420px;
    }

    .ss-seller-tagline {
        margin-top: 28px;
        color: white;
        font-size: 14px;
    }

    .ss-seller-watermark {
        position: absolute;
        bottom: -115px;
        right: 0;
        font-size: 290px;
        line-height: 1;
        font-weight: 900;
        color: rgba(255,255,255,0.055);
        pointer-events: none;
    }

    .ss-seller-form-side {
        background: white;
        padding: 65px 60px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .ss-seller-label-top {
        color: #ff872f;
        font-size: 13px;
        font-weight: 800;
        letter-spacing: 3px;
        margin-bottom: 22px;
    }

    .ss-seller-form-side h2 {
        color: #14233f;
        font-size: 37px;
        font-weight: 800;
        margin: 0 0 12px;
    }

    .ss-seller-description {
        color: #7d8798;
        font-size: 14px;
        margin-bottom: 42px;
        line-height: 1.6;
    }

    .ss-seller-form-label {
        display: block;
        color: #14233f;
        font-size: 14px;
        font-weight: 700;
        margin-bottom: 12px;
    }

    .ss-seller-input {
        width: 100%;
        box-sizing: border-box;
        padding: 17px;
        background: #f0f4fc;
        border: 1px solid #e1e7f1;
        border-radius: 10px;
        outline: none;
        font-size: 15px;
        color: #14233f;
        margin-bottom: 27px;
        transition: 0.3s;
    }

    .ss-seller-input:focus {
        border-color: #ff872f;
        box-shadow: 0 0 0 3px rgba(255,135,47,0.12);
    }

    .ss-seller-login-btn {
        width: 100%;
        padding: 19px;
        border: none;
        border-radius: 10px;
        background: #ff872f;
        color: white;
        font-size: 15px;
        font-weight: 800;
        cursor: pointer;
        transition: 0.3s;
        margin-top: 5px;
    }

    .ss-seller-login-btn:hover {
        background: #ed7929;
        transform: translateY(-2px);
        box-shadow: 0 8px 18px rgba(255,135,47,0.2);
    }

    .ss-seller-form-footer {
        text-align: center;
        color: #8792a4;
        font-size: 13px;
        margin-top: 30px;
    }

    .ss-seller-form-footer a {
        color: #ff872f;
        font-weight: 800;
        text-decoration: none;
    }

    .ss-seller-form-footer a:hover {
        text-decoration: underline;
    }

    .ss-seller-error {
        background: #fff0ef;
        border: 1px solid #ffd6d3;
        color: #dc4545;
        padding: 13px;
        border-radius: 9px;
        font-size: 13px;
        margin-bottom: 22px;
    }

    @media(max-width: 850px) {
        .ss-seller-login-container {
            grid-template-columns: 1fr;
        }

        .ss-seller-welcome {
            padding: 45px 35px;
            min-height: 300px;
        }

        .ss-seller-brand {
            margin-bottom: 25px;
        }

        .ss-seller-welcome h1 {
            font-size: 34px;
        }

        .ss-seller-form-side {
            padding: 45px 35px;
        }
    }

    @media(max-width: 480px) {
        .ss-seller-login-page {
            padding: 20px 10px;
        }

        .ss-seller-welcome,
        .ss-seller-form-side {
            padding: 35px 25px;
        }

        .ss-seller-welcome h1 {
            font-size: 29px;
        }

        .ss-seller-form-side h2 {
            font-size: 29px;
        }
    }
</style>

<%
if(request.getParameter("submit1") == null) {
%>

<div class="ss-seller-login-page">

```
<div class="ss-seller-login-container">

    <!-- LEFT WELCOME SECTION -->

    <div class="ss-seller-welcome">

        <div class="ss-seller-brand">
            WELCOME TO SHOP SPHERE
        </div>

        <h1>
            Grow your business.<br>
            <span>Reach more customers.</span>
        </h1>

        <p>
            Connect with customers, showcase your products
            and grow your business through the Shop Sphere
            marketplace.
        </p>

        <div class="ss-seller-tagline">
            <strong style="color:#ff872f;">SS</strong>
            &nbsp; Everything You Need, All in One Place
        </div>

        <div class="ss-seller-watermark">S</div>

    </div>

    <!-- RIGHT LOGIN SECTION -->

    <div class="ss-seller-form-side">

        <div class="ss-seller-label-top">
            SELLER ACCOUNT
        </div>

        <h2>Welcome back!</h2>

        <p class="ss-seller-description">
            Sign in to manage your products and connect with customers.
        </p>

        <form name="f" action="sellers.jsp" method="post">

            <label class="ss-seller-form-label">
                Email / User ID
            </label>

            <input
                type="text"
                name="userid"
                class="ss-seller-input"
                placeholder="Enter your seller user ID"
                required
                autofocus
            >

            <label class="ss-seller-form-label">
                Password
            </label>

            <input
                type="password"
                name="pwd"
                class="ss-seller-input"
                placeholder="Enter your password"
                required
            >

            <input
                type="submit"
                name="submit1"
                value="LOGIN TO YOUR ACCOUNT"
                class="ss-seller-login-btn"
            >

        </form>

        <div class="ss-seller-form-footer">
            Don't have an account?
            <a href="sregn.jsp">Register here</a>
        </div>

    </div>

</div>
```

</div>

<%
} else {


    ps = conn.prepareStatement(
        "select * from newuser where userid=? and pwd=? and utype='seller'"
    );

    ps.setString(1, request.getParameter("userid"));
    ps.setString(2, request.getParameter("pwd"));

    rs = ps.executeQuery();

    if(rs.next()) {

        session.setAttribute(
            "sellerid",
            request.getParameter("userid")
        );

        rs.close();
        ps.close();

        response.sendRedirect("sellerhome.jsp");
        return;

    } else {

        rs.close();
        ps.close();


%>

<div class="ss-seller-login-page">

```
<div class="ss-seller-login-container">

    <div class="ss-seller-welcome">

        <div class="ss-seller-brand">WELCOME TO SHOP SPHERE</div>

        <h1>
            Grow your business.<br>
            <span>Reach more customers.</span>
        </h1>

        <p>
            Showcase your products and connect with customers
            through Shop Sphere.
        </p>

    </div>

    <div class="ss-seller-form-side">

        <div class="ss-seller-label-top">SELLER ACCOUNT</div>

        <h2>Welcome back!</h2>

        <div class="ss-seller-error">
            Invalid User ID or Password. Please try again.
        </div>

        <form name="f" action="sellers.jsp" method="post">

            <label class="ss-seller-form-label">Email / User ID</label>

            <input type="text" name="userid"
                   class="ss-seller-input"
                   placeholder="Enter your seller user ID"
                   required>

            <label class="ss-seller-form-label">Password</label>

            <input type="password" name="pwd"
                   class="ss-seller-input"
                   placeholder="Enter your password"
                   required>

            <input type="submit" name="submit1"
                   value="LOGIN TO YOUR ACCOUNT"
                   class="ss-seller-login-btn">

        </form>

        <div class="ss-seller-form-footer">
            Don't have an account?
            <a href="sregn.jsp">Register here</a>
        </div>

    </div>

</div>
```

</div>

<%
}
}
%>

<%@include file="footer.jsp" %>
