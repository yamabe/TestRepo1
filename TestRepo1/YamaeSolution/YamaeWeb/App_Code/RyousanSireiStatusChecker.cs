using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// RyousanSireiStatusChecker の概要の説明です
/// </summary>
public class RyousanSireiStatusChecker
{
    public RyousanSireiStatusChecker()
    {
        //
        // TODO: コンストラクター ロジックをここに追加します
        //
    }

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

        if (e.Command.Parameters["試打検査納品日"].Value == null
            || String.IsNullOrEmpty(e.Command.Parameters["試打検査納品日"].Value.ToString()))
        {
            statusList.Add("未提出");
            return StringUtils.Join(statusList, ",");
        }

        if (e.Command.Parameters["試打検査確認日"].Value == null
           || String.IsNullOrEmpty(e.Command.Parameters["試打検査確認日"].Value.ToString()))
        {
            statusList.Add("寸検待ち");
            return StringUtils.Join(statusList, ",");
        }

        if (e.Command.Parameters["型費請求書提出日"].Value == null
            || String.IsNullOrEmpty(e.Command.Parameters["型費請求書提出日"].Value.ToString()))
        {
            statusList.Add("型請求書未提出");
        }

        //if (e.Command.Parameters["試打組立用注文日"].Value == null
        //    || String.IsNullOrEmpty(e.Command.Parameters["試打組立用注文日"].Value.ToString()))
        //{
        //    statusList.Add("試打未注文");
        //    return Join(statusList, ",");
        //}

        //if (e.Command.Parameters["試打組立用納品日"].Value == null
        //    || String.IsNullOrEmpty(e.Command.Parameters["試打組立用納品日"].Value.ToString()))
        //{
        //    statusList.Add("試打品納品待ち");
        //    return Join(statusList, ",");
        //}

        //if (e.Command.Parameters["量試用注文日"].Value == null
        //    || String.IsNullOrEmpty(e.Command.Parameters["量試用注文日"].Value.ToString()))
        //{
        //    statusList.Add("量試用未注文");
        //    return Join(statusList, ",");
        //}

        //if (e.Command.Parameters["量使用納品日"].Value == null
        //    || String.IsNullOrEmpty(e.Command.Parameters["量使用納品日"].Value.ToString()))
        //{
        //    statusList.Add("量試用納品待ち");
        //    return Join(statusList, ",");
        //}

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