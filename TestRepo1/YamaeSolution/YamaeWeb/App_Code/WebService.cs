using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

/// <summary>
/// WebService の概要の説明です
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {

    public WebService () {

        //デザインされたコンポーネントを使用する場合、次の行のコメントを解除してください 
        //InitializeComponent(); 
    }

    [WebMethod]
    public  string GetList() {
        JavaScriptSerializer s = new JavaScriptSerializer();

        Dictionary<String, String> o = new Dictionary<String, String>();
        o.Add("aa", "bb");
        o.Add("cc", "dd");

        return s.Serialize(o);
    }

    [WebMethod]
    public string Get(int dataKey)
    {
        JavaScriptSerializer s = new JavaScriptSerializer();

        DsWrapperLight ds = new DsWrapperLight(new SessionManager(this.Context));
        Dictionary<String, String> param = new Dictionary<String, String>();

        ds.Select("select * from 未実装このあたりから", "", param);

        Dictionary<String, String> o = new Dictionary<String, String>();
        o.Add("aa", "bb");
        o.Add("cc", "dd");

        return s.Serialize(o);
    }

    [WebMethod]
    public string Hello()
    {
        return "test";
    }
}
