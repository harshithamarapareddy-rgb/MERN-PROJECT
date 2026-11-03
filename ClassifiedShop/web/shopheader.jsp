<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>SHOP SPHERE</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #f5f7fb;
        }

        /* SHOP SPHERE HEADER */
        .ss-header {
            width: 100%;
            background: #14233f;
            padding: 18px 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
            flex-wrap: wrap;
        }

        /* LOGO */
        .ss-logo {
            color: white;
            font-size: 27px;
            font-weight: bold;
            text-decoration: none;
            letter-spacing: 1px;
        }

        .ss-logo span {
            color: #ff872f;
        }

        .ss-tagline {
            color: #cbd5e1;
            font-size: 11px;
            margin-top: 4px;
            letter-spacing: 2px;
        }

        /* NAVIGATION */
        .ss-nav {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .ss-nav a {
            color: white;
            text-decoration: none;
            font-size: 15px;
            padding: 11px 18px;
            border-radius: 7px;
            transition: 0.3s;
        }

        .ss-nav a:hover {
            background: #263d61;
            color: #ff872f;
        }

        .ss-nav .ss-logout {
            background: #ff872f;
            color: white;
            font-weight: bold;
        }

        .ss-nav .ss-logout:hover {
            background: #e66c18;
            color: white;
        }

        /* PAGE CONTAINER */
        .class {
            padding-bottom: 5px;
            min-height: 450px;
        }

        .class .container {
            min-height: 450px;
            width: 90%;
            max-width: 1400px;
            margin: auto;
            padding-top: 30px;
            padding-bottom: 30px;
        }

        @media(max-width: 768px) {
            .ss-header {
                flex-direction: column;
                gap: 18px;
            }

            .ss-nav {
                flex-wrap: wrap;
                justify-content: center;
            }

            .ss-nav a {
                font-size: 13px;
                padding: 9px 12px;
            }
        }
    </style>
</head>

<body>

    <!-- SHOP SPHERE HEADER -->
    <header class="ss-header">

        <div>
            <a href="shophome.jsp" class="ss-logo">
                SHOP <span>SPHERE</span>
            </a>

            <div class="ss-tagline">
                YOUR MARKETPLACE, YOUR WORLD
            </div>
        </div>

        <nav class="ss-nav">

            <a href="shophome.jsp">
                Add Products / View
            </a>

            <a href="shvinterest.jsp">
                Interests
            </a>

            <a href="signout.jsp" class="ss-logout">
                Sign Out
            </a>

        </nav>

    </header>

    <!-- PAGE CONTENT CONTAINER -->

    <div class="class">
        <div class="container">

            <%@include file="db.jsp"%>

            <%
                if(session.getAttribute("shopid") == null) {
                    response.sendRedirect("shops.jsp");
                }
            %>