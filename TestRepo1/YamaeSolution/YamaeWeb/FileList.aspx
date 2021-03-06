﻿<%@ Page Language="C#" MasterPageFile="~/YMasterPage.master" AutoEventWireup="true" CodeFile="FileList.aspx.cs" Inherits="FileList" %>


<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="y" Namespace="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>ファイル一覧</title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">


    <script type="text/javascript">


        function rowClick(dataKey) {
            console.log(dataKey);

            var element = $("#popupPriceChart");

            var req = new Request();

            req.ajax({
                url: "WsTFile.asmx/Get",
                data: { dataKey: dataKey },
                success: function (data, textStatus, xhr) {
                    console.log(data);
                    console.log(JSON.parse(data));

                    var json = JSON.parse(data);
                    var tファイル = json["Tファイル"][0];
                    var tファイルタグ = json["Tファイルタグ"];

                    $("#ファイルID").text(tファイル.ファイルID);
                    $("#ファイルパス").text(tファイル.ファイルパス);
                    $("#ファイルサイズ").text(tファイル.ファイルサイズ);
                    $("#担当者").val(tファイル.担当者);
                    $("#備考").val(tファイル.備考);

                    for(var i in tファイルタグ) {
                        console.log(i);
                        var row = tファイルタグ[i];
                        console.log(row);
                    }
                    

                    // ajaxでコール後
                    element.dialog({
                        position: ["center", "middle"]
                        , width: 1000

                    , height: 510

                    });
                },
                error: function (xhr, textStatus, errorThrown) {
                    alert(xhr.responseText);
                }
            });

        }

        var element = $("#popupPriceChart");
        var title = "タグ編集";
        element.dialog({
            appendTo: "#dialog_parent",
            position: ["center", "middle"],
            title: title,
            width: 1000,

            height: 510,
            open: function (event, ui) {
                $(this).parent().children(".ui-dialog-titlebar").css("height", "20px");
            }
        });
        element.dialog("close");


        function pageLoad() {
            $("#タグ追加").click(function () {
                var data ={
                    ファイルID:$("#ファイルID").text(),
                    ファイルタグタイプID: $("#タグタイプ").val(),
                    値１: $("#値１").val(),
                    値２: $("#値２").val(),
                    値３: $("#値３").val(),
                    値４: $("#値４").val(),
                    値５: $("#値５").val(),
                    備考: $("#備考").val(),
                    //削除フラグ: "False", //$("#削除フラグ").val(),
                    //
                    };

                console.log(data);

                var req = new Request();

                req.ajax({
                    url: "WsTFile.asmx/Add",
                    parseJson : true,
                    data: data ,
                    success: function (data, textStatus, xhr) {
                        console.log("1234:" + data);
                        console.log(JSON.parse(data));

                        rowClick($("#ファイルID").text());
                    },
                    error: function (xhr, textStatus, errorThrown) {
                        alert(xhr.responseText);
                    }
                });
            });
        }
    </script>


</asp:Content>


<asp:Content ID="Content8" ContentPlaceHolderID="Chart" runat="Server">
    <div id="popupPriceChart" style="display: none">
        ファイル名：<span id="ファイルパス"  ></span>(<span id="ファイルサイズ" ></span>)(<span id="ファイルID"></span>)

        <table>
            <tr>
                <td>       
                    担当者：<select id="担当者">
                        <option value="0">管理者</option>
                    </select>
                    <br />
                    備考：<textarea id="備考" rows="15" cols="60"></textarea>
                    <br />

                </td>
                <td>
                    <table>
                        <tr>
                            <td>タグ名称１</td>
                            <td>
                                <input type="button" value="削除" /></td>
                        </tr>
                        <tr>
                            <td>タグ名称１</td>
                            <td>
                                <input type="button" value="削除" /></td>
                        </tr>
                        <tr>
                            <td>タグ名称１</td>
                            <td>
                                <input type="button" value="削除" /></td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <select id="タグタイプ">
                                    <option value="1">試作注文書</option>
                                    <option value="2">試作見積書</option>
                                    <option value="3">コスト算出</option>
                                </select></td>
                            <td>
                                <input type="button" id="タグ追加" value="追加" /></td>
                        </tr>
                        <tr>
                            <td><span id="値１">値１</span></td>
                            <td>
                                <input type="text" /></td>
                        </tr>
                        <tr>
                            <td><span id="値２">値２</span></td>
                            <td>
                                <input type="text" /></td>
                        </tr>
                        <tr>
                            <td><span id="値３">値３</span></td>
                            <td>
                                <input type="text" /></td>
                        </tr>
                        <tr>
                            <td><span id="値４">値４</span></td>
                            <td>
                                <input type="text" /></td>
                        </tr>
                        <tr>
                            <td><span id="値５">値５</span></td>
                            <td>
                                <input type="text" /></td>
                        </tr>
                    </table>

                </td>
            </tr>
        </table>


    </div>

</asp:Content>


<asp:Content ID="Content5" ContentPlaceHolderID="Main" runat="Server">
    <asp:Button runat="server" ID="検索" Text="検索" OnClick="検索_Click" />
    <asp:Button runat="server" ID="Clear" Text="クリア" OnClick="Clear_Click" />
    <y:YDropDownList runat="server" ID="ページサイズ" OnSelectedIndexChanged="pageSize_SelectedIndexChanged" />


    <y:BaseGridView CssClass="GridView" ID="mainGridView" runat="server"
        DataSourceID="mainDataSource"
        DataKeyNames="ファイルID,最終更新日時" AutoGenerateColumns="false"
        AllowPaging="true"
        PageSize="12"
        AllowRowClick="false"
        AllowSorting="true"
        PagerStyle-CssClass="grid_pager">
        <Columns>
            <asp:CommandField ShowEditButton="true" ControlStyle-Width="25" ItemStyle-Width="25"></asp:CommandField>
            <y:YBoundField HeaderText="ファイルID" DataFormatStringEditing="" DataField="ファイルID" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="" />
            <y:YBoundField HeaderText="ファイルパス" DataFormatStringEditing="" DataField="ファイルパス" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="" />
            <y:YBoundField HeaderText="拡張子" DataFormatStringEditing="" DataField="拡張子" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="" />
            <y:YBoundField HeaderText="ファイルサイズ" DataFormatStringEditing="" DataField="ファイルサイズ" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="" />
            <y:YBoundField HeaderText="ファイル作成日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="ファイル作成日時" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="" />
            <y:YBoundField HeaderText="ファイル更新日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="ファイル更新日時" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="" />
            <y:YBoundField HeaderText="ファイルアクセス日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="ファイルアクセス日時" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="" />
            <y:YBoundField HeaderText="ファイル属性" DataFormatStringEditing="" DataField="ファイル属性" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="" />
            <y:YBoundField HeaderText="担当者" DataFormatStringEditing="" DataField="担当者" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" IsDropDownList="true" />
            <y:YBoundField HeaderText="備考" DataFormatStringEditing="" DataField="備考" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
            <y:YBoundField HeaderText="削除フラグ" DataFormatStringEditing="" DataField="削除フラグ" ReadOnly="FALSE" IsBoolean="TRUE" ControlStyle-Width="40" ItemStyle-Width="40" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="" />
            <y:YBoundField HeaderText="作成ユーザー" DataFormatStringEditing="" DataField="作成ユーザー" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" IsDropDownList="true" />
            <y:YBoundField HeaderText="最終更新ユーザー" DataFormatStringEditing="" DataField="最終更新ユーザー" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" IsDropDownList="true" />
            <y:YBoundField HeaderText="作成日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="作成日時" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="" />
            <y:YBoundField HeaderText="最終更新日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="最終更新日時" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="" />
        </Columns>
    </y:BaseGridView>
    <y:BaseValidationSummary ID="mainValidationSummary" runat="server" EnableClientScript="true" />

    <br />
    <y:BaseFormView ID="mainFormView"
        runat="server"
        DataKeyNames="ファイルID,最終更新日時" DataSourceID="mainDataSource" BackColor="#DEBA84"
        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3"
        CellSpacing="2" GridLines="Both"
        AllowPaging="false">
        <EditItemTemplate>
        </EditItemTemplate>
        <EditRowStyle BackColor="pink" Font-Bold="True" ForeColor="black" />
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
        </InsertItemTemplate>
        <ItemTemplate>
        </ItemTemplate>
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <EmptyDataTemplate>
            <asp:LinkButton ID="LinkButton8" CommandName="New" runat="server" Text="新規追加" />
        </EmptyDataTemplate>
    </y:BaseFormView>

    <y:BaseSqlDataSource ID="mainDataSource" runat="server"
        SelectCommand="select * from Tファイル"
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original_{0}"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        OnUpdating="mainDataSource_Updating"
        OnInserting="mainDataSource_Inserting">

        <InsertParameters>
        </InsertParameters>

        <UpdateParameters>
        </UpdateParameters>
        <DeleteParameters>
        </DeleteParameters>
    </y:BaseSqlDataSource>


    <y:BaseSqlDataSource runat="server" ID="ユーザーDataSource"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        SelectCommand="SELECT ユーザーId, ユーザー名 FROM `Mユーザー` ">
    </y:BaseSqlDataSource>


</asp:Content>
