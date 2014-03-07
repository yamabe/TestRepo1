using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

/// <summary>
/// WsBase の概要の説明です
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public abstract class WsBase : System.Web.Services.WebService
{

    public WsBase()
    {

        //デザインされたコンポーネントを使用する場合、次の行のコメントを解除してください 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string GetList()
    {
        String ret = string.Empty;
        try
        {
            JavaScriptSerializer s = new JavaScriptSerializer();

            object o = GetListInternal();

            ret = s.Serialize(o);

        }
        catch (Exception ex)
        {
            string s = string.Empty;
        }

        return ret;
    }

    protected abstract object GetListInternal();


    [WebMethod]
    public string Get(int dataKey)
    {
        String ret = string.Empty;
        try
        {
            JavaScriptSerializer s = new JavaScriptSerializer();


            object o = GetInternal(dataKey);

            ret = s.Serialize(o);

        }
        catch (Exception ex)
        {
            string s = string.Empty;
        }

        return ret;
    }

    protected abstract object GetInternal(int dataKey);


    [WebMethod]
    public string Add(String data)
    {
        String ret = string.Empty;
        try
        {
            JavaScriptSerializer s = new JavaScriptSerializer();
            Object o = s.DeserializeObject(data);

            Dictionary<String, Object> rowData = o as Dictionary<String, Object>;
            if (data != null)
            {
                object retObject = AddInternal(rowData);

                ret = s.Serialize(retObject);
            }

        }
        catch (Exception ex)
        {
            string s = string.Empty;
        }

        return ret;
    }

    protected abstract object AddInternal(Dictionary<String, Object> data);



    [WebMethod]
    public string Hello()
    {
        return "test";
    }

    protected List<Dictionary<String, string>> Parse(DataView view)
    {
        List<Dictionary<String, String>> table = new List<Dictionary<string, string>>();
        for (int i = 0; i < view.Count; i++)
        {
            DataRowView row = view[i];
            Dictionary<String, String> rowData = new Dictionary<string, string>();
            table.Add(rowData);
            for (int c = 0; c < row.Row.Table.Columns.Count; c++)
            {
                String columnName = row.Row.Table.Columns[c].ColumnName;
                object value = row[columnName];

                if (value == null || value == DBNull.Value)
                {
                    rowData[columnName] = null;
                }
                else
                {
                    rowData[columnName] = value.ToString();
                }

            }



        }
        return table;
    }

}
