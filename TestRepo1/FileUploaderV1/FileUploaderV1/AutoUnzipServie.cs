using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FileUploaderV1
{
    class AutoUnzipServie
    {
        private Form1 _rootForm;

        private String _lastFile;

        public AutoUnzipServie(Form1 root)
        {
            _rootForm = root;
        }

        public FileSystemWatcher Execute()
        {
            FileSystemWatcher watcher = new FileSystemWatcher();
            watcher.Path = ConfigurationManager.AppSettings["ARRANGE_FILES"];

            watcher.IncludeSubdirectories = true;
            watcher.Created += watcher_Created;
            watcher.Error += watcher_Error;

            watcher.Filter = "*.zip";

            watcher.EnableRaisingEvents = true;

            _rootForm.addMessage(this.GetType().Name + "    監視開始(自動解凍)" + watcher.Path);

            return watcher;
        }


        void watcher_Error(object sender, ErrorEventArgs e)
        {
            _rootForm.addMessage(this.GetType().Name + "    ERROR:" + e.ToString());
        }

        void watcher_Created(object sender, FileSystemEventArgs e)
        {
            if (e.Name == this._lastFile)
            {
                return;
            }

            this._lastFile = e.Name;

            Task.Run(async delegate
            {
                await Task.Delay(TimeSpan.FromSeconds(10));
                this._lastFile = null;
                return;
            });
            
            _rootForm.addMessage(this.GetType().Name + "    info:" + e.Name);

            try
            {
                if (FileUtils.WaitFileAccess(e.FullPath))
                {
                    FileInfo fi = new FileInfo(e.FullPath);

                    if (!fi.Exists)
                    {
                        // 処理終了
                        return;
                    }

                    _rootForm.addMessage(this.GetType().Name + "    info:解凍処理開始" + e.Name);

                    var svc = new RenameService(_rootForm);
                    svc.Execute(fi, true);
                }
                else
                {
                    _rootForm.addMessage(this.GetType().Name + "    処理失敗：" + e.FullPath);
                }

            }
            catch (Exception ex)
            {

                _rootForm.addMessage(this.GetType().Name + "    ERROR:" + ex.ToString());
            }
        }

    }
}
