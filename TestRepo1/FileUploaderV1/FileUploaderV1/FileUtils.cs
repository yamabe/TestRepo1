using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace FileUploaderV1
{
    class FileUtils
    {
        public static bool WaitFileAccess(String fullPath)
        {
            FileInfo fi = new FileInfo(fullPath);

            for (int i = 0; i < 200; i++)
            {
                if (IsFileLocked(fi))
                {
                    continue;
                }
                else
                {
                    return true;
                } 
            }

            return false;

        }

        public static  bool IsFileLocked(FileInfo file)
        {
            FileStream stream = null;

            try
            {
                stream = file.Open(FileMode.Open, FileAccess.ReadWrite, FileShare.None);
            }
            catch (IOException)
            {
                //the file is unavailable because it is:
                //still being written to
                //or being processed by another thread
                //or does not exist (has already been processed)
                return true;
            }
            finally
            {
                if (stream != null)
                    stream.Close();
            }

            //file is not locked
            return false;
        }
    }

}
