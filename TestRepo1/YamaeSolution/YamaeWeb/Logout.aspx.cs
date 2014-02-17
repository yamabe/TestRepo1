using System;
using System.Collections.Generic;
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


    protected override void Search()
    {



    }

    protected override void ConditionClear()
    {
    }
}