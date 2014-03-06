using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uc;

public partial class MGomuTokusei : BaseForm
{

    protected void Page_Load(object sender, EventArgs e)
    {
        this.MainBaseFormView = mainFormView;
        this.MainBaseGridView = mainGridView;
        this.MainBaseSqlDataSource = mainDataSource;
        _originalSelectCommand = this.MainBaseSqlDataSource.SelectCommand;
        _selectCollection = this.MainBaseSqlDataSource.SelectParameters;

       // MainBaseGridView.DataBound += MainBaseGridView_DataBound;

        SetVisibleHiddenField();
    }

    void MainBaseGridView_DataBound(object sender, EventArgs e)
    {
        SetVisibleHiddenField();
    }
    protected void mainDataSource_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        // 更新前処理。自動で値を設定するなどはここ。
        //Parameter status = this.mainDataSource.UpdateParameters["ステータス"];
        //e.Command.Parameters["ステータス"].Value = new RyousanSireiStatusChecker().Get(e);

        //Parameter status = this.mainDataSource.UpdateParameters["得意先"];
        //String s = status.DefaultValue;
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

        List<String> l熱 = new List<String>();
        l熱.Add("耐熱性_発泡");
        l熱.Add("耐熱性");
        this.mainDataSource.AddSelectParameterOr(where, l熱, 検索耐熱性.GetInternalValue(), " > ");

        List<String> l炎 = new List<String>();
        l炎.Add("耐炎性");
        this.mainDataSource.AddSelectParameterLikeOr(where, l炎, TokuseiMarkUtils.GetMarkForConditionValues(検索耐炎.GetInternalValue()));

        List<String> l酸 = new List<String>();
        l酸.Add("耐薬_有機酸");
        this.mainDataSource.AddSelectParameterLikeOr(where, l酸, TokuseiMarkUtils.GetMarkForConditionValues(検索耐薬_有機酸.GetInternalValue()));

        l酸.Clear();
        l酸.Add("耐薬_高濃度無機酸");
        this.mainDataSource.AddSelectParameterLikeOr(where, l酸, TokuseiMarkUtils.GetMarkForConditionValues(検索耐薬_高濃度無機酸.GetInternalValue()));

        l酸.Clear();
        l酸.Add("耐薬_低濃度無機酸");
        this.mainDataSource.AddSelectParameterLikeOr(where, l酸, TokuseiMarkUtils.GetMarkForConditionValues(検索耐薬_低濃度無機酸.GetInternalValue()));

        List<String> lアルカリ = new List<String>();
        lアルカリ.Add("耐薬_低濃度アルカリ");
        this.mainDataSource.AddSelectParameterLikeOr(where, lアルカリ, TokuseiMarkUtils.GetMarkForConditionValues(検索耐薬_低濃度アルカリ.GetInternalValue()));

        lアルカリ.Clear();
        lアルカリ.Add("耐薬_高濃度アルカリ");
        this.mainDataSource.AddSelectParameterLikeOr(where, lアルカリ, TokuseiMarkUtils.GetMarkForConditionValues(検索耐薬_高濃度アルカリ.GetInternalValue()));


        if (this.mainDataSource.SelectParameters.Count <= 0)
        {

        }
        else
        {
            command.Append(" where ");
            command.Append(StringUtils.Join(where, " and "));
        }

        this.mainDataSource.OrderBy = 順序.SelectedValue;
        this.mainDataSource.SelectCommand = command.ToString();
        DataView view = this.mainDataSource.Select(arg) as DataView;
        this.mainDataSource.DataBind();


        SetVisibleHiddenField();

        return view;
    }

    protected override void ConditionClear()
    {
        //検索ステータス.Text = String.Empty;
        検索耐熱性.SelectedIndex = 0;
        検索耐炎.SelectedIndex = 0;
        検索耐薬_有機酸.SelectedIndex = 0;
        検索耐薬_高濃度無機酸.SelectedIndex = 0;
        検索耐薬_低濃度無機酸.SelectedIndex = 0;
        検索耐薬_高濃度無機酸.SelectedIndex = 0;
        検索耐薬_低濃度無機酸.SelectedIndex = 0;
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

    protected override void SetVisibleHiddenField()
    {

        StringBuilder sb = new StringBuilder();
        sb.Append(検索純ゴム性質.SelectedItem.Value);
        sb.Append(検索機械的性質.SelectedItem.Value);
        sb.Append(検索耐環境性質.SelectedItem.Value);
        sb.Append(検索耐油耐溶剤.SelectedItem.Value);
        sb.Append(検索耐熱炎.SelectedItem.Value);
        sb.Append(検索電気的性質.SelectedItem.Value);
        sb.Append(検索耐薬品.SelectedItem.Value);

        String[] hiddenNames = sb.ToString().Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);

        List<String> hiddenNameList = new List<string>();
        foreach (String h in hiddenNames)
        {
            hiddenNameList.Add(h.ToLower());
        }

        foreach (DataControlField c in MainBaseGridView.Columns)
        {
            c.Visible = true;

            YBoundField f = c as YBoundField;

            if (f != null)
            {
                if (hiddenNameList.Contains(f.DataField.ToLower()))
                {
                    f.Visible = false;
                }
            }
        }
    }
}