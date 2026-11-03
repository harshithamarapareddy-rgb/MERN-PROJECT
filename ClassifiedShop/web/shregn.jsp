<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="header.jsp" %>

<style>
    .ss-reg-wrapper {
        max-width: 850px;
        margin: 35px auto 55px;
        padding: 0 15px;
        font-family: Arial, sans-serif;
    }

    .ss-reg-heading {
        color: #14233f;
        font-size: 30px;
        font-weight: 700;
        margin-bottom: 8px;
        text-align: center;
    }

    .ss-reg-subtitle {
        color: #7b8495;
        text-align: center;
        margin-bottom: 28px;
    }

    .ss-reg-card {
        background: #ffffff;
        padding: 35px;
        border-radius: 15px;
        box-shadow: 0 5px 25px rgba(20,35,63,0.10);
        border: 1px solid #edf0f5;
    }

    .ss-reg-card h3 {
        color: #14233f;
        font-size: 22px;
        font-weight: 700;
        margin-bottom: 25px;
    }

    .ss-reg-group {
        margin-bottom: 18px;
    }

    .ss-reg-group label {
        display: block;
        color: #263653;
        font-size: 14px;
        font-weight: 600;
        margin-bottom: 8px;
    }

    .ss-reg-group input,
    .ss-reg-group textarea,
    .ss-reg-group select {
        width: 100%;
        padding: 13px 14px;
        border: 1px solid #dce2eb;
        border-radius: 8px;
        font-size: 14px;
        outline: none;
        background: #ffffff;
        box-sizing: border-box;
    }

    .ss-reg-group input:focus,
    .ss-reg-group textarea:focus,
    .ss-reg-group select:focus {
        border-color: #ff872f;
        box-shadow: 0 0 0 3px rgba(255,135,47,0.12);
    }

    .ss-reg-group textarea {
        min-height: 85px;
        resize: vertical;
    }

    .ss-reg-submit {
        width: 100%;
        padding: 14px;
        border: none;
        border-radius: 8px;
        background: #ff872f;
        color: #ffffff;
        font-size: 16px;
        font-weight: 700;
        cursor: pointer;
        transition: 0.3s;
        margin-top: 10px;
    }

    .ss-reg-submit:hover {
        background: #e96f18;
    }

    .ss-reg-footer {
        text-align: center;
        margin-top: 22px;
        color: #778197;
        font-size: 14px;
    }

    .ss-reg-footer a {
        color: #ff872f;
        font-weight: 700;
        text-decoration: none;
    }

    .ss-reg-message {
        max-width: 550px;
        margin: 50px auto;
        padding: 35px;
        background: #ffffff;
        border-radius: 14px;
        text-align: center;
        box-shadow: 0 5px 25px rgba(20,35,63,0.10);
        color: #14233f;
        font-size: 18px;
        font-weight: 600;
    }

    .ss-reg-message a {
        display: inline-block;
        margin: 15px 7px 0;
        padding: 11px 23px;
        background: #ff872f;
        color: #ffffff;
        border-radius: 7px;
        text-decoration: none;
        font-size: 14px;
    }

    @media(max-width:600px) {
        .ss-reg-card {
            padding: 22px;
        }

        .ss-reg-heading {
            font-size: 25px;
        }
    }
</style>

<%
if(request.getParameter("submit1") == null) {


    PreparedStatement cityPs = conn.prepareStatement(
        "select city from cities"
    );

    ResultSet cityRs = cityPs.executeQuery();


%>

<div class="ss-reg-wrapper">

```
<h1 class="ss-reg-heading">Join SHOP SPHERE</h1>

<p class="ss-reg-subtitle">
    Register your shop and grow your business with us.
</p>

<div class="ss-reg-card">

    <h3>Shop Registration</h3>

    <form name="f" action="shregn.jsp" method="post"
          onsubmit="return validateShopForm();">

        <div class="ss-reg-group">
            <label>Shop Name *</label>
            <input type="text" name="name"
                   placeholder="Enter your shop name"
                   required autofocus>
        </div>

        <div class="ss-reg-group">
            <label>Address *</label>
            <textarea name="addr"
                      placeholder="Enter your shop address"
                      required></textarea>
        </div>

        <div class="ss-reg-group">
            <label>Area Name *</label>
            <input type="text" name="aname"
                   placeholder="Enter your area"
                   required>
        </div>

        <div class="ss-reg-group">
            <label>City *</label>

            <select name="city" required>
                <option value="">Select your city</option>

                <%
                    while(cityRs.next()) {
                %>
                <option value="<%=cityRs.getString(1)%>">
                    <%=cityRs.getString(1)%>
                </option>
                <%
                    }
                    cityRs.close();
                    cityPs.close();
                %>

            </select>
        </div>

        <div class="ss-reg-group">
            <label>Mobile Number *</label>
            <input type="text" name="mobile"
                   placeholder="Enter 10-digit mobile number"
                   maxlength="10" required>
        </div>

        <div class="ss-reg-group">
            <label>Email Address (User ID) *</label>
            <input type="email" name="email"
                   placeholder="Enter your email address"
                   required>
        </div>

        <div class="ss-reg-group">
            <label>Password *</label>
            <input type="password" name="pwd"
                   placeholder="Create a password"
                   required>
        </div>

        <div class="ss-reg-group">
            <label>Confirm Password *</label>
            <input type="password" name="cpwd"
                   placeholder="Confirm your password"
                   required>
        </div>

        <button type="submit" name="submit1"
                value="Register" class="ss-reg-submit">
            Register Your Shop
        </button>

    </form>

    <div class="ss-reg-footer">
        Already registered?
        <a href="shops.jsp">Login Here</a>
    </div>

</div>
```

</div>

<script>
    function validateShopForm() {

        var mobile = document.f.mobile.value;
        var password = document.f.pwd.value;
        var confirmPassword = document.f.cpwd.value;

        var mobilePattern = /^[9876][0-9]{9}$/;

        if(!mobilePattern.test(mobile)) {
            alert("Please enter a valid 10-digit mobile number.");
            document.f.mobile.focus();
            return false;
        }

        if(password !== confirmPassword) {
            alert("Passwords do not match.");
            document.f.cpwd.focus();
            return false;
        }

        return true;
    }
</script>

<%
} else {


    String name = request.getParameter("name");
    String addr = request.getParameter("addr");
    String aname = request.getParameter("aname");
    String city = request.getParameter("city");
    String mobile = request.getParameter("mobile");
    String userid = request.getParameter("email");
    String pwd = request.getParameter("pwd");
    String cpwd = request.getParameter("cpwd");

    int k = 0;

    if(pwd == null || !pwd.equals(cpwd)) {


%>

<div class="ss-reg-message">
    Passwords do not match!
    <br>
    <a href="shregn.jsp">Try Again</a>
</div>

<%
} else {


        PreparedStatement insertPs = null;

        try {

            insertPs = conn.prepareStatement(
                "insert into newuser(name,addr,aname,city,mobile,userid,pwd,utype) values (?,?,?,?,?,?,?,?)"
            );

            insertPs.setString(1, name);
            insertPs.setString(2, addr);
            insertPs.setString(3, aname);
            insertPs.setString(4, city);
            insertPs.setString(5, mobile);
            insertPs.setString(6, userid);
            insertPs.setString(7, pwd);
            insertPs.setString(8, "shop");

            k = insertPs.executeUpdate();

        } catch(Exception e) {
            k = 0;
        } finally {
            if(insertPs != null) {
                try { insertPs.close(); } catch(Exception e) {}
            }
        }

        if(k > 0) {


%>

<div class="ss-reg-message">
    Shop Registered Successfully!
    <br>
    <a href="shops.jsp">Login Now</a>
</div>

<%
} else {
%>

<div class="ss-reg-message">
    Registration Failed! This User ID may already exist.
    <br>
    <a href="shregn.jsp">Try Again</a>
</div>

<%
}
}
}
%>

<%@include file="footer.jsp" %>
