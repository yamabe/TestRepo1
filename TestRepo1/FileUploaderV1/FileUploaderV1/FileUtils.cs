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

            for (int i = 0; i < 10; i++)
            {
                if (IsFileLocked(fi, false))
                {
                    Thread.Sleep(1000);
                    continue;
                }
                else
                {
                    return true;
                } 
            }

            IsFileLocked(fi, true);
            return false;

        }

        public static  bool IsFileLocked(FileInfo file, bool isThrow)
        {
            if (file.Exists) return false;

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

                if (isThrow)
                {
                    throw;
                }
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
