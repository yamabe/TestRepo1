using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MZairyoZokusei : BaseForm
{

    protected void Page_Load(object sender, EventArgs e)
    {
        this.MainBaseFormView = mainFormView;
        this.MainBaseGridView = mainGridView;
        this.MainBaseSqlDataSource = mainDataSource;

        _originalSelectCommand = this.MainBaseSqlDataSource.SelectCommand;
        _selectCollection = this.MainBaseSqlDataSource.SelectParameters;

        //this.検索有効フラグ.Checked = true;

    }

    protected void mainDataSource_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        // 更新前処理。自動で値を設定するなどはここ。
        //Parameter status = this.mainDataSource.UpdateParameters["ステータス"];
        //e.Command.Parameters["ステータス"].Value = new RyousanSireiStatusChecker().Get(e);

        int v材料メーカー = (int)e.Command.Parameters["材料メーカー"].Value;
        int v材質大分類 = (int)e.Command.Parameters["材質大分類"].Value;
        int v材質 = (int)e.Command.Parameters["材質"].Value;
        string v材料名称 = (string)e.Command.Parameters["original_材料名称"].Value;
        string v材料名称New = (string)e.Command.Parameters["材料名称"].Value;
        ZairyoUpdater.Update材料価格(this, v材料メーカー, v材質大分類, v材質, v材料名称, v材料名称New);


    }
    protected void mainDataSource_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        // 追加前処理。自動で値を設定するなどはここ。
        //Parameter status = this.mainDataSource.UpdateParameters["ステータス"];
        //e.Command.Parameters["ステータス"].Value = new RyousanSireiStatusChecker().Get(e);

    }

    protected override void Search()
    {
        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        StringBuilder command = new StringBuilder(_originalSelectCommand);
        this.mainDataSource.SelectParameters.Clear();

        List<String> where = new List<String>();

        this.mainDataSource.AddSelectParameterLike(where, "材料名称", 検索材料名称.Text);
        this.mainDataSource.AddSelectParameter(where, "材料メーカー", 検索材料メーカー.GetInternalValue());
        this.mainDataSource.AddSelectParameter(where, "材質大分類", 検索材質大分類.GetInternalValue());
        this.mainDataSource.AddSelectParameter(where, "材質", 検索材質.GetInternalValue());

        if (検索削除フラグ.Checked)
        {
            this.mainDataSource.AddSelectParameter(where, "削除フラグ", StringUtils.TrueString);
        }


        if (this.mainDataSource.SelectParameters.Count <= 0)
        {

        }
        else
        {
            command.Append(" where ");
            command.Append(StringUtils.Join(where, " and "));
        }

        this.mainDataSource.OrderBy = 順序.GetInternalValue();

        this.mainDataSource.SelectCommand = command.ToString();
        this.mainDataSource.Select(arg);
        this.mainDataSource.DataBind();
    }

    protected override void ConditionClear()
    {
        検索材料名称.Text = String.Empty;
        検索材料メーカー.SelectedIndex = 0;
        検索材質大分類.SelectedIndex = 0;
        検索材質.SelectedIndex = 0;
        検索削除フラグ.Checked = false;
    }
}