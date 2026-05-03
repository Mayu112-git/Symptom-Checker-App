using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;

public partial class ResultPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) ShowResults();
    }

    private void ShowResults()
    {
        string idList = Session["SelectedIds"] as string;
        if (string.IsNullOrEmpty(idList))
        {
            Response.Redirect("Default.aspx");
            return;
        }

        var sb = new StringBuilder();

        // --- Selected symptom tags ---
        try
        {
            DataTable symDt = SymptomCheckerLogic.GetSymptomNames(idList);
            sb.Append("<div class='tags-box'>");
            sb.Append("<div class='tags-label'>&#128269; Symptoms You Selected:</div>");
            sb.Append("<div class='tags-wrap'>");
            foreach (DataRow row in symDt.Rows)
                sb.AppendFormat("<span class='tag'>{0}</span>",
                    HttpUtility.HtmlEncode(row["Name"].ToString()));
            sb.Append("</div></div>");
        }
        catch (Exception ex)
        {
            litOutput.Text = "<div style='color:red;padding:10px;background:#ffe0e0;"
                + "border:1px solid red;border-radius:6px;'><strong>DB Error:</strong> "
                + HttpUtility.HtmlEncode(ex.Message) + "</div>";
            return;
        }

        // --- Matched diseases ---
        try
        {
            List<DiseaseResult> results = SymptomCheckerLogic.GetMatchingDiseases(idList, 3);

            if (results.Count == 0)
            {
                sb.Append("<div class='no-results'>");
                sb.Append("<div class='icon'>&#128269;</div>");
                sb.Append("<h3>No Matching Diseases Found</h3>");
                sb.Append("<p>Try selecting more symptoms and check again.</p>");
                sb.Append("</div>");
            }
            else
            {
                sb.Append("<div class='card-title' style='margin-bottom:14px;'>&#127973; Possible Conditions</div>");
                int rank = 1;
                foreach (DiseaseResult dr in results)
                {
                    sb.Append("<div class='disease-card'>");

                    // Header
                    sb.Append("<div class='d-header'>");
                    sb.AppendFormat("<div class='rank-badge'>{0}</div>", rank);
                    sb.AppendFormat("<div class='d-name'>{0}</div>",
                        HttpUtility.HtmlEncode(dr.Name));
                    sb.AppendFormat("<span class='match-badge {0}'>{1}/{2} symptoms ({3}%)</span>",
                        dr.BadgeClass, dr.MatchCount, dr.TotalSymptoms, dr.MatchPercent);
                    sb.Append("</div>");

                    // Body
                    sb.Append("<div class='d-body'>");

                    // Progress bar
                    sb.AppendFormat(
                        "<div class='bar-wrap'><div class='bar-fill' style='width:{0}%'></div></div>",
                        dr.MatchPercent);

                    // Description
                    sb.Append("<div class='sec-label'>Description</div>");
                    sb.AppendFormat("<div class='sec-text'>{0}</div>",
                        HttpUtility.HtmlEncode(dr.Description));

                    // Precautions
                    sb.Append("<div class='sec-label'>Recommended Precautions</div>");
                    sb.Append("<ul class='prec-list'>");
                    foreach (string p in dr.PrecautionList)
                        sb.AppendFormat("<li>{0}</li>", HttpUtility.HtmlEncode(p));
                    sb.Append("</ul>");

                    sb.Append("</div></div>"); // d-body, disease-card
                    rank++;
                }
            }

            // Disclaimer
            sb.Append("<div class='disclaimer'>");
            sb.Append("<strong>&#9888; Medical Disclaimer</strong>");
            sb.Append("This tool is for <strong>educational purposes only</strong>. ");
            sb.Append("Always consult a qualified doctor for any medical concerns.");
            sb.Append("</div>");
        }
        catch (Exception ex)
        {
            sb.AppendFormat(
                "<div style='color:red;padding:10px;background:#ffe0e0;"
                + "border:1px solid red;border-radius:6px;'>Error: {0}</div>",
                HttpUtility.HtmlEncode(ex.Message));
        }

        litOutput.Text = sb.ToString();
    }
}
