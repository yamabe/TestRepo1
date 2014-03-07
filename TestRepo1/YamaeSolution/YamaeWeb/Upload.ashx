<%@ WebHandler Language="C#" Class="Upload" %>

using System;
using System.Web;
using System.IO;

public class Upload : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        context.Response.Expires = -1;
        try
        {
            HttpPostedFile postedFile = context.Request.Files["file"];

            SessionManager sessin = new SessionManager(context);

                string savepath = "";
            savepath = System.Configuration.ConfigurationManager.AppSettings["UPLOAD_DIR"];
            string filename = DateTime.Now.ToString("yyyyMMddhhmmss_") + postedFile.FileName;
            if (!Directory.Exists(savepath))
                Directory.CreateDirectory(savepath);

            string fullPath = Path.Combine(savepath, filename);
            postedFile.SaveAs(fullPath);

            context.Response.Write(fullPath);

            String command = @"insert into Tファイル
                            (ファイルパス,拡張子,ファイルサイズ,ファイル作成日時,ファイル更新日時,ファイルアクセス日時,ファイル属性,担当者,備考,削除フラグ,作成ユーザー,最終更新ユーザー,作成日時,最終更新日時)
                            values
                            (@ファイルパス,@拡張子,@ファイルサイズ,@ファイル作成日時,@ファイル更新日時,@ファイルアクセス日時,@ファイル属性,@担当者,@備考,@削除フラグ,@作成ユーザー,@最終更新ユーザー,@作成日時,@最終更新日時);";

            System.Collections.Generic.Dictionary<String, object> param = new System.Collections.Generic.Dictionary<string, object>();

            FileInfo fi = new FileInfo(fullPath);

            param.Add("ファイルパス", fullPath);
            param.Add("拡張子", fi.Extension);
            param.Add("ファイルサイズ", (fi.Length * 0.001).ToString());
            param.Add("ファイル作成日時", fi.CreationTime.ToString("yyyy-MM-dd hh:mm:ss"));
            param.Add("ファイル更新日時", fi.LastWriteTime.ToString("yyyy-MM-dd hh:mm:ss"));
            param.Add("ファイルアクセス日時", fi.LastAccessTime.ToString("yyyy-MM-dd hh:mm:ss"));
            param.Add("ファイル属性", fi.Attributes.ToString());
            param.Add("担当者", sessin.UserId.ToString());
            param.Add("備考", string.Empty);
            param.Add("削除フラグ", "False");
            //param.Add("作成ユーザー", Se);
            //param.Add("最終更新ユーザー", );
            //param.Add("作成日時", );
            //param.Add("最終更新日時", );


            DsWrapperLight ds = new DsWrapperLight(sessin);
            int ret = ds.Insert(command, param);


            context.Response.StatusCode = 200;
        }
        catch (Exception ex)
        {
            context.Response.Write("Error: " + ex.Message);
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}