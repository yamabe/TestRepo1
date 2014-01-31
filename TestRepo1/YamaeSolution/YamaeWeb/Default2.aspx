<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MTankaMitsumori.aspx.cs" Inherits="MTankaMitsumori" %>

<%@ Register TagPrefix="y" Namespace="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>単価見積もり画面</title>
    <link href="css/style.css" rel="stylesheet" />

    <script type="text/javascript" src="jquery-1.11.0.js"></script>
    <script type="text/javascript">

     
        var 部品コード = $('#<%=  mainFormView.FindControl("部品コード").ClientID%>');
        var 部品名称 = $('#<%=  mainFormView.FindControl("部品名称").ClientID%>');
        var 材料ID = $('#<%=  mainFormView.FindControl("材料ID").ClientID%>');
        var 材料名称 = $('#<%=  mainFormView.FindControl("材料名称").ClientID%>');
        var 材質大分類 = $('#<%=  mainFormView.FindControl("材質大分類").ClientID%>');
        var 材質 = $('#<%=  mainFormView.FindControl("材質").ClientID%>');
        var 定尺寸法縦 = $('#<%=  mainFormView.FindControl("定尺寸法縦").ClientID%>');
        var 定尺寸法横 = $('#<%=  mainFormView.FindControl("定尺寸法横").ClientID%>');
        var 厚み = $('#<%=  mainFormView.FindControl("厚み").ClientID%>');
        var 定尺仕入金額 = $('#<%=  mainFormView.FindControl("定尺仕入金額").ClientID%>');
        var 定尺売り金額 = $('#<%=  mainFormView.FindControl("定尺売り金額").ClientID%>');
        var 仕入れ単価 = $('#<%=  mainFormView.FindControl("仕入れ単価").ClientID%>');
        var 取り数 = $('#<%=  mainFormView.FindControl("取り数").ClientID%>');
        var 商品たて = $('#<%=  mainFormView.FindControl("商品たて").ClientID%>');
        var 商品よこ = $('#<%=  mainFormView.FindControl("商品よこ").ClientID%>');
        var たてしろ = $('#<%=  mainFormView.FindControl("たてしろ").ClientID%>');
        var よこしろ = $('#<%=  mainFormView.FindControl("よこしろ").ClientID%>');
        var 見積_裁断 = $('#<%=  mainFormView.FindControl("見積_裁断").ClientID%>');
        var 見積_打抜き = $('#<%=  mainFormView.FindControl("見積_打抜き").ClientID%>');
        var 見積_貼り = $('#<%=  mainFormView.FindControl("見積_貼り").ClientID%>');
        var 見積_曲げ = $('#<%=  mainFormView.FindControl("見積_曲げ").ClientID%>');
        var 見積_ロス管理 = $('#<%=  mainFormView.FindControl("見積_ロス管理").ClientID%>');
        var 定尺裁断_数 = $('#<%=  mainFormView.FindControl("定尺裁断_数").ClientID%>');
        var 定尺裁断_所要時間 = $('#<%=  mainFormView.FindControl("定尺裁断_所要時間").ClientID%>');
        var 定尺裁断_割数 = $('#<%=  mainFormView.FindControl("定尺裁断_割数").ClientID%>');
        var 寸法カット_数 = $('#<%=  mainFormView.FindControl("寸法カット_数").ClientID%>');
        var 寸法カット_所要時間 = $('#<%=  mainFormView.FindControl("寸法カット_所要時間").ClientID%>');
        var 寸法カット_割数 = $('#<%=  mainFormView.FindControl("寸法カット_割数").ClientID%>');
        var 打抜_型取数 = $('#<%=  mainFormView.FindControl("打抜_型取数").ClientID%>');
        var 打抜_プレス回数 = $('#<%=  mainFormView.FindControl("打抜_プレス回数").ClientID%>');
        var 曲げ_数 = $('#<%=  mainFormView.FindControl("曲げ_数").ClientID%>');
        var 曲げ_秒数 = $('#<%=  mainFormView.FindControl("曲げ_秒数").ClientID%>');
        var 曲げ_同時加工 = $('#<%=  mainFormView.FindControl("曲げ_同時加工").ClientID%>');
        var 仕上げ_数 = $('#<%=  mainFormView.FindControl("仕上げ_数").ClientID%>');
        var 仕上げ_秒数 = $('#<%=  mainFormView.FindControl("仕上げ_秒数").ClientID%>');
        var ロス管理_材比 = $('#<%=  mainFormView.FindControl("ロス管理_材比").ClientID%>');
        var ロス管理_加工比 = $('#<%=  mainFormView.FindControl("ロス管理_加工比").ClientID%>');
        var ロット = $('#<%=  mainFormView.FindControl("ロット").ClientID%>');
        var 丸め数 = $('#<%=  mainFormView.FindControl("丸め数").ClientID%>');
        var 商品重量 = $('#<%=  mainFormView.FindControl("商品重量").ClientID%>');
        var 削除フラグ = $('#<%=  mainFormView.FindControl("削除フラグ").ClientID%>');
        var 作成ユーザー = $('#<%=  mainFormView.FindControl("作成ユーザー").ClientID%>');
        var 最終更新ユーザー = $('#<%=  mainFormView.FindControl("最終更新ユーザー").ClientID%>');
        var 作成日時 = $('#<%=  mainFormView.FindControl("作成日時").ClientID%>');
        var 最終更新日時 = $('#<%=  mainFormView.FindControl("最終更新日時").ClientID%>');

     
        var たて_しろあり = $('#<%=  mainFormView.FindControl("たて_しろあり").ClientID%>');
        var よこ_しろあり = $('#<%=  mainFormView.FindControl("よこ_しろあり").ClientID%>');
        var 縦取り数 = $('#<%=  mainFormView.FindControl("縦取り数").ClientID%>');
        var 横取り数 = $('#<%=  mainFormView.FindControl("横取り数").ClientID%>');
        var たて余 = $('#<%=  mainFormView.FindControl("たて余").ClientID%>');
        var よこ余 = $('#<%=  mainFormView.FindControl("よこ余").ClientID%>');
        var 計算_取り数 = $('#<%=  mainFormView.FindControl("計算_取り数").ClientID%>');
        var m2あたりの材料費 = $('#<%=  mainFormView.FindControl("m2あたりの材料費").ClientID%>');
        var m2あたりの取数たて = $('#<%=  mainFormView.FindControl("m2あたりの取数たて").ClientID%>');
        var m2あたりの取数よこ = $('#<%=  mainFormView.FindControl("m2あたりの取数よこ").ClientID%>');
        var m2あたりの取数 = $('#<%=  mainFormView.FindControl("m2あたりの取数").ClientID%>');
        var 単価チェック = $('#<%=  mainFormView.FindControl("単価チェック").ClientID%>');
        var 見積_材料費 = $('#<%=  mainFormView.FindControl("見積_材料費").ClientID%>');
        var 見積_材料費比 = $('#<%=  mainFormView.FindControl("見積_材料費比").ClientID%>');
        var 見積_加工費小計 = $('#<%=  mainFormView.FindControl("見積_加工費小計").ClientID%>');
        var 見積_加工費比 = $('#<%=  mainFormView.FindControl("見積_加工費比").ClientID%>');
        var 見積_単価 = $('#<%=  mainFormView.FindControl("見積_単価").ClientID%>');
        var 計算_裁断 = $('#<%=  mainFormView.FindControl("計算_裁断").ClientID%>');
        var 計算_打抜き = $('#<%=  mainFormView.FindControl("計算_打抜き").ClientID%>');
        var 計算_貼り = $('#<%=  mainFormView.FindControl("計算_貼り").ClientID%>');
        var 計算_曲げ = $('#<%=  mainFormView.FindControl("計算_曲げ").ClientID%>');
        var 計算_ロス管理 = $('#<%=  mainFormView.FindControl("計算_ロス管理").ClientID%>');
        var 計算_材料費 = $('#<%=  mainFormView.FindControl("計算_材料費").ClientID%>');
        var 計算_材料費比 = $('#<%=  mainFormView.FindControl("計算_材料費比").ClientID%>');
        var 計算_加工費小計 = $('#<%=  mainFormView.FindControl("計算_加工費小計").ClientID%>');
        var 計算_加工費比 = $('#<%=  mainFormView.FindControl("計算_加工費比").ClientID%>');
        var 計算_単価 = $('#<%=  mainFormView.FindControl("計算_単価").ClientID%>');
        var 時間単価 = $('#<%=  mainFormView.FindControl("時間単価").ClientID%>');
        var 分単価 = $('#<%=  mainFormView.FindControl("分単価").ClientID%>');
        var 秒単価 = $('#<%=  mainFormView.FindControl("秒単価").ClientID%>');
        var 定尺裁断_時間 = $('#<%=  mainFormView.FindControl("定尺裁断_時間").ClientID%>');
        var 定尺裁断_作業費 = $('#<%=  mainFormView.FindControl("定尺裁断_作業費").ClientID%>');
        var 定尺裁断_単価当り = $('#<%=  mainFormView.FindControl("定尺裁断_単価当り").ClientID%>');
        var 寸法カット_時間 = $('#<%=  mainFormView.FindControl("寸法カット_時間").ClientID%>');
        var 寸法カット_作業費 = $('#<%=  mainFormView.FindControl("寸法カット_作業費").ClientID%>');
        var 寸法カット_単価当り = $('#<%=  mainFormView.FindControl("寸法カット_単価当り").ClientID%>');
        var 打抜_時間当たりの加工数 = $('#<%=  mainFormView.FindControl("打抜_時間当たりの加工数").ClientID%>');
        var 打抜_単価当り = $('#<%=  mainFormView.FindControl("打抜_単価当り").ClientID%>');
        var 曲げ_時間 = $('#<%=  mainFormView.FindControl("曲げ_時間").ClientID%>');
        var 曲げ_作業費 = $('#<%=  mainFormView.FindControl("曲げ_作業費").ClientID%>');
        var 曲げ_単価当り = $('#<%=  mainFormView.FindControl("曲げ_単価当り").ClientID%>');
        var 仕上げ_時間 = $('#<%=  mainFormView.FindControl("仕上げ_時間").ClientID%>');
        var 仕上げ_作業費 = $('#<%=  mainFormView.FindControl("仕上げ_作業費").ClientID%>');
        var 仕上げ_単価当り = $('#<%=  mainFormView.FindControl("仕上げ_単価当り").ClientID%>');
        var ロス管理_材_費用 = $('#<%=  mainFormView.FindControl("ロス管理_材_費用").ClientID%>');
        var ロス管理_加工_費用 = $('#<%=  mainFormView.FindControl("ロス管理_加工_費用").ClientID%>');
        var ロス管理_単価_費用 = $('#<%=  mainFormView.FindControl("ロス管理_単価_費用").ClientID%>');
        var 見積_定尺裁断費比 = $('#<%=  mainFormView.FindControl("見積_定尺裁断費比").ClientID%>');
        var 計算_定尺裁断費比 = $('#<%=  mainFormView.FindControl("計算_定尺裁断費比").ClientID%>');
        var 計算_寸法カット費比 = $('#<%=  mainFormView.FindControl("計算_寸法カット費比").ClientID%>');
        var 見積_打ち抜き費比 = $('#<%=  mainFormView.FindControl("見積_打ち抜き費比").ClientID%>');
        var 計算_打ち抜き費比 = $('#<%=  mainFormView.FindControl("計算_打ち抜き費比").ClientID%>');
        var 見積_貼り費比 = $('#<%=  mainFormView.FindControl("見積_貼り費比").ClientID%>');
        var 計算_貼り比 = $('#<%=  mainFormView.FindControl("計算_貼り比").ClientID%>');
        var 見積_曲げ費比 = $('#<%=  mainFormView.FindControl("見積_曲げ費比").ClientID%>');
        var 計算_曲げ費比 = $('#<%=  mainFormView.FindControl("計算_曲げ費比").ClientID%>');
        var 見積_仕上げ費比 = $('#<%=  mainFormView.FindControl("見積_仕上げ費比").ClientID%>');
        var 計算_仕上げ費比 = $('#<%=  mainFormView.FindControl("計算_仕上げ費比").ClientID%>');
        var 見積_ロス管理費比 = $('#<%=  mainFormView.FindControl("見積_ロス管理費比").ClientID%>');
        var 計算_ロス管理費比 = $('#<%=  mainFormView.FindControl("計算_ロス管理費比").ClientID%>');

        function Fixed(value, keta) {
            //最初のテキストボックスの値を数字に変換
            var num = parseFloat(value);
            console.log("1:" + num);
            var num2 = num.toFixed(keta);

            console.log("2:" + num2);

            return num2;
        }

        function Floor(value, keta) {
            var num = parseFloat(value);
            
            return Math.floor(num * Math.pow(10, keta)) / Math.pow(10, keta)
        }

        function BindEvent(ele, func) {
            ele.bind('keyup', function (event) { func(event, this) });
            ele.bind('change', function (event) { func(event, this) });
        }

        var m2あたりの材料費計算 = function (event, ele) {
            try {
                var v縦係数 = 定尺寸法縦/1000;
                var v横係数 = 定尺寸法横 / 1000;
                var v面 = v縦係数 * v横係数;
                
                m2あたりの材料費.val(Fixed(定尺仕入金額 / v面), 2);
            } catch (e) {
                m2あたりの材料費.val("NaN");
            }
        };

        BindEvent(定尺寸法縦, m2あたりの材料費計算);
        BindEvent(定尺寸法横, m2あたりの材料費計算);
        BindEvent(定尺仕入金額, m2あたりの材料費計算);
        定尺寸法縦.bind('keyup', function (event) { m2あたりの材料費計算(event, this) });
        定尺寸法縦.bind('change', function (event) { m2あたりの材料費計算(event, this) });
        定尺寸法横.bind('keyup', function (event) { m2あたりの材料費計算(event, this) });
        定尺寸法横.bind('change', function (event) { m2あたりの材料費計算(event, this) });
        定尺仕入金額.bind('keyup', function (event) { m2あたりの材料費計算(event, this) });
        定尺仕入金額.bind('change', function (event) { m2あたりの材料費計算(event, this) });
        定尺寸法横.change();

    </script>
</head>
</html>
