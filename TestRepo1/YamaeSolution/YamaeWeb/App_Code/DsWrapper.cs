using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using uc;

/// <summary>
/// DsWrapper の概要の説明です
/// </summary>
public class DsWrapper
{
    private BaseSqlDataSource _ds;

	public DsWrapper(Page page)
	{
        _ds = new BaseSqlDataSource();
        ConnectionStringSettings connString = ConfigurationManager.ConnectionStrings["mysqlConLocal"];

        _ds.Page = page;
        _ds.ConnectionString = connString.ConnectionString;
        _ds.ProviderName = connString.ProviderName;
	}

    public DataView Select(String commandText, String orderBy, Dictionary<String, String> param)
    {
        this._ds.SelectCommand = commandText;
        this._ds.OrderBy = orderBy;
        
        foreach(String key in param.Keys) {
            this._ds.SelectParameters.Add(key, param[key]);
        }

        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        DataView view = (DataView)_ds.Select(arg);

        return view;
    }
}