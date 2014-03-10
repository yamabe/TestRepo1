﻿using System;
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
            String prefix = string.Empty;

            if (fi.Name.Length > 8)
            {
                prefix = fi.Name.Substring(0, 8);
            }

            DateTime dt = DateTime.Now;

            if (DateTime.TryParseExact(prefix, "yyyyMMdd", null, System.Globalization.DateTimeStyles.None, out dt))
            {

            }
            else
            {
             //   String creationTime = fi.CreationTime.ToString("yyyyMMdd_hhmm_ss_");
                String creationTime =DateTime.Now.ToString("yyyyMMdd_hhmm_ss_");
                
                String newName = creationTime + fi.Name;
                String newFullPath = Path.Combine(fi.DirectoryName, newName);
                fi.MoveTo(newFullPath);

                if (unzip)
                {
                    if (fi.Extension.ToLower() == ".zip")
                    {
                        fi = new FileInfo(newFullPath);

                        UnzipService svc = new UnzipService(_rootForm);
                        svc.Unzip(newFullPath, fi, creationTime);
                    }
                }
            }
        }
    }
}
