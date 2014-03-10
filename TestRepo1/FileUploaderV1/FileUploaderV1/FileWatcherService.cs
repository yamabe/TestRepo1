using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace FileUploaderV1
{
    public class FileWatcherService
    {
        private Form1 _rootForm;
        public FileWatcherService(Form1 rootForm)
        {
            _rootForm = rootForm;
        }

        public FileSystemWatcher Execute()
        {
            FileSystemWatcher watcher = new FileSystemWatcher();
            watcher.Path = ConfigurationManager.AppSettings["WATCHER_DIR"];

            watcher.IncludeSubdirectories = true;
            watcher.Created += watcher_Created;
            watcher.Error += watcher_Error;


            watcher.EnableRaisingEvents = true;

            _rootForm.addMessage("監視開始" + watcher.Path + " → " + ConfigurationManager.AppSettings["UPLOAD_DIR"]);

            return watcher;
        }


        void watcher_Error(object sender, ErrorEventArgs e)
        {
            _rootForm.addMessage("ERROR:" + e.ToString());
        }

        void watcher_Created(object sender, FileSystemEventArgs e)
        {
            _rootForm.addMessage("info:" + e.Name);
            try
            {
                if (FileUtils.WaitFileAccess(e.FullPath))
                {
                    FileInfo fi = new FileInfo(e.FullPath);

                    Form2 frm2 = new Form2();
                    frm2.ShowDialog();

                    var userName = ConfigurationManager.AppSettings["USER_NAME"];
                    var newName = string.Format(DateTime.Now.ToString("yyyyMMdd_hhMMsss_{0}_{1}"), userName, fi.Name);

                    var fullPath = Path.Combine(ConfigurationManager.AppSettings["UPLOAD_DIR"], newName);

                    fi.CopyTo(fullPath, true);

                    _rootForm.addMessage("Copy:" + fi.Name + "→" + newName);

                    var conStr = ConfigurationManager.ConnectionStrings["mysqlConLocal"].ConnectionString;
                    MySqlCommand cmd = new MySqlCommand();
                    using (MySqlConnection con = new MySqlConnection(conStr))
                    {
                        con.Open();

                        cmd.Connection = con;

                        cmd.CommandText = @"insert into tファイル
                            (ファイルパス, 拡張子, ファイルサイズ, ファイル作成日時, ファイル更新日時, ファイルアクセス日時, ファイル属性, 担当者, 備考, 削除フラグ, 作成ユーザー, 最終更新ユーザー, 作成日時, 最終更新日時)
                            values
                            (@ファイルパス,@拡張子,@ファイルサイズ,@ファイル作成日時,@ファイル更新日時,@ファイルアクセス日時,@ファイル属性,@担当者,@備考,@削除フラグ,@作成ユーザー,@最終更新ユーザー,@作成日時,@最終更新日時)";
                        cmd.Parameters.AddWithValue("ファイルパス", fullPath);
                        cmd.Parameters.AddWithValue("拡張子", fi.Extension);
                        cmd.Parameters.AddWithValue("ファイルサイズ", fi.Length * 0.001);
                        cmd.Parameters.AddWithValue("ファイル作成日時", fi.CreationTime);
                        cmd.Parameters.AddWithValue("ファイル更新日時", fi.LastWriteTime);
                        cmd.Parameters.AddWithValue("ファイルアクセス日時", fi.LastAccessTime);
                        cmd.Parameters.AddWithValue("ファイル属性", fi.Attributes.ToString());
                        cmd.Parameters.AddWithValue("担当者", ConfigurationManager.AppSettings["USER_ID"]);
                        cmd.Parameters.AddWithValue("備考", "");
                        cmd.Parameters.AddWithValue("削除フラグ", "False");
                        cmd.Parameters.AddWithValue("作成ユーザー", ConfigurationManager.AppSettings["USER_ID"]);
                        cmd.Parameters.AddWithValue("最終更新ユーザー", ConfigurationManager.AppSettings["USER_ID"]);
                        cmd.Parameters.AddWithValue("作成日時", DateTime.Now);
                        cmd.Parameters.AddWithValue("最終更新日時", DateTime.Now);

                        int ret = cmd.ExecuteNonQuery();
                    }

                }
                else
                {
                    _rootForm.addMessage("処理失敗：" + e.FullPath);
                }

            }
            catch (Exception ex)
            {

                _rootForm.addMessage("ERROR:" + ex.ToString());
            }
        }


    }
}
