﻿<%@ Page Title="" EnableSessionState="True" Language="C#" MasterPageFile="~/YMasterPage.master" AutoEventWireup="true" CodeFile="MTankaMitsumori.aspx.cs" Inherits="MTankaMitsumori" %>

<%@ Register TagPrefix="y" Namespace="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>単価見積もり画面</title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">

    <script type="text/javascript">

        var autoCalculateControl = [];

        function pageLoad() {

            <% if (mainFormView.FindControl("部品コード") != null)
               { %>


            var 単価ID = $('#<%=  mainFormView.FindControl("単価ID").ClientID%>'); 単価ID.css({ 'text-align': 'right', 'margin-right': '25px' }); 単価ID.next().css({ 'left': '72px' }); 単価ID.next().next().css({ 'left': '72px' });
            var 部品コード = $('#<%=  mainFormView.FindControl("部品コード").ClientID%>');
            var 部品名称 = $('#<%=  mainFormView.FindControl("部品名称").ClientID%>');
            var 材料ID = $('#<%=  mainFormView.FindControl("材料ID").ClientID%>');
            var 材料名称 = $('#<%=  mainFormView.FindControl("材料名称").ClientID%>');
            var 材質大分類 = $('#<%=  mainFormView.FindControl("材質大分類").ClientID%>');
            var 材質 = $('#<%=  mainFormView.FindControl("材質").ClientID%>');
            var 定尺寸法縦_original = $('#<%=  mainFormView.FindControl("定尺寸法縦_original").ClientID%>'); 定尺寸法縦_original.css({ 'text-align': 'right', 'margin-right': '25px' }); 定尺寸法縦_original.next().css({ 'left': '72px' }); 定尺寸法縦_original.next().next().css({ 'left': '72px' });
            var 定尺寸法横_original = $('#<%=  mainFormView.FindControl("定尺寸法横_original").ClientID%>'); 定尺寸法横_original.css({ 'text-align': 'right', 'margin-right': '25px' }); 定尺寸法横_original.next().css({ 'left': '72px' }); 定尺寸法横_original.next().next().css({ 'left': '72px' });
            var 定尺仕入金額_original = $('#<%=  mainFormView.FindControl("定尺仕入金額_original").ClientID%>'); 定尺仕入金額_original.css({ 'text-align': 'right', 'margin-right': '25px' }); 定尺仕入金額_original.next().css({ 'left': '72px' }); 定尺仕入金額_original.next().next().css({ 'left': '72px' });

            var 定尺寸法縦 = $('#<%=  mainFormView.FindControl("定尺寸法縦").ClientID%>'); 定尺寸法縦.css({ 'text-align': 'right', 'margin-right': '25px' }); 定尺寸法縦.next().css({ 'left': '72px' }); 定尺寸法縦.next().next().css({ 'left': '72px' });
            var 定尺寸法横 = $('#<%=  mainFormView.FindControl("定尺寸法横").ClientID%>'); 定尺寸法横.css({ 'text-align': 'right', 'margin-right': '25px' }); 定尺寸法横.next().css({ 'left': '72px' }); 定尺寸法横.next().next().css({ 'left': '72px' });
            var 厚み = $('#<%=  mainFormView.FindControl("厚み").ClientID%>'); 厚み.css({ 'text-align': 'right', 'margin-right': '25px' }); 厚み.next().css({ 'left': '72px' }); 厚み.next().next().css({ 'left': '72px' });
            var 定尺仕入金額 = $('#<%=  mainFormView.FindControl("定尺仕入金額").ClientID%>'); 定尺仕入金額.css({ 'text-align': 'right', 'margin-right': '25px' }); 定尺仕入金額.next().css({ 'left': '72px' }); 定尺仕入金額.next().next().css({ 'left': '72px' });
            var 定尺仕入自動計算フラグ = $('#<%=  mainFormView.FindControl("定尺仕入自動計算フラグ").ClientID%>'); 定尺仕入自動計算フラグ.css({ 'text-align': 'right', 'margin-right': '25px' }); 定尺仕入自動計算フラグ.next().css({ 'left': '72px' }); 定尺仕入自動計算フラグ.next().next().css({ 'left': '72px' });

            var 定尺売り金額 = $('#<%=  mainFormView.FindControl("定尺売り金額").ClientID%>'); 定尺売り金額.css({ 'text-align': 'right', 'margin-right': '25px' }); 定尺売り金額.next().css({ 'left': '72px' }); 定尺売り金額.next().next().css({ 'left': '72px' });
            var 時間単価 = $('#<%=  mainFormView.FindControl("時間単価").ClientID%>'); 時間単価.css({ 'text-align': 'right', 'margin-right': '25px' }); 時間単価.next().css({ 'left': '72px' }); 時間単価.next().next().css({ 'left': '72px' });
            var 分単価 = $('#<%=  mainFormView.FindControl("分単価").ClientID%>'); 分単価.css({ 'text-align': 'right', 'margin-right': '25px' }); 分単価.next().css({ 'left': '72px' }); 分単価.next().next().css({ 'left': '72px' });
            var 秒単価 = $('#<%=  mainFormView.FindControl("秒単価").ClientID%>'); 秒単価.css({ 'text-align': 'right', 'margin-right': '25px' }); 秒単価.next().css({ 'left': '72px' }); 秒単価.next().next().css({ 'left': '72px' });

            var m2あたりの材料費 = $('#<%=  mainFormView.FindControl("m2あたりの材料費").ClientID%>'); m2あたりの材料費.css({ 'text-align': 'right', 'margin-right': '25px' }); m2あたりの材料費.next().css({ 'left': '72px' }); m2あたりの材料費.next().next().css({ 'left': '72px' });
            var m2あたりの取数たて = $('#<%=  mainFormView.FindControl("m2あたりの取数たて").ClientID%>'); m2あたりの取数たて.css({ 'text-align': 'right', 'margin-right': '25px' }); m2あたりの取数たて.next().css({ 'left': '72px' }); m2あたりの取数たて.next().next().css({ 'left': '72px' });
            var m2あたりの取数よこ = $('#<%=  mainFormView.FindControl("m2あたりの取数よこ").ClientID%>'); m2あたりの取数よこ.css({ 'text-align': 'right', 'margin-right': '25px' }); m2あたりの取数よこ.next().css({ 'left': '72px' }); m2あたりの取数よこ.next().next().css({ 'left': '72px' });
            var m2あたりの取数 = $('#<%=  mainFormView.FindControl("m2あたりの取数").ClientID%>'); m2あたりの取数.css({ 'text-align': 'right', 'margin-right': '25px' }); m2あたりの取数.next().css({ 'left': '72px' }); m2あたりの取数.next().next().css({ 'left': '72px' });

            var 仕入れ単価 = $('#<%=  mainFormView.FindControl("仕入れ単価").ClientID%>'); 仕入れ単価.css({ 'text-align': 'right', 'margin-right': '25px' }); 仕入れ単価.next().css({ 'left': '72px' }); 仕入れ単価.next().next().css({ 'left': '72px' });
            var 商品たて = $('#<%=  mainFormView.FindControl("商品たて").ClientID%>'); 商品たて.css({ 'text-align': 'right', 'margin-right': '25px' }); 商品たて.next().css({ 'left': '72px' }); 商品たて.next().next().css({ 'left': '72px' });
            var 商品よこ = $('#<%=  mainFormView.FindControl("商品よこ").ClientID%>'); 商品よこ.css({ 'text-align': 'right', 'margin-right': '25px' }); 商品よこ.next().css({ 'left': '72px' }); 商品よこ.next().next().css({ 'left': '72px' });

            var たてしろ = $('#<%=  mainFormView.FindControl("たてしろ").ClientID%>'); たてしろ.css({ 'text-align': 'right', 'margin-right': '25px' }); たてしろ.next().css({ 'left': '72px' }); たてしろ.next().next().css({ 'left': '72px' });
            var よこしろ = $('#<%=  mainFormView.FindControl("よこしろ").ClientID%>'); よこしろ.css({ 'text-align': 'right', 'margin-right': '25px' }); よこしろ.next().css({ 'left': '72px' }); よこしろ.next().next().css({ 'left': '72px' });


            var 取り数 = $('#<%=  mainFormView.FindControl("取り数").ClientID%>'); 取り数.css({ 'text-align': 'right', 'margin-right': '25px' }); 取り数.next().css({ 'left': '72px' }); 取り数.next().next().css({ 'left': '72px' });
            var 見積_材料費 = $('#<%=  mainFormView.FindControl("見積_材料費").ClientID%>'); 見積_材料費.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_材料費.next().css({ 'left': '72px' }); 見積_材料費.next().next().css({ 'left': '72px' });

            var 見積_裁断 = $('#<%=  mainFormView.FindControl("見積_裁断").ClientID%>'); 見積_裁断.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_裁断.next().css({ 'left': '72px' }); 見積_裁断.next().next().css({ 'left': '72px' });
            var 見積_打抜 = $('#<%=  mainFormView.FindControl("見積_打抜").ClientID%>'); 見積_打抜.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_打抜.next().css({ 'left': '72px' }); 見積_打抜.next().next().css({ 'left': '72px' });
            var 見積_貼り = $('#<%=  mainFormView.FindControl("見積_貼り").ClientID%>'); 見積_貼り.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_貼り.next().css({ 'left': '72px' }); 見積_貼り.next().next().css({ 'left': '72px' });
            var 見積_曲げ = $('#<%=  mainFormView.FindControl("見積_曲げ").ClientID%>'); 見積_曲げ.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_曲げ.next().css({ 'left': '72px' }); 見積_曲げ.next().next().css({ 'left': '72px' });
            var 見積_仕上げ = $('#<%=  mainFormView.FindControl("見積_仕上げ").ClientID%>'); 見積_仕上げ.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_仕上げ.next().css({ 'left': '72px' }); 見積_仕上げ.next().next().css({ 'left': '72px' });
            var 見積_ロス管理 = $('#<%=  mainFormView.FindControl("見積_ロス管理").ClientID%>'); 見積_ロス管理.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_ロス管理.next().css({ 'left': '72px' }); 見積_ロス管理.next().next().css({ 'left': '72px' });
            var 見積_材料費比 = $('#<%=  mainFormView.FindControl("見積_材料費比").ClientID%>'); 見積_材料費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_材料費比.next().css({ 'left': '72px' }); 見積_材料費比.next().next().css({ 'left': '72px' });
            var 見積_加工費小計 = $('#<%=  mainFormView.FindControl("見積_加工費小計").ClientID%>'); 見積_加工費小計.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_加工費小計.next().css({ 'left': '72px' }); 見積_加工費小計.next().next().css({ 'left': '72px' });
            var 見積_加工費比 = $('#<%=  mainFormView.FindControl("見積_加工費比").ClientID%>'); 見積_加工費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_加工費比.next().css({ 'left': '72px' }); 見積_加工費比.next().next().css({ 'left': '72px' });
            var 見積_単価 = $('#<%=  mainFormView.FindControl("見積_単価").ClientID%>'); 見積_単価.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_単価.next().css({ 'left': '72px' }); 見積_単価.next().next().css({ 'left': '72px' });
            var 見積_m2あたり材料費 = $('#<%=  mainFormView.FindControl("見積_m2あたり材料費").ClientID%>'); 見積_m2あたり材料費.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_m2あたり材料費.next().css({ 'left': '72px' }); 見積_m2あたり材料費.next().next().css({ 'left': '72px' });

            var たて_しろあり = $('#<%=  mainFormView.FindControl("たて_しろあり").ClientID%>'); たて_しろあり.css({ 'text-align': 'right', 'margin-right': '25px' }); たて_しろあり.next().css({ 'left': '72px' }); たて_しろあり.next().next().css({ 'left': '72px' });
            var よこ_しろあり = $('#<%=  mainFormView.FindControl("よこ_しろあり").ClientID%>'); よこ_しろあり.css({ 'text-align': 'right', 'margin-right': '25px' }); よこ_しろあり.next().css({ 'left': '72px' }); よこ_しろあり.next().next().css({ 'left': '72px' });
            var 縦取り数 = $('#<%=  mainFormView.FindControl("縦取り数").ClientID%>'); 縦取り数.css({ 'text-align': 'right', 'margin-right': '25px' }); 縦取り数.next().css({ 'left': '72px' }); 縦取り数.next().next().css({ 'left': '72px' });
            var 横取り数 = $('#<%=  mainFormView.FindControl("横取り数").ClientID%>'); 横取り数.css({ 'text-align': 'right', 'margin-right': '25px' }); 横取り数.next().css({ 'left': '72px' }); 横取り数.next().next().css({ 'left': '72px' });
            var たて余 = $('#<%=  mainFormView.FindControl("たて余").ClientID%>'); たて余.css({ 'text-align': 'right', 'margin-right': '25px' }); たて余.next().css({ 'left': '72px' }); たて余.next().next().css({ 'left': '72px' });
            var よこ余 = $('#<%=  mainFormView.FindControl("よこ余").ClientID%>'); よこ余.css({ 'text-align': 'right', 'margin-right': '25px' }); よこ余.next().css({ 'left': '72px' }); よこ余.next().next().css({ 'left': '72px' });

            var 計算_取り数 = $('#<%=  mainFormView.FindControl("計算_取り数").ClientID%>'); 計算_取り数.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_取り数.next().css({ 'left': '72px' }); 計算_取り数.next().next().css({ 'left': '72px' });
            var 計算_材料費T = $('#<%=  mainFormView.FindControl("計算_材料費T").ClientID%>'); 計算_材料費T.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_材料費T.next().css({ 'left': '72px' }); 計算_材料費T.next().next().css({ 'left': '72px' });
            var 計算_材料費 = $('#<%=  mainFormView.FindControl("計算_材料費").ClientID%>'); 計算_材料費.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_材料費.next().css({ 'left': '72px' }); 計算_材料費.next().next().css({ 'left': '72px' });

            var 計算_裁断 = $('#<%=  mainFormView.FindControl("計算_裁断").ClientID%>'); 計算_裁断.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_裁断.next().css({ 'left': '72px' }); 計算_裁断.next().next().css({ 'left': '72px' });
            var 計算_打抜 = $('#<%=  mainFormView.FindControl("計算_打抜").ClientID%>'); 計算_打抜.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_打抜.next().css({ 'left': '72px' }); 計算_打抜.next().next().css({ 'left': '72px' });
            var 計算_貼り = $('#<%=  mainFormView.FindControl("計算_貼り").ClientID%>'); 計算_貼り.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_貼り.next().css({ 'left': '72px' }); 計算_貼り.next().next().css({ 'left': '72px' });
            var 計算_曲げ = $('#<%=  mainFormView.FindControl("計算_曲げ").ClientID%>'); 計算_曲げ.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_曲げ.next().css({ 'left': '72px' }); 計算_曲げ.next().next().css({ 'left': '72px' });
            var 計算_仕上げ = $('#<%=  mainFormView.FindControl("計算_仕上げ").ClientID%>'); 計算_仕上げ.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_仕上げ.next().css({ 'left': '72px' }); 計算_仕上げ.next().next().css({ 'left': '72px' });
            var 計算_ロス管理 = $('#<%=  mainFormView.FindControl("計算_ロス管理").ClientID%>'); 計算_ロス管理.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_ロス管理.next().css({ 'left': '72px' }); 計算_ロス管理.next().next().css({ 'left': '72px' });
            var 計算_材料費比 = $('#<%=  mainFormView.FindControl("計算_材料費比").ClientID%>'); 計算_材料費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_材料費比.next().css({ 'left': '72px' }); 計算_材料費比.next().next().css({ 'left': '72px' });
            var 計算_加工費小計 = $('#<%=  mainFormView.FindControl("計算_加工費小計").ClientID%>'); 計算_加工費小計.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_加工費小計.next().css({ 'left': '72px' }); 計算_加工費小計.next().next().css({ 'left': '72px' });
            var 計算_加工費比 = $('#<%=  mainFormView.FindControl("計算_加工費比").ClientID%>'); 計算_加工費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_加工費比.next().css({ 'left': '72px' }); 計算_加工費比.next().next().css({ 'left': '72px' });
            var 計算_単価 = $('#<%=  mainFormView.FindControl("計算_単価").ClientID%>'); 計算_単価.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_単価.next().css({ 'left': '72px' }); 計算_単価.next().next().css({ 'left': '72px' });

            var 定尺裁断_数 = $('#<%=  mainFormView.FindControl("定尺裁断_数").ClientID%>'); 定尺裁断_数.css({ 'text-align': 'right', 'margin-right': '25px' }); 定尺裁断_数.next().css({ 'left': '72px' }); 定尺裁断_数.next().next().css({ 'left': '72px' });
            var 定尺裁断_所要時間 = $('#<%=  mainFormView.FindControl("定尺裁断_所要時間").ClientID%>'); 定尺裁断_所要時間.css({ 'text-align': 'right', 'margin-right': '25px' }); 定尺裁断_所要時間.next().css({ 'left': '72px' }); 定尺裁断_所要時間.next().next().css({ 'left': '72px' });
            var 定尺裁断_割数 = $('#<%=  mainFormView.FindControl("定尺裁断_割数").ClientID%>'); 定尺裁断_割数.css({ 'text-align': 'right', 'margin-right': '25px' }); 定尺裁断_割数.next().css({ 'left': '72px' }); 定尺裁断_割数.next().next().css({ 'left': '72px' });

            var 寸法カット_数 = $('#<%=  mainFormView.FindControl("寸法カット_数").ClientID%>'); 寸法カット_数.css({ 'text-align': 'right', 'margin-right': '25px' }); 寸法カット_数.next().css({ 'left': '72px' }); 寸法カット_数.next().next().css({ 'left': '72px' });
            var 寸法カット_所要時間 = $('#<%=  mainFormView.FindControl("寸法カット_所要時間").ClientID%>'); 寸法カット_所要時間.css({ 'text-align': 'right', 'margin-right': '25px' }); 寸法カット_所要時間.next().css({ 'left': '72px' }); 寸法カット_所要時間.next().next().css({ 'left': '72px' });
            var 寸法カット_割数 = $('#<%=  mainFormView.FindControl("寸法カット_割数").ClientID%>'); 寸法カット_割数.css({ 'text-align': 'right', 'margin-right': '25px' }); 寸法カット_割数.next().css({ 'left': '72px' }); 寸法カット_割数.next().next().css({ 'left': '72px' });

            var 打抜_型取数 = $('#<%=  mainFormView.FindControl("打抜_型取数").ClientID%>'); 打抜_型取数.css({ 'text-align': 'right', 'margin-right': '25px' }); 打抜_型取数.next().css({ 'left': '72px' }); 打抜_型取数.next().next().css({ 'left': '72px' });
            var 打抜_プレス回数 = $('#<%=  mainFormView.FindControl("打抜_プレス回数").ClientID%>'); 打抜_プレス回数.css({ 'text-align': 'right', 'margin-right': '25px' }); 打抜_プレス回数.next().css({ 'left': '72px' }); 打抜_プレス回数.next().next().css({ 'left': '72px' });

            var 曲げ_数 = $('#<%=  mainFormView.FindControl("曲げ_数").ClientID%>'); 曲げ_数.css({ 'text-align': 'right', 'margin-right': '25px' }); 曲げ_数.next().css({ 'left': '72px' }); 曲げ_数.next().next().css({ 'left': '72px' });
            var 曲げ_秒数 = $('#<%=  mainFormView.FindControl("曲げ_秒数").ClientID%>'); 曲げ_秒数.css({ 'text-align': 'right', 'margin-right': '25px' }); 曲げ_秒数.next().css({ 'left': '72px' }); 曲げ_秒数.next().next().css({ 'left': '72px' });
            var 曲げ_同時加工 = $('#<%=  mainFormView.FindControl("曲げ_同時加工").ClientID%>'); 曲げ_同時加工.css({ 'text-align': 'right', 'margin-right': '25px' }); 曲げ_同時加工.next().css({ 'left': '72px' }); 曲げ_同時加工.next().next().css({ 'left': '72px' });

            var 仕上げ_数 = $('#<%=  mainFormView.FindControl("仕上げ_数").ClientID%>'); 仕上げ_数.css({ 'text-align': 'right', 'margin-right': '25px' }); 仕上げ_数.next().css({ 'left': '72px' }); 仕上げ_数.next().next().css({ 'left': '72px' });
            var 仕上げ_秒数 = $('#<%=  mainFormView.FindControl("仕上げ_秒数").ClientID%>'); 仕上げ_秒数.css({ 'text-align': 'right', 'margin-right': '25px' }); 仕上げ_秒数.next().css({ 'left': '72px' }); 仕上げ_秒数.next().next().css({ 'left': '72px' });
            var 仕上げ_同時加工 = $('#<%=  mainFormView.FindControl("仕上げ_同時加工").ClientID%>'); 仕上げ_同時加工.css({ 'text-align': 'right', 'margin-right': '25px' }); 仕上げ_同時加工.next().css({ 'left': '72px' }); 仕上げ_同時加工.next().next().css({ 'left': '72px' });

            var ロス管理_材比 = $('#<%=  mainFormView.FindControl("ロス管理_材比").ClientID%>'); ロス管理_材比.css({ 'text-align': 'right', 'margin-right': '25px' }); ロス管理_材比.next().css({ 'left': '72px' }); ロス管理_材比.next().next().css({ 'left': '72px' });
            var ロス管理_加工比 = $('#<%=  mainFormView.FindControl("ロス管理_加工比").ClientID%>'); ロス管理_加工比.css({ 'text-align': 'right', 'margin-right': '25px' }); ロス管理_加工比.next().css({ 'left': '72px' }); ロス管理_加工比.next().next().css({ 'left': '72px' });

            var 定尺裁断_時間 = $('#<%=  mainFormView.FindControl("定尺裁断_時間").ClientID%>'); 定尺裁断_時間.css({ 'text-align': 'right', 'margin-right': '25px' }); 定尺裁断_時間.next().css({ 'left': '72px' }); 定尺裁断_時間.next().next().css({ 'left': '72px' });
            var 定尺裁断_作業費 = $('#<%=  mainFormView.FindControl("定尺裁断_作業費").ClientID%>'); 定尺裁断_作業費.css({ 'text-align': 'right', 'margin-right': '25px' }); 定尺裁断_作業費.next().css({ 'left': '72px' }); 定尺裁断_作業費.next().next().css({ 'left': '72px' });
            var 定尺裁断_単価当り = $('#<%=  mainFormView.FindControl("定尺裁断_単価当り").ClientID%>'); 定尺裁断_単価当り.css({ 'text-align': 'right', 'margin-right': '25px' }); 定尺裁断_単価当り.next().css({ 'left': '72px' }); 定尺裁断_単価当り.next().next().css({ 'left': '72px' });

            var 寸法カット_時間 = $('#<%=  mainFormView.FindControl("寸法カット_時間").ClientID%>'); 寸法カット_時間.css({ 'text-align': 'right', 'margin-right': '25px' }); 寸法カット_時間.next().css({ 'left': '72px' }); 寸法カット_時間.next().next().css({ 'left': '72px' });
            var 寸法カット_作業費 = $('#<%=  mainFormView.FindControl("寸法カット_作業費").ClientID%>'); 寸法カット_作業費.css({ 'text-align': 'right', 'margin-right': '25px' }); 寸法カット_作業費.next().css({ 'left': '72px' }); 寸法カット_作業費.next().next().css({ 'left': '72px' });
            var 寸法カット_単価当り = $('#<%=  mainFormView.FindControl("寸法カット_単価当り").ClientID%>'); 寸法カット_単価当り.css({ 'text-align': 'right', 'margin-right': '25px' }); 寸法カット_単価当り.next().css({ 'left': '72px' }); 寸法カット_単価当り.next().next().css({ 'left': '72px' });

            var 打抜_時間当たりの加工数 = $('#<%=  mainFormView.FindControl("打抜_時間当たりの加工数").ClientID%>'); 打抜_時間当たりの加工数.css({ 'text-align': 'right', 'margin-right': '25px' }); 打抜_時間当たりの加工数.next().css({ 'left': '72px' }); 打抜_時間当たりの加工数.next().next().css({ 'left': '72px' });
            var 打抜_単価当り = $('#<%=  mainFormView.FindControl("打抜_単価当り").ClientID%>'); 打抜_単価当り.css({ 'text-align': 'right', 'margin-right': '25px' }); 打抜_単価当り.next().css({ 'left': '72px' }); 打抜_単価当り.next().next().css({ 'left': '72px' });

            var 曲げ_時間 = $('#<%=  mainFormView.FindControl("曲げ_時間").ClientID%>'); 曲げ_時間.css({ 'text-align': 'right', 'margin-right': '25px' }); 曲げ_時間.next().css({ 'left': '72px' }); 曲げ_時間.next().next().css({ 'left': '72px' });
            var 曲げ_作業費 = $('#<%=  mainFormView.FindControl("曲げ_作業費").ClientID%>'); 曲げ_作業費.css({ 'text-align': 'right', 'margin-right': '25px' }); 曲げ_作業費.next().css({ 'left': '72px' }); 曲げ_作業費.next().next().css({ 'left': '72px' });
            var 曲げ_単価当り = $('#<%=  mainFormView.FindControl("曲げ_単価当り").ClientID%>'); 曲げ_単価当り.css({ 'text-align': 'right', 'margin-right': '25px' }); 曲げ_単価当り.next().css({ 'left': '72px' }); 曲げ_単価当り.next().next().css({ 'left': '72px' });

            var 仕上げ_時間 = $('#<%=  mainFormView.FindControl("仕上げ_時間").ClientID%>'); 仕上げ_時間.css({ 'text-align': 'right', 'margin-right': '25px' }); 仕上げ_時間.next().css({ 'left': '72px' }); 仕上げ_時間.next().next().css({ 'left': '72px' });
            var 仕上げ_作業費 = $('#<%=  mainFormView.FindControl("仕上げ_作業費").ClientID%>'); 仕上げ_作業費.css({ 'text-align': 'right', 'margin-right': '25px' }); 仕上げ_作業費.next().css({ 'left': '72px' }); 仕上げ_作業費.next().next().css({ 'left': '72px' });
            var 仕上げ_単価当り = $('#<%=  mainFormView.FindControl("仕上げ_単価当り").ClientID%>'); 仕上げ_単価当り.css({ 'text-align': 'right', 'margin-right': '25px' }); 仕上げ_単価当り.next().css({ 'left': '72px' }); 仕上げ_単価当り.next().next().css({ 'left': '72px' });

            var ロス管理_材_費用 = $('#<%=  mainFormView.FindControl("ロス管理_材_費用").ClientID%>'); ロス管理_材_費用.css({ 'text-align': 'right', 'margin-right': '25px' }); ロス管理_材_費用.next().css({ 'left': '72px' }); ロス管理_材_費用.next().next().css({ 'left': '72px' });
            var ロス管理_加工_費用 = $('#<%=  mainFormView.FindControl("ロス管理_加工_費用").ClientID%>'); ロス管理_加工_費用.css({ 'text-align': 'right', 'margin-right': '25px' }); ロス管理_加工_費用.next().css({ 'left': '72px' }); ロス管理_加工_費用.next().next().css({ 'left': '72px' });

            var 見積_定尺裁断費比 = $('#<%=  mainFormView.FindControl("見積_定尺裁断費比").ClientID%>'); 見積_定尺裁断費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_定尺裁断費比.next().css({ 'left': '72px' }); 見積_定尺裁断費比.next().next().css({ 'left': '72px' });
            var 計算_定尺裁断費比 = $('#<%=  mainFormView.FindControl("計算_定尺裁断費比").ClientID%>'); 計算_定尺裁断費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_定尺裁断費比.next().css({ 'left': '72px' }); 計算_定尺裁断費比.next().next().css({ 'left': '72px' });
            var 計算_寸法カット費比 = $('#<%=  mainFormView.FindControl("計算_寸法カット費比").ClientID%>'); 計算_寸法カット費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_寸法カット費比.next().css({ 'left': '72px' }); 計算_寸法カット費比.next().next().css({ 'left': '72px' });

            var 見積_打抜費比 = $('#<%=  mainFormView.FindControl("見積_打抜費比").ClientID%>'); 見積_打抜費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_打抜費比.next().css({ 'left': '72px' }); 見積_打抜費比.next().next().css({ 'left': '72px' });
            var 計算_打抜費比 = $('#<%=  mainFormView.FindControl("計算_打抜費比").ClientID%>'); 計算_打抜費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_打抜費比.next().css({ 'left': '72px' }); 計算_打抜費比.next().next().css({ 'left': '72px' });
            var 見積_貼り費比 = $('#<%=  mainFormView.FindControl("見積_貼り費比").ClientID%>'); 見積_貼り費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_貼り費比.next().css({ 'left': '72px' }); 見積_貼り費比.next().next().css({ 'left': '72px' });
            var 計算_貼り費比 = $('#<%=  mainFormView.FindControl("計算_貼り費比").ClientID%>'); 計算_貼り費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_貼り費比.next().css({ 'left': '72px' }); 計算_貼り費比.next().next().css({ 'left': '72px' });
            var 見積_曲げ費比 = $('#<%=  mainFormView.FindControl("見積_曲げ費比").ClientID%>'); 見積_曲げ費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_曲げ費比.next().css({ 'left': '72px' }); 見積_曲げ費比.next().next().css({ 'left': '72px' });
            var 計算_曲げ費比 = $('#<%=  mainFormView.FindControl("計算_曲げ費比").ClientID%>'); 計算_曲げ費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_曲げ費比.next().css({ 'left': '72px' }); 計算_曲げ費比.next().next().css({ 'left': '72px' });
            var 見積_仕上げ費比 = $('#<%=  mainFormView.FindControl("見積_仕上げ費比").ClientID%>'); 見積_仕上げ費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_仕上げ費比.next().css({ 'left': '72px' }); 見積_仕上げ費比.next().next().css({ 'left': '72px' });
            var 計算_仕上げ費比 = $('#<%=  mainFormView.FindControl("計算_仕上げ費比").ClientID%>'); 計算_仕上げ費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_仕上げ費比.next().css({ 'left': '72px' }); 計算_仕上げ費比.next().next().css({ 'left': '72px' });
            var 見積_ロス管理費比 = $('#<%=  mainFormView.FindControl("見積_ロス管理費比").ClientID%>'); 見積_ロス管理費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 見積_ロス管理費比.next().css({ 'left': '72px' }); 見積_ロス管理費比.next().next().css({ 'left': '72px' });
            var 計算_ロス管理費比 = $('#<%=  mainFormView.FindControl("計算_ロス管理費比").ClientID%>'); 計算_ロス管理費比.css({ 'text-align': 'right', 'margin-right': '25px' }); 計算_ロス管理費比.next().css({ 'left': '72px' }); 計算_ロス管理費比.next().next().css({ 'left': '72px' });

            var 売単価 = $('#<%=  mainFormView.FindControl("売単価").ClientID%>'); 売単価.css({ 'text-align': 'right', 'margin-right': '25px' }); 売単価.next().css({ 'left': '72px' }); 売単価.next().next().css({ 'left': '72px' });
            var 利益率 = $('#<%=  mainFormView.FindControl("利益率").ClientID%>'); 利益率.css({ 'text-align': 'right', 'margin-right': '25px' }); 利益率.next().css({ 'left': '72px' }); 利益率.next().next().css({ 'left': '72px' });

            var ロット = $('#<%=  mainFormView.FindControl("ロット").ClientID%>'); ロット.css({ 'text-align': 'right', 'margin-right': '25px' }); ロット.next().css({ 'left': '72px' }); ロット.next().next().css({ 'left': '72px' });
            var 丸め数 = $('#<%=  mainFormView.FindControl("丸め数").ClientID%>'); 丸め数.css({ 'text-align': 'right', 'margin-right': '25px' }); 丸め数.next().css({ 'left': '72px' }); 丸め数.next().next().css({ 'left': '72px' });
            var 商品重量 = $('#<%=  mainFormView.FindControl("商品重量").ClientID%>'); 商品重量.css({ 'text-align': 'right', 'margin-right': '25px' }); 商品重量.next().css({ 'left': '72px' }); 商品重量.next().next().css({ 'left': '72px' });
            var 削除フラグ = $('#<%=  mainFormView.FindControl("削除フラグ").ClientID%>'); 削除フラグ.css({ 'text-align': 'right', 'margin-right': '25px' }); 削除フラグ.next().css({ 'left': '72px' }); 削除フラグ.next().next().css({ 'left': '72px' });
            var 作成ユーザー = $('#<%=  mainFormView.FindControl("作成ユーザー").ClientID%>'); 作成ユーザー.css({ 'text-align': 'right', 'margin-right': '25px' }); 作成ユーザー.next().css({ 'left': '72px' }); 作成ユーザー.next().next().css({ 'left': '72px' });
            var 最終更新ユーザー = $('#<%=  mainFormView.FindControl("最終更新ユーザー").ClientID%>'); 最終更新ユーザー.css({ 'text-align': 'right', 'margin-right': '25px' }); 最終更新ユーザー.next().css({ 'left': '72px' }); 最終更新ユーザー.next().next().css({ 'left': '72px' });
            var 作成日時 = $('#<%=  mainFormView.FindControl("作成日時").ClientID%>'); 作成日時.css({ 'text-align': 'right', 'margin-right': '25px' }); 作成日時.next().css({ 'left': '72px' }); 作成日時.next().next().css({ 'left': '72px' });
            var 最終更新日時 = $('#<%=  mainFormView.FindControl("最終更新日時").ClientID%>'); 最終更新日時.css({ 'text-align': 'right', 'margin-right': '25px' }); 最終更新日時.next().css({ 'left': '72px' }); 最終更新日時.next().next().css({ 'left': '72px' });




            たて_しろあり.val("NaN");
            よこ_しろあり.val("NaN");
            縦取り数.val("NaN");
            横取り数.val("NaN");
            たて余.val("NaN");
            よこ余.val("NaN");
            計算_取り数.val("NaN");
            計算_材料費T.val("NaN");
            m2あたりの材料費.val("NaN");
            m2あたりの取数たて.val("NaN");
            m2あたりの取数よこ.val("NaN");
            m2あたりの取数.val("NaN");

            見積_材料費比.val("NaN");
            見積_加工費小計.val("NaN");
            見積_加工費比.val("NaN");
            見積_単価.val("NaN");
            見積_m2あたり材料費.val("NaN");
            計算_裁断.val("NaN");
            計算_打抜.val("NaN");
            計算_貼り.val("NaN");
            計算_曲げ.val("NaN");
            計算_ロス管理.val("NaN");
            計算_材料費.val("NaN");
            計算_材料費比.val("NaN");
            計算_加工費小計.val("NaN");
            計算_加工費比.val("NaN");
            計算_単価.val("NaN");
            分単価.val("NaN");
            秒単価.val("NaN");
            定尺裁断_時間.val("NaN");
            定尺裁断_作業費.val("NaN");
            定尺裁断_単価当り.val("NaN");
            寸法カット_時間.val("NaN");
            寸法カット_作業費.val("NaN");
            寸法カット_単価当り.val("NaN");
            打抜_時間当たりの加工数.val("NaN");
            打抜_単価当り.val("NaN");
            曲げ_時間.val("NaN");
            曲げ_作業費.val("NaN");
            曲げ_単価当り.val("NaN");
            仕上げ_時間.val("NaN");
            仕上げ_作業費.val("NaN");
            仕上げ_単価当り.val("NaN");
            ロス管理_材_費用.val("NaN");
            ロス管理_加工_費用.val("NaN");
            見積_定尺裁断費比.val("NaN");
            計算_定尺裁断費比.val("NaN");
            計算_寸法カット費比.val("NaN");
            見積_打抜費比.val("NaN");
            計算_打抜費比.val("NaN");
            見積_貼り費比.val("NaN");
            計算_貼り費比.val("NaN");
            見積_曲げ費比.val("NaN");
            計算_曲げ費比.val("NaN");
            見積_仕上げ費比.val("NaN");
            計算_仕上げ費比.val("NaN");
            見積_ロス管理費比.val("NaN");
            計算_ロス管理費比.val("NaN");
            利益率.val("NaN");


            var 分単価計算 = function (event, ele) {
                try {
                    分単価.val(Fixed(V(時間単価) / 60, 2));
                    秒単価.val(Fixed(V(分単価) / 60, 2));
                } catch (e) {
                    分単価.val("NaN");
                    秒単価.val("NaN");
                }
                //分単価.change();
            };
            var eleList = [時間単価];
            BindEvent(eleList, 分単価計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            //var 秒単価計算 = function (event, ele) {
            //    try {
            //        秒単価.val(Fixed(V(分単価) / 60, 2));
            //    } catch (e) {
            //        秒単価.val("NaN");
            //    }
            //    //秒単価.change();
            //};
            //var eleList = [秒単価];
            //BindEvent(eleList, 秒単価計算);

            //autoCalculateControl = autoCalculateControl.concat(eleList);

            var たて計算 = function (event, ele) {
                try {
                    たて_しろあり.val(Fixed(V(たてしろ) + V(商品たて), 2));
                } catch (e) {
                    たて_しろあり.val("NaN");
                }
                たて_しろあり.change();
            };
            var eleList = [たてしろ, 商品たて];
            BindEvent(eleList, たて計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);


            var よこ計算 = function (event, ele) {
                try {
                    よこ_しろあり.val(Fixed(V(よこしろ) + V(商品よこ), 2));
                } catch (e) {
                    よこ_しろあり.val("NaN");
                }
                よこ_しろあり.change();
            };
            var eleList = [よこしろ, 商品よこ];
            BindEvent(eleList, よこ計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);


            var たて取り数計算 = function (event, ele) {
                try {
                    if (V(たて_しろあり) > 0) {
                        縦取り数.val(Fixed(V(定尺寸法縦) / V(たて_しろあり), 2));
                    } else {
                        縦取り数.val(0);
                    }
                } catch (e) {
                    縦取り数.val("NaN");
                }
                縦取り数.change();
            };
            var eleList = [たて_しろあり, 定尺寸法縦];
            BindEvent(eleList, たて取り数計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var よこ取り数計算 = function (event, ele) {
                try {

                    if (V(たて_しろあり) > 0) {
                        横取り数.val(Fixed(V(定尺寸法横) / V(よこ_しろあり), 2));
                    } else {
                        横取り数.val(0);
                    }
                } catch (e) {
                    横取り数.val("NaN");
                }
                横取り数.change();
            };
            var eleList = [よこ_しろあり, 定尺寸法横];
            BindEvent(eleList, よこ取り数計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var たて余計算 = function (event, ele) {
                try {
                    var v1 = Floor(V(縦取り数), 0);
                    たて余.val(Fixed(V(定尺寸法縦) - (V(たて_しろあり) * v1), 2));
                } catch (e) {
                    たて余.val("NaN");
                }
                たて余.change();
            };
            var eleList = [定尺寸法縦, たて_しろあり, 縦取り数];
            BindEvent(eleList, たて余計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var よこ余計算 = function (event, ele) {
                try {
                    var v1 = Floor(V(横取り数), 0);
                    よこ余.val(Fixed(V(定尺寸法横) - (V(よこ_しろあり) * v1), 2));
                } catch (e) {
                    よこ余.val("NaN");
                }
                よこ余.change();
            };
            var eleList = [定尺寸法横, よこ_しろあり, 横取り数];
            BindEvent(eleList, よこ余計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 計算_取り数計算 = function (event, ele) {
                try {
                    var v縦取り数 = Floor(V(縦取り数), 0);
                    var v横取り数 = Floor(V(横取り数), 0);

                    計算_取り数.val(Fixed(v縦取り数 * v横取り数), 0);
                } catch (e) {
                    計算_取り数.val("NaN");
                }
                計算_取り数.change();
            };
            var eleList = [縦取り数, 横取り数];
            BindEvent(eleList, 計算_取り数計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);




            var 計算_材料費T計算 = function (event, ele) {
                try {
                    var v定尺仕入金額 = V(定尺仕入金額);
                    var v計算_取り数 = V(計算_取り数);

                    var value = Fixed(v定尺仕入金額 / v計算_取り数, 2);

                    計算_材料費T.val(value);
                } catch (e) {
                    計算_材料費T.val("NaN");
                }
                計算_材料費T.change();
            };
            var eleList = [定尺仕入金額, 計算_取り数];
            BindEvent(eleList, 計算_材料費T計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);



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
                m2あたりの材料費.change();
            };

            var eleList = [定尺寸法縦, 定尺寸法横, 定尺仕入金額];
            BindEvent(eleList, m2あたりの材料費計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);


            var m2あたりの取数たて計算 = function (event, ele) {
                try {
                    if (V(たて_しろあり) > 0) {
                        m2あたりの取数たて.val(Fixed(1000 / V(たて_しろあり), 2));
                    } else {
                        m2あたりの取数たて.val(0);
                    }
                } catch (e) {
                    m2あたりの取数たて.val("NaN");
                }
                m2あたりの取数たて.change();
            };
            var eleList = [たて_しろあり];
            BindEvent(eleList, m2あたりの取数たて計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var m2あたりの取数よこ計算 = function (event, ele) {
                try {

                    if (V(よこ_しろあり) > 0) {
                        m2あたりの取数よこ.val(Fixed(1000 / V(よこ_しろあり), 2));
                    } else {
                        m2あたりの取数よこ.val(0);
                    }
                } catch (e) {
                    m2あたりの取数よこ.val("NaN");
                }
                m2あたりの取数よこ.change();
            };
            var eleList = [よこ_しろあり];
            BindEvent(eleList, m2あたりの取数よこ計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var m2あたりの取数計算 = function (event, ele) {
                try {
                    m2あたりの取数.val(Floor(V(m2あたりの取数よこ), 0) * Floor(V(m2あたりの取数たて), 0));
                } catch (e) {
                    m2あたりの取数.val("NaN");
                }
                m2あたりの取数.change();
            };
            var eleList = [m2あたりの取数よこ, m2あたりの取数たて];
            BindEvent(eleList, m2あたりの取数計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 計算_材料費計算 = function (event, ele) {
                try {
                    計算_材料費.val(Floor(V(定尺仕入金額) / V(取り数), 2));
                } catch (e) {
                    計算_材料費.val("NaN");
                }
                計算_材料費.change();
            };
            var eleList = [定尺仕入金額, 取り数];
            BindEvent(eleList, 計算_材料費計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);




            var 見積_加工費小計計算 = function (event, ele) {
                try {
                    var v = 0;
                    v = v + V(見積_裁断);
                    v = v + V(見積_打抜);
                    v = v + V(見積_貼り);
                    v = v + V(見積_曲げ);
                    v = v + V(見積_仕上げ);
                    //v = v + V(見積_ロス管理);
                    v = Fixed(v, 2);
                    見積_加工費小計.val(v);
                } catch (e) {
                    見積_加工費小計.val("NaN");
                }
                見積_加工費小計.change();
            };
            var eleList = [定尺仕入金額, 見積_裁断, 見積_打抜, 見積_貼り, 見積_曲げ, 見積_仕上げ];
            BindEvent(eleList, 見積_加工費小計計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 見積_単価計算 = function (event, ele) {
                try {
                    var v = 0;
                    v = v + V(見積_加工費小計);
                    v = v + V(見積_ロス管理);
                    v = v + V(見積_材料費);
                    v = Fixed(v, 2);
                    見積_単価.val(v);
                } catch (e) {
                    見積_単価.val("NaN");
                }
                見積_単価.change();
            };
            var eleList = [見積_加工費小計, 見積_ロス管理, 見積_材料費];
            BindEvent(eleList, 見積_単価計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 見積_m2あたり材料費計算 = function (event, ele) {
                try {

                    var vたて係数 = 1000 / (V(商品たて) + V(たてしろ));
                    var vよこ係数 = 1000 / (V(商品よこ) + V(よこしろ));
                    var v材料費 = V(見積_材料費);
                    var v = v材料費 * vたて係数 * vよこ係数;
                    v = Fixed(v, 2);
                    見積_m2あたり材料費.val(v);
                } catch (e) {
                    見積_m2あたり材料費.val("NaN");
                }
                見積_m2あたり材料費.change();
            };
            var eleList = [見積_加工費小計, 見積_ロス管理, 見積_材料費];
            BindEvent(eleList, 見積_m2あたり材料費計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);




            var 見積_材料費比計算 = function (event, ele) {
                try {

                    if (V(たて_しろあり) > 0) {
                        見積_材料費比.val(Fixed(V(見積_材料費) / V(見積_単価), 2));
                    } else {
                        見積_材料費比.val(0);
                    }
                } catch (e) {
                    見積_材料費比.val("NaN");
                }
                見積_材料費比.change();
            };
            var eleList = [見積_材料費, 見積_単価];
            BindEvent(eleList, 見積_材料費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 見積_加工費比計算 = function (event, ele) {
                try {

                    if (V(たて_しろあり) > 0) {
                        見積_加工費比.val(Fixed(V(見積_加工費小計) / V(見積_単価), 2));
                    } else {
                        見積_加工費比.val(0);
                    }
                } catch (e) {
                    見積_加工費比.val("NaN");
                }
                見積_加工費比.change();
            };
            var eleList = [見積_材料費, 見積_単価];
            BindEvent(eleList, 見積_加工費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 定尺裁断_時間計算 = function (event, ele) {
                try {
                    定尺裁断_時間.val(Fixed(V(定尺裁断_数) * V(定尺裁断_所要時間), 2));
                } catch (e) {
                    定尺裁断_時間.val("NaN");
                }
                定尺裁断_時間.change();
            };
            var eleList = [定尺裁断_数, 定尺裁断_所要時間];
            BindEvent(eleList, 定尺裁断_時間計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 定尺裁断_作業費計算 = function (event, ele) {
                try {
                    定尺裁断_作業費.val(Fixed(V(定尺裁断_時間) * V(秒単価), 2));
                } catch (e) {
                    定尺裁断_作業費.val("NaN");
                }
                定尺裁断_作業費.change();
            };
            var eleList = [定尺裁断_時間, 秒単価];
            BindEvent(eleList, 定尺裁断_作業費計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 定尺裁断_単価当り計算 = function (event, ele) {
                try {
                    if (V(定尺裁断_割数) <= 0) {
                        定尺裁断_単価当り.val("0.00");
                    } else {
                        定尺裁断_単価当り.val(Fixed(V(定尺裁断_作業費) / V(定尺裁断_割数), 2));
                    }
                } catch (e) {
                    定尺裁断_単価当り.val("NaN");
                }
                定尺裁断_単価当り.change();
            };
            var eleList = [定尺裁断_作業費, 定尺裁断_割数];
            BindEvent(eleList, 定尺裁断_単価当り計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);


            var 寸法カット_時間計算 = function (event, ele) {
                try {
                    寸法カット_時間.val(Fixed(V(寸法カット_数) * V(寸法カット_所要時間), 2));
                } catch (e) {
                    寸法カット_時間.val("NaN");
                }
                寸法カット_時間.change();
            };
            var eleList = [寸法カット_数, 寸法カット_所要時間];
            BindEvent(eleList, 寸法カット_時間計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 寸法カット_作業費計算 = function (event, ele) {
                try {
                    寸法カット_作業費.val(Fixed(V(寸法カット_時間) * V(秒単価), 2));
                } catch (e) {
                    寸法カット_作業費.val("NaN");
                }
                寸法カット_作業費.change();
            };
            var eleList = [寸法カット_時間, 秒単価];
            BindEvent(eleList, 寸法カット_作業費計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 寸法カット_単価当り計算 = function (event, ele) {
                try {
                    if (V(寸法カット_割数) <= 0) {
                        寸法カット_単価当り.val("0.00");
                    } else {
                        寸法カット_単価当り.val(Fixed(V(寸法カット_作業費) / V(寸法カット_割数), 2));
                    }
                } catch (e) {
                    寸法カット_単価当り.val("NaN");
                }
                寸法カット_単価当り.change();
            };
            var eleList = [寸法カット_作業費, 寸法カット_割数];
            BindEvent(eleList, 寸法カット_単価当り計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 打抜_時間当たりの加工数計算 = function (event, ele) {
                try {
                    打抜_時間当たりの加工数.val(Fixed(V(打抜_型取数) * V(打抜_プレス回数), 2));
                } catch (e) {
                    打抜_時間当たりの加工数.val("NaN");
                }
                打抜_時間当たりの加工数.change();
            };
            var eleList = [打抜_型取数, 打抜_プレス回数];
            BindEvent(eleList, 打抜_時間当たりの加工数計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 打抜_単価当り計算 = function (event, ele) {
                try {
                    if (V(打抜_時間当たりの加工数) <= 0) {
                        打抜_単価当り.val("0.00");
                    } else {
                        打抜_単価当り.val(Fixed(V(時間単価) / V(打抜_時間当たりの加工数), 2));
                    }
                } catch (e) {
                    打抜_単価当り.val("NaN");
                }
                打抜_単価当り.change();
            };
            var eleList = [打抜_型取数, 打抜_プレス回数];
            BindEvent(eleList, 打抜_単価当り計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 曲げ_時間計算 = function (event, ele) {
                try {
                    曲げ_時間.val(Fixed(V(曲げ_数) * V(曲げ_秒数), 2));
                } catch (e) {
                    曲げ_時間.val("NaN");
                }
                曲げ_時間.change();
            };
            var eleList = [曲げ_数, 曲げ_秒数];
            BindEvent(eleList, 曲げ_時間計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 曲げ_作業費計算 = function (event, ele) {
                try {
                    曲げ_作業費.val(Fixed(V(曲げ_時間) * V(秒単価), 2));
                } catch (e) {
                    曲げ_作業費.val("NaN");
                }
                曲げ_作業費.change();
            };
            var eleList = [曲げ_時間, 秒単価];
            BindEvent(eleList, 曲げ_作業費計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 曲げ_単価当り計算 = function (event, ele) {
                try {
                    if (V(曲げ_同時加工) <= 0) {
                        曲げ_単価当り.val("0.00");
                    } else {
                        曲げ_単価当り.val(Fixed(V(曲げ_作業費) / V(曲げ_同時加工), 2));
                    }
                } catch (e) {
                    曲げ_単価当り.val("NaN");
                }
                曲げ_単価当り.change();
            };
            var eleList = [曲げ_作業費, 曲げ_同時加工];
            BindEvent(eleList, 曲げ_単価当り計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 仕上げ_時間計算 = function (event, ele) {
                try {
                    仕上げ_時間.val(Fixed(V(仕上げ_数) * V(仕上げ_秒数), 2));
                } catch (e) {
                    仕上げ_時間.val("NaN");
                }
                仕上げ_時間.change();
            };
            var eleList = [仕上げ_数, 仕上げ_秒数];
            BindEvent(eleList, 仕上げ_時間計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 仕上げ_作業費計算 = function (event, ele) {
                try {
                    仕上げ_作業費.val(Fixed(V(仕上げ_時間) * V(秒単価), 2));
                } catch (e) {
                    仕上げ_作業費.val("NaN");
                }
                仕上げ_作業費.change();
            };
            var eleList = [仕上げ_時間, 秒単価];
            BindEvent(eleList, 仕上げ_作業費計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 計算_裁断計算 = function (event, ele) {
                try {
                    計算_裁断.val(Fixed(V(定尺裁断_単価当り) + V(寸法カット_単価当り), 2));
                } catch (e) {
                    計算_裁断.val("NaN");
                }
                計算_裁断.change();
            };
            var eleList = [定尺裁断_単価当り, 寸法カット_単価当り];
            BindEvent(eleList, 計算_裁断計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 計算_打抜計算 = function (event, ele) {
                try {
                    計算_打抜.val(Fixed(V(打抜_単価当り), 2));
                } catch (e) {
                    計算_打抜.val("NaN");
                }
                計算_打抜.change();
            };
            var eleList = [打抜_単価当り];
            BindEvent(eleList, 計算_打抜計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            //var 計算_貼り計算 = function (event, ele) {
            //    try {
            //        計算_貼り.val(Fixed(V(貼り_単価当り), 2));
            //    } catch (e) {
            //        計算_貼り.val("NaN");
            //    }
            //};
            //var eleList = [打抜_単価当り];
            //BindEvent(eleList, 計算_貼り計算);
            //eleList[0].change();
            //autoCalculateControl = autoCalculateControl.concat(eleList);
            計算_貼り.val(0);

            var 計算_曲げ計算 = function (event, ele) {
                try {
                    計算_曲げ.val(Fixed(V(曲げ_単価当り), 2));
                } catch (e) {
                    計算_曲げ.val("NaN");
                }
                計算_曲げ.change();
            };
            var eleList = [曲げ_単価当り];
            BindEvent(eleList, 計算_曲げ計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 仕上げ_単価当り計算 = function (event, ele) {
                try {
                    if (V(仕上げ_同時加工) <= 0) {
                        仕上げ_単価当り.val("0.00");
                    } else {
                        仕上げ_単価当り.val(Fixed(V(仕上げ_作業費) / V(仕上げ_同時加工), 2));
                        計算_仕上げ.val(V(仕上げ_単価当り));
                    }
                } catch (e) {
                    仕上げ_単価当り.val("NaN");
                }
                仕上げ_単価当り.change();
            };
            var eleList = [仕上げ_作業費, 仕上げ_同時加工];
            BindEvent(eleList, 仕上げ_単価当り計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            //var 計算_仕上げ計算 = function (event, ele) {
            //    try {
            //        計算_仕上げ.val(Fixed(V(仕上げ_単価当り)), 2));
            //    } catch (e) {
            //        計算_仕上げ.val("NaN");
            //    }
            //    計算_仕上げ.change();
            //};
            //var eleList = [仕上げ_単価当り];
            //BindEvent(eleList, 計算_仕上げ計算);
            //eleList[0].change();
            //            autoCalculateControl = autoCalculateControl.concat(eleList);


            var ロス管理_材_費用計算 = function (event, ele) {
                try {
                    ロス管理_材_費用.val(Fixed(V(計算_材料費) * V(ロス管理_材比) / 100, 2));
                } catch (e) {
                    ロス管理_材_費用.val("NaN");
                }
                ロス管理_材_費用.change();
            };
            var eleList = [計算_材料費, ロス管理_材比];
            BindEvent(eleList, ロス管理_材_費用計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);


            var 計算_加工費小計計算 = function (event, ele) {
                try {
                    var v = 0;
                    v = v + V(計算_裁断);
                    v = v + V(計算_打抜);
                    v = v + V(計算_貼り);
                    v = v + V(計算_仕上げ);
                    v = v + V(計算_曲げ);
                    //v = v + V(計算_ロス管理);
                    v = Fixed(v, 2);
                    計算_加工費小計.val(v);
                } catch (e) {
                    計算_加工費小計.val("NaN");
                }
                計算_加工費小計.change();
            };
            var eleList = [定尺仕入金額, 計算_裁断, 計算_打抜, 計算_貼り, 計算_曲げ, 計算_仕上げ];
            BindEvent(eleList, 計算_加工費小計計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var ロス管理_加工_費用計算 = function (event, ele) {
                try {
                    var v1 = V(計算_加工費小計);
                    var v2 = V(ロス管理_加工比);

                    ロス管理_加工_費用.val(Fixed(v1 * v2 / 100, 2));
                } catch (e) {
                    ロス管理_加工_費用.val("NaN");
                }
                ロス管理_加工_費用.change();
            };
            var eleList = [ロス管理_加工比, 計算_加工費小計];
            BindEvent(eleList, ロス管理_加工_費用計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 計算_ロス管理計算 = function (event, ele) {
                try {
                    計算_ロス管理.val(Fixed((V(ロス管理_加工_費用) + V(ロス管理_材_費用)), 2));
                } catch (e) {
                    計算_ロス管理.val("NaN");
                }
                計算_ロス管理.change();
            };
            var eleList = [ロス管理_加工_費用, ロス管理_材_費用];
            BindEvent(eleList, 計算_ロス管理計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 計算_単価計算 = function (event, ele) {
                try {

                    var v = 0;
                    v = v + V(計算_加工費小計);
                    v = v + V(計算_ロス管理);
                    v = v + V(計算_材料費);
                    v = Fixed(v, 2);
                    計算_単価.val(v);

                } catch (e) {
                    計算_単価.val("NaN");
                }
                計算_単価.change();
            };
            var eleList = [計算_加工費小計, 計算_ロス管理, 計算_材料費];
            BindEvent(eleList, 計算_単価計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);





            var 計算_材料費比計算 = function (event, ele) {
                try {
                    if (V(計算_材料費) <= 0) {
                        計算_材料費比.val(0);
                    } else {
                        計算_材料費比.val(Fixed(V(計算_材料費) / V(計算_単価) * 100, 2));
                    }
                } catch (e) {
                    計算_材料費比.val("NaN");
                }
                計算_材料費比.change();
            };
            var eleList = [計算_単価, 計算_材料費];
            BindEvent(eleList, 計算_材料費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 計算_加工費比計算 = function (event, ele) {
                try {
                    if (V(計算_加工費小計) <= 0) {
                        計算_加工費比.val(0);
                    } else {
                        計算_加工費比.val(Fixed(V(計算_加工費小計) / V(計算_単価) * 100, 2));
                    }
                } catch (e) {
                    計算_加工費比.val("NaN");
                }
                計算_加工費比.change();
            };
            var eleList = [計算_単価, 計算_材料費];
            BindEvent(eleList, 計算_加工費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 見積_定尺裁断費比計算 = function (event, ele) {
                try {
                    if (V(仕入れ単価) <= 0) {
                        見積_定尺裁断費比.val(0);
                    } else {
                        見積_定尺裁断費比.val(Fixed(V(見積_裁断) / V(仕入れ単価) * 100, 2));
                    }
                } catch (e) {
                    見積_定尺裁断費比.val("NaN");
                }
                見積_定尺裁断費比.change();
            };
            var eleList = [仕入れ単価, 見積_裁断];
            BindEvent(eleList, 見積_定尺裁断費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 計算_定尺裁断費比計算 = function (event, ele) {
                try {
                    if (V(計算_単価) <= 0) {
                        計算_定尺裁断費比.val(0);
                    } else {
                        計算_定尺裁断費比.val(Fixed(V(定尺裁断_単価当り) / V(計算_単価) * 100, 2));
                    }
                } catch (e) {
                    計算_定尺裁断費比.val("NaN");
                }
                計算_定尺裁断費比.change();
            };
            var eleList = [計算_単価, 定尺裁断_単価当り];
            BindEvent(eleList, 計算_定尺裁断費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 計算_寸法カット費比計算 = function (event, ele) {
                try {
                    if (V(計算_単価) <= 0) {
                        計算_寸法カット費比.val(0);
                    } else {
                        計算_寸法カット費比.val(Fixed(V(寸法カット_単価当り) / V(計算_単価) * 100, 2));
                    }
                } catch (e) {
                    計算_寸法カット費比.val("NaN");
                }
                計算_寸法カット費比.change();
            };
            var eleList = [計算_単価, 寸法カット_単価当り];
            BindEvent(eleList, 計算_寸法カット費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);


            var 見積_打抜費比計算 = function (event, ele) {
                try {
                    if (V(仕入れ単価) <= 0) {
                        見積_打抜費比.val(0);
                    } else {
                        見積_打抜費比.val(Fixed(V(見積_打抜) / V(仕入れ単価) * 100, 2));
                    }
                } catch (e) {
                    見積_打抜費比.val("NaN");
                }
                見積_打抜費比.change();
            };
            var eleList = [仕入れ単価, 見積_打抜];
            BindEvent(eleList, 見積_打抜費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 計算_打抜費比計算 = function (event, ele) {
                try {
                    if (V(計算_単価) <= 0) {
                        計算_打抜費比.val(0);
                    } else {
                        計算_打抜費比.val(Fixed(V(計算_打抜) / V(計算_単価) * 100, 2));
                    }
                } catch (e) {
                    計算_打抜費比.val("NaN");
                }
                計算_打抜費比.change();
            };
            var eleList = [計算_単価, 計算_打抜];
            BindEvent(eleList, 計算_打抜費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 見積_貼り費比計算 = function (event, ele) {
                try {
                    if (V(仕入れ単価) <= 0) {
                        見積_貼り費比.val(0);
                    } else {
                        見積_貼り費比.val(Fixed(V(見積_貼り) / V(仕入れ単価) * 100, 2));
                    }
                } catch (e) {
                    見積_貼り費比.val("NaN");
                }
                見積_貼り費比.change();
            };
            var eleList = [仕入れ単価, 見積_貼り];
            BindEvent(eleList, 見積_貼り費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 計算_貼り費比計算 = function (event, ele) {
                try {
                    if (V(計算_単価) <= 0) {
                        計算_貼り費比.val(0);
                    } else {
                        計算_貼り費比.val(Fixed(V(計算_貼り) / V(計算_単価) * 100, 2));
                    }
                } catch (e) {
                    計算_貼り費比.val("NaN");
                }
                計算_貼り費比.change();
            };
            var eleList = [計算_単価, 計算_貼り];
            BindEvent(eleList, 計算_貼り費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);


            var 見積_曲げ費比計算 = function (event, ele) {
                try {
                    if (V(仕入れ単価) <= 0) {
                        見積_曲げ費比.val(0);
                    } else {
                        見積_曲げ費比.val(Fixed(V(見積_曲げ) / V(仕入れ単価) * 100, 2));
                    }
                } catch (e) {
                    見積_曲げ費比.val("NaN");
                }
                見積_曲げ費比.change();
            };
            var eleList = [仕入れ単価, 見積_曲げ];
            BindEvent(eleList, 見積_曲げ費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 計算_曲げ費比計算 = function (event, ele) {
                try {
                    if (V(計算_単価) <= 0) {
                        計算_曲げ費比.val(0);
                    } else {
                        計算_曲げ費比.val(Fixed(V(計算_曲げ) / V(計算_単価) * 100, 2));
                    }
                } catch (e) {
                    計算_曲げ費比.val("NaN");
                }
                計算_曲げ費比.change();
            };
            var eleList = [計算_単価, 計算_曲げ];
            BindEvent(eleList, 計算_曲げ費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 見積_仕上げ費比計算 = function (event, ele) {
                try {
                    if (V(仕入れ単価) <= 0) {
                        見積_仕上げ費比.val(0);
                    } else {
                        見積_仕上げ費比.val(Fixed(V(見積_仕上げ) / V(仕入れ単価) * 100, 2));
                    }
                } catch (e) {
                    見積_仕上げ費比.val("NaN");
                }
                見積_仕上げ費比.change();
            };
            var eleList = [仕入れ単価, 見積_仕上げ];
            BindEvent(eleList, 見積_仕上げ費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 計算_仕上げ費比計算 = function (event, ele) {
                try {
                    if (V(計算_単価) <= 0) {
                        計算_仕上げ費比.val(0);
                    } else {
                        計算_仕上げ費比.val(Fixed(V(計算_仕上げ) / V(計算_単価) * 100, 2));
                    }
                } catch (e) {
                    計算_仕上げ費比.val("NaN");
                }
                計算_仕上げ費比.change();
            };
            var eleList = [計算_単価, 計算_仕上げ];
            BindEvent(eleList, 計算_仕上げ費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);


            var 見積_ロス管理費比計算 = function (event, ele) {
                try {
                    if (V(仕入れ単価) <= 0) {
                        見積_ロス管理費比.val(0);
                    } else {
                        見積_ロス管理費比.val(Fixed(V(見積_ロス管理) / V(仕入れ単価) * 100, 2));
                    }
                } catch (e) {
                    見積_ロス管理費比.val("NaN");
                }
                見積_ロス管理費比.change();
            };
            var eleList = [仕入れ単価, 見積_ロス管理];
            BindEvent(eleList, 見積_ロス管理費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            var 計算_ロス管理費比計算 = function (event, ele) {
                try {
                    if (V(計算_単価) <= 0) {
                        計算_ロス管理費比.val(0);
                    } else {
                        計算_ロス管理費比.val(Fixed(V(計算_ロス管理) / V(計算_単価) * 100, 2));
                    }
                } catch (e) {
                    計算_ロス管理費比.val("NaN");
                }
                計算_ロス管理費比.change();
            };
            var eleList = [計算_単価, 計算_ロス管理];
            BindEvent(eleList, 計算_ロス管理費比計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);



            var 利益率計算 = function (event, ele) {
                try {
                    if (V(見積_単価) <= 0) {
                        利益率.val(0);
                    } else {
                        var v利益率 = V(売単価) / V(見積_単価) * 100;
                        v利益率 = v利益率 - 100;
                        利益率.val(Fixed(v利益率, 2));
                    }
                } catch (e) {
                    利益率.val("NaN");
                }
                計算_ロス管理費比.change();
            };
            var eleList = [売単価, 見積_単価];
            BindEvent(eleList, 利益率計算);

            autoCalculateControl = autoCalculateControl.concat(eleList);

            //for (var i = 0; i < autoCalculateControl.length; i++) {
            //    autoCalculateControl[i].click(function () {
            //        $("#autoCalculate").click();

            //    });
            //}

            $("#autoCalculate").click(function () {
                for (var i = 0; i < autoCalculateControl.length; i++) {
                    autoCalculateControl[i].change();
                }
            });

            $("#autoCalculate").click();


            $("#商品たてよこ逆").click(function () {
                var v商品たて = V(商品たて);
                var v商品よこ = V(商品よこ);

                商品たて.val(v商品よこ);
                商品よこ.val(v商品たて);

                商品たて.change();
                商品よこ.change();
            });


            $("#定尺仕入自動計算").click(function () {
                定尺仕入自動計算func();
            });

            var 定尺仕入自動計算func = function () {
                try {
                    var v定尺寸法縦_original = V(定尺寸法縦_original);
                    var v定尺寸法横_original = V(定尺寸法横_original);
                    var v定尺仕入金額_original = V(定尺仕入金額_original);
                    var v定尺寸法縦 = V(定尺寸法縦);
                    var v定尺寸法横 = V(定尺寸法横);
                    var v定尺仕入金額 = V(定尺仕入金額);

                    var v1 = v定尺仕入金額_original / v定尺寸法縦_original * v定尺寸法横_original;
                    var v2 = v1 * v定尺寸法縦 * v定尺寸法横 * 0.001 * 0.001;

                    定尺仕入金額.val(Fixed(v2, 2));
                } catch (e) {
                    console.log(e);
                    定尺仕入金額.val("NaN");
                }
            };

            定尺寸法縦.change(function () {
                console.log("t:" + 定尺仕入自動計算フラグ.prop("checked"));

                if (定尺仕入自動計算フラグ.prop("checked")) {
                    定尺仕入自動計算func();
                }
            });
            定尺寸法横.change(function () {
                if (定尺仕入自動計算フラグ.prop("checked")) {
                    定尺仕入自動計算func();
                }
            });



            $("#計算値コピー").click(function () {
                try {
                    見積_裁断.val(計算_裁断.val());
                    見積_打抜.val(計算_打抜.val());
                    見積_貼り.val(計算_貼り.val());
                    見積_曲げ.val(計算_曲げ.val());
                    見積_仕上げ.val(計算_仕上げ.val());
                    見積_ロス管理.val(計算_ロス管理.val());

                } catch (e) {
                    console.log(e);
                }
            });

            $("#材料費コピー").click(function () {
                try {
                    見積_材料費.val(計算_材料費.val());

                } catch (e) {
                    console.log(e);
                }
            });

            function initPriceChart() {
                var chartdata1 = {

                    "config": {
                        "width": 420,
                        "height": 230,
                        "subTitle": "",
                        "type": "bar",
                        "useVal": "yes",
                        "colorSet":
                              ["#FF9114", "#3CB000", "#00A8A2", "#0036C0", "#C328FF", "#FF34C0"],
                        "bgGradient": {
                            "direction": "vertical",
                            "from": "#687478",
                            "to": "#222222"
                        }
                    },

                    "data": [
                      ["種類", "材料", "加工", "裁断", "打抜", "貼り", "曲げ", "仕上げ", "利益"],
                      ["見積", V(見積_材料費), V(見積_加工費小計), V(見積_裁断), V(見積_打抜), V(見積_貼り), V(見積_曲げ), V(見積_仕上げ), V(見積_ロス管理)],
                      ["計算", V(計算_材料費), V(計算_加工費小計), V(計算_裁断), V(計算_打抜), V(計算_貼り), V(計算_曲げ), V(計算_仕上げ), V(計算_ロス管理)],
                    ]
                };
                ccchart.init('priceChart', chartdata1)
            };


            var eleList = [見積_材料費, 見積_加工費小計, 見積_裁断, 見積_打抜, 見積_貼り, 見積_曲げ, 見積_仕上げ, 見積_ロス管理, 計算_材料費, 計算_加工費小計, 計算_裁断, 計算_打抜, 計算_貼り, 計算_曲げ, 計算_仕上げ, 計算_ロス管理];
            BindEvent(eleList, initPriceChart);


            initPriceChart();

            $("#priceChart").click(function () {

                initPriceChart();
            });

            var element = $("#popupPriceChart");
            var title = 部品名称.val() + "    材料・加工費";
            element.dialog({
                appendTo: "#dialog_parent",
                //position: ["right", "bottom"],
                position: [900, 1900],
                title: title,
                width: 457,
                height: 310,
                open: function (event, ui) {
                    $(this).parent().children(".ui-dialog-titlebar").css("height", "20px");
                }
            });
            element.dialog("close");


            $("#openPriceChart").click(function () {
                var element = $("#popupPriceChart");
                element.dialog({
                    position: ["right", "bottom"]
                });
            });

            var openChartElement = [見積_材料費, 見積_裁断, 見積_打抜, 見積_貼り, 見積_曲げ, 見積_仕上げ, 見積_ロス管理, 計算_材料費T, 計算_材料費, 計算_裁断, 計算_打抜, 計算_貼り, 計算_曲げ, 計算_仕上げ, 計算_ロス管理];
            for (var i = 0; i < openChartElement.length; i++) {
                openChartElement[i].click(function () {
                
                    var element = $("#popupPriceChart");
                    element.dialog({
                        position: ["right", "bottom"]
                    });

                });
            }



            $("#<%=mainFormView.ClientID%>").click(function () {
                //var element = $("#popupPriceChart");
                //element.dialog({
                //    position: ["right", "bottom"],
                //});
            });

             <% } %>

        }


        function UpdateDetail() {

            for (var i = 0; i < autoCalculateControl.length; i++) {

                var num = autoCalculateControl[i].val();
                if (isNaN(num) ||
                    num == Number.POSITIVE_INFINITY ||
                    num == Number.NEGATIVE_INFINITY) {

                    autoCalculateControl[i].val("0");
                }
            }
            return true;
        }
        function InsertDetail() {
            return UpdateDetail();
        }

    </script>


</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="Main" runat="Server">


    <y:YTextBox ID="検索部品コード" DefaultValue="" Label="部品コード【-】" IsGrid="false" ValidationGroup="Search" runat="server" />
    <y:YTextBox ID="検索部品名称" DefaultValue="" Label="部品名称【-】" IsGrid="false" ValidationGroup="Search" runat="server" />

    <y:YDropDownList ID="検索材料名称" DefaultValue="" Label="材料名称" IsGrid="false" ValidationGroup="Search" runat="server" DataSourceID="検索材料名称DataSource" DataTextField="材料名称" DataValueField="材料名称" AppendDataBoundItems="true" AddEmptyItem="true" />
    <y:YDropDownList ID="検索材質大分類" DefaultValue="" Label="材質大分類" IsGrid="false" ValidationGroup="Search" runat="server" DataSourceID="検索材質大分類DataSource" DataTextField="材質大分類" DataValueField="材質大分類" AppendDataBoundItems="true" AddEmptyItem="true" />
    <y:YDropDownList ID="検索材質" DefaultValue="" Label="材質" IsGrid="false" ValidationGroup="Search" runat="server" DataSourceID="検索材質DataSource" DataTextField="材質" DataValueField="材質" AppendDataBoundItems="true" AddEmptyItem="true" />


    <y:YTextBox ID="検索作成日時開始" DefaultValue="" Label="作成日時" IsGrid="false" ValidationGroup="Search" runat="server" IsDate="true" />
    ～<y:YTextBox ID="検索作成日時終了" DefaultValue="" Label="作成日時" IsGrid="true" ValidationGroup="Search" runat="server" IsDate="true" />

    <y:YCheckBox ID="検索削除フラグ" DefaultValue="" Label="削除フラグ" IsGrid="false" ValidationGroup="Search" runat="server" />


    <y:YDropDownList ID="順序" Width="160" runat="server" Label="順序" AutoPostBack="false">
        <asp:ListItem Value="作成日時 desc,部品コード" Text="作成順" Selected="True"></asp:ListItem>
        <asp:ListItem Value="部品名称,部品コード" Text="部品名称"></asp:ListItem>
        <asp:ListItem Value="部品コード" Text="部品コード"></asp:ListItem>
    </y:YDropDownList>

    <br />
    <asp:Button runat="server" ID="検索" Text="検索" />
    <asp:Button runat="server" ID="Clear" Text="クリア" />

    <y:YDropDownList runat="server" ID="ページサイズ" />

    <y:BaseGridView CssClass="GridView" ID="mainGridView" runat="server"
        DataSourceID="mainDataSource"
        DataKeyNames="単価ID,最終更新日時" AutoGenerateColumns="false"
        AllowPaging="true"
        PageSize="12"
        AllowSorting="true"
        PagerStyle-CssClass="grid_pager">
        <Columns>
            <asp:ButtonField CommandName="ShowDetailUpdate" Text="詳細編集" ControlStyle-Width="65" />

            <asp:ButtonField ButtonType="Link" CommandName="Copy" Text="Copy" />

            <y:YBoundField HeaderText="単価ID" DataFormatStringEditing="" DataField="単価ID" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Auto numeric" />
            <y:YBoundField HeaderText="部品コード" DataFormatStringEditing="" DataField="部品コード" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
            <y:YBoundField HeaderText="部品名称" DataFormatStringEditing="" DataField="部品名称" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
            <y:YBoundField HeaderText="材料名称" DataFormatStringEditing="" DataField="材料名称" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
            <y:YBoundField HeaderText="材質大分類" DataFormatStringEditing="" DataField="材質大分類" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
            <y:YBoundField HeaderText="材質" DataFormatStringEditing="" DataField="材質" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
            <y:YBoundField HeaderText="見積_材料費" DataFormatStringEditing="{0:f2}" DataField="見積_材料費" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input numeric" />
            <y:YBoundField HeaderText="見積_加工費小計" DataFormatStringEditing="{0:f2}" DataField="見積_加工費小計" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto numeric" />
            <y:YBoundField HeaderText="見積_単価" DataFormatStringEditing="{0:f2}" DataField="見積_単価" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto numeric" />
            <y:YBoundField HeaderText="売単価" DataFormatStringEditing="{0:f2}" DataField="売単価" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" />
            <y:YBoundField HeaderText="利益率" DataFormatStringEditing="{0:f2}" DataField="利益率" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" />
            <y:YBoundField HeaderText="備考" DataFormatStringEditing="" DataField="備考" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
            <y:YBoundField HeaderText="定尺寸法縦" DataFormatStringEditing="{0:f2}" DataField="定尺寸法縦" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input numeric" />
            <y:YBoundField HeaderText="定尺寸法横" DataFormatStringEditing="{0:f2}" DataField="定尺寸法横" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input numeric" />
            <y:YBoundField HeaderText="厚み" DataFormatStringEditing="{0:f2}" DataField="厚み" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="40" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input numeric" />
            <y:YBoundField HeaderText="定尺仕入金額" DataFormatStringEditing="{0:f2}" DataField="定尺仕入金額" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input numeric" />
            <y:YBoundField HeaderText="m2あたりの材料費" DataFormatStringEditing="{0:f2}" DataField="m2あたりの材料費" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto numeric" />
            <y:YBoundField HeaderText="m2あたりの取数" DataFormatStringEditing="{0:f2}" DataField="m2あたりの取数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto numeric" />
            <y:YBoundField HeaderText="商品たて" DataFormatStringEditing="{0:f2}" DataField="商品たて" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input numeric" />
            <y:YBoundField HeaderText="商品よこ" DataFormatStringEditing="{0:f2}" DataField="商品よこ" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input numeric" />
            <y:YBoundField HeaderText="取り数" DataFormatStringEditing="{0:f2}" DataField="取り数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input numeric" />
            <y:YBoundField HeaderText="商品重量" DataFormatStringEditing="{0:f2}" DataField="商品重量" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input numeric" />
            <y:YBoundField HeaderText="削除フラグ" DataFormatStringEditing="" DataField="削除フラグ" ReadOnly="FALSE" IsBoolean="TRUE" ControlStyle-Width="40" ItemStyle-Width="40" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
            <y:YBoundField HeaderText="作成ユーザー" DataFormatStringEditing="" DataField="作成ユーザー" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" IsDropDownList="true" />
            <y:YBoundField HeaderText="最終更新ユーザー" DataFormatStringEditing="" DataField="最終更新ユーザー" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" IsDropDownList="true" />
            <y:YBoundField HeaderText="作成日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="作成日時" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Input" />
            <y:YBoundField HeaderText="最終更新日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="最終更新日時" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Input" />

        </Columns>
    </y:BaseGridView>

    <y:BaseValidationSummary ID="mainValidationSummary" runat="server" EnableClientScript="true" />

    <input type="button" value="再計算" id="autoCalculate" />
    <input type="button" value="グラフ表示" id="openPriceChart" />
    <y:BaseFormView ID="mainFormView"
        runat="server"
        DataKeyNames="単価ID,最終更新日時" DataSourceID="mainDataSource" BackColor="#DEBA84"
        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3"
        CellSpacing="2" GridLines="Both"
        AllowPaging="true">
        <EditItemTemplate>

            <asp:ValidationSummary ID="ValidationSummary3" runat="server" EnableClientScript="true" ValidationGroup="DetailUpdate" />
            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="True"
                CommandName="Update" Text="更新" ValidationGroup="DetailUpdate" OnClientClick="return UpdateDetail()" />
            &nbsp;<asp:LinkButton ID="LinkButton3" runat="server"
                CausesValidation="False" CommandName="Cancel" Text="キャンセル" />

            <table>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <table>
                                        <tr class="titleRow">
                                            <td colspan="2">基本情報</td>
                                        </tr>
                                        <y:YTextBox ID="単価ID" Label="単価ID" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("単価ID", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="部品コード" Label="部品コード" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("部品コード", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="部品名称" Label="部品名称" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("部品名称", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" TextMode="MultiLine" Rows="2" Width="100" />
                                        <y:YDropDownList ID="材料ID" Label="材料ID" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("材料ID") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="材料DataSource" DataTextField="材料名称識別テキスト" DataValueField="材料ID" AppendDataBoundItems="true" OnSelectedIndexChanged="材料ID_SelectedIndexChanged" AutoPostBack="true" Width="100" />
                                        <y:YTextBox ID="材料名称" Label="材料名称" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("材料名称", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                        <y:YTextBox ID="材質大分類" Label="材質大分類" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("材質大分類", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                        <y:YTextBox ID="材質" Label="材質" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("材質", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                        <y:YTextBox ID="定尺寸法縦_original" Label="定尺寸法縦【mm】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺寸法縦_original", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺寸法横_original" Label="定尺寸法横【mm】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺寸法横_original", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺仕入金額_original" Label="定尺仕入金額【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺仕入金額_original", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:Button runat="server" ID="定尺情報設定" OnClick="定尺情報設定_Click" Text="定尺情報設定" /></td>
                                        </tr>
                                        <y:YTextBox ID="定尺寸法縦" Label="定尺寸法縦【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺寸法縦", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺寸法横" Label="定尺寸法横【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺寸法横", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="厚み" Label="厚み【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("厚み", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺仕入金額" Label="定尺仕入金額【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺仕入金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YCheckBox ID="定尺仕入自動計算フラグ" Label="定尺仕入自動計算" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Checked='<%# ConvertToBoolean(Eval("定尺仕入自動計算フラグ")) %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="40" />
                                        <tr class="blankrow">
                                            <td></td>
                                            <td class="Input" colspan="2">
                                                <input type="button" id="定尺仕入自動計算" value="定尺仕入自動計算" />
                                        </tr>
                                        <y:YTextBox ID="定尺売り金額" Label="定尺売り金額【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺売り金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="時間単価" Label="時間単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("時間単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="分単価" Label="分単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("分単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="秒単価" Label="秒単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("秒単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">m2あたりの材料</td>
                                        </tr>
                                        <y:YTextBox ID="m2あたりの材料費" Label="材料費【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("m2あたりの材料費", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="m2あたりの取数たて" Label="取数たて【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("m2あたりの取数たて", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="m2あたりの取数よこ" Label="取数よこ【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("m2あたりの取数よこ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="m2あたりの取数" Label="取数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("m2あたりの取数", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <y:YTextBox ID="仕入れ単価" Label="仕入れ単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("仕入れ単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="商品たて" Label="商品たて【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("商品たて", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="商品よこ" Label="商品よこ【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("商品よこ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="blankrow">
                                            <td></td>
                                            <td>
                                                <input type="button" id="商品たてよこ逆" value="入れ替え" /></td>
                                        </tr>
                                        <tr class="blankrow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="たてしろ" Label="たてしろ【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("たてしろ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="よこしろ" Label="よこしろ【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("よこしろ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">見積</td>
                                        </tr>
                                        <tr class="blankrow">
                                            <td></td>
                                        </tr>
                                        <y:YTextBox ID="取り数" Label="取り数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("取り数", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_材料費" Label="材料費【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_材料費", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_m2あたり材料費" Label="m2あたり材料費【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_m2あたり材料費", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_裁断" Label="裁断【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_裁断", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_打抜" Label="打抜【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_打抜", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_貼り" Label="貼り【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_貼り", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_曲げ" Label="曲げ【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_曲げ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_仕上げ" Label="仕上げ【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_仕上げ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_ロス管理" Label="ロス管理【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_ロス管理", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_材料費比" Label="材料費比【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_材料費比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_加工費小計" Label="加工費小計【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_加工費小計", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_加工費比" Label="加工費比【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_加工費比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_単価" Label="単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="売単価" Label="売単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("売単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="利益率" Label="利益率【%】" IsGrid="false" ReadOnly="false" ValidationGroup="DetailUpdate" Text='<%# Bind("利益率", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />

                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <tr class="blankrow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="たて_しろあり" Label="抜きたて【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("たて_しろあり", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="よこ_しろあり" Label="抜きよこ【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("よこ_しろあり", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="縦取り数" Label="縦取り数【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("縦取り数", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="横取り数" Label="横取り数【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("横取り数", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="たて余" Label="たて余【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("たて余", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="よこ余" Label="よこ余【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("よこ余", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">計算</td>
                                        </tr>
                                        <y:YTextBox ID="計算_取り数" Label="取り数【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_取り数", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_材料費T" Label="材料費T【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_材料費T", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_材料費" Label="材料費【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_材料費", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="blankrow">
                                            <td></td>
                                            <td>
                                                <input type="button" id="材料費コピー" value="材料費コピー" /></td>
                                        </tr>
                                        <y:YTextBox ID="計算_裁断" Label="裁断【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_裁断", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_打抜" Label="打抜【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_打抜", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_貼り" Label="貼り【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_貼り", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_曲げ" Label="曲げ【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_曲げ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_仕上げ" Label="仕上げ【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_仕上げ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_ロス管理" Label="ロス管理【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_ロス管理", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_材料費比" Label="材料費比【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_材料費比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_加工費小計" Label="加工費小計【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_加工費小計", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_加工費比" Label="加工費比【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_加工費比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_単価" Label="単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="blankrow">
                                            <td></td>
                                            <td>
                                                <input type="button" id="計算値コピー" value="見積←計算"></td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <tr class="titleRow">
                                            <td colspan="2">定尺裁断</td>
                                        </tr>
                                        <y:YTextBox ID="定尺裁断_数" Label="数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺裁断_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺裁断_所要時間" Label="所要時間【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺裁断_所要時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺裁断_割数" Label="割数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺裁断_割数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">寸法カット</td>
                                        </tr>
                                        <y:YTextBox ID="寸法カット_数" Label="数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("寸法カット_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="寸法カット_所要時間" Label="所要時間【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("寸法カット_所要時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="寸法カット_割数" Label="割数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("寸法カット_割数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">打抜</td>
                                        </tr>
                                        <y:YTextBox ID="打抜_型取数" Label="型取数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("打抜_型取数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="打抜_プレス回数" Label="プレス回数【回/時】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("打抜_プレス回数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">曲げ</td>
                                        </tr>
                                        <y:YTextBox ID="曲げ_数" Label="数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("曲げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="曲げ_秒数" Label="秒数【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("曲げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="曲げ_同時加工" Label="同時加工【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("曲げ_同時加工", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">仕上げ</td>
                                        </tr>
                                        <y:YTextBox ID="仕上げ_数" Label="数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("仕上げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="仕上げ_秒数" Label="秒数【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("仕上げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="仕上げ_同時加工" Label="同時加工【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("仕上げ_同時加工", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">ロス管理</td>
                                        </tr>
                                        <y:YTextBox ID="ロス管理_材比" Label="材比【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("ロス管理_材比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="ロス管理_加工比" Label="加工比【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("ロス管理_加工比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="定尺裁断_時間" Label="時間【秒】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺裁断_時間", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="定尺裁断_作業費" Label="作業費【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺裁断_作業費", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="定尺裁断_単価当り" Label="単価当り【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺裁断_単価当り", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="寸法カット_時間" Label="時間【秒】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("寸法カット_時間", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="寸法カット_作業費" Label="作業費【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("寸法カット_作業費", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="寸法カット_単価当り" Label="単価当り【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("寸法カット_単価当り", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="打抜_時間当たりの加工数" Label="加工数/時間【ヶ】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("打抜_時間当たりの加工数", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="打抜_単価当り" Label="単価当り【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("打抜_単価当り", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="曲げ_時間" Label="時間【秒】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("曲げ_時間", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="曲げ_作業費" Label="作業費【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("曲げ_作業費", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="曲げ_単価当り" Label="単価当り【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("曲げ_単価当り", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="仕上げ_時間" Label="時間【秒】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("仕上げ_時間", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="仕上げ_作業費" Label="作業費【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("仕上げ_作業費", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="仕上げ_単価当り" Label="単価当り【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("仕上げ_単価当り", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="ロス管理_材_費用" Label="材_費用【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("ロス管理_材_費用", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="ロス管理_加工_費用" Label="加工_費用【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("ロス管理_加工_費用", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                    </table>
                                </td>
                                <td id="Td1" runat="server" visible="false">
                                    <table>
                                        <y:YTextBox ID="見積_定尺裁断費比" Label="見積_定尺裁断費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_定尺裁断費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_定尺裁断費比" Label="計算_定尺裁断費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_定尺裁断費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_寸法カット費比" Label="計算_寸法カット費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_寸法カット費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="blankrow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr class="blankrow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr class="blankrow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="見積_打抜費比" Label="見積_打抜費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_打抜費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_打抜費比" Label="計算_打抜費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_打抜費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_貼り費比" Label="見積_貼り費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_貼り費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_貼り費比" Label="計算_貼り費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_貼り費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_曲げ費比" Label="見積_曲げ費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_曲げ費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_曲げ費比" Label="計算_曲げ費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_曲げ費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_仕上げ費比" Label="見積_仕上げ費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_仕上げ費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_仕上げ費比" Label="計算_仕上げ費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_仕上げ費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_ロス管理費比" Label="見積_ロス管理費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_ロス管理費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_ロス管理費比" Label="計算_ロス管理費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_ロス管理費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <y:YTextBox ID="ロット" Label="ロット【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("ロット", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="丸め数" Label="丸め数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("丸め数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="商品重量" Label="商品重量【g】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("商品重量", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />


                                        <y:YLinkList ID="図面リスト" Dir='<%# ConfigurationManager.AppSettings.Get("BASE_DIR") + "/tanka/" + Eval("単価ID") %>' IsGrid="false" runat="server" />
                                        <y:YFileUpload runat="server" Label="図面ファイル" ID="図面ファイル" />

                                        <y:YLinkList ID="参考資料リスト" Dir='<%# ConfigurationManager.AppSettings.Get("BASE_DIR") + "/tanka/" + Eval("単価ID") + "/参考資料/" %>' IsGrid="false" runat="server" />
                                        <y:YFileUpload runat="server" Label="参考資料" ID="参考資料" />
                                        <y:YTextBox ID="備考" Label="備考" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("備考", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" TextMode="MultiLine" Rows="10" Width="300" />

                                        <y:YCheckBox ID="削除フラグ" Label="削除フラグ" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="40" />
                                        <y:YDropDownList ID="作成ユーザー" Label="作成ユーザー" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("作成ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                                        <y:YDropDownList ID="最終更新ユーザー" Label="最終更新ユーザー" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("最終更新ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                                        <y:YTextBox ID="作成日時" Label="作成日時" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                        <y:YTextBox ID="最終更新日時" Label="最終更新日時" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>



            <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true" ValidationGroup="DetailUpdate" />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True"
                CommandName="Update" Text="更新" ValidationGroup="DetailUpdate" OnClientClick="return UpdateDetail()" />
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
                            <tr>
                                <td>
                                    <table>
                                        <tr class="titleRow">
                                            <td colspan="2">基本情報</td>
                                        </tr>
                                        <y:YTextBox ID="単価ID" DefaultValue="" Label="単価ID" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("単価ID", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="部品コード" DefaultValue="" Label="部品コード" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("部品コード", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="部品名称" DefaultValue="" Label="部品名称" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("部品名称", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" TextMode="MultiLine" Rows="2" Width="100" />
                                        <y:YDropDownList ID="材料ID" DefaultValue="" Label="材料ID" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" SelectedValue='<%# Bind("材料ID") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="材料DataSource" DataTextField="材料名称識別テキスト" DataValueField="材料ID" AppendDataBoundItems="true" OnSelectedIndexChanged="材料ID_SelectedIndexChanged" AutoPostBack="true" Width="100" />
                                        <y:YTextBox ID="材料名称" DefaultValue="" Label="材料名称" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("材料名称", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                        <y:YTextBox ID="材質大分類" DefaultValue="" Label="材質大分類" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("材質大分類", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                        <y:YTextBox ID="材質" DefaultValue="" Label="材質" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("材質", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                        <y:YTextBox ID="定尺寸法縦_original" DefaultValue="" Label="定尺寸法縦【mm】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("定尺寸法縦_original", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺寸法横_original" DefaultValue="" Label="定尺寸法横【mm】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("定尺寸法横_original", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺仕入金額_original" DefaultValue="" Label="定尺仕入金額【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("定尺仕入金額_original", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:Button runat="server" ID="定尺情報設定" OnClick="定尺情報設定_Click" Text="定尺情報設定" /></td>
                                        </tr>
                                        <y:YTextBox ID="定尺寸法縦" DefaultValue="" Label="定尺寸法縦【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("定尺寸法縦", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺寸法横" DefaultValue="" Label="定尺寸法横【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("定尺寸法横", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="厚み" DefaultValue="" Label="厚み【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("厚み", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺仕入金額" DefaultValue="" Label="定尺仕入金額【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("定尺仕入金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YCheckBox ID="定尺仕入自動計算フラグ" DefaultValue="" Label="定尺仕入自動計算" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Checked='<%# ConvertToBoolean(Eval("定尺仕入自動計算フラグ")) %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="40" />
                                        <tr class="blankrow">
                                            <td></td>
                                            <td class="Input" colspan="2">
                                                <input type="button" id="定尺仕入自動計算" value="定尺仕入自動計算" />
                                        </tr>
                                        <y:YTextBox ID="定尺売り金額" DefaultValue="" Label="定尺売り金額【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("定尺売り金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="時間単価" DefaultValue="" Label="時間単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("時間単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="分単価" DefaultValue="" Label="分単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("分単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="秒単価" DefaultValue="" Label="秒単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("秒単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">m2あたりの材料</td>
                                        </tr>
                                        <y:YTextBox ID="m2あたりの材料費" DefaultValue="" Label="材料費【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("m2あたりの材料費", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="m2あたりの取数たて" DefaultValue="" Label="取数たて【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("m2あたりの取数たて", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="m2あたりの取数よこ" DefaultValue="" Label="取数よこ【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("m2あたりの取数よこ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="m2あたりの取数" DefaultValue="" Label="取数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("m2あたりの取数", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <y:YTextBox ID="仕入れ単価" DefaultValue="" Label="仕入れ単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("仕入れ単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="商品たて" DefaultValue="" Label="商品たて【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("商品たて", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="商品よこ" DefaultValue="" Label="商品よこ【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("商品よこ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="blankrow">
                                            <td></td>
                                            <td>
                                                <input type="button" id="商品たてよこ逆" value="入れ替え" /></td>
                                        </tr>
                                        <tr class="blankrow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="たてしろ" DefaultValue="" Label="たてしろ【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("たてしろ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="よこしろ" DefaultValue="" Label="よこしろ【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("よこしろ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">見積</td>
                                        </tr>
                                        <tr class="blankrow">
                                            <td></td>
                                        </tr>
                                        <y:YTextBox ID="取り数" DefaultValue="" Label="取り数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("取り数", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_材料費" DefaultValue="" Label="材料費【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_材料費", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_m2あたり材料費" DefaultValue="" Label="m2あたり材料費【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_m2あたり材料費", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_裁断" DefaultValue="" Label="裁断【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_裁断", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_打抜" DefaultValue="" Label="打抜【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_打抜", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_貼り" DefaultValue="" Label="貼り【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_貼り", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_曲げ" DefaultValue="" Label="曲げ【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_曲げ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_仕上げ" DefaultValue="" Label="仕上げ【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_仕上げ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_ロス管理" DefaultValue="" Label="ロス管理【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_ロス管理", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_材料費比" DefaultValue="" Label="材料費比【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_材料費比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_加工費小計" DefaultValue="" Label="加工費小計【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_加工費小計", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_加工費比" DefaultValue="" Label="加工費比【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_加工費比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_単価" DefaultValue="" Label="単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="売単価" DefaultValue="" Label="売単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("売単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="利益率" DefaultValue="" Label="利益率【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("利益率", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />

                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <tr class="blankrow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="たて_しろあり" DefaultValue="" Label="抜きたて【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("たて_しろあり", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="よこ_しろあり" DefaultValue="" Label="抜きよこ【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("よこ_しろあり", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="縦取り数" DefaultValue="" Label="縦取り数【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("縦取り数", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="横取り数" DefaultValue="" Label="横取り数【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("横取り数", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="たて余" DefaultValue="" Label="たて余【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("たて余", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="よこ余" DefaultValue="" Label="よこ余【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("よこ余", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">計算</td>
                                        </tr>
                                        <y:YTextBox ID="計算_取り数" DefaultValue="" Label="取り数【mm】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_取り数", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_材料費T" DefaultValue="" Label="材料費T【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_材料費T", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_材料費" DefaultValue="" Label="材料費【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_材料費", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="blankrow">
                                            <td></td>
                                            <td>
                                                <input type="button" id="材料費コピー" value="材料費コピー" /></td>
                                        </tr>
                                        <y:YTextBox ID="計算_裁断" DefaultValue="" Label="裁断【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_裁断", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_打抜" DefaultValue="" Label="打抜【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_打抜", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_貼り" DefaultValue="" Label="貼り【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_貼り", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_曲げ" DefaultValue="" Label="曲げ【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_曲げ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_仕上げ" DefaultValue="" Label="仕上げ【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_仕上げ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_ロス管理" DefaultValue="" Label="ロス管理【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_ロス管理", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_材料費比" DefaultValue="" Label="材料費比【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_材料費比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_加工費小計" DefaultValue="" Label="加工費小計【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_加工費小計", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_加工費比" DefaultValue="" Label="加工費比【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_加工費比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_単価" DefaultValue="" Label="単価【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="blankrow">
                                            <td></td>
                                            <td>
                                                <input type="button" id="計算値コピー" value="見積←計算"></td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <tr class="titleRow">
                                            <td colspan="2">定尺裁断</td>
                                        </tr>
                                        <y:YTextBox ID="定尺裁断_数" DefaultValue="" Label="数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("定尺裁断_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺裁断_所要時間" DefaultValue="" Label="所要時間【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("定尺裁断_所要時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺裁断_割数" DefaultValue="" Label="割数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("定尺裁断_割数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">寸法カット</td>
                                        </tr>
                                        <y:YTextBox ID="寸法カット_数" DefaultValue="" Label="数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("寸法カット_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="寸法カット_所要時間" DefaultValue="" Label="所要時間【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("寸法カット_所要時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="寸法カット_割数" DefaultValue="" Label="割数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("寸法カット_割数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">打抜</td>
                                        </tr>
                                        <y:YTextBox ID="打抜_型取数" DefaultValue="" Label="型取数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("打抜_型取数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="打抜_プレス回数" DefaultValue="" Label="プレス回数【回/時】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("打抜_プレス回数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">曲げ</td>
                                        </tr>
                                        <y:YTextBox ID="曲げ_数" DefaultValue="" Label="数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("曲げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="曲げ_秒数" DefaultValue="" Label="秒数【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("曲げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="曲げ_同時加工" DefaultValue="" Label="同時加工【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("曲げ_同時加工", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">仕上げ</td>
                                        </tr>
                                        <y:YTextBox ID="仕上げ_数" DefaultValue="" Label="数【個所】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("仕上げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="仕上げ_秒数" DefaultValue="" Label="秒数【秒】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("仕上げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="仕上げ_同時加工" DefaultValue="" Label="同時加工【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("仕上げ_同時加工", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">ロス管理</td>
                                        </tr>
                                        <y:YTextBox ID="ロス管理_材比" DefaultValue="" Label="材比【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("ロス管理_材比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="ロス管理_加工比" DefaultValue="" Label="加工比【%】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("ロス管理_加工比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="定尺裁断_時間" DefaultValue="" Label="時間【秒】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("定尺裁断_時間", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="定尺裁断_作業費" DefaultValue="" Label="作業費【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("定尺裁断_作業費", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="定尺裁断_単価当り" DefaultValue="" Label="単価当り【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("定尺裁断_単価当り", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="寸法カット_時間" DefaultValue="" Label="時間【秒】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("寸法カット_時間", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="寸法カット_作業費" DefaultValue="" Label="作業費【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("寸法カット_作業費", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="寸法カット_単価当り" DefaultValue="" Label="単価当り【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("寸法カット_単価当り", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="打抜_時間当たりの加工数" DefaultValue="" Label="加工数/時間【ヶ】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("打抜_時間当たりの加工数", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="打抜_単価当り" DefaultValue="" Label="単価当り【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("打抜_単価当り", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="曲げ_時間" DefaultValue="" Label="時間【秒】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("曲げ_時間", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="曲げ_作業費" DefaultValue="" Label="作業費【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("曲げ_作業費", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="曲げ_単価当り" DefaultValue="" Label="単価当り【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("曲げ_単価当り", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="仕上げ_時間" DefaultValue="" Label="時間【秒】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("仕上げ_時間", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="仕上げ_作業費" DefaultValue="" Label="作業費【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("仕上げ_作業費", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="仕上げ_単価当り" DefaultValue="" Label="単価当り【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("仕上げ_単価当り", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="ロス管理_材_費用" DefaultValue="" Label="材_費用【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("ロス管理_材_費用", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="ロス管理_加工_費用" DefaultValue="" Label="加工_費用【\】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("ロス管理_加工_費用", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                    </table>
                                </td>
                                <td id="Td1" runat="server" visible="false">
                                    <table>
                                        <y:YTextBox ID="見積_定尺裁断費比" DefaultValue="" Label="見積_定尺裁断費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_定尺裁断費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_定尺裁断費比" DefaultValue="" Label="計算_定尺裁断費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_定尺裁断費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_寸法カット費比" DefaultValue="" Label="計算_寸法カット費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_寸法カット費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="blankrow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr class="blankrow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr class="blankrow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="見積_打抜費比" DefaultValue="" Label="見積_打抜費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_打抜費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_打抜費比" DefaultValue="" Label="計算_打抜費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_打抜費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_貼り費比" DefaultValue="" Label="見積_貼り費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_貼り費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_貼り費比" DefaultValue="" Label="計算_貼り費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_貼り費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_曲げ費比" DefaultValue="" Label="見積_曲げ費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_曲げ費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_曲げ費比" DefaultValue="" Label="計算_曲げ費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_曲げ費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_仕上げ費比" DefaultValue="" Label="見積_仕上げ費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_仕上げ費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_仕上げ費比" DefaultValue="" Label="計算_仕上げ費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_仕上げ費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_ロス管理費比" DefaultValue="" Label="見積_ロス管理費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_ロス管理費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_ロス管理費比" DefaultValue="" Label="計算_ロス管理費比【%】" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_ロス管理費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <y:YTextBox ID="ロット" DefaultValue="" Label="ロット【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("ロット", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="丸め数" DefaultValue="" Label="丸め数【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("丸め数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="商品重量" DefaultValue="" Label="商品重量【g】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("商品重量", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />

                                        <y:YFileUpload runat="server" Label="図面ファイル" ID="図面ファイル" />

                                        <y:YFileUpload runat="server" Label="参考資料" ID="参考資料" />
                                        <y:YTextBox ID="備考" DefaultValue="" Label="備考" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("備考", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" TextMode="MultiLine" Rows="10" Width="300" />

                                        <y:YCheckBox ID="削除フラグ" DefaultValue="" Label="削除フラグ" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="40" />
                                        <y:YDropDownList ID="作成ユーザー" DefaultValue="" Label="作成ユーザー" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" SelectedValue='<%# Bind("作成ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                                        <y:YDropDownList ID="最終更新ユーザー" DefaultValue="" Label="最終更新ユーザー" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" SelectedValue='<%# Bind("最終更新ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                                        <y:YTextBox ID="作成日時" DefaultValue="" Label="作成日時" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                        <y:YTextBox ID="最終更新日時" DefaultValue="" Label="最終更新日時" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>


            <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true" ValidationGroup="DetailInsert" />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                CommandName="Insert" Text="挿入" ValidationGroup="DetailInsert" OnClientClick="return InsertDetail()" />
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
                                        <tr class="titleRow">
                                            <td colspan="2">基本情報</td>
                                        </tr>
                                        <y:YTextBox ID="単価ID" Label="単価ID" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("単価ID", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="部品コード" Label="部品コード" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("部品コード", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="部品名称" Label="部品名称" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("部品名称", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" TextMode="MultiLine" Rows="2" Width="100" />
                                        <y:YDropDownList ID="材料ID" Label="材料ID" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("材料ID") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="材料DataSource" DataTextField="材料名称識別テキスト" DataValueField="材料ID" AppendDataBoundItems="true" OnSelectedIndexChanged="材料ID_SelectedIndexChanged" AutoPostBack="true" Width="100" />
                                        <y:YTextBox ID="材料名称" Label="材料名称" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材料名称", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                        <y:YTextBox ID="材質大分類" Label="材質大分類" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材質大分類", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                        <y:YTextBox ID="材質" Label="材質" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材質", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                        <y:YTextBox ID="定尺寸法縦_original" Label="定尺寸法縦【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺寸法縦_original", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺寸法横_original" Label="定尺寸法横【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺寸法横_original", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺仕入金額_original" Label="定尺仕入金額【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺仕入金額_original", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:Button runat="server" ID="定尺情報設定" OnClick="定尺情報設定_Click" Text="定尺情報設定" /></td>
                                        </tr>
                                        <y:YTextBox ID="定尺寸法縦" Label="定尺寸法縦【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺寸法縦", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺寸法横" Label="定尺寸法横【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺寸法横", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="厚み" Label="厚み【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("厚み", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺仕入金額" Label="定尺仕入金額【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺仕入金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YCheckBox ID="定尺仕入自動計算フラグ" Label="定尺仕入自動計算" IsGrid="false" ReadOnly="TRUE" Checked='<%# ConvertToBoolean(Eval("定尺仕入自動計算フラグ")) %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="40" />
                                        <tr class="blankrow">
                                            <td></td>
                                            <td class="Input" colspan="2">
                                                <input type="button" id="定尺仕入自動計算" value="定尺仕入自動計算" />
                                        </tr>
                                        <y:YTextBox ID="定尺売り金額" Label="定尺売り金額【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺売り金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="時間単価" Label="時間単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("時間単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="分単価" Label="分単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("分単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="秒単価" Label="秒単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("秒単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">m2あたりの材料</td>
                                        </tr>
                                        <y:YTextBox ID="m2あたりの材料費" Label="材料費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("m2あたりの材料費", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="m2あたりの取数たて" Label="取数たて【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("m2あたりの取数たて", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="m2あたりの取数よこ" Label="取数よこ【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("m2あたりの取数よこ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="m2あたりの取数" Label="取数【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("m2あたりの取数", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <y:YTextBox ID="仕入れ単価" Label="仕入れ単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕入れ単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="商品たて" Label="商品たて【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("商品たて", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="商品よこ" Label="商品よこ【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("商品よこ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="blankrow">
                                            <td></td>
                                            <td>
                                                <input type="button" id="商品たてよこ逆" value="入れ替え" /></td>
                                        </tr>
                                        <tr class="blankrow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="たてしろ" Label="たてしろ【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("たてしろ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="よこしろ" Label="よこしろ【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("よこしろ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">見積</td>
                                        </tr>
                                        <tr class="blankrow">
                                            <td></td>
                                        </tr>
                                        <y:YTextBox ID="取り数" Label="取り数【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("取り数", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_材料費" Label="材料費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_材料費", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_m2あたり材料費" Label="m2あたり材料費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_m2あたり材料費", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_裁断" Label="裁断【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_裁断", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_打抜" Label="打抜【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_打抜", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_貼り" Label="貼り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_貼り", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_曲げ" Label="曲げ【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_曲げ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_仕上げ" Label="仕上げ【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_仕上げ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_ロス管理" Label="ロス管理【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_ロス管理", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="見積_材料費比" Label="材料費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_材料費比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_加工費小計" Label="加工費小計【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_加工費小計", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_加工費比" Label="加工費比【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_加工費比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_単価" Label="単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="売単価" Label="売単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("売単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="利益率" Label="利益率【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("利益率", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />

                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <tr class="blankrow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="たて_しろあり" Label="抜きたて【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("たて_しろあり", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="よこ_しろあり" Label="抜きよこ【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("よこ_しろあり", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="縦取り数" Label="縦取り数【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("縦取り数", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="横取り数" Label="横取り数【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("横取り数", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="たて余" Label="たて余【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("たて余", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="よこ余" Label="よこ余【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("よこ余", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">計算</td>
                                        </tr>
                                        <y:YTextBox ID="計算_取り数" Label="取り数【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_取り数", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_材料費T" Label="材料費T【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_材料費T", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_材料費" Label="材料費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_材料費", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="blankrow">
                                            <td></td>
                                            <td>
                                                <input type="button" id="材料費コピー" value="材料費コピー" /></td>
                                        </tr>
                                        <y:YTextBox ID="計算_裁断" Label="裁断【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_裁断", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_打抜" Label="打抜【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_打抜", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_貼り" Label="貼り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_貼り", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_曲げ" Label="曲げ【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_曲げ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_仕上げ" Label="仕上げ【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_仕上げ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_ロス管理" Label="ロス管理【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_ロス管理", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_材料費比" Label="材料費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_材料費比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_加工費小計" Label="加工費小計【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_加工費小計", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_加工費比" Label="加工費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_加工費比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_単価" Label="単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="blankrow">
                                            <td></td>
                                            <td>
                                                <input type="button" id="計算値コピー" value="見積←計算"></td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <tr class="titleRow">
                                            <td colspan="2">定尺裁断</td>
                                        </tr>
                                        <y:YTextBox ID="定尺裁断_数" Label="数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺裁断_所要時間" Label="所要時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_所要時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="定尺裁断_割数" Label="割数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_割数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">寸法カット</td>
                                        </tr>
                                        <y:YTextBox ID="寸法カット_数" Label="数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="寸法カット_所要時間" Label="所要時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_所要時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="寸法カット_割数" Label="割数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_割数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">打抜</td>
                                        </tr>
                                        <y:YTextBox ID="打抜_型取数" Label="型取数【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("打抜_型取数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="打抜_プレス回数" Label="プレス回数【回/時】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("打抜_プレス回数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">曲げ</td>
                                        </tr>
                                        <y:YTextBox ID="曲げ_数" Label="数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="曲げ_秒数" Label="秒数【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="曲げ_同時加工" Label="同時加工【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_同時加工", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">仕上げ</td>
                                        </tr>
                                        <y:YTextBox ID="仕上げ_数" Label="数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="仕上げ_秒数" Label="秒数【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="仕上げ_同時加工" Label="同時加工【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_同時加工", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2">ロス管理</td>
                                        </tr>
                                        <y:YTextBox ID="ロス管理_材比" Label="材比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロス管理_材比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="ロス管理_加工比" Label="加工比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロス管理_加工比", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="定尺裁断_時間" Label="時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_時間", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="定尺裁断_作業費" Label="作業費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_作業費", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="定尺裁断_単価当り" Label="単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_単価当り", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="寸法カット_時間" Label="時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_時間", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="寸法カット_作業費" Label="作業費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_作業費", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="寸法カット_単価当り" Label="単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_単価当り", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="打抜_時間当たりの加工数" Label="加工数/時間【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("打抜_時間当たりの加工数", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="打抜_単価当り" Label="単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("打抜_単価当り", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="曲げ_時間" Label="時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_時間", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="曲げ_作業費" Label="作業費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_作業費", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="曲げ_単価当り" Label="単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_単価当り", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="仕上げ_時間" Label="時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_時間", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="仕上げ_作業費" Label="作業費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_作業費", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="仕上げ_単価当り" Label="単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_単価当り", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="titleRow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="ロス管理_材_費用" Label="材_費用【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロス管理_材_費用", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="ロス管理_加工_費用" Label="加工_費用【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロス管理_加工_費用", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                    </table>
                                </td>
                                <td id="Td2" runat="server" visible="false">
                                    <table>
                                        <y:YTextBox ID="見積_定尺裁断費比" Label="見積_定尺裁断費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_定尺裁断費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_定尺裁断費比" Label="計算_定尺裁断費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_定尺裁断費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_寸法カット費比" Label="計算_寸法カット費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_寸法カット費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <tr class="blankrow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr class="blankrow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr class="blankrow">
                                            <td colspan="2"></td>
                                        </tr>
                                        <y:YTextBox ID="見積_打抜費比" Label="見積_打抜費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_打抜費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_打抜費比" Label="計算_打抜費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_打抜費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_貼り費比" Label="見積_貼り費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_貼り費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_貼り費比" Label="計算_貼り費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_貼り費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_曲げ費比" Label="見積_曲げ費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_曲げ費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_曲げ費比" Label="計算_曲げ費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_曲げ費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_仕上げ費比" Label="見積_仕上げ費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_仕上げ費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_仕上げ費比" Label="計算_仕上げ費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_仕上げ費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="見積_ロス管理費比" Label="見積_ロス管理費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_ロス管理費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                        <y:YTextBox ID="計算_ロス管理費比" Label="計算_ロス管理費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_ロス管理費比", "{0:f2}") %>' IsRequired="FALSE" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Auto" Width="65" />
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <y:YTextBox ID="ロット" Label="ロット【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロット", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="丸め数" Label="丸め数【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("丸め数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                                        <y:YTextBox ID="商品重量" Label="商品重量【g】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("商品重量", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:f2}" IsInteger="true" runat="server" CssClass="Input" Width="65" />

                                        <y:YLinkList ID="図面リスト" Dir='<%# ConfigurationManager.AppSettings.Get("BASE_DIR") + "/tanka/" + Eval("単価ID") %>' IsGrid="false" runat="server" />
                                        <y:YLinkList ID="参考資料リスト" Dir='<%# ConfigurationManager.AppSettings.Get("BASE_DIR") + "/tanka/" + Eval("単価ID") + "/参考資料/" %>' IsGrid="false" runat="server" />

                                        <y:YTextBox ID="備考" Label="備考" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("備考", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" TextMode="MultiLine" Rows="10" Width="300" />
                                        <y:YCheckBox ID="削除フラグ" Label="削除フラグ" IsGrid="false" ReadOnly="TRUE" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="40" />
                                        <y:YDropDownList ID="作成ユーザー" Label="作成ユーザー" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("作成ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                                        <y:YDropDownList ID="最終更新ユーザー" Label="最終更新ユーザー" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("最終更新ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                                        <y:YTextBox ID="作成日時" Label="作成日時" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                        <y:YTextBox ID="最終更新日時" Label="最終更新日時" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Input" Width="100" />
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
                部品コード = @部品コード,部品名称 = @部品名称,材料ID = @材料ID,材料名称 = @材料名称,材質大分類 = @材質大分類,材質 = @材質,定尺寸法縦_original = @定尺寸法縦_original,定尺寸法横_original = @定尺寸法横_original,定尺仕入金額_original = @定尺仕入金額_original,定尺寸法縦 = @定尺寸法縦,定尺寸法横 = @定尺寸法横,厚み = @厚み,定尺仕入金額 = @定尺仕入金額,定尺仕入自動計算フラグ = @定尺仕入自動計算フラグ,定尺売り金額 = @定尺売り金額,時間単価 = @時間単価,分単価 = @分単価,秒単価 = @秒単価,m2あたりの材料費 = @m2あたりの材料費,m2あたりの取数たて = @m2あたりの取数たて,m2あたりの取数よこ = @m2あたりの取数よこ,m2あたりの取数 = @m2あたりの取数,仕入れ単価 = @仕入れ単価,商品たて = @商品たて,商品よこ = @商品よこ,たてしろ = @たてしろ,よこしろ = @よこしろ,取り数 = @取り数,見積_材料費 = @見積_材料費,見積_裁断 = @見積_裁断,見積_打抜 = @見積_打抜,見積_貼り = @見積_貼り,見積_曲げ = @見積_曲げ,見積_仕上げ = @見積_仕上げ,見積_ロス管理 = @見積_ロス管理,見積_材料費比 = @見積_材料費比,見積_加工費小計 = @見積_加工費小計,見積_加工費比 = @見積_加工費比,見積_単価 = @見積_単価,見積_m2あたり材料費 = @見積_m2あたり材料費,たて_しろあり = @たて_しろあり,よこ_しろあり = @よこ_しろあり,縦取り数 = @縦取り数,横取り数 = @横取り数,たて余 = @たて余,よこ余 = @よこ余,計算_取り数 = @計算_取り数,計算_材料費T = @計算_材料費T,計算_材料費 = @計算_材料費,計算_裁断 = @計算_裁断,計算_打抜 = @計算_打抜,計算_貼り = @計算_貼り,計算_曲げ = @計算_曲げ,計算_仕上げ = @計算_仕上げ,計算_ロス管理 = @計算_ロス管理,計算_材料費比 = @計算_材料費比,計算_加工費小計 = @計算_加工費小計,計算_加工費比 = @計算_加工費比,計算_単価 = @計算_単価,定尺裁断_数 = @定尺裁断_数,定尺裁断_所要時間 = @定尺裁断_所要時間,定尺裁断_割数 = @定尺裁断_割数,寸法カット_数 = @寸法カット_数,寸法カット_所要時間 = @寸法カット_所要時間,寸法カット_割数 = @寸法カット_割数,打抜_型取数 = @打抜_型取数,打抜_プレス回数 = @打抜_プレス回数,曲げ_数 = @曲げ_数,曲げ_秒数 = @曲げ_秒数,曲げ_同時加工 = @曲げ_同時加工,仕上げ_数 = @仕上げ_数,仕上げ_秒数 = @仕上げ_秒数,仕上げ_同時加工 = @仕上げ_同時加工,ロス管理_材比 = @ロス管理_材比,ロス管理_加工比 = @ロス管理_加工比,定尺裁断_時間 = @定尺裁断_時間,定尺裁断_作業費 = @定尺裁断_作業費,定尺裁断_単価当り = @定尺裁断_単価当り,寸法カット_時間 = @寸法カット_時間,寸法カット_作業費 = @寸法カット_作業費,寸法カット_単価当り = @寸法カット_単価当り,打抜_時間当たりの加工数 = @打抜_時間当たりの加工数,打抜_単価当り = @打抜_単価当り,曲げ_時間 = @曲げ_時間,曲げ_作業費 = @曲げ_作業費,曲げ_単価当り = @曲げ_単価当り,仕上げ_時間 = @仕上げ_時間,仕上げ_作業費 = @仕上げ_作業費,仕上げ_単価当り = @仕上げ_単価当り,ロス管理_材_費用 = @ロス管理_材_費用,ロス管理_加工_費用 = @ロス管理_加工_費用,見積_定尺裁断費比 = @見積_定尺裁断費比,計算_定尺裁断費比 = @計算_定尺裁断費比,計算_寸法カット費比 = @計算_寸法カット費比,見積_打抜費比 = @見積_打抜費比,計算_打抜費比 = @計算_打抜費比,見積_貼り費比 = @見積_貼り費比,計算_貼り費比 = @計算_貼り費比,見積_曲げ費比 = @見積_曲げ費比,計算_曲げ費比 = @計算_曲げ費比,見積_仕上げ費比 = @見積_仕上げ費比,計算_仕上げ費比 = @計算_仕上げ費比,見積_ロス管理費比 = @見積_ロス管理費比,計算_ロス管理費比 = @計算_ロス管理費比,ロット = @ロット,丸め数 = @丸め数,商品重量 = @商品重量,図面ファイル = @図面ファイル,備考 = @備考,売単価=@売単価,利益率=@利益率,削除フラグ = @削除フラグ,最終更新ユーザー = @最終更新ユーザー, 最終更新日時 = @最終更新日時
                where 単価ID = @original_単価ID and 最終更新日時 = @original_最終更新日時"
        InsertCommand=" insert into T単価 
                (部品コード,部品名称,材料ID,材料名称,材質大分類,材質,定尺寸法縦_original,定尺寸法横_original,定尺仕入金額_original,定尺寸法縦,定尺寸法横,厚み,定尺仕入金額,定尺仕入自動計算フラグ,定尺売り金額,時間単価,分単価,秒単価,m2あたりの材料費,m2あたりの取数たて,m2あたりの取数よこ,m2あたりの取数,仕入れ単価,商品たて,商品よこ,たてしろ,よこしろ,取り数,見積_材料費,見積_裁断,見積_打抜,見積_貼り,見積_曲げ,見積_仕上げ,見積_ロス管理,見積_材料費比,見積_加工費小計,見積_加工費比,見積_単価,見積_m2あたり材料費,たて_しろあり,よこ_しろあり,縦取り数,横取り数,たて余,よこ余,計算_取り数,計算_材料費T,計算_材料費,計算_裁断,計算_打抜,計算_貼り,計算_曲げ,計算_仕上げ,計算_ロス管理,計算_材料費比,計算_加工費小計,計算_加工費比,計算_単価,定尺裁断_数,定尺裁断_所要時間,定尺裁断_割数,寸法カット_数,寸法カット_所要時間,寸法カット_割数,打抜_型取数,打抜_プレス回数,曲げ_数,曲げ_秒数,曲げ_同時加工,仕上げ_数,仕上げ_秒数,仕上げ_同時加工,ロス管理_材比,ロス管理_加工比,定尺裁断_時間,定尺裁断_作業費,定尺裁断_単価当り,寸法カット_時間,寸法カット_作業費,寸法カット_単価当り,打抜_時間当たりの加工数,打抜_単価当り,曲げ_時間,曲げ_作業費,曲げ_単価当り,仕上げ_時間,仕上げ_作業費,仕上げ_単価当り,ロス管理_材_費用,ロス管理_加工_費用,見積_定尺裁断費比,計算_定尺裁断費比,計算_寸法カット費比,見積_打抜費比,計算_打抜費比,見積_貼り費比,計算_貼り費比,見積_曲げ費比,計算_曲げ費比,見積_仕上げ費比,計算_仕上げ費比,見積_ロス管理費比,計算_ロス管理費比,ロット,丸め数,商品重量,図面ファイル,備考,売単価,利益率,削除フラグ,作成ユーザー,最終更新ユーザー,作成日時,最終更新日時) 
                values (@部品コード,@部品名称,@材料ID,@材料名称,@材質大分類,@材質,@定尺寸法縦_original,@定尺寸法横_original,@定尺仕入金額_original,@定尺寸法縦,@定尺寸法横,@厚み,@定尺仕入金額,@定尺仕入自動計算フラグ,@定尺売り金額,@時間単価,@分単価,@秒単価,@m2あたりの材料費,@m2あたりの取数たて,@m2あたりの取数よこ,@m2あたりの取数,@仕入れ単価,@商品たて,@商品よこ,@たてしろ,@よこしろ,@取り数,@見積_材料費,@見積_裁断,@見積_打抜,@見積_貼り,@見積_曲げ,@見積_仕上げ,@見積_ロス管理,@見積_材料費比,@見積_加工費小計,@見積_加工費比,@見積_単価,@見積_m2あたり材料費,@たて_しろあり,@よこ_しろあり,@縦取り数,@横取り数,@たて余,@よこ余,@計算_取り数,@計算_材料費T,@計算_材料費,@計算_裁断,@計算_打抜,@計算_貼り,@計算_曲げ,@計算_仕上げ,@計算_ロス管理,@計算_材料費比,@計算_加工費小計,@計算_加工費比,@計算_単価,@定尺裁断_数,@定尺裁断_所要時間,@定尺裁断_割数,@寸法カット_数,@寸法カット_所要時間,@寸法カット_割数,@打抜_型取数,@打抜_プレス回数,@曲げ_数,@曲げ_秒数,@曲げ_同時加工,@仕上げ_数,@仕上げ_秒数,@仕上げ_同時加工,@ロス管理_材比,@ロス管理_加工比,@定尺裁断_時間,@定尺裁断_作業費,@定尺裁断_単価当り,@寸法カット_時間,@寸法カット_作業費,@寸法カット_単価当り,@打抜_時間当たりの加工数,@打抜_単価当り,@曲げ_時間,@曲げ_作業費,@曲げ_単価当り,@仕上げ_時間,@仕上げ_作業費,@仕上げ_単価当り,@ロス管理_材_費用,@ロス管理_加工_費用,@見積_定尺裁断費比,@計算_定尺裁断費比,@計算_寸法カット費比,@見積_打抜費比,@計算_打抜費比,@見積_貼り費比,@計算_貼り費比,@見積_曲げ費比,@計算_曲げ費比,@見積_仕上げ費比,@計算_仕上げ費比,@見積_ロス管理費比,@計算_ロス管理費比,@ロット,@丸め数,@商品重量,@図面ファイル,@備考,@売単価,@利益率,@削除フラグ,@作成ユーザー,@最終更新ユーザー,@作成日時,@最終更新日時)
                ;  "
        DeleteCommand="update T単価    set 削除フラグ = 'True'  where 単価ID = @original_単価ID  and 最終更新日時 = @original_最終更新日時"
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
            <asp:FormParameter Name="定尺寸法縦_original" FormField="定尺寸法縦_original" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="定尺寸法横_original" FormField="定尺寸法横_original" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="定尺仕入金額_original" FormField="定尺仕入金額_original" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="定尺寸法縦" FormField="定尺寸法縦" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="定尺寸法横" FormField="定尺寸法横" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="厚み" FormField="厚み" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="定尺仕入金額" FormField="定尺仕入金額" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="定尺仕入自動計算フラグ" FormField="定尺仕入自動計算フラグ" ConvertEmptyStringToNull="true" Type="String" />

            <asp:FormParameter Name="定尺売り金額" FormField="定尺売り金額" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="時間単価" FormField="時間単価" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="分単価" FormField="分単価" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="秒単価" FormField="秒単価" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="m2あたりの材料費" FormField="m2あたりの材料費" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="m2あたりの取数たて" FormField="m2あたりの取数たて" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="m2あたりの取数よこ" FormField="m2あたりの取数よこ" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="m2あたりの取数" FormField="m2あたりの取数" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="仕入れ単価" FormField="仕入れ単価" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="商品たて" FormField="商品たて" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="商品よこ" FormField="商品よこ" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="たてしろ" FormField="たてしろ" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="よこしろ" FormField="よこしろ" ConvertEmptyStringToNull="true" Type="Decimal" />


            <asp:FormParameter Name="取り数" FormField="取り数" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_材料費" FormField="見積_材料費" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="見積_裁断" FormField="見積_裁断" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_打抜" FormField="見積_打抜" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_貼り" FormField="見積_貼り" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_曲げ" FormField="見積_曲げ" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_仕上げ" FormField="見積_仕上げ" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_ロス管理" FormField="見積_ロス管理" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_材料費比" FormField="見積_材料費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_加工費小計" FormField="見積_加工費小計" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_加工費比" FormField="見積_加工費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_単価" FormField="見積_単価" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_m2あたり材料費" FormField="見積_m2あたり材料費" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="たて_しろあり" FormField="たて_しろあり" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="よこ_しろあり" FormField="よこ_しろあり" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="縦取り数" FormField="縦取り数" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="横取り数" FormField="横取り数" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="たて余" FormField="たて余" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="よこ余" FormField="よこ余" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="計算_取り数" FormField="計算_取り数" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_材料費T" FormField="計算_材料費T" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_材料費" FormField="計算_材料費" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="計算_裁断" FormField="計算_裁断" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_打抜" FormField="計算_打抜" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_貼り" FormField="計算_貼り" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_曲げ" FormField="計算_曲げ" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_仕上げ" FormField="計算_仕上げ" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_ロス管理" FormField="計算_ロス管理" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_材料費比" FormField="計算_材料費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_加工費小計" FormField="計算_加工費小計" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_加工費比" FormField="計算_加工費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_単価" FormField="計算_単価" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="定尺裁断_数" FormField="定尺裁断_数" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="定尺裁断_所要時間" FormField="定尺裁断_所要時間" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="定尺裁断_割数" FormField="定尺裁断_割数" ConvertEmptyStringToNull="true" Type="Int32" />

            <asp:FormParameter Name="寸法カット_数" FormField="寸法カット_数" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="寸法カット_所要時間" FormField="寸法カット_所要時間" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="寸法カット_割数" FormField="寸法カット_割数" ConvertEmptyStringToNull="true" Type="Int32" />

            <asp:FormParameter Name="打抜_型取数" FormField="打抜_型取数" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="打抜_プレス回数" FormField="打抜_プレス回数" ConvertEmptyStringToNull="true" Type="Int32" />

            <asp:FormParameter Name="曲げ_数" FormField="曲げ_数" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="曲げ_秒数" FormField="曲げ_秒数" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="曲げ_同時加工" FormField="曲げ_同時加工" ConvertEmptyStringToNull="true" Type="Int32" />

            <asp:FormParameter Name="仕上げ_数" FormField="仕上げ_数" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="仕上げ_秒数" FormField="仕上げ_秒数" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="仕上げ_同時加工" FormField="仕上げ_同時加工" ConvertEmptyStringToNull="true" Type="Int32" />

            <asp:FormParameter Name="ロス管理_材比" FormField="ロス管理_材比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="ロス管理_加工比" FormField="ロス管理_加工比" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="定尺裁断_時間" FormField="定尺裁断_時間" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="定尺裁断_作業費" FormField="定尺裁断_作業費" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="定尺裁断_単価当り" FormField="定尺裁断_単価当り" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="寸法カット_時間" FormField="寸法カット_時間" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="寸法カット_作業費" FormField="寸法カット_作業費" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="寸法カット_単価当り" FormField="寸法カット_単価当り" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="打抜_時間当たりの加工数" FormField="打抜_時間当たりの加工数" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="打抜_単価当り" FormField="打抜_単価当り" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="曲げ_時間" FormField="曲げ_時間" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="曲げ_作業費" FormField="曲げ_作業費" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="曲げ_単価当り" FormField="曲げ_単価当り" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="仕上げ_時間" FormField="仕上げ_時間" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="仕上げ_作業費" FormField="仕上げ_作業費" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="仕上げ_単価当り" FormField="仕上げ_単価当り" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="ロス管理_材_費用" FormField="ロス管理_材_費用" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="ロス管理_加工_費用" FormField="ロス管理_加工_費用" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="見積_定尺裁断費比" FormField="見積_定尺裁断費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_定尺裁断費比" FormField="計算_定尺裁断費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_寸法カット費比" FormField="計算_寸法カット費比" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="見積_打抜費比" FormField="見積_打抜費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_打抜費比" FormField="計算_打抜費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_貼り費比" FormField="見積_貼り費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_貼り費比" FormField="計算_貼り費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_曲げ費比" FormField="見積_曲げ費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_曲げ費比" FormField="計算_曲げ費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_仕上げ費比" FormField="見積_仕上げ費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_仕上げ費比" FormField="計算_仕上げ費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_ロス管理費比" FormField="見積_ロス管理費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_ロス管理費比" FormField="計算_ロス管理費比" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="売単価" FormField="売単価" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="利益率" FormField="利益率" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="ロット" FormField="ロット" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="丸め数" FormField="丸め数" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="商品重量" FormField="商品重量" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="図面ファイル" FormField="図面ファイル" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="備考" FormField="備考" ConvertEmptyStringToNull="true" Type="String" />

            <asp:FormParameter Name="削除フラグ" FormField="削除フラグ" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="作成ユーザー" FormField="作成ユーザー" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="最終更新ユーザー" FormField="最終更新ユーザー" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="作成日時" FormField="作成日時" ConvertEmptyStringToNull="true" Type="DateTime" />
            <asp:FormParameter Name="最終更新日時" FormField="最終更新日時" ConvertEmptyStringToNull="true" Type="DateTime" />


        </InsertParameters>

        <UpdateParameters>
            <asp:FormParameter Name="部品コード" FormField="部品コード" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="部品名称" FormField="部品名称" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="材料ID" FormField="材料ID" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="材料名称" FormField="材料名称" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="材質大分類" FormField="材質大分類" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="材質" FormField="材質" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="定尺寸法縦_original" FormField="定尺寸法縦_original" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="定尺寸法横_original" FormField="定尺寸法横_original" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="定尺仕入金額_original" FormField="定尺仕入金額_original" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="定尺寸法縦" FormField="定尺寸法縦" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="定尺寸法横" FormField="定尺寸法横" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="厚み" FormField="厚み" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="定尺仕入金額" FormField="定尺仕入金額" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="定尺仕入自動計算フラグ" FormField="定尺仕入自動計算フラグ" ConvertEmptyStringToNull="true" Type="String" />

            <asp:FormParameter Name="定尺売り金額" FormField="定尺売り金額" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="時間単価" FormField="時間単価" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="分単価" FormField="分単価" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="秒単価" FormField="秒単価" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="m2あたりの材料費" FormField="m2あたりの材料費" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="m2あたりの取数たて" FormField="m2あたりの取数たて" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="m2あたりの取数よこ" FormField="m2あたりの取数よこ" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="m2あたりの取数" FormField="m2あたりの取数" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="仕入れ単価" FormField="仕入れ単価" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="商品たて" FormField="商品たて" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="商品よこ" FormField="商品よこ" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="たてしろ" FormField="たてしろ" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="よこしろ" FormField="よこしろ" ConvertEmptyStringToNull="true" Type="Decimal" />


            <asp:FormParameter Name="取り数" FormField="取り数" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_材料費" FormField="見積_材料費" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="見積_裁断" FormField="見積_裁断" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_打抜" FormField="見積_打抜" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_貼り" FormField="見積_貼り" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_曲げ" FormField="見積_曲げ" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_仕上げ" FormField="見積_仕上げ" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_ロス管理" FormField="見積_ロス管理" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_材料費比" FormField="見積_材料費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_加工費小計" FormField="見積_加工費小計" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_加工費比" FormField="見積_加工費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_単価" FormField="見積_単価" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_m2あたり材料費" FormField="見積_m2あたり材料費" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="たて_しろあり" FormField="たて_しろあり" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="よこ_しろあり" FormField="よこ_しろあり" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="縦取り数" FormField="縦取り数" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="横取り数" FormField="横取り数" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="たて余" FormField="たて余" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="よこ余" FormField="よこ余" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="計算_取り数" FormField="計算_取り数" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_材料費T" FormField="計算_材料費T" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_材料費" FormField="計算_材料費" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="計算_裁断" FormField="計算_裁断" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_打抜" FormField="計算_打抜" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_貼り" FormField="計算_貼り" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_曲げ" FormField="計算_曲げ" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_仕上げ" FormField="計算_仕上げ" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_ロス管理" FormField="計算_ロス管理" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_材料費比" FormField="計算_材料費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_加工費小計" FormField="計算_加工費小計" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_加工費比" FormField="計算_加工費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_単価" FormField="計算_単価" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="定尺裁断_数" FormField="定尺裁断_数" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="定尺裁断_所要時間" FormField="定尺裁断_所要時間" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="定尺裁断_割数" FormField="定尺裁断_割数" ConvertEmptyStringToNull="true" Type="Int32" />

            <asp:FormParameter Name="寸法カット_数" FormField="寸法カット_数" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="寸法カット_所要時間" FormField="寸法カット_所要時間" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="寸法カット_割数" FormField="寸法カット_割数" ConvertEmptyStringToNull="true" Type="Int32" />

            <asp:FormParameter Name="打抜_型取数" FormField="打抜_型取数" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="打抜_プレス回数" FormField="打抜_プレス回数" ConvertEmptyStringToNull="true" Type="Int32" />

            <asp:FormParameter Name="曲げ_数" FormField="曲げ_数" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="曲げ_秒数" FormField="曲げ_秒数" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="曲げ_同時加工" FormField="曲げ_同時加工" ConvertEmptyStringToNull="true" Type="Int32" />

            <asp:FormParameter Name="仕上げ_数" FormField="仕上げ_数" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="仕上げ_秒数" FormField="仕上げ_秒数" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="仕上げ_同時加工" FormField="仕上げ_同時加工" ConvertEmptyStringToNull="true" Type="Int32" />

            <asp:FormParameter Name="ロス管理_材比" FormField="ロス管理_材比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="ロス管理_加工比" FormField="ロス管理_加工比" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="定尺裁断_時間" FormField="定尺裁断_時間" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="定尺裁断_作業費" FormField="定尺裁断_作業費" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="定尺裁断_単価当り" FormField="定尺裁断_単価当り" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="寸法カット_時間" FormField="寸法カット_時間" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="寸法カット_作業費" FormField="寸法カット_作業費" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="寸法カット_単価当り" FormField="寸法カット_単価当り" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="打抜_時間当たりの加工数" FormField="打抜_時間当たりの加工数" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="打抜_単価当り" FormField="打抜_単価当り" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="曲げ_時間" FormField="曲げ_時間" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="曲げ_作業費" FormField="曲げ_作業費" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="曲げ_単価当り" FormField="曲げ_単価当り" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="仕上げ_時間" FormField="仕上げ_時間" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="仕上げ_作業費" FormField="仕上げ_作業費" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="仕上げ_単価当り" FormField="仕上げ_単価当り" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="ロス管理_材_費用" FormField="ロス管理_材_費用" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="ロス管理_加工_費用" FormField="ロス管理_加工_費用" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="見積_定尺裁断費比" FormField="見積_定尺裁断費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_定尺裁断費比" FormField="計算_定尺裁断費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_寸法カット費比" FormField="計算_寸法カット費比" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="見積_打抜費比" FormField="見積_打抜費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_打抜費比" FormField="計算_打抜費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_貼り費比" FormField="見積_貼り費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_貼り費比" FormField="計算_貼り費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_曲げ費比" FormField="見積_曲げ費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_曲げ費比" FormField="計算_曲げ費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_仕上げ費比" FormField="見積_仕上げ費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_仕上げ費比" FormField="計算_仕上げ費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="見積_ロス管理費比" FormField="見積_ロス管理費比" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="計算_ロス管理費比" FormField="計算_ロス管理費比" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="売単価" FormField="売単価" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="利益率" FormField="利益率" ConvertEmptyStringToNull="true" Type="Decimal" />

            <asp:FormParameter Name="ロット" FormField="ロット" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="丸め数" FormField="丸め数" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="商品重量" FormField="商品重量" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="図面ファイル" FormField="図面ファイル" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="備考" FormField="備考" ConvertEmptyStringToNull="true" Type="String" />

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
        SelectCommand="SELECT concat(材料名称,'_', 厚み, 't*', 定尺寸法縦, 'mm*', 定尺寸法横, 'mm', '_', 定尺仕入金額, '円') AS 材料名称識別テキスト,t1.材料ID,  t1.材料名称, t1.材料メーカー,t3.名称, t1.定尺寸法縦,t1.定尺寸法横,t1.厚み,t1.定尺仕入金額,t1.定尺売り金額, t2.名称 as 材質大分類, t3.名称 as 材質 FROM `M材料価格` as t1 left outer join Mコード as t2 on t1.材質大分類 = t2.コードID left outer join Mコード as t3 on t1.材質 = t3.コードID WHERE (t1.削除フラグ is null or t1.削除フラグ !=  'true') "
        OrderBy="材料名称識別テキスト">
    </y:BaseSqlDataSource>


    <y:BaseSqlDataSource runat="server" ID="ユーザーDataSource"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        SelectCommand="SELECT ユーザーId, ユーザー名 FROM `Mユーザー` WHERE (`削除フラグ` is null or `削除フラグ` !=  'true')">
    </y:BaseSqlDataSource>


    <y:BaseSqlDataSource runat="server" ID="検索材質大分類DataSource"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        SelectCommand="
                SELECT distinct(材質大分類) as 材質大分類 FROM `T単価`
                    ">
    </y:BaseSqlDataSource>


    <y:BaseSqlDataSource runat="server" ID="検索材質DataSource"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        SelectCommand="
                SELECT distinct(材質) as 材質 FROM `T単価`
                    ">
    </y:BaseSqlDataSource>

    <y:BaseSqlDataSource runat="server" ID="検索材料名称DataSource"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        SelectCommand="
                SELECT distinct(材料名称) as 材料名称 FROM `T単価`
                    ">
    </y:BaseSqlDataSource>

</asp:Content>


<asp:Content ID="Content8" ContentPlaceHolderID="Chart" runat="Server">
    <div id="popupPriceChart" style="">
        <canvas id="priceChart"></canvas>
    </div>

</asp:Content>
