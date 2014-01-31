using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uc;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        String connectionString = "Database=yamabe_system;Data Source=192.168.43.66;Port=8889;User Id=root;Password=root";

        connectionString = ConfigurationManager.ConnectionStrings["mysqlConLocal"].ConnectionString;

        

        using (MySqlConnection con = new MySql.Data.MySqlClient.MySqlConnection(connectionString))
        {
            con.Open();
        }
    }
    protected void mainDataSource_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        // 更新前処理。自動で値を設定するなどはここ。
        Parameter status = this.mainDataSource.UpdateParameters["ステータス"];
        e.Command.Parameters["ステータス"].Value = new RyousanSireiStatusChecker().Get(e);
    }
    protected void mainDataSource_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        // 削除前処理。
        String ss = string.Empty;

    }
    protected void mainDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        // 行追加後処理。
        String ss = string.Empty;

    }
    protected void mainDataSource_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        // 追加前処理。自動で値を設定するなどはここ。
        Parameter status = this.mainDataSource.UpdateParameters["ステータス"];
        e.Command.Parameters["ステータス"].Value = new RyousanSireiStatusChecker().Get(e);

    }
    protected void mainDataSource_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        // 行更新後処理。
        String ss = string.Empty;

        //mainGridView.EditIndex = -1;
        //mainFormView.ChangeMode(FormViewMode.ReadOnly);
    }
    protected void mainGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        // グリッドの編集モード開始時
        //mainFormView.PageIndex = e.NewEditIndex;

        //mainFormView.ChangeMode(FormViewMode.Edit);
    }
    protected void mainGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = Int32.Parse((String)e.CommandArgument);
        if (rowIndex < 0)
        {
            return;
        }

        if (e.CommandName == "ShowDetailUpdate")
        {
            mainFormView.PageIndex = rowIndex;
            mainFormView.ChangeMode(FormViewMode.Edit);
        }
    }
}