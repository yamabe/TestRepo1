using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// FormatParam の概要の説明です
/// </summary>
public class FormatManager
{
    private static Dictionary<String, FormatParam> _formatParamList;

    static FormatManager()
    {
        _formatParamList = new Dictionary<String, FormatParam>();

        FormatParam p = null;
        p = new FormatParam("-", "", "", "", ""); _formatParamList.Add(p.Key, p);
        p = new FormatParam("%", "{0:c2}", "{0:c2}", "{0:c2}", "{0:c2}"); _formatParamList.Add(p.Key, p);
        p = new FormatParam("\\", "{0:c2}", "{0:f2}", "{0:c2}", "{0:f2}"); _formatParamList.Add(p.Key, p);
        p = new FormatParam("g", "{0:c2}", "{0:c2}", "{0:c2}", "{0:c2}"); _formatParamList.Add(p.Key, p);
        p = new FormatParam("mm", "{0:c2}", "{0:c2}", "{0:c2}", "{0:c2}"); _formatParamList.Add(p.Key, p);
        p = new FormatParam("回/時", "", "", "", ""); _formatParamList.Add(p.Key, p);
        p = new FormatParam("個所", "", "", "", ""); _formatParamList.Add(p.Key, p);
        p = new FormatParam("ヶ", "", "", "", ""); _formatParamList.Add(p.Key, p);
        p = new FormatParam("ケ", "", "", "", ""); _formatParamList.Add(p.Key, p);
        p = new FormatParam("秒", "{0:c2}", "{0:c2}", "{0:c2}", "{0:c2}"); _formatParamList.Add(p.Key, p);



    }

    public static FormatParam get(String key)
    {
        if (_formatParamList.ContainsKey(key))
        {
            return _formatParamList[key];
        }
        return _formatParamList["-"];

    }
}