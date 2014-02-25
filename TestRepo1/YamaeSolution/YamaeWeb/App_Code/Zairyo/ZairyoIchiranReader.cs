using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using uc;


public class ZairyoManager
{
    public static DataTable Read(BaseForm form, Dictionary<String,String> where, String order)
    {
        ConnectionStringSettings connString = ConfigurationManager.ConnectionStrings["mysqlConLocal"];

        BaseSqlDataSource ds = new BaseSqlDataSource();
        ds.Page = form;
        ds.ConnectionString = connString.ConnectionString;
        ds.ProviderName = connString.ProviderName;

        ds.SelectCommand = @"SELECT 
t1.材料ID         as  材料ID,
t1.材料属性ID     as  材料属性ID,
t1.材料名称       as  材料名称,
t1.定尺寸法縦     as  定尺寸法縦,
t1.定尺寸法横     as  定尺寸法横,
t1.厚み           as  厚み,
t1.定尺仕入金額   as  定尺仕入金額,
t1.m2あたり材料費 as  m2あたり材料費,
t1.定尺売り金額 as  定尺売り金額,
t1.利益率 as 利益率,
t1.密度           as  密度,
t1.有効フラグ     as  有効フラグ,
t2.耐寒           as  耐寒,
t2.耐熱           as  耐熱,
t6.名称         as  難燃性,
t3.会社名称 as 材料メーカー,
t4.名称     as  材質大分類,
t5.名称           as  材質

FROM  `m材料価格` AS t1
LEFT OUTER JOIN m材料属性 AS t2 ON t1.材料属性ID = t2.材料属性ID 

left outer join m会社 as t3 on t1.材料メーカー = t3.会社ID
left outer join mコード as t4 on t1.材質大分類 = t4.コードID
left outer join mコード as t5 on t1.材質 = t5.コードID
left outer join mコード as t6 on t2.難燃性 = t6.コードID


where t1.削除フラグ != 'True' and t1.材料ID != 0 ";
        ds.OrderBy = "材料名称, 定尺寸法縦, 定尺寸法横";
        foreach (String key in where.Keys)
        {
            String val = where[key];

            ds.SelectCommand += " and " + key + " = " + val + " ";
        }

        //ds.SelectCommand += "order by " + order;
        
        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        DataView view = (DataView)ds.Select(arg);

        
        //DataTable table = view.ToTable();
        //DataRow row = table.Rows[0];


        List<decimal> thicknessList = GetThicknessList(form);

        DataTable nt = new DataTable();
        nt.Columns.Add("材料ID", typeof(Int32));
        nt.Columns.Add("材料属性ID", typeof(Int32));
        nt.Columns.Add("材料名称", typeof(String));
        nt.Columns.Add("材料メーカー", typeof(String));
        nt.Columns.Add("材質大分類", typeof(String));
        nt.Columns.Add("材質", typeof(String));
        nt.Columns.Add("定尺寸法縦", typeof(Decimal));
        nt.Columns.Add("定尺寸法横", typeof(Decimal));

        foreach (decimal t in thicknessList)
        {
            //nt.Columns.Add("厚み", typeof(Decimal));
            nt.Columns.Add(t + "(入)", typeof(Decimal));
            nt.Columns.Add(t + "(㎡)", typeof(Decimal));
            nt.Columns.Add(t + "(売)", typeof(Decimal));
            nt.Columns.Add(t + "(利)", typeof(Decimal));
        }

        nt.Columns.Add("密度", typeof(Decimal));
        //nt.Columns.Add("定尺仕入金額", typeof(Decimal));
        //nt.Columns.Add("m2あたり材料費", typeof(Decimal));
        //nt.Columns.Add("定尺売り金額", typeof(Decimal));
        //nt.Columns.Add("利益率", typeof(Decimal));

        nt.Columns.Add("耐寒", typeof(Decimal));
        nt.Columns.Add("耐熱", typeof(Decimal));
        nt.Columns.Add("難燃性", typeof(String));

        nt.Columns.Add("有効フラグ", typeof(String));

        DataRowView prevRow = null;
        DataRow newRow = nt.NewRow();

        if (view.Count > 0)
        {
            DataRowView curRow = view[0];

            newRow["材料ID"] = curRow["材料ID"];
            newRow["材料属性ID"] = curRow["材料属性ID"];
            newRow["材料名称"] = curRow["材料名称"];
            newRow["材料メーカー"] = curRow["材料メーカー"];
            newRow["材質大分類"] = curRow["材質大分類"];
            newRow["材質"] = curRow["材質"];
            newRow["定尺寸法縦"] = curRow["定尺寸法縦"];
            newRow["定尺寸法横"] = curRow["定尺寸法横"];
            newRow[curRow["厚み"] + "(入)"] = curRow["定尺仕入金額"];
            newRow[curRow["厚み"] + "(㎡)"] = curRow["m2あたり材料費"];
            newRow[curRow["厚み"] + "(売)"] = curRow["定尺売り金額"];
            newRow[curRow["厚み"] + "(利)"] = curRow["利益率"];
            newRow["密度"] = curRow["密度"];
            newRow["有効フラグ"] = curRow["有効フラグ"];
            newRow["耐寒"] = curRow["耐寒"];
            newRow["耐熱"] = curRow["耐熱"];
            newRow["難燃性"] = curRow["難燃性"];

            prevRow = curRow;
            nt.Rows.Add(newRow);

        }

        for (int i = 1; i < view.Count; i++)
        {
            DataRowView curRow = view[i];

            String curRowKey = GetValue(curRow, "定尺寸法縦") + "_" + GetValue(curRow, "定尺寸法横") + "_" + GetValue(curRow, "材料名称");
            String prevRowKey = GetValue(prevRow, "定尺寸法縦") + "_" + GetValue(prevRow, "定尺寸法横") + "_" + GetValue(prevRow, "材料名称");

            if (curRowKey == prevRowKey)
            {
                newRow[curRow["厚み"] + "(入)"] = curRow["定尺仕入金額"];
                newRow[curRow["厚み"] + "(㎡)"] = curRow["m2あたり材料費"];
                newRow[curRow["厚み"] + "(売)"] = curRow["定尺売り金額"];
                newRow[curRow["厚み"] + "(利)"] = curRow["利益率"];
            }
            else
            {

                newRow = nt.NewRow();
                nt.Rows.Add(newRow);

                newRow["材料ID"] = curRow["材料ID"];
                newRow["材料属性ID"] = curRow["材料属性ID"];
                newRow["材料名称"] = curRow["材料名称"];
                newRow["材料メーカー"] = curRow["材料メーカー"];
                newRow["材質大分類"] = curRow["材質大分類"];
                newRow["材質"] = curRow["材質"];
                newRow["定尺寸法縦"] = curRow["定尺寸法縦"];
                newRow["定尺寸法横"] = curRow["定尺寸法横"];
                newRow[curRow["厚み"] + "(入)"] = curRow["定尺仕入金額"];
                newRow[curRow["厚み"] + "(㎡)"] = curRow["m2あたり材料費"];
                newRow[curRow["厚み"] + "(売)"] = curRow["定尺売り金額"];
                newRow[curRow["厚み"] + "(利)"] = curRow["利益率"];
                newRow["密度"] = curRow["密度"];
                newRow["有効フラグ"] = curRow["有効フラグ"];
                newRow["耐寒"] = curRow["耐寒"];
                newRow["耐熱"] = curRow["耐熱"];
                newRow["難燃性"] = curRow["難燃性"];

            }

            prevRow = curRow;
        }

        

        return nt;

    }



    private static List<decimal> GetThicknessList(BaseForm form)
    {
        ConnectionStringSettings connString = ConfigurationManager.ConnectionStrings["mysqlConLocal"];

        BaseSqlDataSource ds = new BaseSqlDataSource();
        ds.Page = form;
        ds.ConnectionString = connString.ConnectionString;
        ds.ProviderName = connString.ProviderName;

        ds.SelectCommand = @"SELECT distinct(厚み)
FROM  `m材料価格`";

        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        DataView view = (DataView)ds.Select(arg);

        List<decimal> thicknessList = new List<decimal>();

        for (int i = 0; i < view.Count; i++)
        {
            DataRowView row = view[i];
            if (row[0] != null && row[0] != DBNull.Value)
            {
                decimal v = decimal.Parse(row[0].ToString());

                if (v == 0)
                {
                    continue;
                }
                thicknessList.Add(v);
            }

        }

        thicknessList.Sort();
        return thicknessList;

    }

    private static String GetValue(DataRowView row, String name)
    {
        if (row[name] == null)
        {
            return string.Empty;
        }

        return row[name].ToString();

    }


}


/// <summary>
/// Zairyo の概要の説明です
/// </summary>
public class ZairyoParam
{
    public ZairyoParam()
    {
        //
        // TODO: コンストラクター ロジックをここに追加します
        //
    }


}

public class ThicknessPrice
{

    public decimal Thickness;
    public decimal Teishaku縦;
    public decimal Teishaku横;

    public decimal Teishaku価格入;
    public decimal Teishaku価格売;
    public decimal M2価格入;
    public decimal M2価格売;
}

public class Zokusei
{
    public String Tainetsu寒;
    public String Tainetsu熱;
    public String V難燃;

}

