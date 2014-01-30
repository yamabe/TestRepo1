<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<%@ Register Assembly="WebApplication1" TagPrefix="y" Namespace="uc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="jquery-1.11.0.js"></script>
    <script type="text/javascript">

        function Round(value, keta) {
            //最初のテキストボックスの値を数字に変換
            var num = parseFloat(value);
            console.log("1:" + num);
            var num2 = num.toFixed(keta);

            console.log("2:" + num2);

            return num2;
        }


        $(document).ready(function () {


            var 部品コード = $('#<%=  FormView1.FindControl("部品コード").ClientID%>');
            var 部品名称 = $('#<%=  FormView1.FindControl("部品名称").ClientID%>');
            var 材料名称 = $('#<%=  FormView1.FindControl("材料名称").ClientID%>');
            var 材質大分類 = $('#<%=  FormView1.FindControl("材質大分類").ClientID%>');
            var 材質 = $('#<%=  FormView1.FindControl("材質").ClientID%>');
            var 定尺寸法縦 = $('#<%=  FormView1.FindControl("定尺寸法縦").ClientID%>');
            var 定尺寸法横 = $('#<%=  FormView1.FindControl("定尺寸法横").ClientID%>');
            var 厚み = $('#<%=  FormView1.FindControl("厚み").ClientID%>');
            var 定尺仕入金額 = $('#<%=  FormView1.FindControl("定尺仕入金額").ClientID%>');
            var 定尺売り金額 = $('#<%=  FormView1.FindControl("定尺売り金額").ClientID%>');
            var 仕入れ単価 = $('#<%=  FormView1.FindControl("仕入れ単価").ClientID%>');
            var 取り数 = $('#<%=  FormView1.FindControl("取り数").ClientID%>');
            var 商品たて = $('#<%=  FormView1.FindControl("商品たて").ClientID%>');
            var 商品よこ = $('#<%=  FormView1.FindControl("商品よこ").ClientID%>');
            var たてしろ係数 = $('#<%=  FormView1.FindControl("たてしろ係数").ClientID%>');
            var よこしろ係数 = $('#<%=  FormView1.FindControl("よこしろ係数").ClientID%>');
            var 仕入れ_裁断 = $('#<%=  FormView1.FindControl("仕入れ_裁断").ClientID%>');
            var 仕入れ_打抜き = $('#<%=  FormView1.FindControl("仕入れ_打抜き").ClientID%>');
            var 仕入れ_貼り = $('#<%=  FormView1.FindControl("仕入れ_貼り").ClientID%>');
            var 仕入れ_曲げ = $('#<%=  FormView1.FindControl("仕入れ_曲げ").ClientID%>');
            var 仕入れ_ロス管理 = $('#<%=  FormView1.FindControl("仕入れ_ロス管理").ClientID%>');
            var 裁断_数 = $('#<%=  FormView1.FindControl("裁断_数").ClientID%>');
            var 裁断_所要時間 = $('#<%=  FormView1.FindControl("裁断_所要時間").ClientID%>');
            var 裁断_割数 = $('#<%=  FormView1.FindControl("裁断_割数").ClientID%>');
            var 打抜_型取数 = $('#<%=  FormView1.FindControl("打抜_型取数").ClientID%>');
            var 打抜_プレス回数 = $('#<%=  FormView1.FindControl("打抜_プレス回数").ClientID%>');
            var 曲げ_数 = $('#<%=  FormView1.FindControl("曲げ_数").ClientID%>');
            var 曲げ_秒数 = $('#<%=  FormView1.FindControl("曲げ_秒数").ClientID%>');
            var 曲げ_同時加工 = $('#<%=  FormView1.FindControl("曲げ_同時加工").ClientID%>');
            var 仕上げ_数 = $('#<%=  FormView1.FindControl("仕上げ_数").ClientID%>');
            var 仕上げ_秒数 = $('#<%=  FormView1.FindControl("仕上げ_秒数").ClientID%>');
            var ロス管理_材 = $('#<%=  FormView1.FindControl("ロス管理_材").ClientID%>');
            var ロス管理_加工 = $('#<%=  FormView1.FindControl("ロス管理_加工").ClientID%>');
            var ロット = $('#<%=  FormView1.FindControl("ロット").ClientID%>');
            var 丸め数 = $('#<%=  FormView1.FindControl("丸め数").ClientID%>');
            var 商品重量 = $('#<%=  FormView1.FindControl("商品重量").ClientID%>');


            var 部品コード2 = $('#<%=  FormView1.FindControl("部品コード2").ClientID%>');
            var 部品名称2 = $('#<%=  FormView1.FindControl("部品名称2").ClientID%>');
            var 材料名称2 = $('#<%=  FormView1.FindControl("材料名称2").ClientID%>');
            var 材質大分類2 = $('#<%=  FormView1.FindControl("材質大分類2").ClientID%>');
            var 材質2 = $('#<%=  FormView1.FindControl("材質2").ClientID%>');
            var 定尺寸法縦2 = $('#<%=  FormView1.FindControl("定尺寸法縦2").ClientID%>');
            var 定尺寸法横2 = $('#<%=  FormView1.FindControl("定尺寸法横2").ClientID%>');
            var 厚み2 = $('#<%=  FormView1.FindControl("厚み2").ClientID%>');
            var 定尺仕入金額2 = $('#<%=  FormView1.FindControl("定尺仕入金額2").ClientID%>');
            var 定尺売り金額2 = $('#<%=  FormView1.FindControl("定尺売り金額2").ClientID%>');
            var 仕入れ単価2 = $('#<%=  FormView1.FindControl("仕入れ単価2").ClientID%>');
            var 取り数2 = $('#<%=  FormView1.FindControl("取り数2").ClientID%>');
            var 商品たて2 = $('#<%=  FormView1.FindControl("商品たて2").ClientID%>');
            var 商品よこ2 = $('#<%=  FormView1.FindControl("商品よこ2").ClientID%>');
            var たてしろ係数2 = $('#<%=  FormView1.FindControl("たてしろ係数2").ClientID%>');
            var よこしろ係数2 = $('#<%=  FormView1.FindControl("よこしろ係数2").ClientID%>');
            var 仕入れ_裁断2 = $('#<%=  FormView1.FindControl("仕入れ_裁断2").ClientID%>');
            var 仕入れ_打抜き2 = $('#<%=  FormView1.FindControl("仕入れ_打抜き2").ClientID%>');
            var 仕入れ_貼り2 = $('#<%=  FormView1.FindControl("仕入れ_貼り2").ClientID%>');
            var 仕入れ_曲げ2 = $('#<%=  FormView1.FindControl("仕入れ_曲げ2").ClientID%>');
            var 仕入れ_ロス管理2 = $('#<%=  FormView1.FindControl("仕入れ_ロス管理2").ClientID%>');
            var 裁断_数2 = $('#<%=  FormView1.FindControl("裁断_数2").ClientID%>');
            var 裁断_所要時間2 = $('#<%=  FormView1.FindControl("裁断_所要時間2").ClientID%>');
            var 裁断_割数2 = $('#<%=  FormView1.FindControl("裁断_割数2").ClientID%>');
            var 打抜_型取数2 = $('#<%=  FormView1.FindControl("打抜_型取数2").ClientID%>');
            var 打抜_プレス回数2 = $('#<%=  FormView1.FindControl("打抜_プレス回数2").ClientID%>');
            var 曲げ_数2 = $('#<%=  FormView1.FindControl("曲げ_数2").ClientID%>');
            var 曲げ_秒数2 = $('#<%=  FormView1.FindControl("曲げ_秒数2").ClientID%>');
            var 曲げ_同時加工2 = $('#<%=  FormView1.FindControl("曲げ_同時加工2").ClientID%>');
            var 仕上げ_数2 = $('#<%=  FormView1.FindControl("仕上げ_数2").ClientID%>');
            var 仕上げ_秒数2 = $('#<%=  FormView1.FindControl("仕上げ_秒数2").ClientID%>');
            var ロス管理_材2 = $('#<%=  FormView1.FindControl("ロス管理_材2").ClientID%>');
            var ロス管理_加工2 = $('#<%=  FormView1.FindControl("ロス管理_加工2").ClientID%>');
            var ロット2 = $('#<%=  FormView1.FindControl("ロット2").ClientID%>');
            var 丸め数2 = $('#<%=  FormView1.FindControl("丸め数2").ClientID%>');
            var 商品重量2 = $('#<%=  FormView1.FindControl("商品重量2").ClientID%>');

            var たて計算 = function (event, ele) {
                try {
                    たてしろ係数2.val(Round(eval(たてしろ係数.val()) + eval(商品たて.val()), 2));
                } catch (e) {
                    たてしろ係数2.val("NaN");
                }
            };
            たてしろ係数.bind('keyup', function (event) { たて計算(event, this) });
            商品たて.bind('keyup', function (event) { たて計算(event, this) });
            たてしろ係数.bind('change', function (event) { たて計算(event, this) });
            商品たて.bind('change', function (event) { たて計算(event, this) });


            var よこ計算 = function (event, ele) {
                try {
                    よこしろ係数2.val(Round(eval(よこしろ係数.val()) + eval(商品よこ.val()), 2));
                } catch (e) {
                    よこしろ係数2.val("NaN");
                }
            };
            よこしろ係数.bind('keyup', function (event) { よこ計算(event, this) });
            商品よこ.bind('keyup', function (event) { よこ計算(event, this) });
            よこしろ係数.bind('change', function (event) { よこ計算(event, this) });
            商品よこ.bind('change', function (event) { よこ計算(event, this) });

            var 材料費計算 = function (event, ele) {
                try {
                    var val = eval(定尺仕入金額.val()) / eval(取り数.val());
                    取り数2.val(Round(val, 2));
                } catch (e) {

                    取り数2.val("NaN");

                }
            };
            定尺仕入金額.bind('keyup', function (event) { 材料費計算(event, this) });
            取り数.bind('keyup', function (event) { 材料費計算(event, this) });
            定尺仕入金額.bind('change', function (event) { 材料費計算(event, this) });
            取り数.bind('change', function (event) { 材料費計算(event, this) });

            // 商品の材料費から定尺単価の算出
            //　単価- 加工費 = 材料費
            //　たて係数＝    1000 / たて長さ
            //　よこ係数＝    1000 / よこ長さ
            //　材料費　* たて係数　＊　よこ係数 = ㎡単価
            //
            //
            //


            console.log(たてしろ係数.val());
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="材料ID,最終更新日時"
            DataSourceID="SqlDataSource1" OnRowEditing="GridView1_RowEditing" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
                <asp:ButtonField ButtonType="Link" CommandName="Copy" Text="Copy" />
                <y:YBoundField HeaderText="単価ID" DataFormatStringEditing="" DataField="単価ID" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false"
                    IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                <y:YBoundField HeaderText="部品コード" DataFormatStringEditing="" DataField="部品コード" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                <y:YBoundField HeaderText="部品名称" DataFormatStringEditing="" DataField="部品名称" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                <y:YBoundField HeaderText="材料ID" DataFormatStringEditing="" DataField="材料ID" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server"
                    DataSourceID="材料DataSource" DataTextField="材料名称" DataValueField="材料ID" AppendDataBoundItems="true"
                    IsDropDownList="true" />
                <y:YBoundField HeaderText="材料名称" DataFormatStringEditing="" DataField="材料名称" ReadOnly="TRUE"
                    IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false"
                    IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                <y:YBoundField HeaderText="材質大分類" DataFormatStringEditing="" DataField="材質大分類" ReadOnly="TRUE"
                    IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false"
                    IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                <y:YBoundField HeaderText="材質" DataFormatStringEditing="" DataField="材質" ReadOnly="TRUE"
                    IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false"
                    IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                <y:YBoundField HeaderText="定尺寸法縦" DataFormatStringEditing="" DataField="定尺寸法縦" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="定尺寸法横" DataFormatStringEditing="" DataField="定尺寸法横" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="厚み" DataFormatStringEditing="" DataField="厚み" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="40" ItemStyle-Width="40" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="定尺仕入金額" DataFormatStringEditing="{0:f2}" DataField="定尺仕入金額"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:c2}"
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="定尺売り金額" DataFormatStringEditing="{0:f2}" DataField="定尺売り金額"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:c2}"
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="仕入れ単価" DataFormatStringEditing="{0:f2}" DataField="仕入れ単価"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:c2}"
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="取り数" DataFormatStringEditing="" DataField="取り数" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="商品たて" DataFormatStringEditing="" DataField="商品たて" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="商品よこ" DataFormatStringEditing="" DataField="商品よこ" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="たてしろ係数" DataFormatStringEditing="" DataField="たてしろ係数"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString=""
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="よこしろ係数" DataFormatStringEditing="" DataField="よこしろ係数"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString=""
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="仕入れ_裁断" DataFormatStringEditing="" DataField="仕入れ_裁断"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString=""
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="仕入れ_打抜き" DataFormatStringEditing="" DataField="仕入れ_打抜き"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString=""
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="仕入れ_貼り" DataFormatStringEditing="" DataField="仕入れ_貼り"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString=""
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="仕入れ_曲げ" DataFormatStringEditing="" DataField="仕入れ_曲げ"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString=""
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="仕入れ_ロス管理" DataFormatStringEditing="" DataField="仕入れ_ロス管理"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString=""
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="裁断_数" DataFormatStringEditing="" DataField="裁断_数" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="裁断_所要時間" DataFormatStringEditing="" DataField="裁断_所要時間"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString=""
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="裁断_割数" DataFormatStringEditing="" DataField="裁断_割数" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="打抜_型取数" DataFormatStringEditing="" DataField="打抜_型取数"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString=""
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="打抜_プレス回数" DataFormatStringEditing="" DataField="打抜_プレス回数"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString=""
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="曲げ_数" DataFormatStringEditing="" DataField="曲げ_数" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="曲げ_秒数" DataFormatStringEditing="" DataField="曲げ_秒数" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="曲げ_同時加工" DataFormatStringEditing="" DataField="曲げ_同時加工"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString=""
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="仕上げ_数" DataFormatStringEditing="" DataField="仕上げ_数" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="仕上げ_秒数" DataFormatStringEditing="" DataField="仕上げ_秒数"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString=""
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="ロス管理_材" DataFormatStringEditing="" DataField="ロス管理_材"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString=""
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="ロス管理_加工" DataFormatStringEditing="" DataField="ロス管理_加工"
                    ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70"
                    ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString=""
                    IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="ロット" DataFormatStringEditing="" DataField="ロット" ReadOnly="TRUE"
                    IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false"
                    IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="丸め数" DataFormatStringEditing="" DataField="丸め数" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="商品重量" DataFormatStringEditing="" DataField="商品重量" ReadOnly="FALSE"
                    IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                <y:YBoundField HeaderText="削除フラグ" DataFormatStringEditing="" DataField="削除フラグ" ReadOnly="FALSE"
                    IsBoolean="TRUE" ControlStyle-Width="40" ItemStyle-Width="40" ItemStyle-Wrap="false"
                    IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                <y:YBoundField HeaderText="作成ユーザー" DataFormatStringEditing="" DataField="作成ユーザー"
                    ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100"
                    ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString=""
                    IsInteger="true" runat="server" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名"
                    DataValueField="ユーザーId" AppendDataBoundItems="true" IsDropDownList="true" />
                <y:YBoundField HeaderText="最終更新ユーザー" DataFormatStringEditing="" DataField="最終更新ユーザー"
                    ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100"
                    ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString=""
                    IsInteger="true" runat="server" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名"
                    DataValueField="ユーザーId" AppendDataBoundItems="true" IsDropDownList="true" />
                <y:YBoundField HeaderText="作成日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}"
                    DataField="作成日時" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100"
                    ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}"
                    IsInteger="false" runat="server" />
                <y:YBoundField HeaderText="最終更新日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}"
                    DataField="最終更新日時" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100"
                    ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="true"
                    DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <br />
        <br />
        <div runat="server">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="材料ID" DataSourceID="SqlDataSource1"
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
                CellPadding="3" CellSpacing="2" GridLines="Both">
                <EditItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <table>
                                    <y:YTextBox ID="部品コード" Label="部品コード【-】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("部品コード", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="false" runat="server" />
                                    <y:YTextBox ID="部品名称" Label="部品名称【-】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("部品名称", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="false" runat="server" />
                                    <y:YTextBox ID="材料名称" Label="材料名称【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("材料名称", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString=""
                                        IsInteger="false" runat="server" />
                                    <y:YTextBox ID="材質大分類" Label="材質大分類【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("材質大分類", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString=""
                                        IsInteger="false" runat="server" />
                                    <y:YTextBox ID="材質" Label="材質【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("材質", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString=""
                                        IsInteger="false" runat="server" />
                                    <y:YTextBox ID="定尺寸法縦" Label="定尺寸法縦【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("定尺寸法縦", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="定尺寸法横" Label="定尺寸法横【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("定尺寸法横", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="厚み" Label="厚み【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("厚み", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="定尺仕入金額" Label="定尺仕入金額【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("定尺仕入金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}"
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="定尺売り金額" Label="定尺売り金額【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("定尺売り金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}"
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="仕入れ単価" Label="仕入れ単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("仕入れ単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}"
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="取り数" Label="取り数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("取り数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="商品たて" Label="商品たて【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("商品たて", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="商品よこ" Label="商品よこ【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("商品よこ", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="たてしろ係数" Label="たてしろ係数【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("たてしろ係数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="よこしろ係数" Label="よこしろ係数【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("よこしろ係数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="仕入れ_裁断" Label="仕入れ_裁断【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("仕入れ_裁断", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="仕入れ_打抜き" Label="仕入れ_打抜き【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("仕入れ_打抜き", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="仕入れ_貼り" Label="仕入れ_貼り【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("仕入れ_貼り", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="仕入れ_曲げ" Label="仕入れ_曲げ【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("仕入れ_曲げ", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="仕入れ_ロス管理" Label="仕入れ_ロス管理【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("仕入れ_ロス管理", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="裁断_数" Label="裁断_数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("裁断_数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="裁断_所要時間" Label="裁断_所要時間【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("裁断_所要時間", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="裁断_割数" Label="裁断_割数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("裁断_割数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="打抜_型取数" Label="打抜_型取数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("打抜_型取数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="打抜_プレス回数" Label="打抜_プレス回数【回/時】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("打抜_プレス回数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="曲げ_数" Label="曲げ_数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("曲げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="曲げ_秒数" Label="曲げ_秒数【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("曲げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="曲げ_同時加工" Label="曲げ_同時加工【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("曲げ_同時加工", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="仕上げ_数" Label="仕上げ_数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("仕上げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="仕上げ_秒数" Label="仕上げ_秒数【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("仕上げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="ロス管理_材" Label="ロス管理_材【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("ロス管理_材", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="ロス管理_加工" Label="ロス管理_加工【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("ロス管理_加工", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="ロット" Label="ロット【ヶ】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("ロット", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="丸め数" Label="丸め数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("丸め数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="商品重量" Label="商品重量【g】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("商品重量", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YCheckBox ID="削除フラグ" Label="削除フラグ【true/false】" IsGrid="false" ReadOnly="FALSE"
                                        ValidationGroup="DetailUpdate" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'
                                        IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                                    <y:YTextBox ID="作成日時" Label="作成日時【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true"
                                        DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" />
                                    <y:YTextBox ID="最終更新日時" Label="最終更新日時【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true"
                                        DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" />
                                </table>
                            </td>
                            <td>
                                <table>
                                    <y:YTextBox ID="部品コード2" Label="部品コード【-】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("部品コード", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="false" runat="server" />
                                    <y:YTextBox ID="部品名称2" Label="部品名称【-】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("部品名称", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="false" runat="server" />
                                    <y:YTextBox ID="材料名称2" Label="材料名称【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("材料名称", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString=""
                                        IsInteger="false" runat="server" />
                                    <y:YTextBox ID="材質大分類2" Label="材質大分類【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("材質大分類", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString=""
                                        IsInteger="false" runat="server" />
                                    <y:YTextBox ID="材質2" Label="材質【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("材質", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString=""
                                        IsInteger="false" runat="server" />
                                    <y:YTextBox ID="定尺寸法縦2" Label="定尺寸法縦【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("定尺寸法縦", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="定尺寸法横2" Label="定尺寸法横【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("定尺寸法横", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="厚み2" Label="厚み【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("厚み", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="定尺仕入金額2" Label="定尺仕入金額【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("定尺仕入金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}"
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="定尺売り金額2" Label="定尺売り金額【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("定尺売り金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}"
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="仕入れ単価2" Label="仕入れ単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("仕入れ単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}"
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="取り数2" Label="取り数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("取り数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="商品たて2" Label="商品たて【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("商品たて", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="商品よこ2" Label="商品よこ【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("商品よこ", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="たてしろ係数2" Label="たてしろ係数【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("たてしろ係数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="よこしろ係数2" Label="よこしろ係数【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("よこしろ係数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="仕入れ_裁断2" Label="仕入れ_裁断【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("仕入れ_裁断", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="仕入れ_打抜き2" Label="仕入れ_打抜き【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("仕入れ_打抜き", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="仕入れ_貼り2" Label="仕入れ_貼り【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("仕入れ_貼り", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="仕入れ_曲げ2" Label="仕入れ_曲げ【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("仕入れ_曲げ", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="仕入れ_ロス管理2" Label="仕入れ_ロス管理【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("仕入れ_ロス管理", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="裁断_数2" Label="裁断_数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("裁断_数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="裁断_所要時間2" Label="裁断_所要時間【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("裁断_所要時間", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="裁断_割数2" Label="裁断_割数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("裁断_割数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="打抜_型取数2" Label="打抜_型取数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("打抜_型取数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="打抜_プレス回数2" Label="打抜_プレス回数【回/時】" IsGrid="false" ReadOnly="FALSE"
                                        ValidationGroup="DetailUpdate" Text='<%# Bind("打抜_プレス回数", "") %>' IsRequired="false"
                                        IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                    <y:YTextBox ID="曲げ_数2" Label="曲げ_数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("曲げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="曲げ_秒数2" Label="曲げ_秒数【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("曲げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="曲げ_同時加工2" Label="曲げ_同時加工【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("曲げ_同時加工", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="仕上げ_数2" Label="仕上げ_数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("仕上げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="仕上げ_秒数2" Label="仕上げ_秒数【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("仕上げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="ロス管理_材2" Label="ロス管理_材【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("ロス管理_材", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="ロス管理_加工2" Label="ロス管理_加工【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("ロス管理_加工", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="ロット2" Label="ロット【ヶ】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("ロット", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="丸め数2" Label="丸め数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("丸め数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YTextBox ID="商品重量2" Label="商品重量【g】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("商品重量", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                        IsInteger="true" runat="server" />
                                    <y:YCheckBox ID="削除フラグ2" Label="削除フラグ【true/false】" IsGrid="false" ReadOnly="FALSE"
                                        ValidationGroup="DetailUpdate" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'
                                        IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                                    <y:YTextBox ID="作成日時2" Label="作成日時【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true"
                                        DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" />
                                    <y:YTextBox ID="最終更新日時2" Label="最終更新日時【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"
                                        Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true"
                                        DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" />
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                        Text="更新" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                        CommandName="Cancel" Text="キャンセル" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    <table>
                        <table>
                            <tr>
                                <td>
                                    <table>
                                        <y:YTextBox ID="部品コード" Label="部品コード【-】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("部品コード", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="false" runat="server" />
                                        <y:YTextBox ID="部品名称" Label="部品名称【-】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("部品名称", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="false" runat="server" />
                                        <y:YTextBox ID="材料名称" Label="材料名称【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("材料名称", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString=""
                                            IsInteger="false" runat="server" />
                                        <y:YTextBox ID="材質大分類" Label="材質大分類【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("材質大分類", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString=""
                                            IsInteger="false" runat="server" />
                                        <y:YTextBox ID="材質" Label="材質【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("材質", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString=""
                                            IsInteger="false" runat="server" />
                                        <y:YTextBox ID="定尺寸法縦" Label="定尺寸法縦【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("定尺寸法縦", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="定尺寸法横" Label="定尺寸法横【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("定尺寸法横", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="厚み" Label="厚み【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("厚み", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="定尺仕入金額" Label="定尺仕入金額【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("定尺仕入金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}"
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="定尺売り金額" Label="定尺売り金額【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("定尺売り金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}"
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ単価" Label="仕入れ単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("仕入れ単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}"
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="取り数" Label="取り数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("取り数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="商品たて" Label="商品たて【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("商品たて", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="商品よこ" Label="商品よこ【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("商品よこ", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="たてしろ係数" Label="たてしろ係数【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("たてしろ係数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="よこしろ係数" Label="よこしろ係数【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("よこしろ係数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_裁断" Label="仕入れ_裁断【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("仕入れ_裁断", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_打抜き" Label="仕入れ_打抜き【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("仕入れ_打抜き", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_貼り" Label="仕入れ_貼り【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("仕入れ_貼り", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_曲げ" Label="仕入れ_曲げ【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("仕入れ_曲げ", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_ロス管理" Label="仕入れ_ロス管理【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("仕入れ_ロス管理", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="裁断_数" Label="裁断_数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("裁断_数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="裁断_所要時間" Label="裁断_所要時間【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("裁断_所要時間", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="裁断_割数" Label="裁断_割数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("裁断_割数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="打抜_型取数" Label="打抜_型取数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("打抜_型取数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="打抜_プレス回数" Label="打抜_プレス回数【回/時】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("打抜_プレス回数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="曲げ_数" Label="曲げ_数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("曲げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="曲げ_秒数" Label="曲げ_秒数【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("曲げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="曲げ_同時加工" Label="曲げ_同時加工【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("曲げ_同時加工", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕上げ_数" Label="仕上げ_数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("仕上げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕上げ_秒数" Label="仕上げ_秒数【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("仕上げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="ロス管理_材" Label="ロス管理_材【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("ロス管理_材", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="ロス管理_加工" Label="ロス管理_加工【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("ロス管理_加工", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="ロット" Label="ロット【ヶ】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("ロット", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="丸め数" Label="丸め数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("丸め数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="商品重量" Label="商品重量【g】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("商品重量", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YCheckBox ID="削除フラグ" Label="削除フラグ【true/false】" IsGrid="false" ReadOnly="FALSE"
                                            ValidationGroup="DetailInsert" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="作成日時" Label="作成日時【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true"
                                            DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="最終更新日時" Label="最終更新日時【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true"
                                            DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" />
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <y:YTextBox ID="部品コード2" Label="部品コード【-】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("部品コード", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="false" runat="server" />
                                        <y:YTextBox ID="部品名称2" Label="部品名称【-】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("部品名称", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="false" runat="server" />
                                        <y:YTextBox ID="材料名称2" Label="材料名称【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("材料名称", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString=""
                                            IsInteger="false" runat="server" />
                                        <y:YTextBox ID="材質大分類2" Label="材質大分類【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("材質大分類", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString=""
                                            IsInteger="false" runat="server" />
                                        <y:YTextBox ID="材質2" Label="材質【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("材質", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString=""
                                            IsInteger="false" runat="server" />
                                        <y:YTextBox ID="定尺寸法縦2" Label="定尺寸法縦【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("定尺寸法縦", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="定尺寸法横2" Label="定尺寸法横【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("定尺寸法横", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="厚み2" Label="厚み【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("厚み", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="定尺仕入金額2" Label="定尺仕入金額【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("定尺仕入金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}"
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="定尺売り金額2" Label="定尺売り金額【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("定尺売り金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}"
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ単価2" Label="仕入れ単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("仕入れ単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}"
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="取り数2" Label="取り数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("取り数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="商品たて2" Label="商品たて【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("商品たて", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="商品よこ2" Label="商品よこ【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("商品よこ", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="たてしろ係数2" Label="たてしろ係数【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("たてしろ係数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="よこしろ係数2" Label="よこしろ係数【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("よこしろ係数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_裁断2" Label="仕入れ_裁断【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("仕入れ_裁断", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_打抜き2" Label="仕入れ_打抜き【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("仕入れ_打抜き", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_貼り2" Label="仕入れ_貼り【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("仕入れ_貼り", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_曲げ2" Label="仕入れ_曲げ【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("仕入れ_曲げ", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_ロス管理2" Label="仕入れ_ロス管理【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("仕入れ_ロス管理", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="裁断_数2" Label="裁断_数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("裁断_数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="裁断_所要時間2" Label="裁断_所要時間【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("裁断_所要時間", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="裁断_割数2" Label="裁断_割数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("裁断_割数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="打抜_型取数2" Label="打抜_型取数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("打抜_型取数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="打抜_プレス回数2" Label="打抜_プレス回数【回/時】" IsGrid="false" ReadOnly="FALSE"
                                            ValidationGroup="DetailInsert" Text='<%# Bind("打抜_プレス回数", "") %>' IsRequired="false"
                                            IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="曲げ_数2" Label="曲げ_数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("曲げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="曲げ_秒数2" Label="曲げ_秒数【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("曲げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="曲げ_同時加工2" Label="曲げ_同時加工【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("曲げ_同時加工", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕上げ_数2" Label="仕上げ_数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("仕上げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕上げ_秒数2" Label="仕上げ_秒数【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("仕上げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="ロス管理_材2" Label="ロス管理_材【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("ロス管理_材", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="ロス管理_加工2" Label="ロス管理_加工【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("ロス管理_加工", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="ロット2" Label="ロット【ヶ】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("ロット", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="丸め数2" Label="丸め数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("丸め数", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YTextBox ID="商品重量2" Label="商品重量【g】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("商品重量", "") %>' IsRequired="false" IsDate="false" DataFormatString=""
                                            IsInteger="true" runat="server" />
                                        <y:YCheckBox ID="削除フラグ2" Label="削除フラグ【true/false】" IsGrid="false" ReadOnly="FALSE"
                                            ValidationGroup="DetailInsert" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="作成日時2" Label="作成日時【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true"
                                            DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="最終更新日時2" Label="最終更新日時【-】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert"
                                            Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true"
                                            DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" />
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </table>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="挿入" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                        CommandName="Cancel" Text="キャンセル" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <table>
                        <table>
                            <tr>
                                <td>
                                    <table>
                                        <y:YTextBox ID="単価ID" Label="単価ID【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("単価ID", "") %>'
                                            IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="部品コード" Label="部品コード【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("部品コード", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="部品名称" Label="部品名称【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("部品名称", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="材料名称" Label="材料名称【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材料名称", "") %>'
                                            IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="材質大分類" Label="材質大分類【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材質大分類", "") %>'
                                            IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="材質" Label="材質【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材質", "") %>'
                                            IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="定尺寸法縦" Label="定尺寸法縦【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺寸法縦", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="定尺寸法横" Label="定尺寸法横【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺寸法横", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="厚み" Label="厚み【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("厚み", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="定尺仕入金額" Label="定尺仕入金額【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺仕入金額", "{0:f2}") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true"
                                            runat="server" />
                                        <y:YTextBox ID="定尺売り金額" Label="定尺売り金額【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺売り金額", "{0:f2}") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true"
                                            runat="server" />
                                        <y:YTextBox ID="仕入れ単価" Label="仕入れ単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕入れ単価", "{0:f2}") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true"
                                            runat="server" />
                                        <y:YTextBox ID="取り数" Label="取り数【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("取り数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="商品たて" Label="商品たて【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("商品たて", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="商品よこ" Label="商品よこ【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("商品よこ", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="たてしろ係数" Label="たてしろ係数【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("たてしろ係数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="よこしろ係数" Label="よこしろ係数【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("よこしろ係数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_裁断" Label="仕入れ_裁断【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕入れ_裁断", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_打抜き" Label="仕入れ_打抜き【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕入れ_打抜き", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_貼り" Label="仕入れ_貼り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕入れ_貼り", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_曲げ" Label="仕入れ_曲げ【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕入れ_曲げ", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_ロス管理" Label="仕入れ_ロス管理【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕入れ_ロス管理", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="裁断_数" Label="裁断_数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("裁断_数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="裁断_所要時間" Label="裁断_所要時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("裁断_所要時間", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="裁断_割数" Label="裁断_割数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("裁断_割数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="打抜_型取数" Label="打抜_型取数【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("打抜_型取数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="打抜_プレス回数" Label="打抜_プレス回数【回/時】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("打抜_プレス回数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="曲げ_数" Label="曲げ_数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="曲げ_秒数" Label="曲げ_秒数【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_秒数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="曲げ_同時加工" Label="曲げ_同時加工【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_同時加工", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕上げ_数" Label="仕上げ_数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕上げ_秒数" Label="仕上げ_秒数【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_秒数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="ロス管理_材" Label="ロス管理_材【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロス管理_材", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="ロス管理_加工" Label="ロス管理_加工【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロス管理_加工", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="ロット" Label="ロット【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロット", "") %>'
                                            IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="丸め数" Label="丸め数【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("丸め数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="商品重量" Label="商品重量【g】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("商品重量", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YCheckBox ID="削除フラグ" Label="削除フラグ【true/false】" IsGrid="false" ReadOnly="TRUE"
                                            Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>' IsRequired="false" IsDate="false"
                                            DataFormatString="" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="作成日時" Label="作成日時【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'
                                            IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false"
                                            runat="server" />
                                        <y:YTextBox ID="最終更新日時" Label="最終更新日時【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'
                                            IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false"
                                            runat="server" />
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <y:YTextBox ID="部品コード2" Label="部品コード【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("部品コード", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="部品名称2" Label="部品名称【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("部品名称", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="材料名称2" Label="材料名称【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材料名称", "") %>'
                                            IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="材質大分類2" Label="材質大分類【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材質大分類", "") %>'
                                            IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="材質2" Label="材質【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材質", "") %>'
                                            IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="定尺寸法縦2" Label="定尺寸法縦【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺寸法縦", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="定尺寸法横2" Label="定尺寸法横【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺寸法横", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="厚み2" Label="厚み【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("厚み", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="定尺仕入金額2" Label="定尺仕入金額【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺仕入金額", "{0:f2}") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true"
                                            runat="server" />
                                        <y:YTextBox ID="定尺売り金額2" Label="定尺売り金額【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺売り金額", "{0:f2}") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true"
                                            runat="server" />
                                        <y:YTextBox ID="仕入れ単価2" Label="仕入れ単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕入れ単価", "{0:f2}") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true"
                                            runat="server" />
                                        <y:YTextBox ID="取り数2" Label="取り数【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("取り数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="商品たて2" Label="商品たて【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("商品たて", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="商品よこ2" Label="商品よこ【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("商品よこ", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="たてしろ係数2" Label="たてしろ係数【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("たてしろ係数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="よこしろ係数2" Label="よこしろ係数【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("よこしろ係数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_裁断2" Label="仕入れ_裁断【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕入れ_裁断", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_打抜き2" Label="仕入れ_打抜き【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕入れ_打抜き", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_貼り2" Label="仕入れ_貼り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕入れ_貼り", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_曲げ2" Label="仕入れ_曲げ【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕入れ_曲げ", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕入れ_ロス管理2" Label="仕入れ_ロス管理【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕入れ_ロス管理", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="裁断_数2" Label="裁断_数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("裁断_数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="裁断_所要時間2" Label="裁断_所要時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("裁断_所要時間", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="裁断_割数2" Label="裁断_割数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("裁断_割数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="打抜_型取数2" Label="打抜_型取数【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("打抜_型取数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="打抜_プレス回数2" Label="打抜_プレス回数【回/時】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("打抜_プレス回数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="曲げ_数2" Label="曲げ_数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="曲げ_秒数2" Label="曲げ_秒数【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_秒数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="曲げ_同時加工2" Label="曲げ_同時加工【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_同時加工", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕上げ_数2" Label="仕上げ_数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="仕上げ_秒数2" Label="仕上げ_秒数【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_秒数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="ロス管理_材2" Label="ロス管理_材【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロス管理_材", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="ロス管理_加工2" Label="ロス管理_加工【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロス管理_加工", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="ロット2" Label="ロット【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロット", "") %>'
                                            IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="丸め数2" Label="丸め数【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("丸め数", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YTextBox ID="商品重量2" Label="商品重量【g】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("商品重量", "") %>'
                                            IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" />
                                        <y:YCheckBox ID="削除フラグ2" Label="削除フラグ【true/false】" IsGrid="false" ReadOnly="TRUE"
                                            Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>' IsRequired="false" IsDate="false"
                                            DataFormatString="" IsInteger="false" runat="server" />
                                        <y:YTextBox ID="作成日時2" Label="作成日時【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'
                                            IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false"
                                            runat="server" />
                                        <y:YTextBox ID="最終更新日時2" Label="最終更新日時【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'
                                            IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false"
                                            runat="server" />
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </table>
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="編集" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                        Text="削除" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                        Text="新規作成" />
                </ItemTemplate>
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <EmptyDataTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="New" runat="server" Text="新規追加" />
                </EmptyDataTemplate>
            </asp:FormView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [T単価] WHERE [材料ID] = @original_材料ID AND [最終更新日時] = @original_最終更新日時"
            InsertCommand="INSERT INTO [T単価] (部品コード,部品名称,材料ID,材料名称,材質大分類,材質,定尺寸法縦,定尺寸法横,厚み,定尺仕入金額,定尺売り金額,仕入れ単価,取り数,商品たて,商品よこ,たてしろ係数,よこしろ係数,仕入れ_裁断,仕入れ_打抜き,仕入れ_貼り,仕入れ_曲げ,仕入れ_ロス管理,裁断_数,裁断_所要時間,裁断_割数,打抜_型取数,打抜_プレス回数,曲げ_数,曲げ_秒数,曲げ_同時加工,仕上げ_数,仕上げ_秒数,ロス管理_材,ロス管理_加工,ロット,丸め数,商品重量,削除フラグ,作成ユーザー,最終更新ユーザー,作成日時,最終更新日時) VALUES (@部品コード,@部品名称,@材料ID,@材料名称,@材質大分類,@材質,@定尺寸法縦,@定尺寸法横,@厚み,@定尺仕入金額,@定尺売り金額,@仕入れ単価,@取り数,@商品たて,@商品よこ,@たてしろ係数,@よこしろ係数,@仕入れ_裁断,@仕入れ_打抜き,@仕入れ_貼り,@仕入れ_曲げ,@仕入れ_ロス管理,@裁断_数,@裁断_所要時間,@裁断_割数,@打抜_型取数,@打抜_プレス回数,@曲げ_数,@曲げ_秒数,@曲げ_同時加工,@仕上げ_数,@仕上げ_秒数,@ロス管理_材,@ロス管理_加工,@ロット,@丸め数,@商品重量,@削除フラグ,@作成ユーザー,@最終更新ユーザー, current_timestamp, current_timestamp)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [T単価]"
            UpdateCommand="UPDATE [T単価] SET 部品コード = @部品コード,部品名称 = @部品名称,材料ID = @材料ID,材料名称 = @材料名称,材質大分類 = @材質大分類,材質 = @材質,定尺寸法縦 = @定尺寸法縦,定尺寸法横 = @定尺寸法横,厚み = @厚み,定尺仕入金額 = @定尺仕入金額,定尺売り金額 = @定尺売り金額,仕入れ単価 = @仕入れ単価,取り数 = @取り数,商品たて = @商品たて,商品よこ = @商品よこ,たてしろ係数 = @たてしろ係数,よこしろ係数 = @よこしろ係数,仕入れ_裁断 = @仕入れ_裁断,仕入れ_打抜き = @仕入れ_打抜き,仕入れ_貼り = @仕入れ_貼り,仕入れ_曲げ = @仕入れ_曲げ,仕入れ_ロス管理 = @仕入れ_ロス管理,裁断_数 = @裁断_数,裁断_所要時間 = @裁断_所要時間,裁断_割数 = @裁断_割数,打抜_型取数 = @打抜_型取数,打抜_プレス回数 = @打抜_プレス回数,曲げ_数 = @曲げ_数,曲げ_秒数 = @曲げ_秒数,曲げ_同時加工 = @曲げ_同時加工,仕上げ_数 = @仕上げ_数,仕上げ_秒数 = @仕上げ_秒数,ロス管理_材 = @ロス管理_材,ロス管理_加工 = @ロス管理_加工,ロット = @ロット,丸め数 = @丸め数,商品重量 = @商品重量,削除フラグ = @削除フラグ,最終更新ユーザー = @最終更新ユーザー,最終更新日時 = @最終更新日時 WHERE [材料ID] = @original_材料ID AND [最終更新日時] = @original_最終更新日時">
            <DeleteParameters>
                <asp:Parameter Name="original_材料ID" Type="Int32" />
                <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
            </DeleteParameters>
            <InsertParameters>
                <asp:FormParameter Name="部品コード" FormField="部品コード" ConvertEmptyStringToNull="true"
                    Type="String" />
                <asp:FormParameter Name="部品名称" FormField="部品名称" ConvertEmptyStringToNull="true" Type="String" />
                <asp:FormParameter Name="材料ID" FormField="材料ID" ConvertEmptyStringToNull="true" Type="Int32" />
                <asp:FormParameter Name="材料名称" FormField="材料名称" ConvertEmptyStringToNull="true" Type="String" />
                <asp:FormParameter Name="材質大分類" FormField="材質大分類" ConvertEmptyStringToNull="true"
                    Type="String" />
                <asp:FormParameter Name="材質" FormField="材質" ConvertEmptyStringToNull="true" Type="String" />
                <asp:FormParameter Name="定尺寸法縦" FormField="定尺寸法縦" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="定尺寸法横" FormField="定尺寸法横" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="厚み" FormField="厚み" ConvertEmptyStringToNull="true" Type="Decimal" />
                <asp:FormParameter Name="定尺仕入金額" FormField="定尺仕入金額" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="定尺売り金額" FormField="定尺売り金額" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="仕入れ単価" FormField="仕入れ単価" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="取り数" FormField="取り数" ConvertEmptyStringToNull="true" Type="Int32" />
                <asp:FormParameter Name="商品たて" FormField="商品たて" ConvertEmptyStringToNull="true" Type="Decimal" />
                <asp:FormParameter Name="商品よこ" FormField="商品よこ" ConvertEmptyStringToNull="true" Type="Decimal" />
                <asp:FormParameter Name="たてしろ係数" FormField="たてしろ係数" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="よこしろ係数" FormField="よこしろ係数" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="仕入れ_裁断" FormField="仕入れ_裁断" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="仕入れ_打抜き" FormField="仕入れ_打抜き" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="仕入れ_貼り" FormField="仕入れ_貼り" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="仕入れ_曲げ" FormField="仕入れ_曲げ" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="仕入れ_ロス管理" FormField="仕入れ_ロス管理" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="裁断_数" FormField="裁断_数" ConvertEmptyStringToNull="true" Type="Int32" />
                <asp:FormParameter Name="裁断_所要時間" FormField="裁断_所要時間" ConvertEmptyStringToNull="true"
                    Type="Int32" />
                <asp:FormParameter Name="裁断_割数" FormField="裁断_割数" ConvertEmptyStringToNull="true"
                    Type="Int32" />
                <asp:FormParameter Name="打抜_型取数" FormField="打抜_型取数" ConvertEmptyStringToNull="true"
                    Type="Int32" />
                <asp:FormParameter Name="打抜_プレス回数" FormField="打抜_プレス回数" ConvertEmptyStringToNull="true"
                    Type="Int32" />
                <asp:FormParameter Name="曲げ_数" FormField="曲げ_数" ConvertEmptyStringToNull="true" Type="Int32" />
                <asp:FormParameter Name="曲げ_秒数" FormField="曲げ_秒数" ConvertEmptyStringToNull="true"
                    Type="Int32" />
                <asp:FormParameter Name="曲げ_同時加工" FormField="曲げ_同時加工" ConvertEmptyStringToNull="true"
                    Type="Int32" />
                <asp:FormParameter Name="仕上げ_数" FormField="仕上げ_数" ConvertEmptyStringToNull="true"
                    Type="Int32" />
                <asp:FormParameter Name="仕上げ_秒数" FormField="仕上げ_秒数" ConvertEmptyStringToNull="true"
                    Type="Int32" />
                <asp:FormParameter Name="ロス管理_材" FormField="ロス管理_材" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="ロス管理_加工" FormField="ロス管理_加工" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="ロット" FormField="ロット" ConvertEmptyStringToNull="true" Type="Int32" />
                <asp:FormParameter Name="丸め数" FormField="丸め数" ConvertEmptyStringToNull="true" Type="Int32" />
                <asp:FormParameter Name="商品重量" FormField="商品重量" ConvertEmptyStringToNull="true" Type="Int32" />
                <asp:FormParameter Name="削除フラグ" FormField="削除フラグ" ConvertEmptyStringToNull="true"
                    Type="String" />
                <asp:FormParameter Name="作成ユーザー" FormField="作成ユーザー" ConvertEmptyStringToNull="true"
                    Type="String" />
                <asp:FormParameter Name="最終更新ユーザー" FormField="最終更新ユーザー" ConvertEmptyStringToNull="true"
                    Type="String" />
                <asp:FormParameter Name="作成日時" FormField="作成日時" ConvertEmptyStringToNull="true" Type="DateTime" />
                <asp:FormParameter Name="最終更新日時" FormField="最終更新日時" ConvertEmptyStringToNull="true"
                    Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:FormParameter Name="単価ID" FormField="単価ID" ConvertEmptyStringToNull="true" Type="Int32" />
                <asp:FormParameter Name="部品コード" FormField="部品コード" ConvertEmptyStringToNull="true"
                    Type="String" />
                <asp:FormParameter Name="部品名称" FormField="部品名称" ConvertEmptyStringToNull="true" Type="String" />
                <asp:FormParameter Name="材料ID" FormField="材料ID" ConvertEmptyStringToNull="true" Type="Int32" />
                <asp:FormParameter Name="材料名称" FormField="材料名称" ConvertEmptyStringToNull="true" Type="String" />
                <asp:FormParameter Name="材質大分類" FormField="材質大分類" ConvertEmptyStringToNull="true"
                    Type="String" />
                <asp:FormParameter Name="材質" FormField="材質" ConvertEmptyStringToNull="true" Type="String" />
                <asp:FormParameter Name="定尺寸法縦" FormField="定尺寸法縦" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="定尺寸法横" FormField="定尺寸法横" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="厚み" FormField="厚み" ConvertEmptyStringToNull="true" Type="Decimal" />
                <asp:FormParameter Name="定尺仕入金額" FormField="定尺仕入金額" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="定尺売り金額" FormField="定尺売り金額" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="仕入れ単価" FormField="仕入れ単価" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="取り数" FormField="取り数" ConvertEmptyStringToNull="true" Type="Int32" />
                <asp:FormParameter Name="商品たて" FormField="商品たて" ConvertEmptyStringToNull="true" Type="Decimal" />
                <asp:FormParameter Name="商品よこ" FormField="商品よこ" ConvertEmptyStringToNull="true" Type="Decimal" />
                <asp:FormParameter Name="たてしろ係数" FormField="たてしろ係数" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="よこしろ係数" FormField="よこしろ係数" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="仕入れ_裁断" FormField="仕入れ_裁断" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="仕入れ_打抜き" FormField="仕入れ_打抜き" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="仕入れ_貼り" FormField="仕入れ_貼り" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="仕入れ_曲げ" FormField="仕入れ_曲げ" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="仕入れ_ロス管理" FormField="仕入れ_ロス管理" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="裁断_数" FormField="裁断_数" ConvertEmptyStringToNull="true" Type="Int32" />
                <asp:FormParameter Name="裁断_所要時間" FormField="裁断_所要時間" ConvertEmptyStringToNull="true"
                    Type="Int32" />
                <asp:FormParameter Name="裁断_割数" FormField="裁断_割数" ConvertEmptyStringToNull="true"
                    Type="Int32" />
                <asp:FormParameter Name="打抜_型取数" FormField="打抜_型取数" ConvertEmptyStringToNull="true"
                    Type="Int32" />
                <asp:FormParameter Name="打抜_プレス回数" FormField="打抜_プレス回数" ConvertEmptyStringToNull="true"
                    Type="Int32" />
                <asp:FormParameter Name="曲げ_数" FormField="曲げ_数" ConvertEmptyStringToNull="true" Type="Int32" />
                <asp:FormParameter Name="曲げ_秒数" FormField="曲げ_秒数" ConvertEmptyStringToNull="true"
                    Type="Int32" />
                <asp:FormParameter Name="曲げ_同時加工" FormField="曲げ_同時加工" ConvertEmptyStringToNull="true"
                    Type="Int32" />
                <asp:FormParameter Name="仕上げ_数" FormField="仕上げ_数" ConvertEmptyStringToNull="true"
                    Type="Int32" />
                <asp:FormParameter Name="仕上げ_秒数" FormField="仕上げ_秒数" ConvertEmptyStringToNull="true"
                    Type="Int32" />
                <asp:FormParameter Name="ロス管理_材" FormField="ロス管理_材" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="ロス管理_加工" FormField="ロス管理_加工" ConvertEmptyStringToNull="true"
                    Type="Decimal" />
                <asp:FormParameter Name="ロット" FormField="ロット" ConvertEmptyStringToNull="true" Type="Int32" />
                <asp:FormParameter Name="丸め数" FormField="丸め数" ConvertEmptyStringToNull="true" Type="Int32" />
                <asp:FormParameter Name="商品重量" FormField="商品重量" ConvertEmptyStringToNull="true" Type="Int32" />
                <asp:FormParameter Name="削除フラグ" FormField="削除フラグ" ConvertEmptyStringToNull="true"
                    Type="String" />
                <asp:FormParameter Name="最終更新ユーザー" FormField="最終更新ユーザー" ConvertEmptyStringToNull="true"
                    Type="String" />
                <asp:FormParameter Name="最終更新日時" FormField="最終更新日時" ConvertEmptyStringToNull="true"
                    Type="DateTime" />
                <asp:Parameter Name="original_材料ID" Type="Int32" />
                <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
