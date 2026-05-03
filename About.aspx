<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="AboutPage" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About - Symptom Checker</title>
    <link rel="stylesheet" href="CSS/Style.css" />
</head>
<body>
<nav class="navbar">
    <a href="Default.aspx" class="navbar-brand">&#128298; Symptom Checker</a>
    <div class="navbar-links">
        <a href="Default.aspx">Home</a>
        <a href="About.aspx">About</a>
    </div>
</nav>
<div class="page-wrapper">
    <div class="page-header"><h1>About This Application</h1></div>
    <div class="card">
        <div class="card-title">Technology Stack</div>
        <ul style="padding-left:20px;color:#475569;font-size:14px;line-height:2.2;">
            <li><strong>Frontend:</strong> ASP.NET Web Forms + HTML5 + CSS3</li>
            <li><strong>Backend:</strong> C# (.NET Framework 4.7.2)</li>
            <li><strong>Database:</strong> SQL Server LocalDB (fully offline)</li>
        </ul>
    </div>
    <div class="card">
        <div class="card-title">Disclaimer</div>
        <div class="disclaimer" style="margin-top:0;">
            <strong>For Educational Purposes Only</strong>
            Not a substitute for real medical advice. Always consult a doctor.
        </div>
    </div>
    <div class="btn-row"><a href="Default.aspx" class="btn btn-primary">&#8592; Back to Home</a></div>
</div>
<div class="footer">&copy; 2024 Symptom Checker | Educational Use Only</div>
</body>
</html>
