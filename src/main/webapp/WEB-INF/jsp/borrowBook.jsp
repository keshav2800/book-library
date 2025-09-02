<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Borrow Book</title>
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
      max-width:720px;
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
      display:flex; align-items:center; justify-content:space-between;
    }
    h1{ margin:0; font-size:22px; letter-spacing:.2px; }
    .status{
      font-size:12px; color:var(--muted);
    }
    .badge{
      display:inline-block;
      padding:4px 8px;
      border-radius:999px;
      font-size:12px;
      border:1px solid var(--border);
      color:var(--muted);
      background:#fff;
    }
    .card-body{ padding:22px; }

    /* Table */
    table{
      width:100%;
      border-collapse:separate;
      border-spacing:0;
      border:1px solid var(--border);
      border-radius:12px;
      overflow:hidden;
    }
    th, td{
      text-align:left;
      padding:12px 14px;
      border-bottom:1px solid var(--border);
      font-size:14px;
    }
    thead th{
      background:#f8fafc;
      color:#334155;
      font-weight:600;
    }
    tbody tr:last-child td{ border-bottom:none; }
    tbody tr:hover{ background:#fafafa; }

    .form-row{
      display:flex; gap:14px; align-items:flex-end; margin-top:18px;
      flex-wrap:wrap;
    }
    label{
      display:block; font-size:13px; color:var(--muted); margin-bottom:6px;
    }
    input[type="number"]{
      width:180px;
      padding:12px 14px;
      border:1px solid var(--border);
      border-radius:10px;
      background:#fff;
      color:var(--text);
      font-size:15px;
      outline:none;
      transition:border .15s ease, box-shadow .15s ease, background .15s ease;
    }
    input[type="number"]:hover{ background:#fafafa; }
    input[type="number"]:focus{
      border-color: var(--accent);
      box-shadow: 0 0 0 4px rgba(99,102,241,.15);
      background:#fff;
    }
    .hint{ font-size:12px; color:var(--muted); margin-top:6px; }

    .actions{
      display:flex; gap:10px; justify-content:flex-end; margin-top:18px;
    }
    .btn{
      appearance:none; border:none; border-radius:10px;
      padding:10px 16px; font-weight:600; cursor:pointer;
      transition:transform .05s ease, box-shadow .15s ease, background .15s ease, border .15s ease;
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
      <h1>Borrow Book</h1>
      <div class="status">
        Status:
        <span class="badge">${book.status}</span>
      </div>
    </div>

    <div class="card-body">
      <form:form method="post" action="/library/borrowBook/${book.id}">
        <table>
          <thead>
            <tr>
              <th>Id</th>
              <th>Book Name</th>
              <th>Author</th>
              <th>Price</th>
              <th>Current Status</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>${book.id}</td>
              <td>${book.name}</td>
              <td>${book.author}</td>
              <td>${book.price}</td>
              <td>${book.status}</td>
            </tr>
          </tbody>
        </table>

        <div class="form-row">
          <div>
            <label for="days">Borrow Days</label>
            <input type="number" id="days" name="days" min="1" step="1" placeholder="e.g., 7" required />
            <div class="hint">Enter how many days you want to borrow (minimum 1).</div>
          </div>

          <div class="actions">
            <button type="reset" class="btn btn-ghost">Clear</button>
            <button type="submit" class="btn btn-primary">Borrow</button>
          </div>
        </div>
      </form:form>
    </div>
  </div>
</body>
</html>
