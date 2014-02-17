using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uc;

public partial class MTankaMitsumori : BaseForm
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


        YFileUpload file = ((YFileUpload)mainFormView.FindControl("図面ファイル"));

        if (file.HasFile)
        {
            String path = FileUtils.GetZumenFileFullPath(e.Command.Parameters["original_単価ID"].Value.ToString(), e.Command.Parameters["部品コード"].Value.ToString(), file.FileName, true);

            file.SaveAs(path);

        }


       YFileUpload file2 = ((YFileUpload)mainFormView.FindControl("参考資料"));
       if (file2.HasFile)
       {
           String path = FileUtils.GetTankaData参考資料FileFullPath(e.Command.Parameters["original_単価ID"].Value.ToString(), file2.FileName, true);
           file2.SaveAs(path);
       }

    }
    protected void mainDataSource_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        // 追加前処理。自動で値を設定するなどはここ。
        //Parameter status = this.mainDataSource.UpdateParameters["ステータス"];
        //e.Command.Parameters["ステータス"].Value = new RyousanSireiStatusChecker().Get(e);

    }
    protected void 材料ID_SelectedIndexChanged(object sender, EventArgs e)
    {
        YDropDownList ddl = (YDropDownList)sender;

        Set定尺情報(ddl, false);
    }
    protected void 材料ID_TextChanged(object sender, EventArgs e)
    {
        String s = string.Empty;
    }

    protected override void Search()
    {

        StringBuilder command = new StringBuilder(_originalSelectCommand);
        this.mainDataSource.SelectParameters.Clear();

        List<String> where = new List<String>();

        this.mainDataSource.AddSelectParameterLike(where, "部品コード", 検索部品コード.Text);
        this.mainDataSource.AddSelectParameterLike(where, "部品名称", 検索部品名称.Text);

        this.mainDataSource.AddSelectParameter(where, "作成日時", "作成日時開始", "作成日時終了", 検索作成日時開始.Text, 検索作成日時終了.Text);

        if (検索削除フラグ.Checked)
        {
            this.mainDataSource.AddSelectParameter(where, "削除フラグ", StringUtils.TrueString);
        }
        else
        {
            this.mainDataSource.AddSelectParameter(where, "削除フラグ", StringUtils.TrueString, "!=");
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

        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        this.mainDataSource.Select(arg);


    }

    protected override void ConditionClear()
    {
        検索部品コード.Text = string.Empty;
        検索部品名称.Text = string.Empty;
        検索作成日時開始.Text = string.Empty;
        検索作成日時終了.Text = string.Empty;

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
    protected void 定尺情報設定_Click(object sender, EventArgs e)
    {
        YDropDownList ddl = (YDropDownList)mainFormView.FindControl("材料ID");

        Set定尺情報(ddl, true);

    }

    private void Set定尺情報(YDropDownList ddl, bool isSetAllValue)
    {
        String 材料ID = ddl.GetInternalValue();

        String SelectCommand = 材料DataSource.SelectCommand;
        ParameterCollection SelectCollection = 材料DataSource.SelectParameters;

        List<String> where = new List<String>();
        where.Add(SelectCommand);
        材料DataSource.AddSelectParameter(where, "t1.材料ID", 材料ID);

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

        if ("3" == row["材料メーカー"].ToString())
        {
            ((YCheckBox)mainFormView.FindControl("定尺仕入自動計算フラグ")).Checked = true;

        }

        if (mainFormView.FindControl("定尺寸法縦_original") != null)
        {
            ((YTextBox)mainFormView.FindControl("定尺寸法縦_original")).Text = row["定尺寸法縦"].ToString();
            ((YTextBox)mainFormView.FindControl("定尺寸法横_original")).Text = row["定尺寸法横"].ToString();
            ((YTextBox)mainFormView.FindControl("定尺仕入金額_original")).Text = row["定尺仕入金額"].ToString();

        }
        if (isSetAllValue)
        {
            ((YTextBox)mainFormView.FindControl("定尺寸法縦")).Text = row["定尺寸法縦"].ToString();
            ((YTextBox)mainFormView.FindControl("定尺寸法横")).Text = row["定尺寸法横"].ToString();
            ((YTextBox)mainFormView.FindControl("厚み")).Text = row["厚み"].ToString();
            ((YTextBox)mainFormView.FindControl("定尺仕入金額")).Text = row["定尺仕入金額"].ToString();
            ((YTextBox)mainFormView.FindControl("定尺売り金額")).Text = row["定尺売り金額"].ToString();
        }
        else
        {
            YTextBox t = (YTextBox)mainFormView.FindControl("定尺寸法縦");
            YTextBox t2 = (YTextBox)mainFormView.FindControl("定尺寸法横");
            if (StringUtils.IsEmptyOrZero(t.Text) && StringUtils.IsEmptyOrZero(t2.Text))
            {
                t.Text = row["定尺寸法縦"].ToString();
                t.Text = row["定尺寸法横"].ToString();
            }

            t = (YTextBox)mainFormView.FindControl("厚み");
            if (StringUtils.IsEmptyOrZero(t.Text))
            {
                t.Text = row["厚み"].ToString();
            }
            t = (YTextBox)mainFormView.FindControl("定尺仕入金額");
            if (StringUtils.IsEmptyOrZero(t.Text))
            {
                t.Text = row["定尺仕入金額"].ToString();
            }
            t = (YTextBox)mainFormView.FindControl("定尺売り金額");
            if (StringUtils.IsEmptyOrZero(t.Text))
            {
                t.Text = row["定尺売り金額"].ToString();
            }
        }

        材料DataSource.SelectCommand = SelectCommand;
        材料DataSource.SelectParameters.Clear();
        this.材料DataSource.Select(arg);
    }

}