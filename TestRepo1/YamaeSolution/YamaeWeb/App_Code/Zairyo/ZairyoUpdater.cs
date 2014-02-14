using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using uc;

/// <summary>
/// ZairyoUpdater の概要の説明です
/// </summary>
public class ZairyoUpdater
{
	public ZairyoUpdater()
	{
		
	}

    public static void Update()
    {

    }

    public static void Update材料価格(BaseForm form, int v材料メーカー, int v材質大分類, int v材質, string v材料名称, String v材料名称New)
    {
        // 材質　→　m材料価格 m材料属性
        // 材質大分類　→　m材料価格 m材料属性
        // 材料メーカー　→　m材料価格 m材料属性

        // m材料属性 →　m材料価格
        string updateCommand = "update m材料価格 set 材料名称 = @材料名称New, 材料メーカー = @材料メーカー, 材質大分類 = @材質大分類, 材質 = @材質, 最終更新ユーザー =@最終更新ユーザー, 最終更新日時 = current_timestamp where 材料名称 = @材料名称";

        ConnectionStringSettings connString = ConfigurationManager.ConnectionStrings["mysqlConLocal"];

        BaseSqlDataSource ds = new BaseSqlDataSource();
        ds.Page = form;
        ds.ConnectionString = connString.ConnectionString;
        ds.ProviderName = connString.ProviderName;

        ds.UpdateCommand = updateCommand;
        
        ds.UpdateParameters.Add("材料メーカー", DbType.Int32, v材料メーカー.ToString());
        ds.UpdateParameters.Add("材質大分類", DbType.Int32, v材質大分類.ToString());
        ds.UpdateParameters.Add("材質", DbType.Int32, v材質.ToString());
        ds.UpdateParameters.Add("材料名称", DbType.String, v材料名称);
        ds.UpdateParameters.Add("材料名称New", DbType.String, v材料名称New);
        ds.UpdateParameters.Add("最終更新ユーザー", DbType.String, string.Empty);
        ds.UpdateParameters.Add("最終更新日時", DbType.DateTime, DateTime.Now.ToString());

        

        ds.Update();

        
    }

    public static void Update材料属性(BaseForm form, int v材料メーカー, int v材質大分類, int v材質, string v材料名称, String v材料名称New)
    {
        // 材質　→　m材料価格 m材料属性
        // 材質大分類　→　m材料価格 m材料属性
        // 材料メーカー　→　m材料価格 m材料属性

        // m材料属性 →　m材料価格
        string updateCommand = "update m材料属性 set 材料名称 = @材料名称New, 材料メーカー = @材料メーカー, 材質大分類 = @材質大分類, 材質 = @材質, 最終更新ユーザー =@最終更新ユーザー, 最終更新日時 = current_timestamp where 材料名称 = @材料名称";

        ConnectionStringSettings connString = ConfigurationManager.ConnectionStrings["mysqlConLocal"];

        BaseSqlDataSource ds = new BaseSqlDataSource();
        ds.Page = form;
        ds.ConnectionString = connString.ConnectionString;
        ds.ProviderName = connString.ProviderName;

        ds.UpdateCommand = updateCommand;

        ds.UpdateParameters.Add("材料メーカー", DbType.Int32, v材料メーカー.ToString());
        ds.UpdateParameters.Add("材質大分類", DbType.Int32, v材質大分類.ToString());
        ds.UpdateParameters.Add("材質", DbType.Int32, v材質.ToString());
        ds.UpdateParameters.Add("材料名称", DbType.String, v材料名称);
        ds.UpdateParameters.Add("材料名称New", DbType.String, v材料名称New);
        ds.UpdateParameters.Add("最終更新ユーザー", DbType.String, string.Empty);
        ds.UpdateParameters.Add("最終更新日時", DbType.DateTime, DateTime.Now.ToString());



        ds.Update();


    }
}