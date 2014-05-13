using ICSharpCode.SharpZipLib.Zip;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FileUploaderV1
{
    class ArrangeFilesService
    {
        private List<String> messages;

         private Form1 _rootForm;
         public ArrangeFilesService(Form1 rootForm)
        {
            _rootForm = rootForm;
        }

        public List<String> Execute()
        {
            messages = new List<string>();

            String rootPath = ConfigurationManager.AppSettings["ARRANGE_FILES"];

            Loop(rootPath);

            return messages;
        }

        private void Loop(String path)
        {
            if (Directory.Exists(path))
            {
                DirectoryInfo di = new DirectoryInfo(path);

                foreach (DirectoryInfo d in di.GetDirectories())
                {
                    Loop(d.FullName);
                }

                foreach (FileInfo fi in di.GetFiles())
                {
                    if (fi.Exists)
                    {
                        continue;
                    }
                    var svc = new RenameService(_rootForm);
                    svc.Execute(fi, true);
                }
            }
        }


    }

}
