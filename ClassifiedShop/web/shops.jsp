<%@include file="header.jsp" %>

<%!
PreparedStatement ps = null;
ResultSet rs = null;
%>

<title>Shop Sphere | Shop Login</title>

<style>

    .ss-shop-login-page {
        min-height: 85vh;
        background: linear-gradient(110deg, #f3f6fb, #fff5ed);
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 50px 20px;
        font-family: Arial, sans-serif;
    }

    .ss-shop-login-container {
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

    .ss-shop-welcome {
        background: #14233f;
        color: white;
        padding: 65px 55px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        position: relative;
        overflow: hidden;
    }

    .ss-shop-brand {
        color: #ff872f;
        font-size: 15px;
        font-weight: 800;
        letter-spacing: 2px;
        margin-bottom: 48px;
    }

    .ss-shop-welcome h1 {
        font-size: 43px;
        line-height: 1.25;
        font-weight: 800;
        margin: 0 0 22px;
        color: white;
    }

    .ss-shop-welcome h1 span {
        color: #ff872f;
    }

    .ss-shop-welcome p {
        color: #d4dceb;
        font-size: 16px;
        line-height: 1.9;
        max-width: 420px;
    }

    .ss-shop-tagline {
        margin-top: 28px;
        color: white;
        font-size: 14px;
    }

    .ss-shop-watermark {
        position: absolute;
        bottom: -115px;
        right: 0;
        font-size: 290px;
        line-height: 1;
        font-weight: 900;
        color: rgba(255,255,255,0.055);
        pointer-events: none;
    }

    .ss-shop-form-side {
        background: white;
        padding: 65px 60px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .ss-shop-label-top {
        color: #ff872f;
        font-size: 13px;
        font-weight: 800;
        letter-spacing: 3px;
        margin-bottom: 22px;
    }

    .ss-shop-form-side h2 {
        color: #14233f;
        font-size: 37px;
        font-weight: 800;
        margin: 0 0 12px;
    }

    .ss-shop-description {
        color: #7d8798;
        font-size: 14px;
        margin-bottom: 42px;
        line-height: 1.7;
    }

    .ss-shop-form-label {
        display: block;
        color: #14233f;
        font-size: 14px;
        font-weight: 700;
        margin-bottom: 12px;
    }

    .ss-shop-input {
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

    .ss-shop-input:focus {
        border-color: #ff872f;
        box-shadow: 0 0 0 3px rgba(255,135,47,0.12);
    }

    .ss-shop-login-btn {
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

    .ss-shop-login-btn:hover {
        background: #ed7929;
        transform: translateY(-2px);
        box-shadow: 0 8px 18px rgba(255,135,47,0.2);
    }

    .ss-shop-register {
        text-align: center;
        color: #8792a4;
        font-size: 14px;
        margin-top: 30px;
    }

    .ss-shop-register a {
        color: #ff872f;
        font-weight: 800;
        text-decoration: none;
    }

    .ss-shop-register a:hover {
        text-decoration: underline;
    }

    .ss-shop-error {
        background: #fff0ef;
        border: 1px solid #ffd6d3;
        color: #dc4545;
        padding: 13px;
        border-radius: 9px;
        font-size: 13px;
        margin-bottom: 22px;
    }

    @media(max-width: 850px) {

        .ss-shop-login-container {
            grid-template-columns: 1fr;
        }

        .ss-shop-welcome {
            padding: 45px 35px;
            min-height: 300px;
        }

        .ss-shop-brand {
            margin-bottom: 25px;
        }

        .ss-shop-welcome h1 {
            font-size: 34px;
        }

        .ss-shop-form-side {
            padding: 45px 35px;
        }
    }

    @media(max-width: 480px) {

        .ss-shop-login-page {
            padding: 20px 10px;
        }

        .ss-shop-welcome,
        .ss-shop-form-side {
            padding: 35px 25px;
        }

        .ss-shop-welcome h1 {
            font-size: 29px;
        }

        .ss-shop-form-side h2 {
            font-size: 29px;
        }
    }

</style>

<%
if(request.getParameter("submit1") == null) {
%>

<div class="ss-shop-login-page">

```
<div class="ss-shop-login-container">

    <!-- LEFT WELCOME SECTION -->

    <div class="ss-shop-welcome">

        <div class="ss-shop-brand">
            WELCOME TO SHOP SPHERE
        </div>

        <h1>
            Grow your business.<br>
            <span>Sell with confidence.</span>
        </h1>

        <p>
            Access your shop dashboard and manage your products,
            connect with customers and grow your business.
            Everything you need to manage your shop is
            available in one simple platform.
        </p>

        <div class="ss-shop-tagline">
            <strong style="color:#ff872f;">SS</strong>
            &nbsp; Your Shop, Your Success, Our Platform.
        </div>

        <div class="ss-shop-watermark">S</div>

    </div>

    <!-- RIGHT LOGIN SECTION -->

    <div class="ss-shop-form-side">

        <div class="ss-shop-label-top">
            SHOP OWNER PORTAL
        </div>

        <h2>Welcome back!</h2>

        <p class="ss-shop-description">
            Sign in with your shop credentials to manage your business.
        </p>

        <form name="f" action="shops.jsp" method="post">

            <label class="ss-shop-form-label">
                Shop User ID
            </label>

            <input
                type="text"
                name="userid"
                class="ss-shop-input"
                placeholder="Enter your shop user ID"
                required
                autofocus
            >

            <label class="ss-shop-form-label">
                Password
            </label>

            <input
                type="password"
                name="pwd"
                class="ss-shop-input"
                placeholder="Enter your password"
                required
            >

            <input
                type="submit"
                name="submit1"
                value="LOGIN TO SHOP DASHBOARD"
                class="ss-shop-login-btn"
            >

        </form>

        <div class="ss-shop-register">
            Don't have a Shop ID?
            <a href="shregn.jsp">Register Your Shop</a>
        </div>

    </div>

</div>
```

</div>

<%
} else {


ps = conn.prepareStatement(
    "select * from newuser where userid=? and pwd=? and utype='shop'"
);

ps.setString(1, request.getParameter("userid"));
ps.setString(2, request.getParameter("pwd"));

rs = ps.executeQuery();

if(rs.next()) {

    session.setAttribute("shopid", request.getParameter("userid"));

    rs.close();
    ps.close();

    response.sendRedirect("shophome.jsp");
    return;

} else {

    rs.close();
    ps.close();


%>

<div class="ss-shop-login-page">

```
<div class="ss-shop-login-container">

    <div class="ss-shop-welcome">

        <div class="ss-shop-brand">
            WELCOME TO SHOP SPHERE
        </div>

        <h1>
            Grow your business.<br>
            <span>Sell with confidence.</span>
        </h1>

        <p>
            Manage your products and grow your business
            with the SHOP SPHERE seller platform.
        </p>

        <div class="ss-shop-watermark">S</div>

    </div>

    <div class="ss-shop-form-side">

        <div class="ss-shop-label-top">
            SHOP OWNER PORTAL
        </div>

        <h2>Welcome back!</h2>

        <div class="ss-shop-error">
            Invalid Shop User ID or Password.
            Please check your credentials and try again.
        </div>

        <form name="f" action="shops.jsp" method="post">

            <label class="ss-shop-form-label">
                Shop User ID
            </label>

            <input type="text"
                   name="userid"
                   class="ss-shop-input"
                   placeholder="Enter your shop user ID"
                   required>

            <label class="ss-shop-form-label">
                Password
            </label>

            <input type="password"
                   name="pwd"
                   class="ss-shop-input"
                   placeholder="Enter your password"
                   required>

            <input type="submit"
                   name="submit1"
                   value="LOGIN TO SHOP DASHBOARD"
                   class="ss-shop-login-btn">

        </form>

        <div class="ss-shop-register">
            Don't have a Shop ID?
            <a href="shregn.jsp">Register Your Shop</a>
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
