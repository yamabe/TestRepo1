using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MTankaMitsumori : BaseForm
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.MainBaseFormView = mainFormView;
        this.MainBaseGridView = mainGridView;
        this.MainBaseSqlDataSource = mainDataSource;
    }

    protected void mainDataSource_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        // 更新前処理。自動で値を設定するなどはここ。
        //Parameter status = this.mainDataSource.UpdateParameters["ステータス"];
        //e.Command.Parameters["ステータス"].Value = new RyousanSireiStatusChecker().Get(e);
    }
    protected void mainDataSource_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        // 追加前処理。自動で値を設定するなどはここ。
        //Parameter status = this.mainDataSource.UpdateParameters["ステータス"];
        //e.Command.Parameters["ステータス"].Value = new RyousanSireiStatusChecker().Get(e);

    }
}