﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MTankaMitsumori.aspx.cs" Inherits="MTankaMitsumori" %>

<%@ Register TagPrefix="y" Namespace="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>単価見積もり画面</title>
    <link href="css/style.css" rel="stylesheet" />

    <script type="text/javascript" src="js/lib/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="js/utils/JQueryUtils.js"></script>
    <script type="text/javascript" src="js/utils/SpecialGlobal.js"></script>
    <script type="text/javascript" src="js/utils/NumberUtils.js"></script>
    <script type="text/javascript" src="js/utils/StringUtils.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {


            var 単価ID = $('#<%=  mainFormView.FindControl("単価ID").ClientID%>');
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
            var 時間単価 = $('#<%=  mainFormView.FindControl("時間単価").ClientID%>');
            var 分単価 = $('#<%=  mainFormView.FindControl("分単価").ClientID%>');
            var 秒単価 = $('#<%=  mainFormView.FindControl("秒単価").ClientID%>');
            var 仕入れ単価 = $('#<%=  mainFormView.FindControl("仕入れ単価").ClientID%>');
            var 取り数 = $('#<%=  mainFormView.FindControl("取り数").ClientID%>');
            var 商品たて = $('#<%=  mainFormView.FindControl("商品たて").ClientID%>');
            var 商品よこ = $('#<%=  mainFormView.FindControl("商品よこ").ClientID%>');
            var たてしろ = $('#<%=  mainFormView.FindControl("たてしろ").ClientID%>');
            var よこしろ = $('#<%=  mainFormView.FindControl("よこしろ").ClientID%>');
            var 見積_材料費 = $('#<%=  mainFormView.FindControl("見積_材料費").ClientID%>');
            var 見積_裁断 = $('#<%=  mainFormView.FindControl("見積_裁断").ClientID%>');
            var 見積_打抜 = $('#<%=  mainFormView.FindControl("見積_打抜").ClientID%>');
            var 見積_貼り = $('#<%=  mainFormView.FindControl("見積_貼り").ClientID%>');
            var 見積_曲げ = $('#<%=  mainFormView.FindControl("見積_曲げ").ClientID%>');
            var 見積_仕上げ = $('#<%=  mainFormView.FindControl("見積_仕上げ").ClientID%>');
            var 見積_ロス管理 = $('#<%=  mainFormView.FindControl("見積_ロス管理").ClientID%>');
            var 見積_材料費比 = $('#<%=  mainFormView.FindControl("見積_材料費比").ClientID%>');
            var 見積_加工費小計 = $('#<%=  mainFormView.FindControl("見積_加工費小計").ClientID%>');
            var 見積_加工費比 = $('#<%=  mainFormView.FindControl("見積_加工費比").ClientID%>');
            var 見積_単価 = $('#<%=  mainFormView.FindControl("見積_単価").ClientID%>');
            var m2あたりの材料費 = $('#<%=  mainFormView.FindControl("m2あたりの材料費").ClientID%>');
            var m2あたりの取数たて = $('#<%=  mainFormView.FindControl("m2あたりの取数たて").ClientID%>');
            var m2あたりの取数よこ = $('#<%=  mainFormView.FindControl("m2あたりの取数よこ").ClientID%>');
            var m2あたりの取数 = $('#<%=  mainFormView.FindControl("m2あたりの取数").ClientID%>');
            var 計算_取り数 = $('#<%=  mainFormView.FindControl("計算_取り数").ClientID%>');
            var たて_しろあり = $('#<%=  mainFormView.FindControl("たて_しろあり").ClientID%>');
            var よこ_しろあり = $('#<%=  mainFormView.FindControl("よこ_しろあり").ClientID%>');
            var 縦取り数 = $('#<%=  mainFormView.FindControl("縦取り数").ClientID%>');
            var 横取り数 = $('#<%=  mainFormView.FindControl("横取り数").ClientID%>');
            var たて余 = $('#<%=  mainFormView.FindControl("たて余").ClientID%>');
            var よこ余 = $('#<%=  mainFormView.FindControl("よこ余").ClientID%>');
            var 計算_材料費 = $('#<%=  mainFormView.FindControl("計算_材料費").ClientID%>');
            var 計算_裁断 = $('#<%=  mainFormView.FindControl("計算_裁断").ClientID%>');
            var 計算_打抜 = $('#<%=  mainFormView.FindControl("計算_打抜").ClientID%>');
            var 計算_貼り = $('#<%=  mainFormView.FindControl("計算_貼り").ClientID%>');
            var 計算_曲げ = $('#<%=  mainFormView.FindControl("計算_曲げ").ClientID%>');
            var 計算_仕上げ = $('#<%=  mainFormView.FindControl("計算_仕上げ").ClientID%>');
            var 計算_ロス管理 = $('#<%=  mainFormView.FindControl("計算_ロス管理").ClientID%>');
            var 計算_材料費比 = $('#<%=  mainFormView.FindControl("計算_材料費比").ClientID%>');
            var 計算_加工費小計 = $('#<%=  mainFormView.FindControl("計算_加工費小計").ClientID%>');
            var 計算_加工費比 = $('#<%=  mainFormView.FindControl("計算_加工費比").ClientID%>');
            var 計算_単価 = $('#<%=  mainFormView.FindControl("計算_単価").ClientID%>');
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
            var 仕上げ_同時加工 = $('#<%=  mainFormView.FindControl("仕上げ_同時加工").ClientID%>');
            var ロス管理_材比 = $('#<%=  mainFormView.FindControl("ロス管理_材比").ClientID%>');
            var ロス管理_加工比 = $('#<%=  mainFormView.FindControl("ロス管理_加工比").ClientID%>');
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
            var 見積_定尺裁断費比 = $('#<%=  mainFormView.FindControl("見積_定尺裁断費比").ClientID%>');
            var 計算_定尺裁断費比 = $('#<%=  mainFormView.FindControl("計算_定尺裁断費比").ClientID%>');
            var 計算_寸法カット費比 = $('#<%=  mainFormView.FindControl("計算_寸法カット費比").ClientID%>');
            var 見積_打抜費比 = $('#<%=  mainFormView.FindControl("見積_打抜費比").ClientID%>');
            var 計算_打抜費比 = $('#<%=  mainFormView.FindControl("計算_打抜費比").ClientID%>');
            var 見積_貼り費比 = $('#<%=  mainFormView.FindControl("見積_貼り費比").ClientID%>');
            var 計算_貼り費比 = $('#<%=  mainFormView.FindControl("計算_貼り費比").ClientID%>');
            var 見積_曲げ費比 = $('#<%=  mainFormView.FindControl("見積_曲げ費比").ClientID%>');
            var 計算_曲げ費比 = $('#<%=  mainFormView.FindControl("計算_曲げ費比").ClientID%>');
            var 見積_仕上げ費比 = $('#<%=  mainFormView.FindControl("見積_仕上げ費比").ClientID%>');
            var 計算_仕上げ費比 = $('#<%=  mainFormView.FindControl("計算_仕上げ費比").ClientID%>');
            var 見積_ロス管理費比 = $('#<%=  mainFormView.FindControl("見積_ロス管理費比").ClientID%>');
            var 計算_ロス管理費比 = $('#<%=  mainFormView.FindControl("計算_ロス管理費比").ClientID%>');
            var ロット = $('#<%=  mainFormView.FindControl("ロット").ClientID%>');
            var 丸め数 = $('#<%=  mainFormView.FindControl("丸め数").ClientID%>');
            var 商品重量 = $('#<%=  mainFormView.FindControl("商品重量").ClientID%>');
            var 削除フラグ = $('#<%=  mainFormView.FindControl("削除フラグ").ClientID%>');
            var 作成ユーザー = $('#<%=  mainFormView.FindControl("作成ユーザー").ClientID%>');
            var 最終更新ユーザー = $('#<%=  mainFormView.FindControl("最終更新ユーザー").ClientID%>');
            var 作成日時 = $('#<%=  mainFormView.FindControl("作成日時").ClientID%>');
            var 最終更新日時 = $('#<%=  mainFormView.FindControl("最終更新日時").ClientID%>');



            たて_しろあり.val("NaN");
            よこ_しろあり.val("NaN");
            縦取り数.val("NaN");
            横取り数.val("NaN");
            たて余.val("NaN");
            よこ余.val("NaN");
            計算_取り数.val("NaN");
            m2あたりの材料費.val("NaN");
            m2あたりの取数たて.val("NaN");
            m2あたりの取数よこ.val("NaN");
            m2あたりの取数.val("NaN");

            見積_材料費比.val("NaN");
            見積_加工費小計.val("NaN");
            見積_加工費比.val("NaN");
            見積_単価.val("NaN");
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

            var 分単価計算 = function (event, ele) {
                try {
                    分単価.val(Fixed(V(時間単価) / 60, 2));
                } catch (e) {
                    分単価.val("NaN");
                }
               // 分単価.change();
            };
            var eleList = [時間単価];
            BindEvent(eleList, 分単価計算);
            eleList[0].change();

            var 秒単価計算 = function (event, ele) {
                try {
                    秒単価.val(Fixed(V(分単価) / 60, 2));
                } catch (e) {
                    秒単価.val("NaN");
                }
                //秒単価.change();
            };
            var eleList = [秒単価];
            BindEvent(eleList, 秒単価計算);
            eleList[0].change();

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
            eleList[0].change();


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


            var m2あたりの取数たて計算 = function (event, ele) {
                try {
                    m2あたりの取数たて.val(Fixed(1000 / V(たて_しろあり), 2));
                } catch (e) {
                    m2あたりの取数たて.val("NaN");
                }
            };
            var eleList = [たて_しろあり];
            BindEvent(eleList, m2あたりの取数たて計算);
            eleList[0].change();

            var m2あたりの取数よこ計算 = function (event, ele) {
                try {
                    m2あたりの取数よこ.val(Fixed(1000 / V(よこ_しろあり), 2));
                } catch (e) {
                    m2あたりの取数よこ.val("NaN");
                }
            };
            var eleList = [よこ_しろあり];
            BindEvent(eleList, m2あたりの取数よこ計算);
            eleList[0].change();

            var m2あたりの取数計算 = function (event, ele) {
                try {
                    m2あたりの取数.val(Floor(V(m2あたりの取数よこ) * V(m2あたりの取数たて), 0));
                } catch (e) {
                    m2あたりの取数.val("NaN");
                }
            };
            var eleList = [m2あたりの取数よこ, m2あたりの取数たて];
            BindEvent(eleList, m2あたりの取数計算);
            eleList[0].change();

            var 計算_材料費計算 = function (event, ele) {
                try {
                    計算_材料費.val(Floor(V(定尺仕入金額) / V(取り数), 2));
                } catch (e) {
                    計算_材料費.val("NaN");
                }
            };
            var eleList = [定尺仕入金額, 取り数];
            BindEvent(eleList, 計算_材料費計算);
            eleList[0].change();


            var 見積_加工費小計計算 = function (event, ele) {
                try {
                    var v = 0;
                    v = v + V(見積_裁断);
                    v = v + V(見積_打抜);
                    v = v + V(見積_貼り);
                    v = v + V(見積_曲げ);
                    //v = v + V(見積_ロス管理);
                    v = Fixed(v, 2);
                    見積_加工費小計.val(v);
                } catch (e) {
                    見積_加工費小計.val("NaN");
                }
            };
            var eleList = [定尺仕入金額, 見積_裁断, 見積_打抜, 見積_貼り, 見積_曲げ];
            BindEvent(eleList, 見積_加工費小計計算);
            eleList[0].change();

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
            };
            var eleList = [見積_加工費小計, 見積_ロス管理, 見積_材料費];
            BindEvent(eleList, 見積_単価計算);
            eleList[0].change();



            var 見積_材料費比計算 = function (event, ele) {
                try {
                    見積_材料費比.val(Fixed(V(見積_材料費) / V(見積_単価) * 100, 2));
                } catch (e) {
                    見積_材料費比.val("NaN");
                }
            };
            var eleList = [見積_材料費, 見積_単価];
            BindEvent(eleList, 見積_材料費比計算);
            eleList[0].change();

            var 見積_加工費比計算 = function (event, ele) {
                try {
                    見積_加工費比.val(Fixed(V(見積_加工費小計) / V(見積_単価) * 100, 2));
                } catch (e) {
                    見積_加工費比.val("NaN");
                }
            };
            var eleList = [見積_材料費, 見積_単価];
            BindEvent(eleList, 見積_加工費比計算);
            eleList[0].change();

            var 定尺裁断_時間計算 = function (event, ele) {
                try {
                    定尺裁断_時間.val(Fixed(V(定尺裁断_数) * V(定尺裁断_所要時間), 2));
                } catch (e) {
                    定尺裁断_時間.val("NaN");
                }
            };
            var eleList = [定尺裁断_数, 定尺裁断_所要時間];
            BindEvent(eleList, 定尺裁断_時間計算);
            eleList[0].change();

            var 定尺裁断_作業費計算 = function (event, ele) {
                try {
                    定尺裁断_作業費.val(Fixed(V(定尺裁断_時間) * V(秒単価), 2));
                } catch (e) {
                    定尺裁断_作業費.val("NaN");
                }
            };
            var eleList = [定尺裁断_時間, 秒単価];
            BindEvent(eleList, 定尺裁断_作業費計算);
            eleList[0].change();

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
            };
            var eleList = [定尺裁断_作業費, 定尺裁断_割数];
            BindEvent(eleList, 定尺裁断_単価当り計算);
            eleList[0].change();


            var 寸法カット_時間計算 = function (event, ele) {
                try {
                    寸法カット_時間.val(Fixed(V(寸法カット_数) * V(寸法カット_所要時間), 2));
                } catch (e) {
                    寸法カット_時間.val("NaN");
                }
            };
            var eleList = [寸法カット_数, 寸法カット_所要時間];
            BindEvent(eleList, 寸法カット_時間計算);
            eleList[0].change();

            var 寸法カット_作業費計算 = function (event, ele) {
                try {
                    寸法カット_作業費.val(Fixed(V(寸法カット_時間) * V(秒単価), 2));
                } catch (e) {
                    寸法カット_作業費.val("NaN");
                }
            };
            var eleList = [寸法カット_時間, 秒単価];
            BindEvent(eleList, 寸法カット_作業費計算);
            eleList[0].change();

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
            };
            var eleList = [寸法カット_作業費, 寸法カット_割数];
            BindEvent(eleList, 寸法カット_単価当り計算);
            eleList[0].change();

            var 打抜_時間当たりの加工数計算 = function (event, ele) {
                try {
                    打抜_時間当たりの加工数.val(Fixed(V(打抜_型取数) * V(打抜_プレス回数), 2));
                } catch (e) {
                    打抜_時間当たりの加工数.val("NaN");
                }
            };
            var eleList = [打抜_型取数, 打抜_プレス回数];
            BindEvent(eleList, 打抜_時間当たりの加工数計算);
            eleList[0].change();

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
            };
            var eleList = [打抜_型取数, 打抜_プレス回数];
            BindEvent(eleList, 打抜_単価当り計算);
            eleList[0].change();

            var 曲げ_時間計算 = function (event, ele) {
                try {
                    曲げ_時間.val(Fixed(V(曲げ_数) * V(曲げ_秒数), 2));
                } catch (e) {
                    曲げ_時間.val("NaN");
                }
            };
            var eleList = [曲げ_数, 曲げ_秒数];
            BindEvent(eleList, 曲げ_時間計算);
            eleList[0].change();

            var 曲げ_作業費計算 = function (event, ele) {
                try {
                    曲げ_作業費.val(Fixed(V(曲げ_時間) * V(秒単価), 2));
                } catch (e) {
                    曲げ_作業費.val("NaN");
                }
            };
            var eleList = [曲げ_時間, 秒単価];
            BindEvent(eleList, 曲げ_作業費計算);
            eleList[0].change();

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
            };
            var eleList = [曲げ_作業費, 曲げ_同時加工];
            BindEvent(eleList, 曲げ_単価当り計算);
            eleList[0].change();

            var 仕上げ_時間計算 = function (event, ele) {
                try {
                    仕上げ_時間.val(Fixed(V(仕上げ_数) * V(仕上げ_秒数), 2));
                } catch (e) {
                    仕上げ_時間.val("NaN");
                }
            };
            var eleList = [仕上げ_数, 仕上げ_秒数];
            BindEvent(eleList, 仕上げ_時間計算);
            eleList[0].change();

            var 仕上げ_作業費計算 = function (event, ele) {
                try {
                    仕上げ_作業費.val(Fixed(V(仕上げ_時間) * V(秒単価), 2));
                } catch (e) {
                    仕上げ_作業費.val("NaN");
                }
            };
            var eleList = [仕上げ_時間, 秒単価];
            BindEvent(eleList, 仕上げ_作業費計算);
            eleList[0].change();

            var 計算_裁断計算 = function (event, ele) {
                try {
                    計算_裁断.val(Fixed(V(定尺裁断_単価当り) * V(寸法カット_単価当り), 2));
                } catch (e) {
                    計算_裁断.val("NaN");
                }
            };
            var eleList = [定尺裁断_単価当り, 寸法カット_単価当り];
            BindEvent(eleList, 計算_裁断計算);
            eleList[0].change();

            var 計算_打抜計算 = function (event, ele) {
                try {
                    計算_打抜.val(Fixed(V(打抜_単価当り), 2));
                } catch (e) {
                    計算_打抜.val("NaN");
                }
            };
            var eleList = [打抜_単価当り];
            BindEvent(eleList, 計算_打抜計算);
            eleList[0].change();

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
            計算_貼り.val(0);

            var 計算_曲げ計算 = function (event, ele) {
                try {
                    計算_曲げ.val(Fixed(V(曲げ_単価当り), 2));
                } catch (e) {
                    計算_曲げ.val("NaN");
                }
            };
            var eleList = [打抜_単価当り];
            BindEvent(eleList, 計算_曲げ計算);
            eleList[0].change();

            var 仕上げ_単価当り計算 = function (event, ele) {
                try {
                    if (V(仕上げ_同時加工) <= 0) {
                        仕上げ_単価当り.val("0.00");
                    } else {
                        仕上げ_単価当り.val(Fixed(V(仕上げ_作業費) / V(仕上げ_同時加工), 2));
                    }
                } catch (e) {
                    仕上げ_単価当り.val("NaN");
                }
            };
            var eleList = [仕上げ_作業費, 仕上げ_同時加工];
            BindEvent(eleList, 仕上げ_単価当り計算);
            eleList[0].change();

            var ロス管理_材_費用計算 = function (event, ele) {
                try {
                    ロス管理_材_費用.val(Fixed(V(計算_材料費) * V(ロス管理_材比) / 100, 2));
                } catch (e) {
                    ロス管理_材_費用.val("NaN");
                }
            };
            var eleList = [計算_材料費, ロス管理_材比];
            BindEvent(eleList, ロス管理_材_費用計算);
            eleList[0].change();


            var 計算_加工費小計計算 = function (event, ele) {
                try {
                    var v = 0;
                    v = v + V(計算_裁断);
                    v = v + V(計算_打抜);
                    v = v + V(計算_貼り);
                    v = v + V(計算_曲げ);
                    //v = v + V(計算_ロス管理);
                    v = Fixed(v, 2);
                    計算_加工費小計.val(v);
                } catch (e) {
                    計算_加工費小計.val("NaN");
                }
            };
            var eleList = [定尺仕入金額, 計算_裁断, 計算_打抜, 計算_貼り, 計算_曲げ];
            BindEvent(eleList, 計算_加工費小計計算);
            eleList[0].change();

            var ロス管理_加工_費用計算 = function (event, ele) {
                try {
                    var v1 = V(計算_加工費小計);
                    var v2 = V(ロス管理_加工比);

                    ロス管理_加工_費用.val(Fixed(v1 * v2 / 100, 2));
                } catch (e) {
                    ロス管理_加工_費用.val("NaN");
                }
            };
            var eleList = [ロス管理_加工比, 計算_加工費小計];
            BindEvent(eleList, ロス管理_加工_費用計算);
            eleList[0].change();

            var 計算_ロス管理計算 = function (event, ele) {
                try {
                    計算_ロス管理.val(Fixed(V(ロス管理_加工_費用) + V(ロス管理_材_費用) / 100, 2));
                } catch (e) {
                    計算_ロス管理.val("NaN");
                }
            };
            var eleList = [ロス管理_加工_費用, ロス管理_材_費用];
            BindEvent(eleList, 計算_ロス管理計算);
            eleList[0].change();

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
            };
            var eleList = [計算_加工費小計, 計算_ロス管理, 計算_材料費];
            BindEvent(eleList, 計算_単価計算);
            eleList[0].change();





            var 計算_材料費比計算 = function (event, ele) {
                try {
                    if (V(計算_材料費) <= 0) {
                        計算_材料費比.val(0);
                    } else {
                        計算_材料費比.val(Fixed(V(計算_単価) / V(計算_材料費) * 100, 2));
                    }
                } catch (e) {
                    計算_材料費比.val("NaN");
                }
            };
            var eleList = [計算_単価, 計算_材料費];
            BindEvent(eleList, 計算_材料費比計算);
            eleList[0].change();

            var 計算_加工費比計算 = function (event, ele) {
                try {
                    if (V(計算_加工費小計) <= 0) {
                        計算_加工費比.val(0);
                    } else {
                        計算_加工費比.val(Fixed(V(計算_単価) / V(計算_加工費小計) * 100, 2));
                    }
                } catch (e) {
                    計算_加工費比.val("NaN");
                }
            };
            var eleList = [計算_単価, 計算_材料費];
            BindEvent(eleList, 計算_加工費比計算);
            eleList[0].change();

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
            };
            var eleList = [仕入れ単価, 見積_裁断];
            BindEvent(eleList, 見積_定尺裁断費比計算);
            eleList[0].change();

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
            };
            var eleList = [計算_単価, 定尺裁断_単価当り];
            BindEvent(eleList, 計算_定尺裁断費比計算);
            eleList[0].change();

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
            };
            var eleList = [計算_単価, 寸法カット_単価当り];
            BindEvent(eleList, 計算_寸法カット費比計算);
            eleList[0].change();


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
            };
            var eleList = [仕入れ単価, 見積_打抜];
            BindEvent(eleList, 見積_打抜費比計算);
            eleList[0].change();

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
            };
            var eleList = [計算_単価, 計算_打抜];
            BindEvent(eleList, 計算_打抜費比計算);
            eleList[0].change();

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
            };
            var eleList = [仕入れ単価, 見積_貼り];
            BindEvent(eleList, 見積_貼り費比計算);
            eleList[0].change();

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
            };
            var eleList = [計算_単価, 計算_貼り];
            BindEvent(eleList, 計算_貼り費比計算);
            eleList[0].change();


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
            };
            var eleList = [仕入れ単価, 見積_曲げ];
            BindEvent(eleList, 見積_曲げ費比計算);
            eleList[0].change();

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
            };
            var eleList = [計算_単価, 計算_曲げ];
            BindEvent(eleList, 計算_曲げ費比計算);
            eleList[0].change();

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
            };
            var eleList = [仕入れ単価, 見積_仕上げ];
            BindEvent(eleList, 見積_仕上げ費比計算);
            eleList[0].change();

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
            };
            var eleList = [計算_単価, 計算_仕上げ];
            BindEvent(eleList, 計算_仕上げ費比計算);
            eleList[0].change();


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
            };
            var eleList = [仕入れ単価, 見積_ロス管理];
            BindEvent(eleList, 見積_ロス管理費比計算);
            eleList[0].change();

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
            };
            var eleList = [計算_単価, 計算_ロス管理];
            BindEvent(eleList, 計算_ロス管理費比計算);
            eleList[0].change();

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

                    <y:YBoundField HeaderText="単価ID" DataFormatStringEditing="" DataField="単価ID" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="部品コード" DataFormatStringEditing="" DataField="部品コード" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="部品名称" DataFormatStringEditing="" DataField="部品名称" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="材料ID" DataFormatStringEditing="" DataField="材料ID" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="材料DataSource" DataTextField="材料名称" DataValueField="材料ID" AppendDataBoundItems="true" IsDropDownList="true" />
                    <y:YBoundField HeaderText="材料名称" DataFormatStringEditing="" DataField="材料名称" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="材質大分類" DataFormatStringEditing="" DataField="材質大分類" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="材質" DataFormatStringEditing="" DataField="材質" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="定尺寸法縦" DataFormatStringEditing="" DataField="定尺寸法縦" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="定尺寸法横" DataFormatStringEditing="" DataField="定尺寸法横" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="厚み" DataFormatStringEditing="" DataField="厚み" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="40" ItemStyle-Width="40" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="定尺仕入金額" DataFormatStringEditing="{0:f2}" DataField="定尺仕入金額" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="定尺売り金額" DataFormatStringEditing="{0:f2}" DataField="定尺売り金額" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="時間単価" DataFormatStringEditing="" DataField="時間単価" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="分単価" DataFormatStringEditing="" DataField="分単価" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="秒単価" DataFormatStringEditing="" DataField="秒単価" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="仕入れ単価" DataFormatStringEditing="{0:f2}" DataField="仕入れ単価" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="取り数" DataFormatStringEditing="" DataField="取り数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="商品たて" DataFormatStringEditing="" DataField="商品たて" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="商品よこ" DataFormatStringEditing="" DataField="商品よこ" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="たてしろ" DataFormatStringEditing="" DataField="たてしろ" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="よこしろ" DataFormatStringEditing="" DataField="よこしろ" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="見積_材料費" DataFormatStringEditing="" DataField="見積_材料費" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="見積_裁断" DataFormatStringEditing="" DataField="見積_裁断" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="見積_打抜" DataFormatStringEditing="" DataField="見積_打抜" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="見積_貼り" DataFormatStringEditing="" DataField="見積_貼り" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="見積_曲げ" DataFormatStringEditing="" DataField="見積_曲げ" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="見積_仕上げ" DataFormatStringEditing="" DataField="見積_仕上げ" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="見積_ロス管理" DataFormatStringEditing="" DataField="見積_ロス管理" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="見積_材料費比" DataFormatStringEditing="" DataField="見積_材料費比" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="見積_加工費小計" DataFormatStringEditing="" DataField="見積_加工費小計" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="見積_加工費比" DataFormatStringEditing="" DataField="見積_加工費比" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="見積_単価" DataFormatStringEditing="" DataField="見積_単価" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="m2あたりの材料費" DataFormatStringEditing="{0:f2}" DataField="m2あたりの材料費" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="m2あたりの取数たて" DataFormatStringEditing="{0:f2}" DataField="m2あたりの取数たて" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="m2あたりの取数よこ" DataFormatStringEditing="{0:f2}" DataField="m2あたりの取数よこ" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="m2あたりの取数" DataFormatStringEditing="" DataField="m2あたりの取数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_取り数" DataFormatStringEditing="" DataField="計算_取り数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="たて_しろあり" DataFormatStringEditing="" DataField="たて_しろあり" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="よこ_しろあり" DataFormatStringEditing="" DataField="よこ_しろあり" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="縦取り数" DataFormatStringEditing="" DataField="縦取り数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="横取り数" DataFormatStringEditing="" DataField="横取り数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="たて余" DataFormatStringEditing="" DataField="たて余" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="よこ余" DataFormatStringEditing="" DataField="よこ余" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_材料費" DataFormatStringEditing="" DataField="計算_材料費" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_裁断" DataFormatStringEditing="" DataField="計算_裁断" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_打抜" DataFormatStringEditing="" DataField="計算_打抜" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_貼り" DataFormatStringEditing="" DataField="計算_貼り" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_曲げ" DataFormatStringEditing="" DataField="計算_曲げ" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_仕上げ" DataFormatStringEditing="" DataField="計算_仕上げ" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_ロス管理" DataFormatStringEditing="" DataField="計算_ロス管理" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="定尺裁断_数" DataFormatStringEditing="" DataField="定尺裁断_数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="定尺裁断_所要時間" DataFormatStringEditing="" DataField="定尺裁断_所要時間" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="定尺裁断_割数" DataFormatStringEditing="" DataField="定尺裁断_割数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="寸法カット_数" DataFormatStringEditing="" DataField="寸法カット_数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="寸法カット_所要時間" DataFormatStringEditing="" DataField="寸法カット_所要時間" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="寸法カット_割数" DataFormatStringEditing="" DataField="寸法カット_割数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="打抜_型取数" DataFormatStringEditing="" DataField="打抜_型取数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="打抜_プレス回数" DataFormatStringEditing="" DataField="打抜_プレス回数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="曲げ_数" DataFormatStringEditing="" DataField="曲げ_数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="曲げ_秒数" DataFormatStringEditing="" DataField="曲げ_秒数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="曲げ_同時加工" DataFormatStringEditing="" DataField="曲げ_同時加工" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="仕上げ_数" DataFormatStringEditing="" DataField="仕上げ_数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="仕上げ_秒数" DataFormatStringEditing="" DataField="仕上げ_秒数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="仕上げ_同時加工" DataFormatStringEditing="" DataField="仕上げ_同時加工" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="ロス管理_材比" DataFormatStringEditing="" DataField="ロス管理_材比" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="ロス管理_加工比" DataFormatStringEditing="" DataField="ロス管理_加工比" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="計算_材料費比" DataFormatStringEditing="" DataField="計算_材料費比" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_加工費小計" DataFormatStringEditing="" DataField="計算_加工費小計" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_加工費比" DataFormatStringEditing="" DataField="計算_加工費比" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_単価" DataFormatStringEditing="" DataField="計算_単価" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="定尺裁断_時間" DataFormatStringEditing="" DataField="定尺裁断_時間" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="定尺裁断_作業費" DataFormatStringEditing="" DataField="定尺裁断_作業費" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="定尺裁断_単価当り" DataFormatStringEditing="" DataField="定尺裁断_単価当り" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="寸法カット_時間" DataFormatStringEditing="" DataField="寸法カット_時間" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="寸法カット_作業費" DataFormatStringEditing="" DataField="寸法カット_作業費" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="寸法カット_単価当り" DataFormatStringEditing="" DataField="寸法カット_単価当り" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="打抜_時間当たりの加工数" DataFormatStringEditing="" DataField="打抜_時間当たりの加工数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="打抜_単価当り" DataFormatStringEditing="" DataField="打抜_単価当り" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="曲げ_時間" DataFormatStringEditing="" DataField="曲げ_時間" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="曲げ_作業費" DataFormatStringEditing="" DataField="曲げ_作業費" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="曲げ_単価当り" DataFormatStringEditing="" DataField="曲げ_単価当り" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="仕上げ_時間" DataFormatStringEditing="" DataField="仕上げ_時間" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="仕上げ_作業費" DataFormatStringEditing="" DataField="仕上げ_作業費" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="仕上げ_単価当り" DataFormatStringEditing="" DataField="仕上げ_単価当り" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="ロス管理_材_費用" DataFormatStringEditing="" DataField="ロス管理_材_費用" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="ロス管理_加工_費用" DataFormatStringEditing="" DataField="ロス管理_加工_費用" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="見積_定尺裁断費比" DataFormatStringEditing="" DataField="見積_定尺裁断費比" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_定尺裁断費比" DataFormatStringEditing="" DataField="計算_定尺裁断費比" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_寸法カット費比" DataFormatStringEditing="" DataField="計算_寸法カット費比" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="見積_打抜費比" DataFormatStringEditing="" DataField="見積_打抜費比" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_打抜費比" DataFormatStringEditing="" DataField="計算_打抜費比" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="見積_貼り費比" DataFormatStringEditing="" DataField="見積_貼り費比" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_貼り費比" DataFormatStringEditing="" DataField="計算_貼り費比" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="見積_曲げ費比" DataFormatStringEditing="" DataField="見積_曲げ費比" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_曲げ費比" DataFormatStringEditing="" DataField="計算_曲げ費比" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="見積_仕上げ費比" DataFormatStringEditing="" DataField="見積_仕上げ費比" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_仕上げ費比" DataFormatStringEditing="" DataField="計算_仕上げ費比" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="見積_ロス管理費比" DataFormatStringEditing="" DataField="見積_ロス管理費比" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="計算_ロス管理費比" DataFormatStringEditing="" DataField="計算_ロス管理費比" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" />
                    <y:YBoundField HeaderText="ロット" DataFormatStringEditing="" DataField="ロット" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="丸め数" DataFormatStringEditing="" DataField="丸め数" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="商品重量" DataFormatStringEditing="" DataField="商品重量" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="削除フラグ" DataFormatStringEditing="" DataField="削除フラグ" ReadOnly="FALSE" IsBoolean="TRUE" ControlStyle-Width="40" ItemStyle-Width="40" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="作成ユーザー" DataFormatStringEditing="" DataField="作成ユーザー" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" IsDropDownList="true" />
                    <y:YBoundField HeaderText="最終更新ユーザー" DataFormatStringEditing="" DataField="最終更新ユーザー" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" IsDropDownList="true" />
                    <y:YBoundField HeaderText="作成日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="作成日時" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Input" />
                    <y:YBoundField HeaderText="最終更新日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="最終更新日時" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Input" />

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
                                    <tr>
                                        <td>

                                            <table>
                                                <tr class="titleRow">
                                                    <td colspan="2">基本情報</td>
                                                </tr>
                                                <y:YTextBox ID="単価ID" Label="単価ID【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("単価ID", "") %>' IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="部品コード" Label="部品コード【-】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("部品コード", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="部品名称" Label="部品名称【-】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("部品名称", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                                <y:YDropDownList ID="材料ID" Label="材料ID【-】" IsGrid="false" ReadOnly="FALSE" SelectedValue='<%# Bind("材料ID") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="材料DataSource" DataTextField="材料名称" DataValueField="材料ID" AppendDataBoundItems="true" Width="70" />
                                                <y:YTextBox ID="材料名称" Label="材料名称【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材料名称", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                                <y:YTextBox ID="材質大分類" Label="材質大分類【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材質大分類", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                                <y:YTextBox ID="材質" Label="材質【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材質", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                                <y:YTextBox ID="定尺寸法縦" Label="定尺寸法縦【mm】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("定尺寸法縦", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="定尺寸法横" Label="定尺寸法横【mm】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("定尺寸法横", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="厚み" Label="厚み【mm】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("厚み", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="40" />
                                                <y:YTextBox ID="定尺仕入金額" Label="定尺仕入金額【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("定尺仕入金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="定尺売り金額" Label="定尺売り金額【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("定尺売り金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="時間単価" Label="時間単価【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("時間単価", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="分単価" Label="分単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("分単価", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="秒単価" Label="秒単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("秒単価", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                            </table>
                                        </td>
                                        <td>

                                            <table>
                                                <y:YTextBox ID="仕入れ単価" Label="仕入れ単価【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("仕入れ単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="商品たて" Label="商品たて【mm】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("商品たて", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="商品よこ" Label="商品よこ【mm】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("商品よこ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="たてしろ" Label="たてしろ【mm】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("たてしろ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="よこしろ" Label="よこしろ【mm】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("よこしろ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                            <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                    <y:YTextBox ID="取り数" Label="取り数【ヶ】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("取り数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_材料費" Label="見積_材料費【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("見積_材料費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_裁断" Label="見積_裁断【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("見積_裁断", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_打抜" Label="見積_打抜【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("見積_打抜", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_貼り" Label="見積_貼り【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("見積_貼り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_曲げ" Label="見積_曲げ【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("見積_曲げ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_仕上げ" Label="見積_仕上げ【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("見積_仕上げ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_ロス管理" Label="見積_ロス管理【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("見積_ロス管理", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />

                                                <y:YTextBox ID="見積_材料費比" Label="見積_材料費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_材料費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_加工費小計" Label="見積_加工費小計【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_加工費小計", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_加工費比" Label="見積_加工費比【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_加工費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_単価" Label="見積_単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_単価", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                                <y:YTextBox ID="m2あたりの材料費" Label="m2あたりの材料費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("m2あたりの材料費", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="m2あたりの取数たて" Label="m2あたりの取数たて【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("m2あたりの取数たて", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="m2あたりの取数よこ" Label="m2あたりの取数よこ【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("m2あたりの取数よこ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="m2あたりの取数" Label="m2あたりの取数【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("m2あたりの取数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                            </table>
                                        </td>

                                        <td>

                                            <table>
                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <y:YTextBox ID="たて_しろあり" Label="たて_しろあり【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("たて_しろあり", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="よこ_しろあり" Label="よこ_しろあり【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("よこ_しろあり", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="縦取り数" Label="縦取り数【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("縦取り数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="横取り数" Label="横取り数【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("横取り数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="たて余" Label="たて余【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("たて余", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="よこ余" Label="よこ余【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("よこ余", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_取り数" Label="計算_取り数【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_取り数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_材料費" Label="計算_材料費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_材料費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_裁断" Label="計算_裁断【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_裁断", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_打抜" Label="計算_打抜【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_打抜", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_貼り" Label="計算_貼り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_貼り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_曲げ" Label="計算_曲げ【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_曲げ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_仕上げ" Label="計算_仕上げ【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("計算_仕上げ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_ロス管理" Label="計算_ロス管理【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_ロス管理", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                                <y:YTextBox ID="計算_材料費比" Label="計算_材料費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_材料費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_加工費小計" Label="計算_加工費小計【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_加工費小計", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_加工費比" Label="計算_加工費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_加工費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_単価" Label="計算_単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_単価", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />


                                            </table>
                                        </td>

                                        <td>
                                            <table>


                                                <y:YTextBox ID="定尺裁断_数" Label="定尺裁断_数【個所】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("定尺裁断_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="定尺裁断_所要時間" Label="定尺裁断_所要時間【秒】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("定尺裁断_所要時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="定尺裁断_割数" Label="定尺裁断_割数【個所】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("定尺裁断_割数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="寸法カット_数" Label="寸法カット_数【個所】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("寸法カット_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="寸法カット_所要時間" Label="寸法カット_所要時間【秒】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("寸法カット_所要時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="寸法カット_割数" Label="寸法カット_割数【個所】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("寸法カット_割数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="打抜_型取数" Label="打抜_型取数【ヶ】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("打抜_型取数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="打抜_プレス回数" Label="打抜_プレス回数【回/時】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("打抜_プレス回数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="曲げ_数" Label="曲げ_数【個所】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("曲げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="曲げ_秒数" Label="曲げ_秒数【秒】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("曲げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="曲げ_同時加工" Label="曲げ_同時加工【ヶ】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("曲げ_同時加工", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="仕上げ_数" Label="仕上げ_数【個所】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("仕上げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="仕上げ_秒数" Label="仕上げ_秒数【秒】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("仕上げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="仕上げ_同時加工" Label="仕上げ_同時加工【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("仕上げ_同時加工", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />

                                                <y:YTextBox ID="ロス管理_材比" Label="ロス管理_材比【%】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("ロス管理_材比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="ロス管理_加工比" Label="ロス管理_加工比【%】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("ロス管理_加工比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />

                                            </table>
                                        </td>

                                        <td>

                                            <table>
                                                <y:YTextBox ID="定尺裁断_時間" Label="定尺裁断_時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="定尺裁断_作業費" Label="定尺裁断_作業費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_作業費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="定尺裁断_単価当り" Label="定尺裁断_単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_単価当り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="寸法カット_時間" Label="寸法カット_時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="寸法カット_作業費" Label="寸法カット_作業費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_作業費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="寸法カット_単価当り" Label="寸法カット_単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_単価当り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="打抜_時間当たりの加工数" Label="打抜_時間当たりの加工数【ケ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("打抜_時間当たりの加工数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="打抜_単価当り" Label="打抜_単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("打抜_単価当り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="曲げ_時間" Label="曲げ_時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="曲げ_作業費" Label="曲げ_作業費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_作業費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="曲げ_単価当り" Label="曲げ_単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_単価当り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="仕上げ_時間" Label="仕上げ_時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="仕上げ_作業費" Label="仕上げ_作業費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_作業費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="仕上げ_単価当り" Label="仕上げ_単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_単価当り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="ロス管理_材_費用" Label="ロス管理_材_費用【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロス管理_材_費用", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="ロス管理_加工_費用" Label="ロス管理_加工_費用【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロス管理_加工_費用", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                            </table>
                                        </td>

                                        <td>
                                            <table>
                                                <y:YTextBox ID="見積_定尺裁断費比" Label="見積_定尺裁断費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_定尺裁断費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_定尺裁断費比" Label="計算_定尺裁断費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_定尺裁断費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_寸法カット費比" Label="計算_寸法カット費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_寸法カット費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <y:YTextBox ID="見積_打抜費比" Label="見積_打抜費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_打抜費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_打抜費比" Label="計算_打抜費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_打抜費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_貼り費比" Label="見積_貼り費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_貼り費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_貼り費比" Label="計算_貼り費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_貼り費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_曲げ費比" Label="見積_曲げ費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_曲げ費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_曲げ費比" Label="計算_曲げ費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_曲げ費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_仕上げ費比" Label="見積_仕上げ費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_仕上げ費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_仕上げ費比" Label="計算_仕上げ費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_仕上げ費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_ロス管理費比" Label="見積_ロス管理費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_ロス管理費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_ロス管理費比" Label="計算_ロス管理費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_ロス管理費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                            </table>
                                        </td>

                                        <td>
                                            <table>
                                                <y:YTextBox ID="ロット" Label="ロット【ヶ】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("ロット", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="丸め数" Label="丸め数【ヶ】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("丸め数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="商品重量" Label="商品重量【g】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("商品重量", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YCheckBox ID="削除フラグ" Label="削除フラグ【true/false】" IsGrid="false" ReadOnly="FALSE" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="40" />
                                                <y:YDropDownList ID="作成ユーザー" Label="作成ユーザー【-】" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("作成ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                                                <y:YDropDownList ID="最終更新ユーザー" Label="最終更新ユーザー【-】" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("最終更新ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                                                <y:YTextBox ID="作成日時" Label="作成日時【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                                <y:YTextBox ID="最終更新日時" Label="最終更新日時【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                            </table>
                                        </td>
                                    </tr>
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
                                    <tr>
                                        <td>

                                            <table>
                                                <tr class="titleRow">
                                                    <td colspan="2">基本情報</td>
                                                </tr>
                                                <y:YTextBox ID="単価ID" Label="単価ID【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("単価ID", "") %>' IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="部品コード" Label="部品コード【-】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("部品コード", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="部品名称" Label="部品名称【-】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("部品名称", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                                <y:YDropDownList ID="材料ID" Label="材料ID【-】" IsGrid="false" ReadOnly="FALSE" SelectedValue='<%# Bind("材料ID") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="材料DataSource" DataTextField="材料名称" DataValueField="材料ID" AppendDataBoundItems="true" Width="70" />
                                                <y:YTextBox ID="材料名称" Label="材料名称【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材料名称", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                                <y:YTextBox ID="材質大分類" Label="材質大分類【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材質大分類", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                                <y:YTextBox ID="材質" Label="材質【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材質", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                                <y:YTextBox ID="定尺寸法縦" Label="定尺寸法縦【mm】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("定尺寸法縦", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="定尺寸法横" Label="定尺寸法横【mm】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("定尺寸法横", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="厚み" Label="厚み【mm】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("厚み", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="40" />
                                                <y:YTextBox ID="定尺仕入金額" Label="定尺仕入金額【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("定尺仕入金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="定尺売り金額" Label="定尺売り金額【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("定尺売り金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="時間単価" Label="時間単価【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("時間単価", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="分単価" Label="分単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("分単価", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="秒単価" Label="秒単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("秒単価", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                            </table>
                                        </td>
                                        <td>

                                            <table>
                                                <y:YTextBox ID="仕入れ単価" Label="仕入れ単価【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("仕入れ単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="商品たて" Label="商品たて【mm】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("商品たて", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="商品よこ" Label="商品よこ【mm】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("商品よこ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="たてしろ" Label="たてしろ【mm】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("たてしろ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="よこしろ" Label="よこしろ【mm】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("よこしろ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <y:YTextBox ID="取り数" Label="取り数【ヶ】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("取り数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_材料費" Label="見積_材料費【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("見積_材料費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_裁断" Label="見積_裁断【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("見積_裁断", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_打抜" Label="見積_打抜【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("見積_打抜", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_貼り" Label="見積_貼り【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("見積_貼り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_曲げ" Label="見積_曲げ【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("見積_曲げ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_仕上げ" DefaultValue="" Label="見積_仕上げ【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("見積_仕上げ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_ロス管理" Label="見積_ロス管理【\】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("見積_ロス管理", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />

                                                <y:YTextBox ID="見積_材料費比" Label="見積_材料費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_材料費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_加工費小計" Label="見積_加工費小計【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_加工費小計", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_加工費比" Label="見積_加工費比【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_加工費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_単価" Label="見積_単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_単価", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                                <y:YTextBox ID="m2あたりの材料費" Label="m2あたりの材料費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("m2あたりの材料費", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="m2あたりの取数たて" Label="m2あたりの取数たて【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("m2あたりの取数たて", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="m2あたりの取数よこ" Label="m2あたりの取数よこ【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("m2あたりの取数よこ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="m2あたりの取数" Label="m2あたりの取数【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("m2あたりの取数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                            </table>
                                        </td>

                                        <td>

                                            <table>
                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <y:YTextBox ID="たて_しろあり" Label="たて_しろあり【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("たて_しろあり", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="よこ_しろあり" Label="よこ_しろあり【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("よこ_しろあり", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="縦取り数" Label="縦取り数【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("縦取り数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="横取り数" Label="横取り数【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("横取り数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="たて余" Label="たて余【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("たて余", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="よこ余" Label="よこ余【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("よこ余", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_取り数" Label="計算_取り数【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_取り数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_材料費" Label="計算_材料費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_材料費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_裁断" Label="計算_裁断【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_裁断", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_打抜" Label="計算_打抜【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_打抜", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_貼り" Label="計算_貼り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_貼り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_曲げ" Label="計算_曲げ【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_曲げ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_仕上げ" DefaultValue="" Label="計算_仕上げ【\】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("計算_仕上げ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_ロス管理" Label="計算_ロス管理【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_ロス管理", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_材料費比" Label="計算_材料費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_材料費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_加工費小計" Label="計算_加工費小計【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_加工費小計", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_加工費比" Label="計算_加工費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_加工費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_単価" Label="計算_単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_単価", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />


                                            </table>
                                        </td>

                                        <td>
                                            <table>


                                                <y:YTextBox ID="定尺裁断_数" Label="定尺裁断_数【個所】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("定尺裁断_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="定尺裁断_所要時間" Label="定尺裁断_所要時間【秒】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("定尺裁断_所要時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="定尺裁断_割数" Label="定尺裁断_割数【個所】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("定尺裁断_割数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="寸法カット_数" Label="寸法カット_数【個所】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("寸法カット_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="寸法カット_所要時間" Label="寸法カット_所要時間【秒】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("寸法カット_所要時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="寸法カット_割数" Label="寸法カット_割数【個所】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("寸法カット_割数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="打抜_型取数" Label="打抜_型取数【ヶ】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("打抜_型取数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="打抜_プレス回数" Label="打抜_プレス回数【回/時】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("打抜_プレス回数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="曲げ_数" Label="曲げ_数【個所】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("曲げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="曲げ_秒数" Label="曲げ_秒数【秒】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("曲げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="曲げ_同時加工" Label="曲げ_同時加工【ヶ】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("曲げ_同時加工", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="仕上げ_数" Label="仕上げ_数【個所】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("仕上げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="仕上げ_秒数" Label="仕上げ_秒数【秒】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("仕上げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="仕上げ_同時加工" DefaultValue="" Label="仕上げ_同時加工【ヶ】" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("仕上げ_同時加工", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="ロス管理_材比" Label="ロス管理_材比【%】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("ロス管理_材比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="ロス管理_加工比" Label="ロス管理_加工比【%】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("ロス管理_加工比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />

                                            </table>
                                        </td>

                                        <td>

                                            <table>
                                                <y:YTextBox ID="定尺裁断_時間" Label="定尺裁断_時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="定尺裁断_作業費" Label="定尺裁断_作業費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_作業費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="定尺裁断_単価当り" Label="定尺裁断_単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_単価当り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="寸法カット_時間" Label="寸法カット_時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="寸法カット_作業費" Label="寸法カット_作業費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_作業費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="寸法カット_単価当り" Label="寸法カット_単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_単価当り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="打抜_時間当たりの加工数" Label="打抜_時間当たりの加工数【ケ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("打抜_時間当たりの加工数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="打抜_単価当り" Label="打抜_単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("打抜_単価当り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="曲げ_時間" Label="曲げ_時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="曲げ_作業費" Label="曲げ_作業費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_作業費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="曲げ_単価当り" Label="曲げ_単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_単価当り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="仕上げ_時間" Label="仕上げ_時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="仕上げ_作業費" Label="仕上げ_作業費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_作業費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="仕上げ_単価当り" Label="仕上げ_単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_単価当り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="ロス管理_材_費用" Label="ロス管理_材_費用【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロス管理_材_費用", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="ロス管理_加工_費用" Label="ロス管理_加工_費用【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロス管理_加工_費用", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                            </table>
                                        </td>

                                        <td>
                                            <table>
                                                <y:YTextBox ID="見積_定尺裁断費比" Label="見積_定尺裁断費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_定尺裁断費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_定尺裁断費比" Label="計算_定尺裁断費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_定尺裁断費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_寸法カット費比" Label="計算_寸法カット費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_寸法カット費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <y:YTextBox ID="見積_打抜費比" Label="見積_打抜費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_打抜費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_打抜費比" Label="計算_打抜費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_打抜費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_貼り費比" Label="見積_貼り費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_貼り費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_貼り費比" Label="計算_貼り費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_貼り費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_曲げ費比" Label="見積_曲げ費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_曲げ費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_曲げ費比" Label="計算_曲げ費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_曲げ費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_仕上げ費比" Label="見積_仕上げ費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_仕上げ費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_仕上げ費比" Label="計算_仕上げ費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_仕上げ費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_ロス管理費比" Label="見積_ロス管理費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_ロス管理費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_ロス管理費比" Label="計算_ロス管理費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_ロス管理費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                            </table>
                                        </td>

                                        <td>
                                            <table>
                                                <y:YTextBox ID="ロット" Label="ロット【ヶ】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("ロット", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="丸め数" Label="丸め数【ヶ】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("丸め数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="商品重量" Label="商品重量【g】" IsGrid="false" ReadOnly="FALSE" Text='<%# Bind("商品重量", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YCheckBox ID="削除フラグ" Label="削除フラグ【true/false】" IsGrid="false" ReadOnly="FALSE" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="40" />
                                                <y:YDropDownList ID="作成ユーザー" Label="作成ユーザー【-】" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("作成ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                                                <y:YDropDownList ID="最終更新ユーザー" Label="最終更新ユーザー【-】" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("最終更新ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                                                <y:YTextBox ID="作成日時" Label="作成日時【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                                <y:YTextBox ID="最終更新日時" Label="最終更新日時【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                            </table>
                                        </td>
                                    </tr>
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
                                                <tr class="titleRow">
                                                    <td colspan="2">基本情報</td>
                                                </tr>
                                                <y:YTextBox ID="単価ID" Label="単価ID【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("単価ID", "") %>' IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="部品コード" Label="部品コード【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("部品コード", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="部品名称" Label="部品名称【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("部品名称", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                                <y:YDropDownList ID="材料ID" Label="材料ID【-】" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("材料ID") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="材料DataSource" DataTextField="材料名称" DataValueField="材料ID" AppendDataBoundItems="true" Width="70" />
                                                <y:YTextBox ID="材料名称" Label="材料名称【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材料名称", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                                <y:YTextBox ID="材質大分類" Label="材質大分類【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材質大分類", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                                <y:YTextBox ID="材質" Label="材質【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材質", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                                <y:YTextBox ID="定尺寸法縦" Label="定尺寸法縦【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺寸法縦", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="定尺寸法横" Label="定尺寸法横【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺寸法横", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="厚み" Label="厚み【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("厚み", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="40" />
                                                <y:YTextBox ID="定尺仕入金額" Label="定尺仕入金額【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺仕入金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="定尺売り金額" Label="定尺売り金額【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺売り金額", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="時間単価" Label="時間単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("時間単価", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="分単価" Label="分単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("分単価", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="秒単価" Label="秒単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("秒単価", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                            </table>
                                        </td>
                                        <td>

                                            <table>
                                                <y:YTextBox ID="仕入れ単価" Label="仕入れ単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕入れ単価", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="商品たて" Label="商品たて【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("商品たて", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="商品よこ" Label="商品よこ【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("商品よこ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="たてしろ" Label="たてしろ【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("たてしろ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="よこしろ" Label="よこしろ【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("よこしろ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <y:YTextBox ID="取り数" Label="取り数【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("取り数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_材料費" Label="見積_材料費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_材料費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_裁断" Label="見積_裁断【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_裁断", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_打抜" Label="見積_打抜【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_打抜", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_貼り" Label="見積_貼り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_貼り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_曲げ" Label="見積_曲げ【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_曲げ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_仕上げ" Label="見積_仕上げ【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_仕上げ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="見積_ロス管理" Label="見積_ロス管理【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_ロス管理", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />


                                                <y:YTextBox ID="見積_材料費比" Label="見積_材料費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_材料費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_加工費小計" Label="見積_加工費小計【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_加工費小計", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_加工費比" Label="見積_加工費比【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_加工費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_単価" Label="見積_単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_単価", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                                <y:YTextBox ID="m2あたりの材料費" Label="m2あたりの材料費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("m2あたりの材料費", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="m2あたりの取数たて" Label="m2あたりの取数たて【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("m2あたりの取数たて", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="m2あたりの取数よこ" Label="m2あたりの取数よこ【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("m2あたりの取数よこ", "{0:f2}") %>' IsRequired="false" IsDate="false" DataFormatString="{0:c2}" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="m2あたりの取数" Label="m2あたりの取数【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("m2あたりの取数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                            </table>
                                        </td>

                                        <td>

                                            <table>
                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <y:YTextBox ID="たて_しろあり" Label="たて_しろあり【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("たて_しろあり", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="よこ_しろあり" Label="よこ_しろあり【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("よこ_しろあり", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="縦取り数" Label="縦取り数【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("縦取り数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="横取り数" Label="横取り数【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("横取り数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="たて余" Label="たて余【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("たて余", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="よこ余" Label="よこ余【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("よこ余", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_取り数" Label="計算_取り数【mm】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_取り数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_材料費" Label="計算_材料費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_材料費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_裁断" Label="計算_裁断【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_裁断", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_打抜" Label="計算_打抜【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_打抜", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_貼り" Label="計算_貼り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_貼り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_曲げ" Label="計算_曲げ【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_曲げ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_仕上げ" Label="計算_仕上げ【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_仕上げ", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_ロス管理" Label="計算_ロス管理【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_ロス管理", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                                <y:YTextBox ID="計算_材料費比" Label="計算_材料費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_材料費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_加工費小計" Label="計算_加工費小計【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_加工費小計", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_加工費比" Label="計算_加工費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_加工費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_単価" Label="計算_単価【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_単価", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />


                                            </table>
                                        </td>

                                        <td>
                                            <table>


                                                <y:YTextBox ID="定尺裁断_数" Label="定尺裁断_数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="定尺裁断_所要時間" Label="定尺裁断_所要時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_所要時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="定尺裁断_割数" Label="定尺裁断_割数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_割数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="寸法カット_数" Label="寸法カット_数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="寸法カット_所要時間" Label="寸法カット_所要時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_所要時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="寸法カット_割数" Label="寸法カット_割数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_割数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="打抜_型取数" Label="打抜_型取数【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("打抜_型取数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="打抜_プレス回数" Label="打抜_プレス回数【回/時】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("打抜_プレス回数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="曲げ_数" Label="曲げ_数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="曲げ_秒数" Label="曲げ_秒数【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="曲げ_同時加工" Label="曲げ_同時加工【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_同時加工", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="仕上げ_数" Label="仕上げ_数【個所】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="仕上げ_秒数" Label="仕上げ_秒数【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_秒数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />

                                                <y:YTextBox ID="仕上げ_同時加工" Label="仕上げ_同時加工【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_同時加工", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="ロス管理_材比" Label="ロス管理_材比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロス管理_材比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="ロス管理_加工比" Label="ロス管理_加工比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロス管理_加工比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />

                                            </table>
                                        </td>

                                        <td>

                                            <table>
                                                <y:YTextBox ID="定尺裁断_時間" Label="定尺裁断_時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="定尺裁断_作業費" Label="定尺裁断_作業費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_作業費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="定尺裁断_単価当り" Label="定尺裁断_単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("定尺裁断_単価当り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="寸法カット_時間" Label="寸法カット_時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="寸法カット_作業費" Label="寸法カット_作業費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_作業費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="寸法カット_単価当り" Label="寸法カット_単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("寸法カット_単価当り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="打抜_時間当たりの加工数" Label="打抜_時間当たりの加工数【ケ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("打抜_時間当たりの加工数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="打抜_単価当り" Label="打抜_単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("打抜_単価当り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="曲げ_時間" Label="曲げ_時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="曲げ_作業費" Label="曲げ_作業費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_作業費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="曲げ_単価当り" Label="曲げ_単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("曲げ_単価当り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="仕上げ_時間" Label="仕上げ_時間【秒】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_時間", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="仕上げ_作業費" Label="仕上げ_作業費【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_作業費", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="仕上げ_単価当り" Label="仕上げ_単価当り【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("仕上げ_単価当り", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="ロス管理_材_費用" Label="ロス管理_材_費用【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロス管理_材_費用", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="ロス管理_加工_費用" Label="ロス管理_加工_費用【\】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロス管理_加工_費用", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                            </table>
                                        </td>

                                        <td>
                                            <table>
                                                <y:YTextBox ID="見積_定尺裁断費比" Label="見積_定尺裁断費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_定尺裁断費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_定尺裁断費比" Label="計算_定尺裁断費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_定尺裁断費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_寸法カット費比" Label="計算_寸法カット費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_寸法カット費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <tr class="blankrow">
                                                    <td colspan="2"></td>
                                                </tr>
                                                <y:YTextBox ID="見積_打抜費比" Label="見積_打抜費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_打抜費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_打抜費比" Label="計算_打抜費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_打抜費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_貼り費比" Label="見積_貼り費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_貼り費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_貼り費比" Label="計算_貼り費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_貼り費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_曲げ費比" Label="見積_曲げ費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_曲げ費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_曲げ費比" Label="計算_曲げ費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_曲げ費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_仕上げ費比" Label="見積_仕上げ費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_仕上げ費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_仕上げ費比" Label="計算_仕上げ費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_仕上げ費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="見積_ロス管理費比" Label="見積_ロス管理費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("見積_ロス管理費比", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />
                                                <y:YTextBox ID="計算_ロス管理費比" Label="計算_ロス管理費比【%】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("計算_ロス管理費比", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" Width="70" />

                                            </table>
                                        </td>

                                        <td>
                                            <table>
                                                <y:YTextBox ID="ロット" Label="ロット【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ロット", "") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="丸め数" Label="丸め数【ヶ】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("丸め数", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YTextBox ID="商品重量" Label="商品重量【g】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("商品重量", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="70" />
                                                <y:YCheckBox ID="削除フラグ" Label="削除フラグ【true/false】" IsGrid="false" ReadOnly="TRUE" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="40" />
                                                <y:YDropDownList ID="作成ユーザー" Label="作成ユーザー【-】" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("作成ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                                                <y:YDropDownList ID="最終更新ユーザー" Label="最終更新ユーザー【-】" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("最終更新ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                                                <y:YTextBox ID="作成日時" Label="作成日時【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Input" Width="100" />
                                                <y:YTextBox ID="最終更新日時" Label="最終更新日時【-】" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Input" Width="100" />
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
                部品コード = @部品コード,部品名称 = @部品名称,材料ID = @材料ID,材料名称 = @材料名称,材質大分類 = @材質大分類,材質 = @材質,定尺寸法縦 = @定尺寸法縦,定尺寸法横 = @定尺寸法横,厚み = @厚み,定尺仕入金額 = @定尺仕入金額,定尺売り金額 = @定尺売り金額,時間単価 = @時間単価,分単価 = @分単価,秒単価 = @秒単価,仕入れ単価 = @仕入れ単価,取り数 = @取り数,商品たて = @商品たて,商品よこ = @商品よこ,たてしろ = @たてしろ,よこしろ = @よこしろ,見積_材料費 = @見積_材料費,見積_裁断 = @見積_裁断,見積_打抜 = @見積_打抜,見積_貼り = @見積_貼り,見積_曲げ = @見積_曲げ,見積_仕上げ = @見積_仕上げ,見積_ロス管理 = @見積_ロス管理,見積_材料費比 = @見積_材料費比,見積_加工費小計 = @見積_加工費小計,見積_加工費比 = @見積_加工費比,見積_単価 = @見積_単価,m2あたりの材料費 = @m2あたりの材料費,m2あたりの取数たて = @m2あたりの取数たて,m2あたりの取数よこ = @m2あたりの取数よこ,m2あたりの取数 = @m2あたりの取数,計算_取り数 = @計算_取り数,たて_しろあり = @たて_しろあり,よこ_しろあり = @よこ_しろあり,縦取り数 = @縦取り数,横取り数 = @横取り数,たて余 = @たて余,よこ余 = @よこ余,計算_材料費 = @計算_材料費,計算_裁断 = @計算_裁断,計算_打抜 = @計算_打抜,計算_貼り = @計算_貼り,計算_曲げ = @計算_曲げ,計算_仕上げ = @計算_仕上げ,計算_ロス管理 = @計算_ロス管理,計算_材料費比 = @計算_材料費比,計算_加工費小計 = @計算_加工費小計,計算_加工費比 = @計算_加工費比,計算_単価 = @計算_単価,定尺裁断_数 = @定尺裁断_数,定尺裁断_所要時間 = @定尺裁断_所要時間,定尺裁断_割数 = @定尺裁断_割数,寸法カット_数 = @寸法カット_数,寸法カット_所要時間 = @寸法カット_所要時間,寸法カット_割数 = @寸法カット_割数,打抜_型取数 = @打抜_型取数,打抜_プレス回数 = @打抜_プレス回数,曲げ_数 = @曲げ_数,曲げ_秒数 = @曲げ_秒数,曲げ_同時加工 = @曲げ_同時加工,仕上げ_数 = @仕上げ_数,仕上げ_秒数 = @仕上げ_秒数,仕上げ_同時加工 = @仕上げ_同時加工,ロス管理_材比 = @ロス管理_材比,ロス管理_加工比 = @ロス管理_加工比,定尺裁断_時間 = @定尺裁断_時間,定尺裁断_作業費 = @定尺裁断_作業費,定尺裁断_単価当り = @定尺裁断_単価当り,寸法カット_時間 = @寸法カット_時間,寸法カット_作業費 = @寸法カット_作業費,寸法カット_単価当り = @寸法カット_単価当り,打抜_時間当たりの加工数 = @打抜_時間当たりの加工数,打抜_単価当り = @打抜_単価当り,曲げ_時間 = @曲げ_時間,曲げ_作業費 = @曲げ_作業費,曲げ_単価当り = @曲げ_単価当り,仕上げ_時間 = @仕上げ_時間,仕上げ_作業費 = @仕上げ_作業費,仕上げ_単価当り = @仕上げ_単価当り,ロス管理_材_費用 = @ロス管理_材_費用,ロス管理_加工_費用 = @ロス管理_加工_費用,見積_定尺裁断費比 = @見積_定尺裁断費比,計算_定尺裁断費比 = @計算_定尺裁断費比,計算_寸法カット費比 = @計算_寸法カット費比,見積_打抜費比 = @見積_打抜費比,計算_打抜費比 = @計算_打抜費比,見積_貼り費比 = @見積_貼り費比,計算_貼り費比 = @計算_貼り費比,見積_曲げ費比 = @見積_曲げ費比,計算_曲げ費比 = @計算_曲げ費比,見積_仕上げ費比 = @見積_仕上げ費比,計算_仕上げ費比 = @計算_仕上げ費比,見積_ロス管理費比 = @見積_ロス管理費比,計算_ロス管理費比 = @計算_ロス管理費比,ロット = @ロット,丸め数 = @丸め数,商品重量 = @商品重量,削除フラグ = @削除フラグ,最終更新ユーザー = @最終更新ユーザー, 最終更新日時 = @最終更新日時
                where 単価ID = @original_単価ID and 最終更新日時 = @original_最終更新日時"
                InsertCommand=" insert into T単価 
                (部品コード,部品名称,材料ID,材料名称,材質大分類,材質,定尺寸法縦,定尺寸法横,厚み,定尺仕入金額,定尺売り金額,時間単価,分単価,秒単価,仕入れ単価,取り数,商品たて,商品よこ,たてしろ,よこしろ,見積_材料費,見積_裁断,見積_打抜,見積_貼り,見積_曲げ,見積_仕上げ,見積_ロス管理,見積_材料費比,見積_加工費小計,見積_加工費比,見積_単価,m2あたりの材料費,m2あたりの取数たて,m2あたりの取数よこ,m2あたりの取数,計算_取り数,たて_しろあり,よこ_しろあり,縦取り数,横取り数,たて余,よこ余,計算_材料費,計算_裁断,計算_打抜,計算_貼り,計算_曲げ,計算_仕上げ,計算_ロス管理,計算_材料費比,計算_加工費小計,計算_加工費比,計算_単価,定尺裁断_数,定尺裁断_所要時間,定尺裁断_割数,寸法カット_数,寸法カット_所要時間,寸法カット_割数,打抜_型取数,打抜_プレス回数,曲げ_数,曲げ_秒数,曲げ_同時加工,仕上げ_数,仕上げ_秒数,仕上げ_同時加工,ロス管理_材比,ロス管理_加工比,定尺裁断_時間,定尺裁断_作業費,定尺裁断_単価当り,寸法カット_時間,寸法カット_作業費,寸法カット_単価当り,打抜_時間当たりの加工数,打抜_単価当り,曲げ_時間,曲げ_作業費,曲げ_単価当り,仕上げ_時間,仕上げ_作業費,仕上げ_単価当り,ロス管理_材_費用,ロス管理_加工_費用,見積_定尺裁断費比,計算_定尺裁断費比,計算_寸法カット費比,見積_打抜費比,計算_打抜費比,見積_貼り費比,計算_貼り費比,見積_曲げ費比,計算_曲げ費比,見積_仕上げ費比,計算_仕上げ費比,見積_ロス管理費比,計算_ロス管理費比,ロット,丸め数,商品重量,削除フラグ,作成ユーザー,最終更新ユーザー,作成日時,最終更新日時) 
                values (@部品コード,@部品名称,@材料ID,@材料名称,@材質大分類,@材質,@定尺寸法縦,@定尺寸法横,@厚み,@定尺仕入金額,@定尺売り金額,@時間単価,@分単価,@秒単価,@仕入れ単価,@取り数,@商品たて,@商品よこ,@たてしろ,@よこしろ,@見積_材料費,@見積_裁断,@見積_打抜,@見積_貼り,@見積_曲げ,@見積_仕上げ,@見積_ロス管理,@見積_材料費比,@見積_加工費小計,@見積_加工費比,@見積_単価,@m2あたりの材料費,@m2あたりの取数たて,@m2あたりの取数よこ,@m2あたりの取数,@計算_取り数,@たて_しろあり,@よこ_しろあり,@縦取り数,@横取り数,@たて余,@よこ余,@計算_材料費,@計算_裁断,@計算_打抜,@計算_貼り,@計算_曲げ,@計算_仕上げ,@計算_ロス管理,@計算_材料費比,@計算_加工費小計,@計算_加工費比,@計算_単価,@定尺裁断_数,@定尺裁断_所要時間,@定尺裁断_割数,@寸法カット_数,@寸法カット_所要時間,@寸法カット_割数,@打抜_型取数,@打抜_プレス回数,@曲げ_数,@曲げ_秒数,@曲げ_同時加工,@仕上げ_数,@仕上げ_秒数,@仕上げ_同時加工,@ロス管理_材比,@ロス管理_加工比,@定尺裁断_時間,@定尺裁断_作業費,@定尺裁断_単価当り,@寸法カット_時間,@寸法カット_作業費,@寸法カット_単価当り,@打抜_時間当たりの加工数,@打抜_単価当り,@曲げ_時間,@曲げ_作業費,@曲げ_単価当り,@仕上げ_時間,@仕上げ_作業費,@仕上げ_単価当り,@ロス管理_材_費用,@ロス管理_加工_費用,@見積_定尺裁断費比,@計算_定尺裁断費比,@計算_寸法カット費比,@見積_打抜費比,@計算_打抜費比,@見積_貼り費比,@計算_貼り費比,@見積_曲げ費比,@計算_曲げ費比,@見積_仕上げ費比,@計算_仕上げ費比,@見積_ロス管理費比,@計算_ロス管理費比,@ロット,@丸め数,@商品重量,@削除フラグ,@作成ユーザー,@最終更新ユーザー,@作成日時,@最終更新日時)
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
                    <asp:FormParameter Name="時間単価" FormField="時間単価" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="分単価" FormField="分単価" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="秒単価" FormField="秒単価" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="仕入れ単価" FormField="仕入れ単価" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="取り数" FormField="取り数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="商品たて" FormField="商品たて" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="商品よこ" FormField="商品よこ" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="たてしろ" FormField="たてしろ" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="よこしろ" FormField="よこしろ" ConvertEmptyStringToNull="true" Type="Decimal" />
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
                    <asp:FormParameter Name="m2あたりの材料費" FormField="m2あたりの材料費" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="m2あたりの取数たて" FormField="m2あたりの取数たて" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="m2あたりの取数よこ" FormField="m2あたりの取数よこ" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="m2あたりの取数" FormField="m2あたりの取数" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="計算_取り数" FormField="計算_取り数" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="たて_しろあり" FormField="たて_しろあり" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="よこ_しろあり" FormField="よこ_しろあり" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="縦取り数" FormField="縦取り数" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="横取り数" FormField="横取り数" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="たて余" FormField="たて余" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="よこ余" FormField="よこ余" ConvertEmptyStringToNull="true" Type="Decimal" />
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
                    <asp:FormParameter Name="ロット" FormField="ロット" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="丸め数" FormField="丸め数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="商品重量" FormField="商品重量" ConvertEmptyStringToNull="true" Type="Int32" />
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
                    <asp:FormParameter Name="定尺寸法縦" FormField="定尺寸法縦" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="定尺寸法横" FormField="定尺寸法横" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="厚み" FormField="厚み" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="定尺仕入金額" FormField="定尺仕入金額" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="定尺売り金額" FormField="定尺売り金額" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="時間単価" FormField="時間単価" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="分単価" FormField="分単価" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="秒単価" FormField="秒単価" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="仕入れ単価" FormField="仕入れ単価" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="取り数" FormField="取り数" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="商品たて" FormField="商品たて" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="商品よこ" FormField="商品よこ" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="たてしろ" FormField="たてしろ" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="よこしろ" FormField="よこしろ" ConvertEmptyStringToNull="true" Type="Decimal" />
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
                    <asp:FormParameter Name="m2あたりの材料費" FormField="m2あたりの材料費" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="m2あたりの取数たて" FormField="m2あたりの取数たて" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="m2あたりの取数よこ" FormField="m2あたりの取数よこ" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="m2あたりの取数" FormField="m2あたりの取数" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="計算_取り数" FormField="計算_取り数" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="たて_しろあり" FormField="たて_しろあり" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="よこ_しろあり" FormField="よこ_しろあり" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="縦取り数" FormField="縦取り数" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="横取り数" FormField="横取り数" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="たて余" FormField="たて余" ConvertEmptyStringToNull="true" Type="Decimal" />
                    <asp:FormParameter Name="よこ余" FormField="よこ余" ConvertEmptyStringToNull="true" Type="Decimal" />
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

