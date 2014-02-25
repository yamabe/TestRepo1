using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Download : BaseForm
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string s = Request["FILE_NAME"] as String;

        s = HttpUtility.UrlDecode(s);

        String path = Path.GetFileName(s);

        FileInfo fi = new FileInfo(s);
        if (fi.Exists)
        {
            if (fi.Extension.ToLower() == ".pdf")
            {
                WebClient client = new WebClient();
                Byte[] buffer = client.DownloadData(s);
                if (buffer != null)
                {
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-length", buffer.Length.ToString());
                    Response.BinaryWrite(buffer);
                }
            }
            else
            {
                this.Page.Response.ContentType = "application/octet-stream";

                this.Page.Response.AddHeader("Content-Disposition", "attachment; filename=" + fi.Name);
                this.Page.Response.Flush();
                this.Page.Response.WriteFile(fi.FullName);
                this.Page.Response.End();
            }

        }

    }

    protected override DataView Search()
    {
        return null;
    }

    protected override void ConditionClear()
    {
    }

}