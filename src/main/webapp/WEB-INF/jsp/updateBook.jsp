<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="updateUrl" value="/library/updateBook/${book.id}" />
<c:url var="listUrl" value="/library/display" />

<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Update Book</title>
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
      background: var(--bg);
      min-height:100vh;
      display:grid;
      place-items:center;
      padding:24px;
    }
    .card{
      width:100%;
      max-width:560px;
      background:var(--card);
      border:1px solid var(--border);
      border-radius:var(--radius);
      box-shadow:0 6px 24px rgba(15,23,42,.08);
      overflow:hidden;
    }
    .card-header{
      padding:20px 22px;
      border-bottom:1px solid var(--border);
      background:linear-gradient(180deg,#f8fafc,transparent);
    }
    h1{ margin:0; font-size:22px; letter-spacing:.2px; }
    .card-body{ padding:22px; }

    .field{ margin-bottom:16px; }
    label{
      display:block; font-size:13px; color:var(--muted); margin-bottom:6px;
    }
    input[type="text"]{
      width:100%;
      padding:12px 14px;
      border:1px solid var(--border);
      border-radius:10px;
      background:#fff;
      color:var(--text);
      font-size:15px;
      outline:none;
      transition:border .15s ease, box-shadow .15s ease, background .15s ease;
    }
    input[type="text"]::placeholder{ color:#cbd5e1; }
    input[type="text"]:hover{ background:#fafafa; }
    input[type="text"]:focus{
      border-color: var(--accent);
      box-shadow: 0 0 0 4px rgba(99,102,241,.15);
      background:#fff;
    }

    .actions{
      display:flex; gap:10px; justify-content:flex-end; margin-top:8px;
    }
    .btn{
      appearance:none; border:none; border-radius:10px;
      padding:10px 16px; font-weight:600; cursor:pointer;
      transition:transform .05s ease, box-shadow .15s ease, background .15s ease, border .15s ease;
      text-decoration:none; display:inline-block;
    }
    .btn:active{ transform: translateY(1px); }
    .btn-primary{
      background: var(--accent); color:#fff;
      box-shadow:0 8px 18px rgba(99,102,241,.25);
    }
    .btn-primary:hover{ box-shadow:0 10px 24px rgba(99,102,241,.32); }
    .btn-ghost{
      background:#fff; color:var(--muted); border:1px solid var(--border);
    }
    .btn-ghost:hover{ color:var(--text); border-color:#cfd8e3; }
  </style>
</head>
<body>
  <div class="card">
    <div class="card-header">
      <h1>Update Book</h1>
    </div>

    <div class="card-body">
      <form:form method="post" action="/library/updateBook/${book.id}" modelAttribute="book">
        <%-- CSRF (no-op if Spring Security isn't present) --%>
        <c:if test="${not empty _csrf}">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </c:if>

        <div class="field">
          <label for="name">Book Name</label>
          <input type="text" id="name" name="name" value="${book.name}" placeholder="Enter book name" required>
        </div>

        <div class="field">
          <label for="author">Author</label>
          <input type="text" id="author" name="author" value="${book.author}" placeholder="Enter author" required>
        </div>

        <div class="field">
          <label for="price">Price</label>
          <input type="text" id="price" name="price" value="${book.price}" placeholder="e.g 100" required>
        </div>

        <div class="actions">
          <a class="btn btn-ghost" href="${listUrl}">Back</a>
          <button type="submit" class="btn btn-primary">Update Book</button>
        </div>
      </form:form>
    </div>
  </div>
</body>
</html>
