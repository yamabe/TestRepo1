using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Delete : BaseForm
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string s = Request["FILE_NAME"] as String;

        s = HttpUtility.UrlDecode(s);

        FileInfo fi = new FileInfo(s);
        if (fi.Exists)
        {
            fi.Delete();
        }
    }



    protected override void Search()
    {
    }

    protected override void ConditionClear()
    {
    }
}