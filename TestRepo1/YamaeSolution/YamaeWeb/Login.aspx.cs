using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uc;

public partial class Login : BaseForm
{
    public Login()
    {
        base.IsCheckAuth = false;
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        ((YMasterPage)this.Master).IsDisplayMenu = false;
    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        String userId = this.ユーザーID.GetInternalValue();

        if (String.IsNullOrEmpty(userId))
        {
            return;
        }

        String password = this.パスワード.Text;
        String hostname = Environment.MachineName;

        // パスワードのチェック必要
        DataRowView row = GetHostName();

        if (row == null)
        {
            ConnectionStringSettings connString = ConfigurationManager.ConnectionStrings["mysqlConLocal"];

            BaseSqlDataSource ds = new BaseSqlDataSource();
            ds.Page = this;
            ds.ConnectionString = connString.ConnectionString;
            ds.ProviderName = connString.ProviderName;

            ds.UpdateCommand = @"update `mユーザー` set ホスト名 = @ホスト名 WHERE ユーザーID = @ユーザーID";


            ds.UpdateParameters.Add("ホスト名", hostname);
            ds.UpdateParameters.Add("ユーザーID", userId);

            ds.Update();
        }

        base.UserId = Int32.Parse(userId);
        base.UserName = this.ユーザーID.GetDisplayText();

        Response.Redirect("~/Menu.aspx"); 
    }

    
    protected override void Search()
    {
      


    }

    protected override void ConditionClear()
    {
    }
}
