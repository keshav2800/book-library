<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="displayUrl" value="/library/display" />

<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Home Page</title>
  <style>
    :root{
      --bg:#f6f8fb;
      --card:#ffffff;
      --text:#0f172a;
      --muted:#64748b;
      --border:#e5e7eb;
      --accent:#6366f1; /* indigo */
      --radius:14px;
    }
    *{box-sizing:border-box}
    body{
      margin:0;
      font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, "Helvetica Neue", Arial;
      color:var(--text);
      background:var(--bg);
      min-height:100vh;
      display:grid;
      place-items:center;
      padding:24px;
    }
    .card{
      width:100%;
      max-width:720px;
      background:var(--card);
      border:1px solid var(--border);
      border-radius:var(--radius);
      box-shadow:0 6px 24px rgba(15,23,42,.08);
      overflow:hidden;
    }
    .card-header{
      padding:22px;
      border-bottom:1px solid var(--border);
      background:linear-gradient(180deg,#f8fafc,transparent);
    }
    h1{ margin:0; font-size:22px; letter-spacing:.2px; }
    .sub{ margin:6px 0 0; color:var(--muted); font-size:14px; }
    .card-body{ padding:22px; }
    .app{
      display:inline-block; margin-top:6px;
      padding:6px 10px; border-radius:999px; font-size:12px;
      border:1px solid var(--border); color:#334155; background:#fff;
    }
    .actions{ margin-top:16px; }
    .btn{
      appearance:none; border:none; border-radius:10px;
      padding:10px 16px; font-weight:600; cursor:pointer;
      text-decoration:none; display:inline-block;
      background:var(--accent); color:#fff;
      box-shadow:0 8px 18px rgba(99,102,241,.25);
      transition:transform .05s ease, box-shadow .15s ease;
    }
    .btn:active{ transform:translateY(1px); }
    .btn:hover{ box-shadow:0 10px 24px rgba(99,102,241,.32); }
  </style>
</head>
<body>
  <div class="card">
    <div class="card-header">
      <h1>Hey, hope you are doing excellent today!</h1>
      <p class="sub">Welcome to <span class="app">${appName}</span></p>
    </div>
    <div class="card-body">
      <div class="actions">
        <a class="btn" href="${displayUrl}">Try Now</a>
      </div>
    </div>
  </div>
</body>
</html>
