<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Shop Sphere | Everything You Need, All in One Place</title>
    <meta name="description" content="Discover products, connect with sellers and explore shops on Shop Sphere.">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="css/shop-sphere.css">
</head>
<body class="ss-home">

<header class="ss-header">
    <div class="container">
        <nav class="ss-nav">
            <a class="ss-brand" href="index.jsp" aria-label="Shop Sphere home">
                <span class="ss-brand-mark">S</span>
                <span class="ss-brand-copy">
                    <strong>SHOP <em>SPHERE</em></strong>
                    <small>Everything You Need, All in One Place</small>
                </span>
            </a>

            <button class="ss-menu-toggle" type="button" data-toggle="collapse"
                    data-target="#shopSphereNav" aria-controls="shopSphereNav"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span></span><span></span><span></span>
            </button>

            <div class="collapse navbar-collapse ss-nav-links" id="shopSphereNav">
                <a class="active" href="index.jsp">Home</a>
                <a href="admin.jsp">Admin</a>
                <a href="user.jsp">User</a>
                <a href="sellers.jsp">Sellers</a>
                <a href="shops.jsp">Shops</a>
                <a class="ss-nav-cta" href="user.jsp">Get started <span aria-hidden="true">→</span></a>
            </div>
        </nav>
    </div>
</header>

<main>
    <section class="ss-hero">
        <div class="ss-hero-orb ss-orb-one"></div>
        <div class="ss-hero-orb ss-orb-two"></div>
        <div class="container ss-hero-inner">
            <div class="row align-items-center">
                <div class="col-lg-7">
                    <div class="ss-eyebrow"><span></span> YOUR MARKETPLACE, MADE SIMPLE</div>
                    <h1>Find what you need.<br><span>Love what you discover.</span></h1>
                    <p class="ss-hero-text">
                        One simple place to explore products, connect with sellers
                        and discover shops. Welcome to a smarter way to shop.
                    </p>
                    <div class="ss-hero-actions">
                        <a class="ss-button ss-button-primary" href="user.jsp">Explore as a user <span>→</span></a>
                        <a class="ss-button ss-button-outline" href="sellers.jsp">I'm a seller</a>
                    </div>
                    <div class="ss-trust-line">
                        <span class="ss-trust-icon">✓</span>
                        Easy to explore <b>·</b> Simple to connect <b>·</b> All in one place
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="ss-hero-art" aria-label="Shop Sphere marketplace illustration">
                        <div class="ss-art-glow"></div>
                        <div class="ss-art-card ss-art-card-back">
                            <span class="ss-art-label">DISCOVER</span>
                            <div class="ss-art-lines"><i></i><i></i><i></i></div>
                        </div>
                        <div class="ss-art-card ss-art-card-main">
                            <div class="ss-art-top"><span class="ss-art-dot"></span><span class="ss-art-dot"></span><span class="ss-art-dot"></span></div>
                            <div class="ss-art-bag">S</div>
                            <strong>Your next great find<br>is just around the corner.</strong>
                            <small>SHOP • CONNECT • DISCOVER</small>
                        </div>
                        <div class="ss-float-tag ss-tag-one"><span>✦</span> Find something new</div>
                        <div class="ss-float-tag ss-tag-two"><span>✓</span> Simple experience</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ss-hero-bottom"></div>
    </section>

    <section class="ss-quick-section">
        <div class="container">
            <div class="ss-section-heading">
                <div>
                    <span class="ss-kicker">GET STARTED</span>
                    <h2>A space for everyone.</h2>
                    <p>Choose how you want to use Shop Sphere.</p>
                </div>
            </div>
            <div class="row ss-role-row">
                <div class="col-md-4">
                    <a class="ss-role-card" href="user.jsp">
                        <span class="ss-role-icon ss-icon-user">♡</span>
                        <span class="ss-role-arrow">↗</span>
                        <h3>I'm a User</h3>
                        <p>Explore the marketplace and find products that interest you.</p>
                        <strong>Continue as user <span>→</span></strong>
                    </a>
                </div>
                <div class="col-md-4">
                    <a class="ss-role-card" href="sellers.jsp">
                        <span class="ss-role-icon ss-icon-seller">↗</span>
                        <span class="ss-role-arrow">↗</span>
                        <h3>I'm a Seller</h3>
                        <p>Connect with customers and manage your selling activity.</p>
                        <strong>Continue as seller <span>→</span></strong>
                    </a>
                </div>
                <div class="col-md-4">
                    <a class="ss-role-card" href="shops.jsp">
                        <span class="ss-role-icon ss-icon-shop">⌂</span>
                        <span class="ss-role-arrow">↗</span>
                        <h3>I'm a Shop</h3>
                        <p>Bring your shop online and reach people through one platform.</p>
                        <strong>Explore shops <span>→</span></strong>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <section class="ss-bottom-cta">
        <div class="container">
            <div class="ss-cta-panel">
                <div>
                    <span class="ss-kicker">WELCOME TO SHOP SPHERE</span>
                    <h2>Everything you need,<br>all in one place.</h2>
                    <p>Start exploring the marketplace today.</p>
                </div>
                <a class="ss-button ss-button-light" href="user.jsp">Get started <span>→</span></a>
                <div class="ss-cta-decoration">S</div>
            </div>
        </div>
    </section>
</main>

<footer class="ss-footer">
    <div class="container ss-footer-inner">
        <a class="ss-brand ss-footer-brand" href="index.jsp">
            <span class="ss-brand-mark">S</span>
            <span class="ss-brand-copy">
                <strong>SHOP <em>SPHERE</em></strong>
                <small>Everything You Need, All in One Place</small>
            </span>
        </a>
        <p>© <%= java.time.Year.now() %> Shop Sphere. All rights reserved.</p>
    </div>
</footer>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
