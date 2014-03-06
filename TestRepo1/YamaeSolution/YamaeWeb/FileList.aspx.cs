using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FileList : BaseForm
{

    protected void Page_Load(object sender, EventArgs e)
    {
        this.MainBaseFormView = mainFormView;
        this.MainBaseGridView = mainGridView;
        this.MainBaseSqlDataSource = mainDataSource;

        this.MainBaseGridView.RowDataBound += MainBaseGridView_RowDataBound;


    }

    void MainBaseGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView o = e.Row.DataItem as DataRowView;
            String func = string.Format(
                    "rowClick({0});return false;", o["ファイルID"]);
            e.Row.Attributes.Add("OnClick", func);


            // reference the Delete LinkButton
            LinkButton db = (LinkButton)e.Row.Cells[0].Controls[0];

            db.OnClientClick = func;
        }
    }

    protected void mainDataSource_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
    }
    protected void mainDataSource_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        // 追加前処理。自動で値を設定するなどはここ。
        //Parameter status = this.mainDataSource.UpdateParameters["ステータス"];
        //e.Command.Parameters["ステータス"].Value = new RyousanSireiStatusChecker().Get(e);

    }

    protected override DataView Search()
    {
        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        StringBuilder command = new StringBuilder(_originalSelectCommand);
        this.mainDataSource.SelectParameters.Clear();

        List<String> where = new List<String>();

        //this.mainDataSource.AddSelectParameterLike(where, "材料名称", 検索材料名称.Text);
        //this.mainDataSource.AddSelectParameter(where, "材料属性ID", 検索材料属性ID.GetInternalValue());
        //this.mainDataSource.AddSelectParameter(where, "材料メーカー", 検索材料メーカー.GetInternalValue());
        //this.mainDataSource.AddSelectParameter(where, "材質大分類", 検索材質大分類.GetInternalValue());
        //this.mainDataSource.AddSelectParameter(where, "材質", 検索材質.GetInternalValue());

        //if (検索削除フラグ.Checked)
        //{
        //    this.mainDataSource.AddSelectParameter(where, "削除フラグ", StringUtils.TrueString);
        //}
        //else
        //{
        //    this.mainDataSource.AddSelectParameter(where, "削除フラグ", StringUtils.TrueString, "!=");
        //}
        //if (検索有効フラグ.Checked)
        //{
        //    this.mainDataSource.AddSelectParameter(where, "有効フラグ", StringUtils.TrueString);
        //}
        //else
        //{
        //    this.mainDataSource.AddSelectParameter(where, "有効フラグ", StringUtils.TrueString, "!=");
        //}


        if (this.mainDataSource.SelectParameters.Count <= 0)
        {

        }
        else
        {
            command.Append(" where ");
            command.Append(StringUtils.Join(where, " and "));
            this.mainDataSource.SelectCommand = command.ToString();
        }

        //this.mainDataSource.OrderBy = 順序.GetInternalValue();

        DataView view = this.mainDataSource.Select(arg) as DataView;
        this.mainDataSource.DataBind();

        return view;
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
        //検索削除フラグ.Checked = false;
        //検索作成ユーザー.SelectedIndex = 0;
        //検索最終更新ユーザー.SelectedIndex = 0;
    }



}