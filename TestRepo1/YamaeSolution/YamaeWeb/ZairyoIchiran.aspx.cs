using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ZairyoIchiran : BaseForm
{

    protected void Page_Load(object sender, EventArgs e)
    {
        //this.MainBaseFormView = mainFormView;
        this.MainBaseGridView = mainGridView;
        //this.MainBaseSqlDataSource = mainDataSource;

        //_originalSelectCommand = this.MainBaseSqlDataSource.SelectCommand;
        //_selectCollection = this.MainBaseSqlDataSource.SelectParameters;


        this.MainBaseGridView.Columns.Clear();


        DataTable table = ZairyoManager.Read(this);
        this.MainBaseGridView.DataSource = table;

        //this.MainBaseGridView.Columns.Add(

        foreach (DataColumn c in table.Columns)
        {
            BoundField bf = new BoundField();

            if (c.DataType == typeof(decimal) || c.DataType == typeof(Int32))
            {
                bf.ItemStyle.CssClass = "numeric";

            }
            bf.HeaderText = c.ColumnName;
            bf.DataField = c.ColumnName;

            this.MainBaseGridView.Columns.Add(bf);
        }
        
        this.MainBaseGridView.DataBind();

    }


    protected override void Search()
    {

        //StringBuilder command = new StringBuilder(_originalSelectCommand);
        //this.mainDataSource.SelectParameters.Clear();

        //List<String> where = new List<String>();

        //this.mainDataSource.AddSelectParameterLike(where, "部品コード", 検索部品コード.Text);
        //this.mainDataSource.AddSelectParameterLike(where, "部品名称", 検索部品名称.Text);

        //this.mainDataSource.AddSelectParameter(where, "作成日時", "作成日時開始", "作成日時終了", 検索作成日時開始.Text, 検索作成日時終了.Text);

        //if (検索削除フラグ.Checked)
        //{
        //    this.mainDataSource.AddSelectParameter(where, "削除フラグ", StringUtils.TrueString);
        //}
        //else
        //{
        //    this.mainDataSource.AddSelectParameter(where, "削除フラグ", StringUtils.TrueString, "!=");
        //}

        //if (this.mainDataSource.SelectParameters.Count <= 0)
        //{

        //}
        //else
        //{
        //    command.Append(" where ");

        //    command.Append(StringUtils.Join(where, " and "));
        //}

        //this.mainDataSource.SelectCommand = command.ToString();

        //DataSourceSelectArguments arg = new DataSourceSelectArguments();
        //this.mainDataSource.Select(arg);


    }

    protected override void ConditionClear()
    {
        //検索部品コード.Text = string.Empty;
        //検索部品名称.Text = string.Empty;
        //検索作成日時開始.Text = string.Empty;
        //検索作成日時終了.Text = string.Empty;

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