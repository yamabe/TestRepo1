using System;
using System.Collections.Generic;
using System.Text;
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
        _originalSelectCommand = this.MainBaseSqlDataSource.SelectCommand;
        _selectCollection = this.MainBaseSqlDataSource.SelectParameters;
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

    protected override void Search()
    {
        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        StringBuilder command = new StringBuilder(_originalSelectCommand);
        this.mainDataSource.SelectParameters.Clear();

        List<String> where = new List<String>();

        //this.mainDataSource.AddSelectParameterLike(where, "ステータス", 検索ステータス.Text);
        //this.mainDataSource.AddSelectParameterLike(where, "得意先", 検索得意先.Text);
        //this.mainDataSource.AddSelectParameterLike(where, "規格番号", 検索規格番号.Text);
        //this.mainDataSource.AddSelectParameterLike(where, "材料名", 検索材料名.Text);
        //this.mainDataSource.AddSelectParameterLike(where, "No", 検索No.Text);
        //if (検索山恵フラグ.Checked)
        //{
        //    this.mainDataSource.AddSelectParameter(where, "山恵フラグ", StringUtils.TrueString);
        //}
        //this.mainDataSource.AddSelectParameter(where, "仕入れ先", 検索仕入れ先.GetInternalValue());
        //this.mainDataSource.AddSelectParameter(where, "材料メーカー", 検索材料メーカー.GetInternalValue());
        //this.mainDataSource.AddSelectParameter(where, "材質", 検索材質.GetInternalValue());
        //this.mainDataSource.AddSelectParameter(where, "M材料_材料ID", 検索M材料_材料ID.GetInternalValue());
        if (検索削除フラグ.Checked)
        {
            this.mainDataSource.AddSelectParameter(where, "削除フラグ", StringUtils.TrueString);
        }
        else
        {
            this.mainDataSource.AddSelectParameter(where, "削除フラグ", StringUtils.TrueString, "!=");
        }

        //this.mainDataSource.AddSelectParameter(where, "作成ユーザー", 検索作成ユーザー.GetInternalValue());
        //this.mainDataSource.AddSelectParameter(where, "最終更新ユーザー", 検索最終更新ユーザー.GetInternalValue());

        if (this.mainDataSource.SelectParameters.Count <= 0)
        {

        }
        else
        {
            command.Append(" where ");
            command.Append(StringUtils.Join(where, " and "));
        }

        this.mainDataSource.SelectCommand = command.ToString();
        this.mainDataSource.Select(arg);
        this.mainDataSource.DataBind();


    }

    protected override void ConditionClear()
    {
        //検索ステータス.Text = String.Empty;
        //検索得意先.SelectedIndex = 0;
        //検索規格番号.Text = String.Empty;
        //検索材料名.Text = String.Empty;
        //検索No.Text = String.Empty;
        //検索山恵フラグ.Checked = false;
        //検索仕入れ先.SelectedIndex = 0;
        //検索材料メーカー.SelectedIndex = 0;
        //検索材質.SelectedIndex = 0;
        //検索M材料_材料ID.SelectedIndex = 0;
        検索削除フラグ.Checked = false;
        //検索作成ユーザー.SelectedIndex = 0;
        //検索最終更新ユーザー.SelectedIndex = 0;
    }

}