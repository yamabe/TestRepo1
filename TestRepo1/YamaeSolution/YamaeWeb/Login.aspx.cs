using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : BaseForm
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        String userId = this.ユーザーID.GetInternalValue();
        String password = this.パスワード.Text;

        // パスワードのチェック必要

        base.UserId = Int32.Parse(userId);
        base.UserName = this.ユーザーID.GetDisplayText();

        Response.Redirect("~/Menu.aspx"); 
    }
}