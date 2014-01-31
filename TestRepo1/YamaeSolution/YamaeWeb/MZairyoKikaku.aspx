<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MZairyoKikaku.aspx.cs" Inherits="MZairyoKikaku" %>

<%@ Register TagPrefix="y" Namespace="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>材料規格マスタメンテナンス画面</title>
    <link href="css/style.css" rel="stylesheet" />
</head>
<body>

    <form id="form1" runat="server">
        <div>

            <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Menu.aspx" Text="メニュー画面へ" />
            <br />

            <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
                EnableScriptLocalization="true" ID="mainScriptManager" />



                
<y:YTextBox   id="検索ステータス" DefaultValue=""  Label="ステータス"  IsGrid="false"    ValidationGroup="Search"    IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
<y:YDropDownList   id="検索得意先" DefaultValue=""  Label="得意先"  IsGrid="false"    ValidationGroup="Search"    IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="得意先DataSource" DataTextField="会社名称" DataValueField="会社ID"   AppendDataBoundItems="true"   AddEmptyItem="true" />
<y:YTextBox   id="検索規格番号" DefaultValue=""  Label="規格番号"  IsGrid="false"    ValidationGroup="Search"    IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
<y:YTextBox   id="検索材料名" DefaultValue=""  Label="材料名"  IsGrid="false"    ValidationGroup="Search"    IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
<y:YTextBox   id="検索No" DefaultValue=""  Label="No"  IsGrid="false"    ValidationGroup="Search"    IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
<y:YCheckBox   id="検索山恵フラグ" DefaultValue=""  Label="山恵フラグ"  IsGrid="false"    ValidationGroup="Search"    IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
            <br />
<y:YDropDownList   id="検索仕入れ先" DefaultValue=""  Label="仕入れ先"  IsGrid="false"    ValidationGroup="Search"    IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="仕入れ先DataSource" DataTextField="会社名称" DataValueField="会社ID"   AppendDataBoundItems="true"   AddEmptyItem="true" />
<y:YDropDownList   id="検索材料メーカー" DefaultValue=""  Label="材料メーカー"  IsGrid="false"    ValidationGroup="Search"    IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="材料メーカーDataSource" DataTextField="会社名称" DataValueField="会社ID"   AppendDataBoundItems="true"   AddEmptyItem="true" />
<y:YDropDownList   id="検索材質" DefaultValue=""  Label="材質"  IsGrid="false"    ValidationGroup="Search"    IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="M材質DataSource" DataTextField="名称" DataValueField="コードID"   AppendDataBoundItems="true"   AddEmptyItem="true" />
<y:YDropDownList   id="検索M材料_材料ID" DefaultValue=""  Label="M材料_材料ID"  IsGrid="false"    ValidationGroup="Search"    IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="M材料_材料IDDataSource" DataTextField="材料名称" DataValueField="材料ID"   AppendDataBoundItems="true"   AddEmptyItem="true" />
            <br />
<y:YCheckBox   id="検索削除フラグ" DefaultValue=""  Label="削除フラグ"  IsGrid="false"    ValidationGroup="Search"    IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
<y:YDropDownList   id="検索作成ユーザー" DefaultValue=""  Label="作成ユーザー"  IsGrid="false"    ValidationGroup="Search"    IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   AddEmptyItem="true" />
<y:YDropDownList   id="検索最終更新ユーザー" DefaultValue=""  Label="最終更新ユーザー"  IsGrid="false"    ValidationGroup="Search"    IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   AddEmptyItem="true" />


            　　　<asp:Button runat="server" ID="検索" Text="検索" OnClick="検索_Click" /> 
            <asp:Button runat="server" ID="Clear" Text="クリア" OnClick="Clear_Click" /> 

            <y:BaseGridView CssClass="GridView" ID="mainGridView" runat="server"
                DataSourceID="mainDataSource"
                DataKeyNames="材料規格ID,最終更新日時" AutoGenerateColumns="false"
                AllowPaging="true"
                PageSize="12">
                <Columns>
                    <asp:CommandField ShowEditButton="true" ControlStyle-Width="25" ItemStyle-Width="25"></asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True" ControlStyle-Width="25" ItemStyle-Width="25"></asp:CommandField>
                    <asp:ButtonField CommandName="ShowDetailUpdate" Text="詳細編集" ControlStyle-Width="50" />

                    <asp:ButtonField ButtonType="Link" CommandName="Copy" Text="Copy" />

 <y:YBoundField HeaderText="材料規格ID" DataFormatStringEditing="" DataField="材料規格ID" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="true" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
 <y:YBoundField HeaderText="ステータス" DataFormatStringEditing="" DataField="ステータス" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
 <y:YBoundField HeaderText="得意先" DataFormatStringEditing="" DataField="得意先" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="得意先DataSource" DataTextField="会社名称" DataValueField="会社ID"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="規格番号" DataFormatStringEditing="" DataField="規格番号" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
 <y:YBoundField HeaderText="材料名" DataFormatStringEditing="" DataField="材料名" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  Rows="3" />
 <y:YBoundField HeaderText="No" DataFormatStringEditing="" DataField="No" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  Rows="3" />
 <y:YBoundField HeaderText="山恵フラグ" DataFormatStringEditing="" DataField="山恵フラグ" ReadOnly="FALSE"  IsBoolean="TRUE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
 <y:YBoundField HeaderText="仕入れ先" DataFormatStringEditing="" DataField="仕入れ先" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="仕入れ先DataSource" DataTextField="会社名称" DataValueField="会社ID"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="材料メーカー" DataFormatStringEditing="" DataField="材料メーカー" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="材料メーカーDataSource" DataTextField="会社名称" DataValueField="会社ID"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="材質" DataFormatStringEditing="" DataField="材質" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="M材質DataSource" DataTextField="名称" DataValueField="コードID"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="M材料_材料ID" DataFormatStringEditing="" DataField="M材料_材料ID" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="M材料_材料IDDataSource" DataTextField="材料名称" DataValueField="材料ID"   AppendDataBoundItems="true"   IsDropDownList="true"  />
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
                DataKeyNames="材料規格ID,最終更新日時" DataSourceID="mainDataSource" BackColor="#DEBA84"
                BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" GridLines="Both"
                AllowPaging="false">
                <EditItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <table>
<y:YTextBox   id="ステータス"  Label="ステータス"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("ステータス", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  />
<y:YDropDownList   id="得意先"  Label="得意先"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("得意先") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="得意先DataSource" DataTextField="会社名称" DataValueField="会社ID"   AppendDataBoundItems="true"  />
<y:YTextBox   id="規格番号"  Label="規格番号"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("規格番号", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  />
<y:YTextBox   id="材料名"  Label="材料名"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("材料名", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  TextMode="MultiLine"  Rows="3"/>
<y:YTextBox   id="No"  Label="No"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("No", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  TextMode="MultiLine"  Rows="3"/>
<y:YCheckBox   id="山恵フラグ"  Label="山恵フラグ"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Checked='<%# ConvertToBoolean(Eval("山恵フラグ")) %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  />
<y:YDropDownList   id="仕入れ先"  Label="仕入れ先"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("仕入れ先") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="仕入れ先DataSource" DataTextField="会社名称" DataValueField="会社ID"   AppendDataBoundItems="true"  />
<y:YDropDownList   id="材料メーカー"  Label="材料メーカー"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("材料メーカー") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="材料メーカーDataSource" DataTextField="会社名称" DataValueField="会社ID"   AppendDataBoundItems="true"  />
<y:YDropDownList   id="材質"  Label="材質"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("材質") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="M材質DataSource" DataTextField="名称" DataValueField="コードID"   AppendDataBoundItems="true"  />
<y:YDropDownList   id="M材料_材料ID"  Label="M材料_材料ID"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("M材料_材料ID") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="M材料_材料IDDataSource" DataTextField="材料名称" DataValueField="材料ID"   AppendDataBoundItems="true"  />
<y:YCheckBox   id="削除フラグ"  Label="削除フラグ"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  />
<y:YDropDownList   id="作成ユーザー"  Label="作成ユーザー"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("作成ユーザー") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"  />
<y:YDropDownList   id="最終更新ユーザー"  Label="最終更新ユーザー"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("最終更新ユーザー") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"  />
<y:YTextBox   id="作成日時"  Label="作成日時"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'     IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"  />
<y:YTextBox   id="最終更新日時"  Label="最終更新日時"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'     IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"  />
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
<y:YTextBox   id="ステータス" DefaultValue=""  Label="ステータス"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("ステータス", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
<y:YDropDownList   id="得意先" DefaultValue=""  Label="得意先"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("得意先") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="得意先DataSource" DataTextField="会社名称" DataValueField="会社ID"   AppendDataBoundItems="true"   />
<y:YTextBox   id="規格番号" DefaultValue=""  Label="規格番号"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("規格番号", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
<y:YTextBox   id="材料名" DefaultValue=""  Label="材料名"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("材料名", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  TextMode="MultiLine"  Rows="3" />
<y:YTextBox   id="No" DefaultValue=""  Label="No"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("No", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  TextMode="MultiLine"  Rows="3" />
<y:YCheckBox   id="山恵フラグ" DefaultValue=""  Label="山恵フラグ"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Checked='<%# ConvertToBoolean(Eval("山恵フラグ")) %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
<y:YDropDownList   id="仕入れ先" DefaultValue=""  Label="仕入れ先"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("仕入れ先") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="仕入れ先DataSource" DataTextField="会社名称" DataValueField="会社ID"   AppendDataBoundItems="true"   />
<y:YDropDownList   id="材料メーカー" DefaultValue=""  Label="材料メーカー"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("材料メーカー") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="材料メーカーDataSource" DataTextField="会社名称" DataValueField="会社ID"   AppendDataBoundItems="true"   />
<y:YDropDownList   id="材質" DefaultValue=""  Label="材質"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("材質") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="M材質DataSource" DataTextField="名称" DataValueField="コードID"   AppendDataBoundItems="true"   />
<y:YDropDownList   id="M材料_材料ID" DefaultValue=""  Label="M材料_材料ID"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("M材料_材料ID") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="M材料_材料IDDataSource" DataTextField="材料名称" DataValueField="材料ID"   AppendDataBoundItems="true"   />
<y:YCheckBox   id="削除フラグ" DefaultValue=""  Label="削除フラグ"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"   />
<y:YDropDownList   id="作成ユーザー" DefaultValue=""  Label="作成ユーザー"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("作成ユーザー") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   />
<y:YDropDownList   id="最終更新ユーザー" DefaultValue=""  Label="最終更新ユーザー"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("最終更新ユーザー") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   />
<y:YTextBox   id="作成日時" DefaultValue=""  Label="作成日時"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'     IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"   />
<y:YTextBox   id="最終更新日時" DefaultValue=""  Label="最終更新日時"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'     IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"   />
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
<y:YTextBox   id="材料規格ID"  Label="材料規格ID"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("材料規格ID", "") %>'    IsRequired="true" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  />
<y:YTextBox   id="ステータス"  Label="ステータス"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("ステータス", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  />
<y:YDropDownList   id="得意先"  Label="得意先"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("得意先") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="得意先DataSource" DataTextField="会社名称" DataValueField="会社ID"   AppendDataBoundItems="true"  />
<y:YTextBox   id="規格番号"  Label="規格番号"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("規格番号", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  />
<y:YTextBox   id="材料名"  Label="材料名"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("材料名", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  TextMode="MultiLine"  Rows="3"/>
<y:YTextBox   id="No"  Label="No"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("No", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  TextMode="MultiLine"  Rows="3"/>
<y:YCheckBox   id="山恵フラグ"  Label="山恵フラグ"  IsGrid="false"  ReadOnly="TRUE" Checked='<%# ConvertToBoolean(Eval("山恵フラグ")) %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  />
<y:YDropDownList   id="仕入れ先"  Label="仕入れ先"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("仕入れ先") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="仕入れ先DataSource" DataTextField="会社名称" DataValueField="会社ID"   AppendDataBoundItems="true"  />
<y:YDropDownList   id="材料メーカー"  Label="材料メーカー"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("材料メーカー") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="材料メーカーDataSource" DataTextField="会社名称" DataValueField="会社ID"   AppendDataBoundItems="true"  />
<y:YDropDownList   id="材質"  Label="材質"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("材質") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="M材質DataSource" DataTextField="名称" DataValueField="コードID"   AppendDataBoundItems="true"  />
<y:YDropDownList   id="M材料_材料ID"  Label="M材料_材料ID"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("M材料_材料ID") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="M材料_材料IDDataSource" DataTextField="材料名称" DataValueField="材料ID"   AppendDataBoundItems="true"  />
<y:YCheckBox   id="削除フラグ"  Label="削除フラグ"  IsGrid="false"  ReadOnly="TRUE" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  />
<y:YDropDownList   id="作成ユーザー"  Label="作成ユーザー"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("作成ユーザー") %>'   IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"  />
<y:YDropDownList   id="最終更新ユーザー"  Label="最終更新ユーザー"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("最終更新ユーザー") %>'   IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"  />
<y:YTextBox   id="作成日時"  Label="作成日時"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'    IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"  />
<y:YTextBox   id="最終更新日時"  Label="最終更新日時"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'    IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"  />
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
                SelectCommand="select * from M材料規格番号"
                UpdateCommand=" update M材料規格番号 set ステータス = @ステータス,得意先 = @得意先,規格番号 = @規格番号,No = @No,山恵フラグ = @山恵フラグ,仕入れ先 = @仕入れ先,材料メーカー = @材料メーカー,材料名 = @材料名,材質 = @材質,M材料_材料ID = @M材料_材料ID,削除フラグ = @削除フラグ,作成ユーザー = @作成ユーザー,最終更新ユーザー = @最終更新ユーザー,作成日時 = @作成日時,最終更新日時 = @最終更新日時 where 材料規格ID = @original_材料規格ID and 最終更新日時 = @original_最終更新日時"
                InsertCommand=" insert into M材料規格番号 (材料規格ID,ステータス,得意先,規格番号,No,山恵フラグ,仕入れ先,材料メーカー,材料名,材質,M材料_材料ID,削除フラグ,作成ユーザー,最終更新ユーザー,作成日時,最終更新日時) values (@材料規格ID,@ステータス,@得意先,@規格番号,@No,@山恵フラグ,@仕入れ先,@材料メーカー,@材料名,@材質,@M材料_材料ID,@削除フラグ,@作成ユーザー,@最終更新ユーザー,@作成日時,@最終更新日時); SET @NewParameter=LAST_INSERT_ID(); "
                DeleteCommand="delete from M材料規格番号  where 材料規格ID = @original_材料規格ID  and 最終更新日時 = @original_最終更新日時"
                ConflictDetection="CompareAllValues"
                OldValuesParameterFormatString="original_{0}"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                OnUpdating="mainDataSource_Updating"
                OnInserting="mainDataSource_Inserting">

                <InsertParameters>
                    <asp:FormParameter Name="材料規格ID" FormField="材料規格ID" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="ステータス" FormField="ステータス" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="得意先" FormField="得意先" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="規格番号" FormField="規格番号" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="No" FormField="No" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="山恵フラグ" FormField="山恵フラグ" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="仕入れ先" FormField="仕入れ先" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="材料メーカー" FormField="材料メーカー" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="材料名" FormField="材料名" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="材質" FormField="材質" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="M材料_材料ID" FormField="M材料_材料ID" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="削除フラグ" FormField="削除フラグ" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="作成ユーザー" FormField="作成ユーザー" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="最終更新ユーザー" FormField="最終更新ユーザー" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="作成日時" FormField="作成日時" ConvertEmptyStringToNull="true" Type="DateTime" />
                    <asp:FormParameter Name="最終更新日時" FormField="最終更新日時" ConvertEmptyStringToNull="true" Type="DateTime" />

                    <asp:Parameter Direction="Output" Name="RETURN_VALUE" Type="Int32" />
                </InsertParameters>

                <UpdateParameters>
                    <asp:FormParameter Name="ステータス" FormField="ステータス" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="得意先" FormField="得意先" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="規格番号" FormField="規格番号" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="No" FormField="No" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="山恵フラグ" FormField="山恵フラグ" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="仕入れ先" FormField="仕入れ先" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="材料メーカー" FormField="材料メーカー" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="材料名" FormField="材料名" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="材質" FormField="材質" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="M材料_材料ID" FormField="M材料_材料ID" ConvertEmptyStringToNull="true" Type="Int32" />
                    <asp:FormParameter Name="削除フラグ" FormField="削除フラグ" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="最終更新ユーザー" FormField="最終更新ユーザー" ConvertEmptyStringToNull="true" Type="String" />
                    <asp:FormParameter Name="最終更新日時" FormField="最終更新日時" ConvertEmptyStringToNull="true" Type="DateTime" />

                    <asp:Parameter Name="original_材料規格ID" Type="String" />
                    <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="original_材料規格ID" Type="String" />
                    <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
                </DeleteParameters>
            </y:BaseSqlDataSource>

            <y:BaseSqlDataSource runat="server" ID="得意先DataSource"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                SelectCommand="SELECT  `会社ID` ,  `会社名称`  
                    FROM  `M会社` 
                    WHERE  (`得意先` =  'True')
                    AND (`削除フラグ` is null or `削除フラグ` !=  'True')
                    ">
            </y:BaseSqlDataSource>

            <y:BaseSqlDataSource runat="server" ID="仕入れ先DataSource"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                SelectCommand="SELECT  `会社ID` ,  `会社名称`  
                    FROM  `M会社` 
                    WHERE  (`仕入れ先` =  'True')
                    AND (`削除フラグ` is null or `削除フラグ` !=  'True')
                    ">
            </y:BaseSqlDataSource>

            <y:BaseSqlDataSource runat="server" ID="材料メーカーDataSource"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                SelectCommand="SELECT  `会社ID` ,  `会社名称`  
                    FROM  `M会社` 
                    WHERE  (`材料メーカー` =  'True')
                    AND (`削除フラグ` is null or `削除フラグ` !=  'True')
                    ">
            </y:BaseSqlDataSource>


            <y:BaseSqlDataSource runat="server" ID="M材料_材料IDDataSource"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                SelectCommand="SELECT  `材料ID` ,  `材料名称`  
                    FROM  `M材料` 
                    WHERE (`削除フラグ` is null or `削除フラグ` !=  'True')
                    ">
            </y:BaseSqlDataSource>

            <y:BaseSqlDataSource runat="server" ID="M材質DataSource"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                SelectCommand="SELECT  `コードID` ,  `名称`  
                    FROM  `Mコード` 
                    WHERE  `グループ` =  '規格番号向け材質'
                    AND (`削除フラグ` is null or `削除フラグ` !=  'True')
                    ">
            </y:BaseSqlDataSource>


            <y:BaseSqlDataSource runat="server" ID="ユーザーDataSource"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                SelectCommand="SELECT ユーザーId, ユーザー名 FROM `Mユーザー` WHERE (`削除フラグ` is null or `削除フラグ` !=  'True')">
            </y:BaseSqlDataSource>

        </div>
    </form>
</body>
</html>

