using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FileUploaderV1
{
    class RenameService
    {
        private Form1 _rootForm;
        public RenameService(Form1 rootForm)
        {
            _rootForm = rootForm;
        }

        public void Execute(FileInfo fi, bool unzip)
        {
            if (!fi.Exists)
            {
                _rootForm.addMessage(this.GetType().Name + "    ファイルが存在しません。" + fi.Name);
                return;
            }

            List<String> noneExecute = new List<string>();
            noneExecute.Add(string.Empty);
            noneExecute.Add(".tmp");

            System.IO.FileAttributes uAttribute = System.IO.File.GetAttributes(fi.FullName);
            if ((uAttribute & System.IO.FileAttributes.Hidden) == System.IO.FileAttributes.Hidden)
            {
                return;
            }

            foreach (String s in noneExecute)
            {
                if (fi.Extension.ToLower() == s)
                {
                    return;
                }
            }

            if (unzip)
            {
                if (fi.Extension.ToLower() == ".zip")
                {
                    UnzipService svc = new UnzipService(_rootForm);
                    svc.Unzip(fi.FullName, fi);
                }
            }
        }
    }
}
