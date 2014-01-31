using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// ZairyoKikakuStatusChecker の概要の説明です
/// </summary>
public class ZairyoKikakuStatusChecker
{
    public String Get(SqlDataSourceCommandEventArgs e)
    {
        // ステータスを決める
        // 試打検査納品日 なし　→　未提出
        // 試打検査確認日 なし　→　寸検確認待ち
        // 試打組立用注文日 なし　→　試打用未注文
        // 試打組立用納品日 なし　→　試打用納品待ち
        // 型費請求書提出日 なし　→　型請求書未提出
        // 量試用注文日 なし　→　量試用未注文
        // 量使用納品日 なし　→　量試用納品待ち

        List<String> statusList = new List<string>();
        StringBuilder sb = new StringBuilder();

        if (e.Command.Parameters["規格番号"].Value == null
            || String.IsNullOrEmpty(e.Command.Parameters["規格番号"].Value.ToString()))
        {
            statusList.Add("申請中");
        }
        else
        {
            statusList.Add("承認済み");
        }


        if (statusList.Count <= 0)
        {
            return "{不明}";
        }
        else
        {
            return StringUtils.Join(statusList, ",");
        }
    }

}