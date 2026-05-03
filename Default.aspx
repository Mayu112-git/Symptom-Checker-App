<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="DefaultPage" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Symptom Checker</title>
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
        <h1>Check Your Symptoms</h1>
        <p>Select all symptoms you are experiencing and click <strong>Check Disease</strong>.</p>
    </div>
    <form id="form1" runat="server">
        <div class="card">
            <div class="card-title">Select Your Symptoms</div>
            <div class="alert" id="alertMsg">Please select at least one symptom.</div>
            <div class="qc">
                <button type="button" class="link-btn" onclick="selAll()">Select All</button>
                <button type="button" class="link-btn" onclick="clrAll()">Clear All</button>
                <span class="count-pill"><span id="cnt">0</span> selected</span>
            </div>
            <div class="symptom-grid">
                <asp:CheckBoxList ID="cblSymptoms" runat="server"
                    RepeatLayout="Flow"
                    DataTextField="Name"
                    DataValueField="SymptomId" />
            </div>
            <div class="btn-row">
                <asp:Button ID="btnCheck" runat="server" Text="Check Disease"
                    CssClass="btn btn-primary"
                    OnClick="btnCheck_Click"
                    OnClientClick="return validate()" />
                <asp:Button ID="btnReset" runat="server" Text="Reset"
                    CssClass="btn btn-secondary"
                    OnClick="btnReset_Click"
                    CausesValidation="false" />
            </div>
        </div>
        <div class="card">
            <div class="card-title">How It Works</div>
            <ol style="padding-left:20px;color:#475569;font-size:14px;line-height:2.1;">
                <li>Tick every symptom you currently have.</li>
                <li>Click <strong>Check Disease</strong>.</li>
                <li>Top 3 best-matched diseases are shown with precautions.</li>
            </ol>
        </div>
    </form>
</div>
<div class="footer">&copy; 2024 Symptom Checker | Offline | Educational Use Only</div>
<script type="text/javascript">
    function getCBs(){return document.querySelectorAll('[id*="cblSymptoms"] input[type="checkbox"]');}
    function updateCnt(){var n=0;getCBs().forEach(function(c){if(c.checked)n++;});document.getElementById('cnt').textContent=n;}
    function validate(){var a=false;getCBs().forEach(function(c){if(c.checked)a=true;});if(!a){document.getElementById('alertMsg').classList.add('show');return false;}document.getElementById('alertMsg').classList.remove('show');return true;}
    function selAll(){getCBs().forEach(function(c){c.checked=true;});updateCnt();}
    function clrAll(){getCBs().forEach(function(c){c.checked=false;});updateCnt();document.getElementById('alertMsg').classList.remove('show');}
    window.addEventListener('load',function(){getCBs().forEach(function(c){c.addEventListener('change',updateCnt);});updateCnt();});
</script>
</body>
</html>
