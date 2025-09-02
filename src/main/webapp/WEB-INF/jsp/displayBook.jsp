<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="addUrl" value="/library/addBookForm" />

<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Library — Books</title>
  <style>
    :root{
      --bg:#f6f8fb;
      --card:#ffffff;
      --text:#0f172a;
      --muted:#64748b;
      --border:#e5e7eb;
      --accent:#6366f1; /* indigo */
      --danger:#ef4444;
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
      max-width:1000px;
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
      display:flex; align-items:center; justify-content:space-between; gap:12px;
      flex-wrap:wrap;
    }
    h1{ margin:0; font-size:22px; letter-spacing:.2px; }
    .msg{
      margin:0 22px; margin-top:14px;
      padding:10px 12px; border-radius:10px;
      background:#f1f5f9; color:#334155; border:1px solid var(--border);
      font-size:14px;
    }

    .table-wrap{ padding:22px; overflow-x:auto; }
    table{
      width:100%;
      border-collapse:separate;
      border-spacing:0;
      border:1px solid var(--border);
      border-radius:12px;
      overflow:hidden;
      min-width:720px;
    }
    th, td{
      text-align:left;
      padding:12px 14px;
      border-bottom:1px solid var(--border);
      font-size:14px;
      white-space:nowrap;
    }
    thead th{
      background:#f8fafc;
      color:#334155;
      font-weight:600;
    }
    tbody tr:last-child td{ border-bottom:none; }
    tbody tr:hover{ background:#fafafa; }

    .badge{
      display:inline-block; padding:4px 8px; border-radius:999px;
      font-size:12px; border:1px solid var(--border); color:var(--muted); background:#fff;
    }
    .badge.ok{ color:#16a34a; background:#ecfdf5; border-color:#a7f3d0; }
    .badge.na{ color:#dc2626; background:#fef2f2; border-color:#fecaca; }

    .btn{
      appearance:none; border:none; border-radius:10px;
      padding:10px 14px; font-weight:600; cursor:pointer;
      transition:transform .05s ease, box-shadow .15s ease, background .15s ease, border .15s ease, color .15s ease;
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
    .btn-danger{
      background:#fff; color:var(--danger); border:1px solid #fecaca;
    }
    .btn-danger:hover{ background:#fff5f5; border-color:#fca5a5; }

    .header-actions{ display:flex; gap:10px; }
  </style>
</head>
<body>
  <div class="card">
    <div class="card-header">
      <h1>Welcome to Java Training School Library</h1>
      <div class="header-actions">
        <a class="btn btn-primary" href="${addUrl}">Add a Book</a>
      </div>
    </div>

    <c:if test="${not empty msg}">
      <div class="msg">${msg}</div>
    </c:if>

    <div class="table-wrap">
      <table>
        <thead>
          <tr>
            <th>Id</th>
            <th>Book Name</th>
            <th>Author</th>
            <th>Price</th>
            <th>Status</th>
            <th>Borrow</th>
            <th>Update</th>
            <th>Delete</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach var="book" items="${books}">
          <c:url var="borrowUrl" value="/library/borrowForm/${book.id}" />
          <c:url var="updateUrl" value="/library/updateBookForm/${book.id}" />
          <c:url var="deleteUrl" value="/library/deleteBook/${book.id}" />
          <tr>
            <td>${book.id}</td>
            <td>${book.name}</td>
            <td>${book.author}</td>
            <td>${book.price}</td>
            <td>
              <span class="badge ${book.status == 'available' ? 'ok' : 'na'}">${book.status}</span>
            </td>

            <c:if test="${book.status == 'available'}">
              <td><a class="btn btn-ghost" href="${borrowUrl}">Borrow</a></td>
            </c:if>
            <c:if test="${book.status != 'available'}">
              <td><span class="badge na">Not Available</span></td>
            </c:if>

            <td><a class="btn btn-ghost" href="${updateUrl}">Update</a></td>

            <td>
              <a class="btn btn-danger"
                 href="${deleteUrl}"
                 onclick="return confirm('Are you sure you want to delete this book?');">
                Delete
              </a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>
