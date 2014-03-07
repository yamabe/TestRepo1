using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Services;

/// <summary>
/// WsTFileTag の概要の説明です
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class WsTFileTag : WsBase
{
    public WsTFileTag()
    {

        //デザインされたコンポーネントを使用する場合、次の行のコメントを解除してください 
        //InitializeComponent(); 
    }


    protected override object GetListInternal()
    {
        DsWrapperLight ds = new DsWrapperLight(new SessionManager(this.Context));
        Dictionary<String, String> param = new Dictionary<String, String>();


        String command = "select * from tファイルタグ";
        String orderBy = "";

        DataView view1 = ds.Select(command, orderBy, param) as DataView;
        Dictionary<String, List<Dictionary<String, string>>> data = new Dictionary<string, List<Dictionary<String, string>>>();
        data["Tファイル"] = Parse(view1);

        return data;
    }

    protected override object GetInternal(int dataKey)
    {
        Dictionary<String, String> param = new Dictionary<String, String>();
        param.Add("ファイルID", dataKey.ToString());

        Dictionary<String, List<Dictionary<String, string>>> data = new Dictionary<string, List<Dictionary<String, string>>>();

        {
            //DsWrapperLight ds = new DsWrapperLight(new SessionManager(this.Context));

            //String command = "select * from tファイル where ファイルID = @ファイルID";
            //String orderBy = "";

            //DataView view1 = ds.Select(command, orderBy, param) as DataView;
            //data["Tファイル"] = Parse(view1);
        }
        {
            DsWrapperLight ds = new DsWrapperLight(new SessionManager(this.Context));
            string command = "select * from tファイルタグ where ファイルID = 2";
            string orderBy = "";

            DataView view2 = ds.Select(command, orderBy, param) as DataView;

            data["Tファイルタグ"] = Parse(view2);
        }
        return data;
    }

    protected override object AddInternal(Dictionary<string, object> data)
    {
        return 123;
    }
}



