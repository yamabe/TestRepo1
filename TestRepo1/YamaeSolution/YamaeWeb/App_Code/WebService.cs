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
public class WebService : System.Web.Services.WebService {

    public WebService () {

        //デザインされたコンポーネントを使用する場合、次の行のコメントを解除してください 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string GetList() {
        JavaScriptSerializer s = new JavaScriptSerializer();

        object o = null;

        return s.Serialize(o);
    }
    
}
