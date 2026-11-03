<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

```
<title>SHOP SPHERE</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
<link rel="icon" href="images/fevicon.png" type="image/gif">

<style>
    * {
        box-sizing: border-box;
    }

    .header {
        width: 100%;
        background: #14233f !important;
        padding: 12px 0;
        position: relative;
        z-index: 9999;
    }

    .header .container-fluid {
        width: 100%;
    }

    .ss-logo {
        color: #ffffff !important;
        font-size: 25px;
        font-weight: 800;
        text-decoration: none !important;
        letter-spacing: 1px;
        white-space: nowrap;
    }

    .ss-logo span {
        color: #ff872f;
    }

    .navigation {
        width: 100%;
    }

    .navigation .navbar-nav {
        display: flex !important;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        gap: 8px;
        width: 100%;
        margin: 0;
    }

    .navigation .navbar-nav .nav-item {
        display: block !important;
        visibility: visible !important;
        opacity: 1 !important;
    }

    .navigation .navbar-nav .nav-link {
        display: block !important;
        color: #ffffff !important;
        visibility: visible !important;
        opacity: 1 !important;
        font-size: 16px;
        font-weight: 600;
        padding: 12px 18px !important;
        text-decoration: none !important;
        border-radius: 6px;
        transition: 0.3s;
    }

    .navigation .navbar-nav .nav-item.active .nav-link {
        color: #ff872f !important;
        border-bottom: 3px solid #ff872f;
    }

    .navigation .navbar-nav .nav-link:hover {
        color: #ff872f !important;
        background: rgba(255,255,255,0.08);
    }

    .navbar-toggler {
        border: 1px solid #ffffff !important;
        padding: 8px 12px;
    }

    .navbar-toggler-icon {
        filter: brightness(0) invert(1);
    }

    @media(max-width: 767px) {

        .header {
            padding: 12px 0;
        }

        .navigation .navbar-nav {
            flex-direction: column;
            align-items: stretch;
            gap: 0;
            margin-top: 12px;
        }

        .navigation .navbar-nav .nav-link {
            padding: 12px 15px !important;
        }

        .navigation .navbar-collapse {
            background: #14233f;
            padding: 10px;
        }
    }
</style>
```

</head>

<body class="main-layout">

```
<!-- Loader -->
<div class="loader_bg">
    <div class="loader">
        <img src="images/loading.gif" alt="Loading">
    </div>
</div>

<!-- SHOP SPHERE HEADER -->
<div class="header">

    <div class="container-fluid">

        <div class="row d-flex align-items-center">

            <!-- Logo -->
            <div class="col-md-3 col-sm-4 col-8">
                <div class="logo">
                    <a href="index.jsp" class="ss-logo">
                        SHOP <span>SPHERE</span>
                    </a>
                </div>
            </div>

            <!-- Navigation -->
            <div class="col-md-9 col-sm-8 col-4">

                <nav class="navigation navbar navbar-expand-md navbar-dark">

                    <button class="navbar-toggler ml-auto"
                            type="button"
                            data-toggle="collapse"
                            data-target="#navbarsExample04"
                            aria-controls="navbarsExample04"
                            aria-expanded="false"
                            aria-label="Toggle navigation">

                        <span class="navbar-toggler-icon"></span>

                    </button>

                    <div class="collapse navbar-collapse"
                         id="navbarsExample04">

                        <ul class="navbar-nav ml-auto">

                            <li class="nav-item <%= request.getServletPath().endsWith("index.jsp") ? "active" : "" %>">
                                <a class="nav-link" href="index.jsp">
                                    Home
                                </a>
                            </li>

                            <li class="nav-item <%= request.getServletPath().endsWith("admin.jsp") ? "active" : "" %>">
                                <a class="nav-link" href="admin.jsp">
                                    Admin
                                </a>
                            </li>

                            <li class="nav-item <%= request.getServletPath().endsWith("user.jsp") ? "active" : "" %>">
                                <a class="nav-link" href="user.jsp">
                                    User
                                </a>
                            </li>

                            <li class="nav-item <%= request.getServletPath().endsWith("sellers.jsp") ? "active" : "" %>">
                                <a class="nav-link" href="sellers.jsp">
                                    Sellers
                                </a>
                            </li>

                            <li class="nav-item <%= request.getServletPath().endsWith("shops.jsp") ? "active" : "" %>">
                                <a class="nav-link" href="shops.jsp">
                                    Shops
                                </a>
                            </li>

                        </ul>

                    </div>

                </nav>

            </div>

        </div>

    </div>

</div>
<!-- END HEADER -->

<!-- Main Content -->
<div class="class" style="padding-bottom: 5px;">

    <div class="container" style="min-height: 450px;">

        <%@include file="db.jsp" %>
```
