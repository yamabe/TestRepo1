using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// TokuseiMarkUtils の概要の説明です
/// </summary>
public class TokuseiMarkUtils
{
	public TokuseiMarkUtils()
	{
		
	}

    public static List<String> GetMarkForConditionValues(String mark)
    {
        List<String> markList = new List<String>();

        if (mark == "×")
        {
            markList.Add("×");
            markList.Add("△");
            markList.Add("○");
            markList.Add("◎");
        }
        else if (mark == "△")
        {
            markList.Add("△");
            markList.Add("○");
            markList.Add("◎");
        }
        else if (mark == "○")
        {
            markList.Add("○");
            markList.Add("◎");
        }
        else if (mark == "◎")
        {
            markList.Add("◎");

        }

        return markList;
    }
}