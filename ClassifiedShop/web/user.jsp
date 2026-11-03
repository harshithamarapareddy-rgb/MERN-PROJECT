<%@include file="header.jsp" %>
<%!
    PreparedStatement ps=null;
    ResultSet rs=null;
    String userid,pwd,utype;
%>

<style>
    .ss-user-login, .ss-user-login * { box-sizing: border-box; }
    .ss-user-login {
        --ss-navy:#14233f; --ss-orange:#ff8a35; --ss-muted:#758096;
        width:100%; padding:55px 15px 65px; background:linear-gradient(120deg,#f5f7fb,#fff4eb);
        font-family:'Poppins',Arial,sans-serif;
    }
    .ss-user-login .ss-auth-wrap {
        max-width:960px; min-height:480px; margin:0 auto; display:grid;
        grid-template-columns:1fr 1fr; overflow:hidden; border-radius:18px;
        background:#fff; box-shadow:0 20px 55px rgba(20,35,63,.10);
    }
    .ss-user-login .ss-auth-intro {
        position:relative; overflow:hidden; padding:55px 42px; color:#fff;
        background:var(--ss-navy); display:flex; flex-direction:column; justify-content:center;
    }
    .ss-user-login .ss-auth-intro:after {
        content:"S"; position:absolute; right:-15px; bottom:-105px; color:rgba(255,255,255,.055);
        font-size:310px; line-height:1; font-weight:900;
    }
    .ss-user-login .ss-mini-brand { position:relative; z-index:1; color:var(--ss-orange); font-size:11px; font-weight:800; letter-spacing:2px; }
    .ss-user-login .ss-auth-intro h2 { position:relative; z-index:1; margin:22px 0 14px; color:#fff; font-size:34px; line-height:1.25; font-weight:800; }
    .ss-user-login .ss-auth-intro h2 span { color:var(--ss-orange); }
    .ss-user-login .ss-auth-intro p { position:relative; z-index:1; max-width:340px; color:#c1cada; font-size:13px; line-height:1.9; }
    .ss-user-login .ss-intro-note { position:relative; z-index:1; margin-top:28px; color:#fff; font-size:11px; }
    .ss-user-login .ss-intro-note b { color:var(--ss-orange); margin-right:7px; }
    .ss-user-login .ss-auth-form-area { padding:55px 48px; display:flex; flex-direction:column; justify-content:center; }
    .ss-user-login .ss-form-kicker { color:var(--ss-orange); font-size:10px; letter-spacing:2px; font-weight:800; }
    .ss-user-login .ss-auth-form-area h1 { margin:10px 0 8px; color:var(--ss-navy); font-size:29px; font-weight:800; }
    .ss-user-login .ss-form-subtitle { margin:0 0 28px; color:var(--ss-muted); font-size:12px; line-height:1.7; }
    .ss-user-login .ss-field { margin-bottom:18px; }
    .ss-user-login .ss-field label { display:block; margin-bottom:8px; color:#344158; font-size:11px; font-weight:700; }
    .ss-user-login .ss-field input { width:100%; height:47px; padding:0 14px; border:1px solid #e2e7ef; border-radius:7px; outline:none; color:#24324a; background:#fbfcfe; font-size:12px; }
    .ss-user-login .ss-field input:focus { border-color:var(--ss-orange); box-shadow:0 0 0 3px rgba(255,138,53,.10); background:#fff; }
    .ss-user-login .ss-login-button { width:100%; height:48px; margin-top:5px; border:0; border-radius:7px; background:var(--ss-orange); color:#fff; font-size:12px; font-weight:800; cursor:pointer; transition:.2s; }
    .ss-user-login .ss-login-button:hover { background:var(--ss-navy); }
    .ss-user-login .ss-register-line { margin:22px 0 0; text-align:center; color:var(--ss-muted); font-size:11px; }
    .ss-user-login .ss-register-line a { color:var(--ss-orange); font-weight:800; text-decoration:none; }
    .ss-user-login .ss-register-line a:hover { color:var(--ss-navy); }
    .ss-user-login .ss-login-error { max-width:960px; margin:0 auto 18px; padding:12px 16px; border:1px solid #ffd5d5; border-radius:8px; background:#fff3f3; color:#b42318; text-align:center; font-size:12px; }
    @media(max-width:700px) {
        .ss-user-login { padding:28px 12px 40px; }
        .ss-user-login .ss-auth-wrap { grid-template-columns:1fr; }
        .ss-user-login .ss-auth-intro { padding:32px 27px; min-height:230px; }
        .ss-user-login .ss-auth-intro h2 { margin:14px 0 8px; font-size:27px; }
        .ss-user-login .ss-auth-form-area { padding:35px 27px; }
    }
</style>

<div class="ss-user-login">
    <%
        if(request.getParameter("submit1")==null) {
    %>
    <div class="ss-auth-wrap">
        <section class="ss-auth-intro">
            <div class="ss-mini-brand">WELCOME TO SHOP SPHERE</div>
            <h2>Your world of finds.<br><span>All in one place.</span></h2>
            <p>Sign in to explore products, discover local shops and connect with sellers through a simple marketplace experience.</p>
            <div class="ss-intro-note"><b>✓</b> Everything You Need, All in One Place</div>
        </section>
        <section class="ss-auth-form-area">
            <div class="ss-form-kicker">USER ACCOUNT</div>
            <h1>Welcome back!</h1>
            <p class="ss-form-subtitle">Enter your login details to continue.</p>
            <form name="f" action="user.jsp" method="post">
                <div class="ss-field">
                    <label for="ss-userid">Email / User ID</label>
                    <input id="ss-userid" type="text" name="userid" placeholder="Enter your email or user ID" required autofocus>
                </div>
                <div class="ss-field">
                    <label for="ss-userpwd">Password</label>
                    <input id="ss-userpwd" type="password" name="pwd" placeholder="Enter your password" required>
                </div>
                <button class="ss-login-button" type="submit" name="submit1" value="Login">LOGIN TO YOUR ACCOUNT&nbsp; →</button>
            </form>
            <p class="ss-register-line">Don't have an account? <a href="regn.jsp">Register here</a></p>
        </section>
    </div>
    <%
        } else {
            ps = conn.prepareStatement("select * from newuser where userid=? and pwd=? and utype='user'");
            ps.setString(1, request.getParameter("userid"));
            ps.setString(2, request.getParameter("pwd"));
            rs = ps.executeQuery();
            if(rs.next()) {
                session.setAttribute("userid", request.getParameter("userid"));
                session.setAttribute("usercity", rs.getString(4));
                response.sendRedirect("userhome.jsp");
            } else {
                out.print("<div class='ss-login-error'>Invalid User ID or Password. Please try again.</div>");
                out.print("<div style='text-align:center'><a style='color:#ff8a35;font-weight:700;font-size:12px;text-decoration:none' href='user.jsp'>← Back to User Login</a></div>");
            }
            ps.close();
        }
    %>
</div>

<%@include file="footer.jsp" %>
