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


            watcher.EnableRaisingEvents = true;

            _rootForm.addMessage("監視開始(自動解凍)" + watcher.Path);

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


                    var svc = new RenameService(_rootForm);
                    svc.Execute(fi, true);
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
