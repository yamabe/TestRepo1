using ICSharpCode.SharpZipLib.Zip;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FileUploaderV1
{
    class UnzipService
    {
        private Form1 _rootForm;
        public UnzipService(Form1 rootForm)
        {
            _rootForm = rootForm;
        }

        public void Unzip(String newFullPath, FileInfo fi)
        {
            if (!fi.Exists)
            {
                _rootForm.addMessage(this.GetType().Name + "    ファイルが存在しません。" + fi.Name);
                return;
            }
            System.IO.FileAttributes uAttribute = System.IO.File.GetAttributes(fi.FullName);
            if ((uAttribute & System.IO.FileAttributes.Hidden) == System.IO.FileAttributes.Hidden)
            {
                return;
            }

            using (ZipInputStream s = new ZipInputStream(File.OpenRead(newFullPath)))
            {

                Form2 frm2 = new Form2();
                frm2.FileName = fi.Name;
                var result = frm2.ShowDialog();


                if (result != System.Windows.Forms.DialogResult.OK)
                {
                    _rootForm.addMessage(this.GetType().Name + "    Zipの解凍をキャンセルしました。" + newFullPath);
                    return;
                }

                s.Password = frm2.Password;

                ZipEntry theEntry;
                while ((theEntry = s.GetNextEntry()) != null)
                {
                    string fileName = Path.GetFileName(theEntry.Name);

                    String newFileName = theEntry.Name;
                    String newFullPathForEntry = Path.Combine(fi.DirectoryName, newFileName);

                    if (File.Exists(newFileName))
                    {
                        String newFileNameWithoutExtension = Path.GetFileNameWithoutExtension(newFileName);
                        String extention = Path.GetExtension(newFileName);
                        for (int i = 0; i < int.MaxValue; i++)
                        {
                            String tmp = newFileNameWithoutExtension + "(" + i + ")" + extention;
                            if (!File.Exists(tmp))
                            {
                                newFileName = tmp;
                                break;
                            }
                        }
                    }

                    if (!String.IsNullOrEmpty(fileName))
                    {
                        newFullPathForEntry = Path.Combine(fi.DirectoryName, newFileName);
                        using (FileStream streamWriter = File.Create(newFullPathForEntry))
                        {
                            int size = 2048;
                            byte[] data = new byte[2048];
                            while (true)
                            {
                                size = s.Read(data, 0, data.Length);
                                if (size > 0)
                                {
                                    streamWriter.Write(data, 0, size);
                                }
                                else
                                {
                                    break;
                                }
                            }
                        }
                    }
                }
            }

            System.Diagnostics.Process.Start(fi.DirectoryName);
        }
    }
}
