﻿using MySql.Data.MySqlClient;
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

    protected void Page_Load(object sender, EventArgs e)
    {
        this.MainBaseFormView = mainFormView;
        this.MainBaseGridView = mainGridView;
        this.MainBaseSqlDataSource = mainDataSource;

        _originalSelectCommand = this.MainBaseSqlDataSource.SelectCommand;
        _selectCollection = this.MainBaseSqlDataSource.SelectParameters;

        if (!IsPostBack)
        {
            this.検索有効フラグ.Checked = true;
        }

    }

    protected void mainDataSource_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        // 更新前処理。自動で値を設定するなどはここ。
        //Parameter status = this.mainDataSource.UpdateParameters["ステータス"];
        //e.Command.Parameters["ステータス"].Value = new RyousanSireiStatusChecker().Get(e);

        int v材料メーカー = (int)e.Command.Parameters["材料メーカー"].Value;
        int v材質大分類 = int.Parse(e.Command.Parameters["材質大分類"].Value.ToString());
        int v材質 = int.Parse(e.Command.Parameters["材質"].Value.ToString());
        string v材料名称 = (string)e.Command.Parameters["original_材料名称"].Value;
        string v材料名称New = (string)e.Command.Parameters["材料名称"].Value;

        DsWrapper wrapper = new DsWrapper(this);
        Dictionary<String, String> param = new Dictionary<string, string>();
        param.Add("材料名称", v材料名称);
        DataView view = wrapper.Select("select * from m材料価格 where 材料名称 = @材料名称", string.Empty, param);

        if (view.Count > 1)
        {
            v材料名称New = v材料名称;
        }

        ZairyoUpdater.Update材料属性(this, v材料メーカー, v材質大分類, v材質, v材料名称, v材料名称New);

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

        this.mainDataSource.AddSelectParameterLike(where, "材料名称", 検索材料名称.Text);
        this.mainDataSource.AddSelectParameter(where, "材料属性ID", 検索材料属性ID.GetInternalValue());
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
        }

        this.mainDataSource.OrderBy = 順序.GetInternalValue();

        this.mainDataSource.SelectCommand = command.ToString();
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

        }
        else
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
            int lastInsertId = ds.LastInsertId;

            //材料属性DataSource.EnableCaching = false;
            //材料属性DataSource.CacheDuration = 0;
            //材料属性DataSource.EnableViewState = false;
            //DataView v2 = (DataView)材料属性DataSource.Select(arg);
            //材料属性DataSource.DataBind();


            YDropDownList ddl属性ID = ((YDropDownList)mainFormView.FindControl("材料属性ID"));
            ListItem item = new ListItem();
            item.Value = lastInsertId.ToString();
            item.Text = ((YTextBox)mainFormView.FindControl("材料名称")).Text;
            ddl属性ID.Items.Add(item);
            //ddl属性ID.DataSourceID = null;
            //ddl属性ID.DataSource = v2;
            //ddl属性ID.DataBind();
            //object o = ddl属性ID.Items;
            //((YDropDownList)mainFormView.FindControl("材料属性ID")).DataBind();


        }

    }
}