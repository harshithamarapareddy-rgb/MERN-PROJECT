<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Shop Sphere | User Dashboard</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <style>
        .ss-user-shell { --ss-navy:#14233f; --ss-orange:#ff8a35; font-family:'Poppins',Arial,sans-serif; background:#f6f8fc; min-height:100vh; color:#24324a; }
        .ss-user-topbar { background:#fff; box-shadow:0 5px 25px rgba(20,35,63,.07); position:relative; z-index:5; }
        .ss-user-nav { max-width:1180px; min-height:82px; margin:auto; padding:0 18px; display:flex; align-items:center; justify-content:space-between; gap:20px; }
        .ss-user-brand { display:flex; align-items:center; gap:11px; text-decoration:none!important; color:var(--ss-navy)!important; }
        .ss-user-mark { width:42px; height:42px; display:flex; align-items:center; justify-content:center; border-radius:12px; background:var(--ss-orange); color:#fff; font-size:24px; font-weight:800; box-shadow:0 7px 16px rgba(255,138,53,.23); }
        .ss-user-brand-copy { display:flex; flex-direction:column; line-height:1.25; }
        .ss-user-brand-copy strong { font-size:16px; letter-spacing:1.4px; font-weight:800; }
        .ss-user-brand-copy em { color:var(--ss-orange); font-style:normal; }
        .ss-user-brand-copy small { margin-top:4px; color:#8993a4; font-size:9px; }
        .ss-user-links { display:flex; align-items:center; gap:9px; }
        .ss-user-links a { display:inline-flex; align-items:center; gap:8px; padding:12px 17px; border-radius:8px; color:#59657a!important; text-decoration:none!important; font-size:12px; font-weight:700; transition:.2s; }
        .ss-user-links a:hover,.ss-user-links a.ss-current { color:var(--ss-orange)!important; background:#fff3e9; }
        .ss-user-links a.ss-signout { margin-left:7px; color:#fff!important; background:var(--ss-navy); }
        .ss-user-links a.ss-signout:hover { background:var(--ss-orange); }
        .ss-user-citybar { max-width:1180px; margin:0 auto; padding:14px 18px 18px; display:flex; justify-content:flex-end; }
        .ss-user-city { display:inline-flex; align-items:center; gap:8px; padding:8px 13px; border:1px solid #e9edf4; border-radius:30px; background:#fff; color:#738096; font-size:11px; }
        .ss-user-city b { color:var(--ss-navy); }
        .ss-user-content { max-width:1180px; min-height:450px; margin:0 auto; padding:18px 18px 35px; }
        @media(max-width:650px) {
            .ss-user-nav { padding-top:14px; padding-bottom:14px; align-items:flex-start; flex-direction:column; gap:12px; }
            .ss-user-links { width:100%; flex-wrap:wrap; gap:4px; }
            .ss-user-links a { padding:10px 12px; font-size:11px; }
            .ss-user-links a.ss-signout { margin-left:0; }
            .ss-user-citybar { padding-top:8px; }
        }
    </style>
</head>
<body>
<div class="ss-user-shell">
    <header class="ss-user-topbar">
        <nav class="ss-user-nav">
            <a class="ss-user-brand" href="userhome.jsp">
                <span class="ss-user-mark">S</span>
                <span class="ss-user-brand-copy">
                    <strong>SHOP <em>SPHERE</em></strong>
                    <small>Everything You Need, All in One Place</small>
                </span>
            </a>
            <div class="ss-user-links">
                <a class="ss-current" href="userhome.jsp">
    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
         stroke="currentColor" stroke-width="2" stroke-linecap="round"
         stroke-linejoin="round">
        <path d="M6 7h12l1 13H5L6 7z"/>
        <path d="M9 7a3 3 0 0 1 6 0"/>
    </svg>
    Shopping
</a>

<a href="uvinterest.jsp">
    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
         stroke="currentColor" stroke-width="2" stroke-linecap="round"
         stroke-linejoin="round">
        <path d="M20.8 4.6a5.5 5.5 0 0 0-7.8 0L12 5.7l-1.1-1.1a5.5 5.5 0 0 0-7.8 7.8L12 21l7.8-7.5a5.5 5.5 0 0 0 1-8.9z"/>
    </svg>
    Interests
</a>

<a class="ss-signout" href="signout.jsp">
    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
         stroke="currentColor" stroke-width="2" stroke-linecap="round"
         stroke-linejoin="round">
        <path d="M10 17l5-5-5-5"/>
        <path d="M15 12H3"/>
        <path d="M12 3h7a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-7"/>
    </svg>
    Sign Out
</a>
            </div>
        </nav>
    </header>
    <%@include file="db.jsp"%>
    <%
        if(session.getAttribute("userid")==null) {
            response.sendRedirect("user.jsp");
            return;
        }
    %>
    <div class="ss-user-citybar">
        <div class="ss-user-city">

    <svg width="16" height="16" viewBox="0 0 24 24"
         fill="none" stroke="currentColor" stroke-width="2"
         stroke-linecap="round" stroke-linejoin="round">
        <path d="M20 10c0 5-8 12-8 12S4 15 4 10a8 8 0 1 1 16 0z"/>
        <circle cx="12" cy="10" r="2.5"/>
    </svg>

    <span>Your location:</span>
    <b><%=session.getAttribute("usercity")%></b>

</div>
    </div>
    <main class="ss-user-content">
