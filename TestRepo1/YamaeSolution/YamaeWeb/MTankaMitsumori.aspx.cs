﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uc;

public partial class MTankaMitsumori : BaseForm
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
    protected void 検索_Click(object sender, EventArgs e)
    {
        StringBuilder command = new StringBuilder(_originalSelectCommand);
        this.mainDataSource.SelectParameters.Clear();

        List<String> where = new List<String>();

        this.mainDataSource.AddSelectParameterLike(where, "部品コード", 検索部品コード.Text);
        this.mainDataSource.AddSelectParameterLike(where, "部品名称", 検索部品名称.Text);

        if (this.mainDataSource.SelectParameters.Count <= 0)
        {

        }
        else
        {
            command.Append(" where ");

            command.Append(StringUtils.Join(where, " and "));
        }

        this.mainDataSource.SelectCommand = command.ToString();

        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        this.mainDataSource.Select(arg);
    }
    protected void Clear_Click(object sender, EventArgs e)
    {

    }
    protected void 材料ID_SelectedIndexChanged(object sender, EventArgs e)
    {
        YDropDownList ddl = (YDropDownList)sender;
       

        String 材料ID = ddl.GetInternalValue();

        String SelectCommand = 材料DataSource.SelectCommand;
        ParameterCollection SelectCollection = 材料DataSource.SelectParameters;

        List<String> where = new List<String>();
        where.Add(SelectCommand);
        材料DataSource.AddSelectParameterLike(where, "t1.材料ID", 材料ID);

        StringBuilder command = new StringBuilder();
        command.Append(StringUtils.Join(where, " and "));

        this.材料DataSource.SelectCommand = command.ToString();

        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        DataView view = (DataView)this.材料DataSource.Select(arg);
        DataTable table = view.ToTable();

        DataRow row = table.Rows[0];

        ((YTextBox)mainFormView.FindControl("材料名称")).Text = row["材料名称"].ToString();
        ((YTextBox)mainFormView.FindControl("材質大分類")).Text = row["材質大分類"].ToString();
        ((YTextBox)mainFormView.FindControl("材質")).Text = row["材質"].ToString();
        ((YTextBox)mainFormView.FindControl("定尺寸法縦")).Text = row["定尺寸法縦"].ToString();
        ((YTextBox)mainFormView.FindControl("定尺寸法横")).Text = row["定尺寸法横"].ToString();
        ((YTextBox)mainFormView.FindControl("厚み")).Text = row["厚み"].ToString();
        ((YTextBox)mainFormView.FindControl("定尺仕入金額")).Text = row["定尺仕入金額"].ToString();
        ((YTextBox)mainFormView.FindControl("定尺売り金額")).Text = row["定尺売り金額"].ToString();
        
        材料DataSource.SelectCommand = SelectCommand;
        材料DataSource.SelectParameters.Clear();
        this.材料DataSource.Select(arg);

    }
    protected void 材料ID_TextChanged(object sender, EventArgs e)
    {
        String s = string.Empty;
    }
}