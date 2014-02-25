using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout : BaseForm
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UserId = -1;
        this.UserName = null;

        Response.Redirect("Login.aspx");
    }


    protected override DataView Search()
    {
        return null;
    }

    protected override void ConditionClear()
    {
    }
}