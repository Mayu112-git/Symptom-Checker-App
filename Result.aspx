<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Result.aspx.cs" Inherits="ResultPage" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Symptom Checker - Results</title>
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
    <div class="page-header">
        <h1>Diagnosis Results</h1>
        <p>Based on your selected symptoms, here are the most likely conditions.</p>
    </div>
    <form id="form1" runat="server">
        <asp:Literal ID="litOutput" runat="server" />
        <div class="btn-row" style="margin-top:20px;">
            <a href="Default.aspx" class="btn btn-primary">&#8592; Check Again</a>
        </div>
    </form>
</div>
<div class="footer">&copy; 2024 Symptom Checker | Offline | Educational Use Only</div>
</body>
</html>
