using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web;

/// <summary>
/// StringUtils の概要の説明です
/// </summary>
public class FileUtils
{
    //private static string BASE_DIR = @"C:\Users\孝治\Documents\git\TestRepo1\TestRepo1\YamaeSolution\YamaeWeb\files";

    private static String GetBaseDir()
    {
        return ConfigurationManager.AppSettings.Get("BASE_DIR");
    }

    public static String GetZumenFileFullPath(String id, String v部品コード, String originalFileName, bool isCreateDir)
    {
        String path = GetBaseDir();
        String key = "tanka";
        path = Path.Combine(path, key);
        path = Path.Combine(path, id);

        Directory.CreateDirectory(path);

        String fileName = "図面_" + v部品コード + Path.GetExtension(originalFileName);

        return Path.Combine(path, fileName);
    }

    public static String GetTankaData参考資料FileFullPath(String id, String originalFileName, bool isCreateDir)
    {
        String path = GetBaseDir();
        String key = "tanka";
        path = Path.Combine(path, key);
        path = Path.Combine(path, id);
        path = Path.Combine(path, "参考資料");

        Directory.CreateDirectory(path);

        String fileName = originalFileName;

        return Path.Combine(path, fileName);
    }

}