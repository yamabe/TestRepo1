using System;
using System.Collections.Generic;
using System.Text;
using System.Web;

/// <summary>
/// StringUtils の概要の説明です
/// </summary>
public class StringUtils
{
    public static String TrueString = "True";
    public static String FalseString = "False";

	public StringUtils()
	{
		//
		// TODO: コンストラクター ロジックをここに追加します
		//
	}

    public static String Join(List<String> list, String delimiter)
    {
        StringBuilder sb = new StringBuilder();

        if (list.Count <= 0)
        {
            return string.Empty;
        }

        sb.Append(list[0]);

        for (int i = 1; i < list.Count; i++)
        {
            sb.Append(delimiter);
            sb.Append(list[i]);

        }

        return sb.ToString();

    }


    public static bool IsEmptyOrZero(String value)
    {
        if (String.IsNullOrEmpty(value))
        {
            return true;
        }

        decimal iValue = 0;

        if (Decimal.TryParse(value, out iValue))
        {
            if (iValue == 0)
            {
                return true;
            }
        }
        return false;
    }
}