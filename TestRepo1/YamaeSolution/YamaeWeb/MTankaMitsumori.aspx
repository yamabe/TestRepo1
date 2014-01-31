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

        function Fixed(value, keta) {
            //最初のテキストボックスの値を数字に変換
            var num = parseFloat(value);
            var num2 = num.toFixed(keta);

            return num2;
        }

        function Floor(value, keta) {
            var num = parseFloat(value);

            return Math.floor(num * Math.pow(10, keta)) / Math.pow(10, keta)
        }

        function BindEvent(ele, func) {
            console.log(ele);
            
            for (var i = 0; i < ele.length; ++i) {
                // 配列の名前[i]を使った処理
                var e = ele[i];
                e.bind('keyup', function (event) { func(event, this) });
                e.bind('change', function (event) { func(event, this) });
            }

        }

        function V(ele) {
            return eval(ele.val());
        }


        $(document).ready(function () {

            <% if(mainFormView.FindControl("部品コード") != null) { %>

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

            
            <% } %>

            <% if (mainFormView.FindControl("たて_しろあり") != null)
               { %>

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


            var たて計算 = function (event, ele) {
                try {
                    たて_しろあり.val(Fixed(V(たてしろ) + V(商品たて), 2));
                } catch (e) {
                    たて_しろあり.val("NaN");
                }
            };
            var eleList = [たてしろ, 商品たて];
            BindEvent(eleList, たて計算);
            eleList[0].change();


            var よこ計算 = function (event, ele) {
                try {
                    よこ_しろあり.val(Fixed(V(よこしろ) + V(商品よこ), 2));
                } catch (e) {
                    よこ_しろあり.val("NaN");
                }
            };
            var eleList = [よこしろ, 商品よこ];
            BindEvent(eleList, よこ計算);
            eleList[0].change();


            var たて取り数計算 = function (event, ele) {
                try {
                    縦取り数.val(Fixed(V(定尺寸法縦) / V(たて_しろあり), 2));
                } catch (e) {
                    縦取り数.val("NaN");
                }
            };
            var eleList = [たて_しろあり, 定尺寸法縦];
            BindEvent(eleList, たて取り数計算);
            eleList[0].change();

            var よこ取り数計算 = function (event, ele) {
                try {
                    横取り数.val(Fixed(V(定尺寸法横) / V(よこ_しろあり), 2));
                } catch (e) {
                    横取り数.val("NaN");
                }
            };
            var eleList = [よこ_しろあり, 定尺寸法横];
            BindEvent(eleList, よこ取り数計算);
            eleList[0].change();

            var たて余計算 = function (event, ele) {
                try {
                    var v1 = Floor(V(縦取り数), 0);
                    たて余.val(Fixed(V(定尺寸法縦) - (V(たて_しろあり) * v1), 2));
                } catch (e) {
                    たて余.val("NaN");
                }
            };
            var eleList = [定尺寸法縦, たて_しろあり, 縦取り数];
            BindEvent(eleList, たて余計算);
            eleList[0].change();

            var よこ余計算 = function (event, ele) {
                try {
                    var v1 = Floor(V(横取り数), 0);
                    よこ余.val(Fixed(V(定尺寸法横) - (V(よこ_しろあり) * v1), 2));
                } catch (e) {
                    よこ余.val("NaN");
                }
            };
            var eleList = [定尺寸法横, よこ_しろあり, 横取り数];
            BindEvent(eleList, よこ余計算);
            eleList[0].change();



            var 計算_取り数計算 = function (event, ele) {
                try {
                    var v縦取り数 = Floor(V(縦取り数), 0);
                    var v横取り数 = Floor(V(横取り数), 0);

                    計算_取り数.val(Fixed(v縦取り数 * v横取り数), 0);
                } catch (e) {
                    計算_取り数.val("NaN");
                }
            };
            var eleList = [縦取り数, 横取り数];
            BindEvent(eleList, 計算_取り数計算);
            eleList[0].change();


            var m2あたりの材料費計算 = function (event, ele) {
                try {
                    var v縦係数 = V(定尺寸法縦) / 1000;

                    var v横係数 = V(定尺寸法横) / 1000;
                    var v面 = v縦係数 * v横係数;
                    var ret = Fixed(V(定尺仕入金額) / v面, 2);
                    m2あたりの材料費.val(ret);
                } catch (e) {
                    m2あたりの材料費.val("NaN");
                }
            };

            var eleList = [定尺寸法縦, 定尺寸法横, 定尺仕入金額];
            BindEvent(eleList, m2あたりの材料費計算);
            eleList[0].change();


            //var 材料費計算 = function (event, ele) {
            //    try {
            //        var val = V(定尺仕入金額) / V(取り数);
            //        取り数.val(Round(val, 2));
            //    } catch (e) {

            //        取り数.val("NaN");

            //    }
            //};


            //var eleList = [定尺仕入金額, 取り数];
            //BindEvent(eleList, 材料費計算);
            //eleList[0].change();




            // 商品の材料費から定尺単価の算出
            //　単価- 加工費 = 材料費
            //　たて係数＝    1000 / たて長さ
            //　よこ係数＝    1000 / よこ長さ
            //　材料費　* たて係数　＊　よこ係数 = ㎡単価
            //
            //
            //


            console.log(たてしろ.val());

            <% } %>

        });

        </script>
</head>
<body>

    <form id="form1" runat="server">
        <div>


            <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Menu.aspx" Text="メニュー画面へ" />
            <br />

            <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
                EnableScriptLocalization="true" ID="mainScriptManager" />





            <y:BaseGridView CssClass="GridView" ID="mainGridView" runat="server"
                DataSourceID="mainDataSource"
                DataKeyNames="単価ID,最終更新日時" AutoGenerateColumns="false">
                <Columns>
                    <asp:CommandField ShowEditButton="true" ControlStyle-Width="25" ItemStyle-Width="25"></asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True" ControlStyle-Width="25" ItemStyle-Width="25"></asp:CommandField>
                    <asp:ButtonField CommandName="ShowDetailUpdate" Text="詳細編集" ControlStyle-Width="50" />

                    <asp:ButtonField ButtonType="Link" CommandName="Copy" Text="Copy" />

 <y:YBoundField HeaderText="単価ID" DataFormatStringEditing="" DataField="単価ID" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="true" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
 <y:YBoundField HeaderText="部品コード" DataFormatStringEditing="" DataField="部品コード" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
 <y:YBoundField HeaderText="部品名称" DataFormatStringEditing="" DataField="部品名称" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
 <y:YBoundField HeaderText="材料ID" DataFormatStringEditing="" DataField="材料ID" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="材料DataSource" DataTextField="材料名称" DataValueField="材料ID"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="材料名称" DataFormatStringEditing="" DataField="材料名称" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
 <y:YBoundField HeaderText="材質大分類" DataFormatStringEditing="" DataField="材質大分類" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
 <y:YBoundField HeaderText="材質" DataFormatStringEditing="" DataField="材質" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
 <y:YBoundField HeaderText="定尺寸法縦" DataFormatStringEditing="" DataField="定尺寸法縦" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="定尺寸法横" DataFormatStringEditing="" DataField="定尺寸法横" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="厚み" DataFormatStringEditing="" DataField="厚み" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="定尺仕入金額" DataFormatStringEditing="{0:f2}" DataField="定尺仕入金額" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="定尺売り金額" DataFormatStringEditing="{0:f2}" DataField="定尺売り金額" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="仕入れ単価" DataFormatStringEditing="{0:f2}" DataField="仕入れ単価" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="取り数" DataFormatStringEditing="" DataField="取り数" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="商品たて" DataFormatStringEditing="" DataField="商品たて" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="商品よこ" DataFormatStringEditing="" DataField="商品よこ" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="たてしろ" DataFormatStringEditing="" DataField="たてしろ" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="よこしろ" DataFormatStringEditing="" DataField="よこしろ" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="見積_裁断" DataFormatStringEditing="" DataField="見積_裁断" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="見積_打抜き" DataFormatStringEditing="" DataField="見積_打抜き" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="見積_貼り" DataFormatStringEditing="" DataField="見積_貼り" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="見積_曲げ" DataFormatStringEditing="" DataField="見積_曲げ" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="見積_ロス管理" DataFormatStringEditing="" DataField="見積_ロス管理" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="定尺裁断_数" DataFormatStringEditing="" DataField="定尺裁断_数" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="定尺裁断_所要時間" DataFormatStringEditing="" DataField="定尺裁断_所要時間" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="定尺裁断_割数" DataFormatStringEditing="" DataField="定尺裁断_割数" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="寸法カット_数" DataFormatStringEditing="" DataField="寸法カット_数" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="寸法カット_所要時間" DataFormatStringEditing="" DataField="寸法カット_所要時間" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="寸法カット_割数" DataFormatStringEditing="" DataField="寸法カット_割数" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="打抜_型取数" DataFormatStringEditing="" DataField="打抜_型取数" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="打抜_プレス回数" DataFormatStringEditing="" DataField="打抜_プレス回数" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="曲げ_数" DataFormatStringEditing="" DataField="曲げ_数" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="曲げ_秒数" DataFormatStringEditing="" DataField="曲げ_秒数" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="曲げ_同時加工" DataFormatStringEditing="" DataField="曲げ_同時加工" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="仕上げ_数" DataFormatStringEditing="" DataField="仕上げ_数" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="仕上げ_秒数" DataFormatStringEditing="" DataField="仕上げ_秒数" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="ロス管理_材比" DataFormatStringEditing="" DataField="ロス管理_材比" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="ロス管理_加工比" DataFormatStringEditing="" DataField="ロス管理_加工比" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="ロット" DataFormatStringEditing="" DataField="ロット" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="丸め数" DataFormatStringEditing="" DataField="丸め数" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="商品重量" DataFormatStringEditing="" DataField="商品重量" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   />
 <y:YBoundField HeaderText="削除フラグ" DataFormatStringEditing="" DataField="削除フラグ" ReadOnly="FALSE"  IsBoolean="TRUE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
 <y:YBoundField HeaderText="作成ユーザー" DataFormatStringEditing="" DataField="作成ユーザー" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="最終更新ユーザー" DataFormatStringEditing="" DataField="最終更新ユーザー" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="作成日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="作成日時" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"   />
 <y:YBoundField HeaderText="最終更新日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="最終更新日時" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"   />
        </Columns>
            </y:BaseGridView>
            <y:BaseValidationSummary ID="mainValidationSummary" runat="server" EnableClientScript="true" />

            <br />

            <y:BaseFormView ID="mainFormView"
                runat="server"
                DataKeyNames="単価ID,最終更新日時" DataSourceID="mainDataSource" BackColor="#DEBA84"
                BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" GridLines="Both"
                AllowPaging="true">
                <EditItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <table>
                            <y:YTextBox   id="単価ID"  Label="単価ID【-】"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("単価ID", "") %>'     IsRequired="true" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="70"/>
<y:YTextBox   id="部品コード"  Label="部品コード【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("部品コード", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="70"/>
<y:YTextBox   id="部品名称"  Label="部品名称【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("部品名称", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="100"/>
<y:YDropDownList   id="材料ID"  Label="材料ID【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("材料ID") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="材料DataSource" DataTextField="材料名称" DataValueField="材料ID"   AppendDataBoundItems="true"   Width="70"/>
<y:YTextBox   id="材料名称"  Label="材料名称【-】"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("材料名称", "") %>'     IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="100"/>
<y:YTextBox   id="材質大分類"  Label="材質大分類【-】"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("材質大分類", "") %>'     IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="100"/>
<y:YTextBox   id="材質"  Label="材質【-】"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("材質", "") %>'     IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="100"/>
<y:YTextBox   id="定尺寸法縦"  Label="定尺寸法縦【mm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺寸法縦", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="定尺寸法横"  Label="定尺寸法横【mm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺寸法横", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="厚み"  Label="厚み【mm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("厚み", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="40"/>
<y:YTextBox   id="定尺仕入金額"  Label="定尺仕入金額【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺仕入金額", "{0:f2}") %>'     IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="定尺売り金額"  Label="定尺売り金額【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺売り金額", "{0:f2}") %>'     IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="仕入れ単価"  Label="仕入れ単価【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("仕入れ単価", "{0:f2}") %>'     IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="取り数"  Label="取り数【ヶ】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("取り数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="商品たて"  Label="商品たて【mm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("商品たて", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="商品よこ"  Label="商品よこ【mm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("商品よこ", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="たてしろ"  Label="たてしろ【mm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("たてしろ", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="よこしろ"  Label="よこしろ【mm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("よこしろ", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="見積_裁断"  Label="見積_裁断【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_裁断", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="見積_打抜き"  Label="見積_打抜き【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_打抜き", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="見積_貼り"  Label="見積_貼り【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_貼り", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="見積_曲げ"  Label="見積_曲げ【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_曲げ", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="見積_ロス管理"  Label="見積_ロス管理【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_ロス管理", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="定尺裁断_数"  Label="定尺裁断_数【個所】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺裁断_数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="定尺裁断_所要時間"  Label="定尺裁断_所要時間【秒】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺裁断_所要時間", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="定尺裁断_割数"  Label="定尺裁断_割数【個所】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺裁断_割数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="寸法カット_数"  Label="寸法カット_数【個所】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("寸法カット_数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="寸法カット_所要時間"  Label="寸法カット_所要時間【秒】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("寸法カット_所要時間", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="寸法カット_割数"  Label="寸法カット_割数【個所】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("寸法カット_割数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="打抜_型取数"  Label="打抜_型取数【ヶ】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("打抜_型取数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="打抜_プレス回数"  Label="打抜_プレス回数【回/時】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("打抜_プレス回数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="曲げ_数"  Label="曲げ_数【個所】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("曲げ_数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="曲げ_秒数"  Label="曲げ_秒数【秒】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("曲げ_秒数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="曲げ_同時加工"  Label="曲げ_同時加工【ヶ】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("曲げ_同時加工", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="仕上げ_数"  Label="仕上げ_数【個所】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("仕上げ_数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="仕上げ_秒数"  Label="仕上げ_秒数【秒】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("仕上げ_秒数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="ロス管理_材比"  Label="ロス管理_材比【%】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("ロス管理_材比", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="ロス管理_加工比"  Label="ロス管理_加工比【%】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("ロス管理_加工比", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="ロット"  Label="ロット【ヶ】"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("ロット", "") %>'     IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="丸め数"  Label="丸め数【ヶ】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("丸め数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="商品重量"  Label="商品重量【g】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("商品重量", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YCheckBox   id="削除フラグ"  Label="削除フラグ【true/false】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="40"/>
<y:YDropDownList   id="作成ユーザー"  Label="作成ユーザー【-】"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("作成ユーザー") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100"/>
<y:YDropDownList   id="最終更新ユーザー"  Label="最終更新ユーザー【-】"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("最終更新ユーザー") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100"/>
<y:YTextBox   id="作成日時"  Label="作成日時【-】"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'     IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"   Width="100"/>
<y:YTextBox   id="最終更新日時"  Label="最終更新日時【-】"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'     IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"   Width="100"/>
    </table>
                            </td>

                        </tr>
                    </table>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true" ValidationGroup="DetailUpdate" />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True"
                        CommandName="Update" Text="更新" ValidationGroup="DetailUpdate" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server"
                        CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
                </EditItemTemplate>
                <EditRowStyle BackColor="pink" Font-Bold="True" ForeColor="black" />
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <table>
<y:YTextBox   id="単価ID" DefaultValue=""  Label="単価ID【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("単価ID", "") %>'     IsRequired="true" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="70" />
<y:YTextBox   id="部品コード" DefaultValue=""  Label="部品コード【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("部品コード", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="70" />
<y:YTextBox   id="部品名称" DefaultValue=""  Label="部品名称【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("部品名称", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="100" />
<y:YDropDownList   id="材料ID" DefaultValue=""  Label="材料ID【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("材料ID") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="材料DataSource" DataTextField="材料名称" DataValueField="材料ID"   AppendDataBoundItems="true"   Width="70" />
<y:YTextBox   id="材料名称" DefaultValue=""  Label="材料名称【-】"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" Text='<%# Bind("材料名称", "") %>'     IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="100" />
<y:YTextBox   id="材質大分類" DefaultValue=""  Label="材質大分類【-】"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" Text='<%# Bind("材質大分類", "") %>'     IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="100" />
<y:YTextBox   id="材質" DefaultValue=""  Label="材質【-】"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" Text='<%# Bind("材質", "") %>'     IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="100" />
<y:YTextBox   id="定尺寸法縦" DefaultValue=""  Label="定尺寸法縦【mm】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("定尺寸法縦", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="定尺寸法横" DefaultValue=""  Label="定尺寸法横【mm】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("定尺寸法横", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="厚み" DefaultValue=""  Label="厚み【mm】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("厚み", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="40" />
<y:YTextBox   id="定尺仕入金額" DefaultValue=""  Label="定尺仕入金額【\】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("定尺仕入金額", "{0:f2}") %>'     IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="定尺売り金額" DefaultValue=""  Label="定尺売り金額【\】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("定尺売り金額", "{0:f2}") %>'     IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="仕入れ単価" DefaultValue=""  Label="仕入れ単価【\】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("仕入れ単価", "{0:f2}") %>'     IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="取り数" DefaultValue=""  Label="取り数【ヶ】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("取り数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="商品たて" DefaultValue=""  Label="商品たて【mm】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("商品たて", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="商品よこ" DefaultValue=""  Label="商品よこ【mm】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("商品よこ", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="たてしろ" DefaultValue=""  Label="たてしろ【mm】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("たてしろ", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="よこしろ" DefaultValue=""  Label="よこしろ【mm】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("よこしろ", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="見積_裁断" DefaultValue=""  Label="見積_裁断【\】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("見積_裁断", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="見積_打抜き" DefaultValue=""  Label="見積_打抜き【\】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("見積_打抜き", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="見積_貼り" DefaultValue=""  Label="見積_貼り【\】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("見積_貼り", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="見積_曲げ" DefaultValue=""  Label="見積_曲げ【\】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("見積_曲げ", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="見積_ロス管理" DefaultValue=""  Label="見積_ロス管理【\】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("見積_ロス管理", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="定尺裁断_数" DefaultValue=""  Label="定尺裁断_数【個所】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("定尺裁断_数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="定尺裁断_所要時間" DefaultValue=""  Label="定尺裁断_所要時間【秒】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("定尺裁断_所要時間", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="定尺裁断_割数" DefaultValue=""  Label="定尺裁断_割数【個所】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("定尺裁断_割数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="寸法カット_数" DefaultValue=""  Label="寸法カット_数【個所】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("寸法カット_数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="寸法カット_所要時間" DefaultValue=""  Label="寸法カット_所要時間【秒】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("寸法カット_所要時間", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="寸法カット_割数" DefaultValue=""  Label="寸法カット_割数【個所】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("寸法カット_割数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="打抜_型取数" DefaultValue=""  Label="打抜_型取数【ヶ】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("打抜_型取数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="打抜_プレス回数" DefaultValue=""  Label="打抜_プレス回数【回/時】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("打抜_プレス回数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="曲げ_数" DefaultValue=""  Label="曲げ_数【個所】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("曲げ_数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="曲げ_秒数" DefaultValue=""  Label="曲げ_秒数【秒】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("曲げ_秒数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="曲げ_同時加工" DefaultValue=""  Label="曲げ_同時加工【ヶ】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("曲げ_同時加工", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="仕上げ_数" DefaultValue=""  Label="仕上げ_数【個所】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("仕上げ_数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="仕上げ_秒数" DefaultValue=""  Label="仕上げ_秒数【秒】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("仕上げ_秒数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="ロス管理_材比" DefaultValue=""  Label="ロス管理_材比【%】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("ロス管理_材比", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="ロス管理_加工比" DefaultValue=""  Label="ロス管理_加工比【%】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("ロス管理_加工比", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="ロット" DefaultValue=""  Label="ロット【ヶ】"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" Text='<%# Bind("ロット", "") %>'     IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="丸め数" DefaultValue=""  Label="丸め数【ヶ】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("丸め数", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YTextBox   id="商品重量" DefaultValue=""  Label="商品重量【g】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("商品重量", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70" />
<y:YCheckBox   id="削除フラグ" DefaultValue=""  Label="削除フラグ【true/false】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="40" />
<y:YDropDownList   id="作成ユーザー" DefaultValue=""  Label="作成ユーザー【-】"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("作成ユーザー") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100" />
<y:YDropDownList   id="最終更新ユーザー" DefaultValue=""  Label="最終更新ユーザー【-】"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("最終更新ユーザー") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100" />
<y:YTextBox   id="作成日時" DefaultValue=""  Label="作成日時【-】"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'     IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"   Width="100" />
<y:YTextBox   id="最終更新日時" DefaultValue=""  Label="最終更新日時【-】"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'     IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"   Width="100" />
               </table>
                            </td>

                        </tr>
                    </table>
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true" ValidationGroup="DetailInsert" />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                        CommandName="Insert" Text="挿入" ValidationGroup="DetailInsert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server"
                        CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>

                                            <table>
                                                <tr>
                                                    <td colspan="2">基本情報</td>
                                                </tr>
<y:YTextBox   id="単価ID"  Label="単価ID【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("単価ID", "") %>'    IsRequired="true" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="70"/>
<y:YTextBox   id="部品コード"  Label="部品コード【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("部品コード", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="70"/>
<y:YTextBox   id="部品名称"  Label="部品名称【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("部品名称", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="100"/>
<y:YDropDownList   id="材料ID"  Label="材料ID【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("材料ID") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="材料DataSource" DataTextField="材料名称" DataValueField="材料ID"   AppendDataBoundItems="true"   Width="70"/>
<y:YTextBox   id="材料名称"  Label="材料名称【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("材料名称", "") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="100"/>
<y:YTextBox   id="材質大分類"  Label="材質大分類【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("材質大分類", "") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="100"/>
<y:YTextBox   id="材質"  Label="材質【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("材質", "") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="100"/>
<y:YTextBox   id="定尺寸法縦"  Label="定尺寸法縦【mm】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("定尺寸法縦", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="定尺寸法横"  Label="定尺寸法横【mm】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("定尺寸法横", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="厚み"  Label="厚み【mm】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("厚み", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="40"/>
<y:YTextBox   id="定尺仕入金額"  Label="定尺仕入金額【\】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("定尺仕入金額", "{0:f2}") %>'    IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="定尺売り金額"  Label="定尺売り金額【\】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("定尺売り金額", "{0:f2}") %>'    IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"   Width="70"/>
                                            </table>
                                        </td>
                                        <td>

                                            <table>
<y:YTextBox   id="仕入れ単価"  Label="仕入れ単価【\】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("仕入れ単価", "{0:f2}") %>'    IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="取り数"  Label="取り数【ヶ】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("取り数", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="商品たて"  Label="商品たて【mm】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("商品たて", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="商品よこ"  Label="商品よこ【mm】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("商品よこ", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="たてしろ"  Label="たてしろ【mm】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("たてしろ", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="よこしろ"  Label="よこしろ【mm】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("よこしろ", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="見積_裁断"  Label="見積_裁断【\】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("見積_裁断", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="見積_打抜き"  Label="見積_打抜き【\】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("見積_打抜き", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="見積_貼り"  Label="見積_貼り【\】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("見積_貼り", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="見積_曲げ"  Label="見積_曲げ【\】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("見積_曲げ", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="見積_ロス管理"  Label="見積_ロス管理【\】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("見積_ロス管理", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
                                            </table>
                                        </td>

                                        <td>

                                            <table>

<y:YTextBox   id="たて_しろあり"  Label="たて_しろあり【mm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="よこ_しろあり"  Label="よこ_しろあり【mm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="縦取り数"  Label="縦取り数【mm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="横取り数"  Label="横取り数【mm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="たて余"  Label="たて余【mm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="よこ余"  Label="よこ余【mm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_取り数"  Label="計算_取り数【mm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="m2あたりの材料費"  Label="m2あたりの材料費【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"  />
<y:YTextBox   id="m2あたりの取数たて"  Label="m2あたりの取数たて【ヶ】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"  />
<y:YTextBox   id="m2あたりの取数よこ"  Label="m2あたりの取数よこ【ヶ】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"  />
<y:YTextBox   id="m2あたりの取数"  Label="m2あたりの取数【ヶ】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="単価チェック"  Label="単価チェック【mm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="見積_材料費"  Label="見積_材料費【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="見積_材料費比"  Label="見積_材料費比【%】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="見積_加工費小計"  Label="見積_加工費小計【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="見積_加工費比"  Label="見積_加工費比【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="見積_単価"  Label="見積_単価【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_裁断"  Label="計算_裁断【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_打抜き"  Label="計算_打抜き【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_貼り"  Label="計算_貼り【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_曲げ"  Label="計算_曲げ【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_ロス管理"  Label="計算_ロス管理【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_材料費"  Label="計算_材料費【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_材料費比"  Label="計算_材料費比【%】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_加工費小計"  Label="計算_加工費小計【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_加工費比"  Label="計算_加工費比【%】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_単価"  Label="計算_単価【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="時間単価"  Label="時間単価【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="分単価"  Label="分単価【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="秒単価"  Label="秒単価【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="定尺裁断_時間"  Label="定尺裁断_時間【秒】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="定尺裁断_作業費"  Label="定尺裁断_作業費【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="定尺裁断_単価当り"  Label="定尺裁断_単価当り【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="寸法カット_時間"  Label="寸法カット_時間【秒】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="寸法カット_作業費"  Label="寸法カット_作業費【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="寸法カット_単価当り"  Label="寸法カット_単価当り【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="打抜_時間当たりの加工数"  Label="打抜_時間当たりの加工数【ケ】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="打抜_単価当り"  Label="打抜_単価当り【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="曲げ_時間"  Label="曲げ_時間【秒】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="曲げ_作業費"  Label="曲げ_作業費【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="曲げ_単価当り"  Label="曲げ_単価当り【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="仕上げ_時間"  Label="仕上げ_時間【秒】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="仕上げ_作業費"  Label="仕上げ_作業費【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="仕上げ_単価当り"  Label="仕上げ_単価当り【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="ロス管理_材_費用"  Label="ロス管理_材_費用【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="ロス管理_加工_費用"  Label="ロス管理_加工_費用【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="ロス管理_単価_費用"  Label="ロス管理_単価_費用【\】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="見積_定尺裁断費比"  Label="見積_定尺裁断費比【%】"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_定尺裁断費比"  Label="計算_定尺裁断費比【%】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_寸法カット費比"  Label="計算_寸法カット費比【%】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="見積_打ち抜き費比"  Label="見積_打ち抜き費比【%】"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_打ち抜き費比"  Label="計算_打ち抜き費比【%】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="見積_貼り費比"  Label="見積_貼り費比【%】"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_貼り比"  Label="計算_貼り比【%】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="見積_曲げ費比"  Label="見積_曲げ費比【%】"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_曲げ費比"  Label="計算_曲げ費比【%】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="見積_仕上げ費比"  Label="見積_仕上げ費比【%】"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_仕上げ費比"  Label="計算_仕上げ費比【%】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="見積_ロス管理費比"  Label="見積_ロス管理費比【%】"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate"    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />
<y:YTextBox   id="計算_ロス管理費比"  Label="計算_ロス管理費比【%】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate"    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  />

                                            </table>
                                        </td>



                                        <td>
                                            <table>


<y:YTextBox   id="定尺裁断_数"  Label="定尺裁断_数【個所】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("定尺裁断_数", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="定尺裁断_所要時間"  Label="定尺裁断_所要時間【秒】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("定尺裁断_所要時間", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="定尺裁断_割数"  Label="定尺裁断_割数【個所】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("定尺裁断_割数", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="寸法カット_数"  Label="寸法カット_数【個所】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("寸法カット_数", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="寸法カット_所要時間"  Label="寸法カット_所要時間【秒】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("寸法カット_所要時間", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="寸法カット_割数"  Label="寸法カット_割数【個所】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("寸法カット_割数", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="打抜_型取数"  Label="打抜_型取数【ヶ】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("打抜_型取数", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="打抜_プレス回数"  Label="打抜_プレス回数【回/時】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("打抜_プレス回数", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="曲げ_数"  Label="曲げ_数【個所】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("曲げ_数", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="曲げ_秒数"  Label="曲げ_秒数【秒】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("曲げ_秒数", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="曲げ_同時加工"  Label="曲げ_同時加工【ヶ】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("曲げ_同時加工", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="仕上げ_数"  Label="仕上げ_数【個所】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("仕上げ_数", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="仕上げ_秒数"  Label="仕上げ_秒数【秒】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("仕上げ_秒数", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="ロス管理_材比"  Label="ロス管理_材比【%】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("ロス管理_材比", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="ロス管理_加工比"  Label="ロス管理_加工比【%】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("ロス管理_加工比", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>

                                            </table>
                                        </td>
                                        <td>
                                            <table>
<y:YTextBox   id="ロット"  Label="ロット【ヶ】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("ロット", "") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="丸め数"  Label="丸め数【ヶ】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("丸め数", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YTextBox   id="商品重量"  Label="商品重量【g】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("商品重量", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"   Width="70"/>
<y:YCheckBox   id="削除フラグ"  Label="削除フラグ【true/false】"  IsGrid="false"  ReadOnly="TRUE" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   Width="40"/>
<y:YDropDownList   id="作成ユーザー"  Label="作成ユーザー【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("作成ユーザー") %>'   IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100"/>
<y:YDropDownList   id="最終更新ユーザー"  Label="最終更新ユーザー【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("最終更新ユーザー") %>'   IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100"/>
<y:YTextBox   id="作成日時"  Label="作成日時【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'    IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"   Width="100"/>
<y:YTextBox   id="最終更新日時"  Label="最終更新日時【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'    IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"   Width="100"/>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>

                        </tr>
                    </table>
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False"
                        CommandName="Edit" Text="編集" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False"
                        CommandName="Delete" Text="削除" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False"
                        CommandName="New" Text="新規作成" />

                </ItemTemplate>
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <EmptyDataTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="New" runat="server" Text="新規追加" />
                </EmptyDataTemplate>
            </y:BaseFormView>

            <y:BaseSqlDataSource ID="mainDataSource" runat="server"
                SelectCommand="select * from T単価"
                UpdateCommand=" update T単価 set 
                部品コード = @部品コード,部品名称 = @部品名称,材料ID = @材料ID,材料名称 = @材料名称,材質大分類 = @材質大分類,材質 = @材質,定尺寸法縦 = @定尺寸法縦,定尺寸法横 = @定尺寸法横,厚み = @厚み,定尺仕入金額 = @定尺仕入金額,定尺売り金額 = @定尺売り金額,仕入れ単価 = @仕入れ単価,取り数 = @取り数,商品たて = @商品たて,商品よこ = @商品よこ,たてしろ = @たてしろ,よこしろ = @よこしろ,見積_裁断 = @見積_裁断,見積_打抜き = @見積_打抜き,見積_貼り = @見積_貼り,見積_曲げ = @見積_曲げ,見積_ロス管理 = @見積_ロス管理,定尺裁断_数 = @定尺裁断_数,定尺裁断_所要時間 = @定尺裁断_所要時間,定尺裁断_割数 = @定尺裁断_割数,寸法カット_数 = @寸法カット_数,寸法カット_所要時間 = @寸法カット_所要時間,寸法カット_割数 = @寸法カット_割数,打抜_型取数 = @打抜_型取数,打抜_プレス回数 = @打抜_プレス回数,曲げ_数 = @曲げ_数,曲げ_秒数 = @曲げ_秒数,曲げ_同時加工 = @曲げ_同時加工,仕上げ_数 = @仕上げ_数,仕上げ_秒数 = @仕上げ_秒数,ロス管理_材比 = @ロス管理_材比,ロス管理_加工比 = @ロス管理_加工比,ロット = @ロット,丸め数 = @丸め数,商品重量 = @商品重量,削除フラグ = @削除フラグ,最終更新ユーザー = @最終更新ユーザー,最終更新日時 = @最終更新日時
                where 単価ID = @original_単価ID and 最終更新日時 = @original_最終更新日時"
                InsertCommand=" insert into T単価 
                (単価ID,部品コード,部品名称,材料ID,材料名称,材質大分類,材質,定尺寸法縦,定尺寸法横,厚み,定尺仕入金額,定尺売り金額,仕入れ単価,取り数,商品たて,商品よこ,たてしろ,よこしろ,見積_裁断,見積_打抜き,見積_貼り,見積_曲げ,見積_ロス管理,定尺裁断_数,定尺裁断_所要時間,定尺裁断_割数,寸法カット_数,寸法カット_所要時間,寸法カット_割数,打抜_型取数,打抜_プレス回数,曲げ_数,曲げ_秒数,曲げ_同時加工,仕上げ_数,仕上げ_秒数,ロス管理_材比,ロス管理_加工比,ロット,丸め数,商品重量,削除フラグ,作成ユーザー,最終更新ユーザー,作成日時,最終更新日時) 
                values (@単価ID,@部品コード,@部品名称,@材料ID,@材料名称,@材質大分類,@材質,@定尺寸法縦,@定尺寸法横,@厚み,@定尺仕入金額,@定尺売り金額,@仕入れ単価,@取り数,@商品たて,@商品よこ,@たてしろ,@よこしろ,@見積_裁断,@見積_打抜き,@見積_貼り,@見積_曲げ,@見積_ロス管理,@定尺裁断_数,@定尺裁断_所要時間,@定尺裁断_割数,@寸法カット_数,@寸法カット_所要時間,@寸法カット_割数,@打抜_型取数,@打抜_プレス回数,@曲げ_数,@曲げ_秒数,@曲げ_同時加工,@仕上げ_数,@仕上げ_秒数,@ロス管理_材比,@ロス管理_加工比,@ロット,@丸め数,@商品重量,@削除フラグ,@作成ユーザー,@最終更新ユーザー,@作成日時,@最終更新日時)
                ; SET @NewParameter=LAST_INSERT_ID(); "
                DeleteCommand="delete from T単価  where 単価ID = @original_単価ID  and 最終更新日時 = @original_最終更新日時"
                ConflictDetection="CompareAllValues"
                OldValuesParameterFormatString="original_{0}"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                OnUpdating="mainDataSource_Updating"
                OnInserting="mainDataSource_Inserting">

                <InsertParameters>
                    <asp:FormParameter Name="単価ID" FormField="単価ID" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="部品コード" FormField="部品コード" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="部品名称" FormField="部品名称" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="材料ID" FormField="材料ID" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="材料名称" FormField="材料名称" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="材質大分類" FormField="材質大分類" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="材質" FormField="材質" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="定尺寸法縦" FormField="定尺寸法縦" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="定尺寸法横" FormField="定尺寸法横" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="厚み" FormField="厚み" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="定尺仕入金額" FormField="定尺仕入金額" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="定尺売り金額" FormField="定尺売り金額" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="仕入れ単価" FormField="仕入れ単価" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="取り数" FormField="取り数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="商品たて" FormField="商品たて" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="商品よこ" FormField="商品よこ" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="たてしろ" FormField="たてしろ" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="よこしろ" FormField="よこしろ" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="仕入れ_裁断" FormField="仕入れ_裁断" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="仕入れ_打抜き" FormField="仕入れ_打抜き" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="仕入れ_貼り" FormField="仕入れ_貼り" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="仕入れ_曲げ" FormField="仕入れ_曲げ" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="仕入れ_ロス管理" FormField="仕入れ_ロス管理" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="裁断_数" FormField="裁断_数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="裁断_所要時間" FormField="裁断_所要時間" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="裁断_割数" FormField="裁断_割数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="打抜_型取数" FormField="打抜_型取数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="打抜_プレス回数" FormField="打抜_プレス回数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="曲げ_数" FormField="曲げ_数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="曲げ_秒数" FormField="曲げ_秒数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="曲げ_同時加工" FormField="曲げ_同時加工" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="仕上げ_数" FormField="仕上げ_数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="仕上げ_秒数" FormField="仕上げ_秒数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="ロス管理_材" FormField="ロス管理_材" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="ロス管理_加工" FormField="ロス管理_加工" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="ロット" FormField="ロット" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="丸め数" FormField="丸め数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="商品重量" FormField="商品重量" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="削除フラグ" FormField="削除フラグ" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="作成ユーザー" FormField="作成ユーザー" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="最終更新ユーザー" FormField="最終更新ユーザー" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="作成日時" FormField="作成日時" ConvertEmptyStringToNull="true" Type="DateTime" />
                    <asp:FormParameter Name="最終更新日時" FormField="最終更新日時" ConvertEmptyStringToNull="true" Type="DateTime" />
                    <asp:Parameter Direction="Output" Name="RETURN_VALUE" Type="Int32" />
                </InsertParameters>

                <UpdateParameters>
                    <asp:FormParameter Name="部品コード" FormField="部品コード" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="部品名称" FormField="部品名称" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="材料ID" FormField="材料ID" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="材料名称" FormField="材料名称" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="材質大分類" FormField="材質大分類" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="材質" FormField="材質" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="定尺寸法縦" FormField="定尺寸法縦" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="定尺寸法横" FormField="定尺寸法横" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="厚み" FormField="厚み" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="定尺仕入金額" FormField="定尺仕入金額" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="定尺売り金額" FormField="定尺売り金額" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="仕入れ単価" FormField="仕入れ単価" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="取り数" FormField="取り数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="商品たて" FormField="商品たて" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="商品よこ" FormField="商品よこ" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="たてしろ" FormField="たてしろ" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="よこしろ" FormField="よこしろ" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="仕入れ_裁断" FormField="仕入れ_裁断" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="仕入れ_打抜き" FormField="仕入れ_打抜き" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="仕入れ_貼り" FormField="仕入れ_貼り" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="仕入れ_曲げ" FormField="仕入れ_曲げ" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="仕入れ_ロス管理" FormField="仕入れ_ロス管理" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="裁断_数" FormField="裁断_数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="裁断_所要時間" FormField="裁断_所要時間" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="裁断_割数" FormField="裁断_割数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="打抜_型取数" FormField="打抜_型取数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="打抜_プレス回数" FormField="打抜_プレス回数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="曲げ_数" FormField="曲げ_数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="曲げ_秒数" FormField="曲げ_秒数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="曲げ_同時加工" FormField="曲げ_同時加工" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="仕上げ_数" FormField="仕上げ_数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="仕上げ_秒数" FormField="仕上げ_秒数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="ロス管理_材" FormField="ロス管理_材" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="ロス管理_加工" FormField="ロス管理_加工" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="ロット" FormField="ロット" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="丸め数" FormField="丸め数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="商品重量" FormField="商品重量" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="削除フラグ" FormField="削除フラグ" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="作成ユーザー" FormField="作成ユーザー" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="最終更新ユーザー" FormField="最終更新ユーザー" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="作成日時" FormField="作成日時" ConvertEmptyStringToNull="true" Type="DateTime" />
                    <asp:FormParameter Name="最終更新日時" FormField="最終更新日時" ConvertEmptyStringToNull="true" Type="DateTime" />

                    <asp:Parameter Name="original_単価ID" Type="String" />
                    <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="original_単価ID" Type="String" />
                    <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
                </DeleteParameters>
            </y:BaseSqlDataSource>

            <y:BaseSqlDataSource runat="server" ID="材料DataSource"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                SelectCommand="SELECT 材料ID, concat(材料名称,'_', 厚み, 't*', 定尺寸法縦, 'mm*', 定尺寸法横, 'mm', '_', 定尺仕入金額, '円') AS 材料名称 FROM `M材料` WHERE (`削除フラグ` is null or `削除フラグ` !=  'true')">
            </y:BaseSqlDataSource>


            <y:BaseSqlDataSource runat="server" ID="ユーザーDataSource"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                SelectCommand="SELECT ユーザーId, ユーザー名 FROM `Mユーザー` WHERE (`削除フラグ` is null or `削除フラグ` !=  'true')">
            </y:BaseSqlDataSource>

        </div>
    </form>
</body>
</html>

