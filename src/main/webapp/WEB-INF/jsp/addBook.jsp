<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Add Book</title>
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
      background:
        radial-gradient(800px 500px at -10% -10%, #c7d2fe40, transparent 40%),
        radial-gradient(900px 600px at 110% 10%, #99f6e440, transparent 45%),
        var(--bg);
      min-height:100vh;
      display:grid;
      place-items:center;
      padding:24px;
    }
    .card{
      width:100%;
      max-width:520px;
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
    h1{
      margin:0;
      font-size:22px;
      letter-spacing:.2px;
    }
    .card-body{ padding:22px; }
    .field{ margin-bottom:16px; }
    label{
      display:block;
      font-size:13px;
      color:var(--muted);
      margin-bottom:6px;
    }
    input[type="text"],
    input[type="number"]{
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
    input::placeholder{ color:#cbd5e1; }
    input:hover{ background:#fafafa; }
    input:focus{
      border-color: var(--accent);
      box-shadow: 0 0 0 4px rgba(99,102,241,.15);
      background:#fff;
    }
    .hint{
      margin-top:6px;
      font-size:12px;
      color:var(--muted);
    }
    .actions{
      display:flex;
      gap:10px;
      justify-content:flex-end;
      padding:0 22px 22px;
    }
    .btn{
      appearance:none;
      border:none;
      border-radius:10px;
      padding:10px 16px;
      font-weight:600;
      cursor:pointer;
      transition:transform .05s ease, box-shadow .15s ease, background .15s ease, border .15s ease;
    }
    .btn:active{ transform: translateY(1px); }
    .btn-primary{
      background: var(--accent);
      color:#fff;
      box-shadow:0 8px 18px rgba(99,102,241,.25);
    }
    .btn-primary:hover{ box-shadow:0 10px 24px rgba(99,102,241,.32); }
    .btn-ghost{
      background:#fff;
      color:var(--muted);
      border:1px solid var(--border);
    }
    .btn-ghost:hover{ color:var(--text); border-color:#cfd8e3; }
  </style>
</head>
<body>
  <div class="card">
    <div class="card-header">
      <h1>Add Book</h1>
    </div>

    <div class="card-body">
      <form method="post" action="/library/addBook" modelAttribute="book" novalidate>
        <div class="field">
          <label for="name">Book Name</label>
          <input type="text" id="name" name="name" placeholder="e.g., The Pragmatic Programmer" required>
        </div>

        <div class="field">
          <label for="author">Author</label>
          <input type="text" id="author" name="author" placeholder="e.g., Andrew Hunt, David Thomas" required>
        </div>

        <div class="field">
          <label for="price">Price</label>
          <input type="number" id="price" name="price" step="0.01" min="0" placeholder="e.g., 9.99" required>
          <div class="hint">Use a decimal value (e.g., 9.99).</div>
        </div>

        <div class="actions">
          <button type="reset" class="btn btn-ghost">Clear</button>
          <button type="submit" class="btn btn-primary">Save Book</button>
        </div>
      </form>
    </div>
  </div>
</body>
</html>
