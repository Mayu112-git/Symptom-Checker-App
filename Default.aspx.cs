using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

// ❗ NO namespace here
public partial class DefaultPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) LoadSymptoms();
    }

    private void LoadSymptoms()
    {
        try
        {
            DataTable dt = SymptomCheckerLogic.GetAllSymptoms();
            cblSymptoms.DataSource = dt;
            cblSymptoms.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write("<div style='color:red;padding:12px;background:#ffe0e0;border:1px solid red;margin:10px;border-radius:6px;'>"
                + "<strong>DB Error:</strong> " + Server.HtmlEncode(ex.Message)
                + "<br/><br/>Steps to fix:<br/>"
                + "1. Run App_Data/SetupDatabase.sql in SQL Server<br/>"
                + "2. Check Web.config connection string</div>");
        }
    }

    protected void btnCheck_Click(object sender, EventArgs e)
    {
        var ids = new List<string>();

        foreach (ListItem item in cblSymptoms.Items)
            if (item.Selected) ids.Add(item.Value);

        if (ids.Count == 0) return;

        Session["SelectedIds"] = string.Join(",", ids);
        Response.Redirect("Result.aspx");
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        foreach (ListItem item in cblSymptoms.Items)
            item.Selected = false;
    }
}