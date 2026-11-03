<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="adminheader.jsp" %>

<%!
PreparedStatement ps = null;
int k = 0;
%>

<style>
    .ss-city-create {
        max-width: 750px;
        margin: 35px auto 55px;
        padding: 0 20px;
        font-family: Arial, sans-serif;
    }

    .ss-city-heading {
        color: #14233f;
        font-size: 30px;
        font-weight: 700;
        margin-bottom: 8px;
    }

    .ss-city-subtitle {
        color: #778197;
        margin-bottom: 25px;
        font-size: 14px;
    }

    .ss-city-card {
        background: #ffffff;
        border-radius: 14px;
        padding: 30px;
        box-shadow: 0 5px 25px rgba(20,35,63,0.09);
        border: 1px solid #edf0f5;
    }

    .ss-city-card h3 {
        color: #14233f;
        font-size: 21px;
        margin: 0 0 8px;
        font-weight: 700;
    }

    .ss-city-card p {
        color: #7b8495;
        font-size: 14px;
        margin-bottom: 25px;
    }

    .ss-city-label {
        display: block;
        color: #263653;
        font-weight: 600;
        margin-bottom: 9px;
        font-size: 14px;
    }

    .ss-city-input {
        width: 100%;
        box-sizing: border-box;
        padding: 13px 15px;
        border: 1px solid #dce2eb;
        border-radius: 8px;
        outline: none;
        font-size: 15px;
        transition: 0.3s;
    }

    .ss-city-input:focus {
        border-color: #ff872f;
        box-shadow: 0 0 0 3px rgba(255,135,47,0.12);
    }

    .ss-city-actions {
        display: flex;
        gap: 12px;
        margin-top: 25px;
        flex-wrap: wrap;
    }

    .ss-city-btn {
        display: inline-block;
        padding: 12px 24px;
        border-radius: 8px;
        text-decoration: none;
        border: none;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: 0.3s;
    }

    .ss-city-submit {
        background: #ff872f;
        color: #ffffff;
    }

    .ss-city-submit:hover {
        background: #e96f18;
        color: #ffffff;
    }

    .ss-city-view {
        background: #14233f;
        color: #ffffff;
    }

    .ss-city-view:hover {
        background: #243d66;
        color: #ffffff;
    }

    .ss-city-message {
        text-align: center;
        background: #ffffff;
        padding: 35px 25px;
        margin: 35px auto;
        max-width: 550px;
        border-radius: 14px;
        box-shadow: 0 5px 25px rgba(20,35,63,0.09);
        color: #14233f;
        font-size: 18px;
        font-weight: 600;
    }

    .ss-city-message a {
        display: inline-block;
        margin-top: 18px;
        background: #ff872f;
        color: white;
        text-decoration: none;
        padding: 10px 25px;
        border-radius: 7px;
        font-size: 14px;
    }

    @media(max-width:600px) {
        .ss-city-card {
            padding: 22px;
        }

        .ss-city-heading {
            font-size: 25px;
        }
    }
</style>

<%
if(request.getParameter("submit1") == null) {
%>

<div class="ss-city-create">


<h1 class="ss-city-heading">City Management</h1>
<p class="ss-city-subtitle">
    Add and manage the cities available in SHOP SPHERE.
</p>

<div class="ss-city-card">

    <h3>Create New City</h3>
    <p>Enter the city name to add it to the city directory.</p>

    <form name="f" action="cities.jsp" method="post">

        <label class="ss-city-label">City Name</label>

        <input type="text"
               name="city"
               class="ss-city-input"
               placeholder="Enter city name"
               required
               autofocus>

        <div class="ss-city-actions">

            <button type="submit"
                    name="submit1"
                    value="Create"
                    class="ss-city-btn ss-city-submit">
                + Create City
            </button>

            <a href="avcities.jsp"
               class="ss-city-btn ss-city-view">
                View Cities
            </a>

        </div>

    </form>

</div>
```

</div>

<%
} else {


    try {
        ps = conn.prepareStatement(
            "insert into cities(city) values(?)"
        );

        ps.setString(1, request.getParameter("city"));
        k = ps.executeUpdate();

        if(k > 0) {


%>

<div class="ss-city-message">
    City Added Successfully!
    <br>
    <a href="cities.jsp">Add Another City</a>
    <a href="avcities.jsp">View Cities</a>
</div>

<%
}


    } catch(Exception e) {


%>

<div class="ss-city-message">
    City could not be added. Please check whether the city already exists.
    <br>
    <a href="cities.jsp">Go Back</a>
</div>

<%
} finally {
if(ps != null) {
try { ps.close(); } catch(Exception e) {}
}
}
}
%>

<%@include file="footer.jsp" %>
