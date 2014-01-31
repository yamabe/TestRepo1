using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MCompany : BaseForm
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

        Parameter status = this.mainDataSource.UpdateParameters["得意先"];
        String s = status.DefaultValue;
    }
    protected void mainDataSource_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        // 追加前処理。自動で値を設定するなどはここ。
        //Parameter status = this.mainDataSource.UpdateParameters["ステータス"];
        //e.Command.Parameters["ステータス"].Value = new RyousanSireiStatusChecker().Get(e);

    }

    //public bool ConvertToBoolean(object myValue)
    //{
    //    if (myValue == null)
    //    {
    //        return false;
    //    }

    //    bool ret = false;

    //    if (Boolean.TryParse(myValue.ToString(), out ret))
    //    {
    //        return ret;
    //    }

    //    return ret;
    //}
}