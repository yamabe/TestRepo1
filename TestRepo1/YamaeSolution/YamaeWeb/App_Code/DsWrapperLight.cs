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
public class DsWrapperLight
{
    private BaseSqlDataSourceLight _ds;
    private SessionManager _session;

    public DsWrapperLight(SessionManager session)
	{
        _session = session;

        _ds = new BaseSqlDataSourceLight(_session.UserId);
        ConnectionStringSettings connString = ConfigurationManager.ConnectionStrings["mysqlConLocal"];

        _ds.ConnectionString = connString.ConnectionString;
        _ds.ProviderName = connString.ProviderName;
	}

    public DataView Select(String commandText, String orderBy, Dictionary<String, String> param)
    {
        this._ds.SelectParameters.Clear();
        this._ds.SelectCommand = commandText;
        this._ds.OrderBy = orderBy;
        
        foreach(String key in param.Keys) {
            this._ds.SelectParameters.Add(key, param[key]);
        }

        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        DataView view = (DataView)_ds.Select(arg);

        return view;
    }

    public int Insert(String commandText, Dictionary<String, object> param)
    {
        this._ds.InsertCommand = commandText;
        
        foreach (String key in param.Keys)
        {
            object o = param[key];

            if (o == null)
            {
                this._ds.InsertParameters.Add(key, null);

            }
            else
            {
                this._ds.InsertParameters.Add(key, param[key].ToString());

            }

        }


        DataSourceSelectArguments arg = new DataSourceSelectArguments();
        int ret = _ds.Insert();

        return ret;
    }
}