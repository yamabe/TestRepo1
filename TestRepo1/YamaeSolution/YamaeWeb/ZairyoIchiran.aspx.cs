using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
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

        List<String> hiddenFields = new List<string>();
        hiddenFields.Add("材料ID");
        hiddenFields.Add("材料属性ID");
        hiddenFields.Add("耐寒");

        if (!String.IsNullOrEmpty(検索M2あたり材料費.GetInternalValue()))
        {
            hiddenFields.Add(検索M2あたり材料費.GetInternalValue());
        }
        if (!String.IsNullOrEmpty(検索定尺仕入金額.GetInternalValue()))
        {
            hiddenFields.Add(検索定尺仕入金額.GetInternalValue());
        }
        if (!String.IsNullOrEmpty(検索定尺売り金額.GetInternalValue()))
        {
            hiddenFields.Add(検索定尺売り金額.GetInternalValue());
        }
        if (!String.IsNullOrEmpty(検索利益率.GetInternalValue()))
        {
            hiddenFields.Add(検索利益率.GetInternalValue());
        }

        Dictionary<String, String> where = new Dictionary<string, string>();
        if (!String.IsNullOrEmpty(検索材料メーカー.GetInternalValue()))
        {
            where.Add("t1.材料メーカー", 検索材料メーカー.GetInternalValue());
        }
        if (!String.IsNullOrEmpty(検索材質大分類.GetInternalValue()))
        {
            where.Add("t1.材質大分類", 検索材質大分類.GetInternalValue());
        }
        if (!String.IsNullOrEmpty(検索材質.GetInternalValue()))
        {
            where.Add("t1.材質", 検索材質.GetInternalValue());
        }


        DataTable table = ZairyoManager.Read(this, where, 順序.GetInternalValue());
        this.MainBaseGridView.DataSource = table;

        foreach (DataColumn c in table.Columns)
        {
            bool isHidden = false;
            foreach (String h in hiddenFields)
            {
                if (c.ColumnName.Contains(h))
                {
                    isHidden = true;
                    break;
                }
            }

            if (isHidden)
            {
                continue;
            }

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

    protected override DataView Search()
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

        return null;
    }

    protected override void ConditionClear()
    {
        //検索部品コード.Text = string.Empty;
        //検索部品名称.Text = string.Empty;
        //検索作成日時開始.Text = string.Empty;
        //検索作成日時終了.Text = string.Empty;

        //検索ステータス.Text = String.Empty;
        検索材料メーカー.SelectedIndex = 0;
        検索材質大分類.SelectedIndex = 0;
        検索材質.SelectedIndex = 0;
        検索定尺仕入金額.SelectedIndex = 0;
        検索M2あたり材料費.SelectedIndex = 1;
        検索定尺売り金額.SelectedIndex = 1;
        検索利益率.SelectedIndex = 1;
        順序.SelectedIndex = 0;

        Page_Load(null, null);
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