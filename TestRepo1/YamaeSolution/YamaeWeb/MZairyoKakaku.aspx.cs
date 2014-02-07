using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uc;

public partial class MZairyo : BaseForm
{
    private String _originalSelectCommand = string.Empty;
    private ParameterCollection _selectCollection;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.MainBaseFormView = mainFormView;
        this.MainBaseGridView = mainGridView;
        this.MainBaseSqlDataSource = mainDataSource;

        _originalSelectCommand = this.MainBaseSqlDataSource.SelectCommand;
        _selectCollection = this.MainBaseSqlDataSource.SelectParameters;

        this.検索有効フラグ.Checked = true;

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
        else
        {
            this.mainDataSource.AddSelectParameter(where, "削除フラグ", StringUtils.TrueString, "!=");
        }
        if (検索有効フラグ.Checked)
        {
            this.mainDataSource.AddSelectParameter(where, "有効フラグ", StringUtils.TrueString);
        }
        else
        {
            this.mainDataSource.AddSelectParameter(where, "有効フラグ", StringUtils.TrueString, "!=");
        }


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
        //検索削除フラグ.Checked = false;
        //検索作成ユーザー.SelectedIndex = 0;
        //検索最終更新ユーザー.SelectedIndex = 0;
    }
    protected void 検索_Click(object sender, EventArgs e)
    {
        Search();
    }


    protected void Clear_Click(object sender, EventArgs e)
    {
        ConditionClear();
        Search();

        this.mainGridView.PageIndex = 0;
    }

    protected void 材料属性に追加_Click(object sender, EventArgs e)
    {
        String v材料名称 = ((YTextBox)mainFormView.FindControl("材料名称")).Text;

        BaseSqlDataSource ds = new BaseSqlDataSource();
        ds.ConnectionString = MainBaseSqlDataSource.ConnectionString;
        ds.ProviderName = MainBaseSqlDataSource.ProviderName;
        ds.Page = this;
        ds.SelectCommand = "select * from M材料属性 where 材料名称 = @材料名称";
        ds.SelectParameters.Add("材料名称", v材料名称);
        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        DataView view = (DataView)ds.Select(arg);
        //DataTable table = view.ToTable();

        //MySqlConnection con = new MySqlConnection(MainBaseSqlDataSource.ConnectionString);
        //MySqlCommand cmd = new MySqlCommand();
        //cmd.Connection = con;
        //con.Open();
        //cmd.CommandText = "select * from M材料属性 where 材料名称 = @材料名称"; ;
        //cmd.Parameters.AddWithValue("材料名称", v材料名称);
        //cmd.Prepare();
        //MySqlDataReader reader = cmd.ExecuteReader();

        if (view.Count > 0)
        {

        }else 
        {
            ds.InsertCommand = "insert into M材料属性(材料名称,材料メーカー,材質大分類,材質,耐寒,耐熱,難燃性,削除フラグ,作成ユーザー,最終更新ユーザー,作成日時,最終更新日時) values(@材料名称,@材料メーカー,@材質大分類,@材質,@耐寒,@耐熱,@難燃性,@削除フラグ,@作成ユーザー,@最終更新ユーザー,current_timestamp,current_timestamp);";
            ds.InsertParameters.Add("材料名称", ((YTextBox)mainFormView.FindControl("材料名称")).Text);
            ds.InsertParameters.Add("材料メーカー", ((YDropDownList)mainFormView.FindControl("材料メーカー")).GetInternalValue());
            ds.InsertParameters.Add("材質大分類", ((YDropDownList)mainFormView.FindControl("材質大分類")).GetInternalValue());
            ds.InsertParameters.Add("材質", ((YDropDownList)mainFormView.FindControl("材質")).GetInternalValue());
            //ds.InsertParameters.Add("耐寒", ((YTextBox)mainFormView.FindControl("耐寒")).Text);
            //ds.InsertParameters.Add("耐熱", ((YTextBox)mainFormView.FindControl("耐熱")).Text);
            //ds.InsertParameters.Add("難燃性", ((YTextBox)mainFormView.FindControl("難燃性")).Text);
            ds.InsertParameters.Add("削除フラグ", Boolean.FalseString);
            ds.InsertParameters.Add("作成ユーザー", ((YDropDownList)mainFormView.FindControl("作成ユーザー")).GetInternalValue());
            ds.InsertParameters.Add("最終更新ユーザー", ((YDropDownList)mainFormView.FindControl("最終更新ユーザー")).GetInternalValue());
            ds.InsertParameters.Add("作成日時", ((YTextBox)mainFormView.FindControl("作成日時")).Text);
            ds.InsertParameters.Add("最終更新日時", ((YTextBox)mainFormView.FindControl("最終更新日時")).Text);

            ds.Insert();
            材料属性DataSource.EnableCaching = false;
            材料属性DataSource.CacheDuration = 0;
            DataView v2 = (DataView)材料属性DataSource.Select(arg);
            材料属性DataSource.EnableViewState = false;
            
            材料属性DataSource.DataBind();
            ((YDropDownList)mainFormView.FindControl("材料属性ID")).DataBind();

            String s = string.Empty;
            
            //材料属性DataSource.EnableCaching = true;

        }

    }
}