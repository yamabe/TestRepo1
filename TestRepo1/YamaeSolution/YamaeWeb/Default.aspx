<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register TagPrefix="y" Namespace="uc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
                EnableScriptLocalization="true" ID="mainScriptManager" />



            <asp:GridView CssClass="GridView" ID="mainGridView" runat="server"
                DataSourceID="mainDataSource"
                DataKeyNames="指令No,最終更新日時" AutoGenerateColumns="false"
                OnRowEditing="mainGridView_RowEditing"
                OnRowCommand="mainGridView_RowCommand">
                <Columns>
                    <asp:CommandField ShowEditButton="true" ControlStyle-Width="25" ItemStyle-Width="25"></asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True" ControlStyle-Width="25" ItemStyle-Width="25"></asp:CommandField>
                    <asp:ButtonField CommandName="ShowDetailUpdate" Text="詳細編集" ControlStyle-Width="50" />

                    <y:YBoundField HeaderText="発効日" IsRequired="true" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" DataField="発効日" ReadOnly="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="機種名" IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" DataField="機種名" ReadOnly="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="指令No" IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" DataField="指令No" ReadOnly="TRUE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="部品コード" IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" DataField="部品コード" ReadOnly="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="指令部品" IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" DataField="指令部品" ReadOnly="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="台数当たりの使用数" IsRequired="true" IsDate="false" DataFormatString="" IsInteger="true" runat="server" DataField="台数当たりの使用数" ReadOnly="FALSE" ControlStyle-Width="40" ItemStyle-Width="40" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="月間企画台数" IsRequired="true" IsDate="false" DataFormatString="" IsInteger="true" runat="server" DataField="月間企画台数" ReadOnly="FALSE" ControlStyle-Width="40" ItemStyle-Width="40" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="ステータス" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" DataField="ステータス" ReadOnly="TRUE" ControlStyle-Width="80" ItemStyle-Width="80" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="試打検査予定日" IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" DataField="試打検査予定日" ReadOnly="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="試打検査数量" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" DataField="試打検査数量" ReadOnly="FALSE" ControlStyle-Width="40" ItemStyle-Width="40" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="試打検査注文日" IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" DataField="試打検査注文日" ReadOnly="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="試打検査納品日" IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" DataField="試打検査納品日" ReadOnly="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="試打検査確認日" IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" DataField="試打検査確認日" ReadOnly="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="型費請求書提出日" IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" DataField="型費請求書提出日" ReadOnly="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="試打組立用予定日" IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" DataField="試打組立用予定日" ReadOnly="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="試打組立用数量" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" DataField="試打組立用数量" ReadOnly="FALSE" ControlStyle-Width="40" ItemStyle-Width="40" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="試打組立用注文日" IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" DataField="試打組立用注文日" ReadOnly="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="試打組立用納品日" IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" DataField="試打組立用納品日" ReadOnly="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="試打組立予定日" IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" DataField="試打組立予定日" ReadOnly="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="量試予定日" IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" DataField="量試予定日" ReadOnly="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="量産開始予定日" IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" DataField="量産開始予定日" ReadOnly="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="作成ユーザー" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" DataField="作成ユーザー" ReadOnly="TRUE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="最終更新ユーザー" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" DataField="最終更新ユーザー" ReadOnly="TRUE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="作成日時" IsRequired="FALSE" IsDate="true" DataFormatString="yyyy/MM/dd hh:mm ss" IsInteger="false" runat="server" DataField="作成日時" ReadOnly="TRUE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="最終更新日時" IsRequired="FALSE" IsDate="true" DataFormatString="yyyy/MM/dd hh:mm ss" IsInteger="false" runat="server" DataField="最終更新日時" ReadOnly="TRUE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" />

                </Columns>
            </asp:GridView>
            <asp:ValidationSummary ID="mainValidationSummary" runat="server" EnableClientScript="true" />

            <br />

            <asp:FormView ID="mainFormView"
                runat="server"
                DataKeyNames="指令No,最終更新日時" DataSourceID="mainDataSource" BackColor="#DEBA84"
                BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" GridLines="Both"
                AllowPaging="true">
                <EditItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <table>
                                    <tr><td colspan="2" style="text-align:center">基本情報</td></tr>
                                    <y:YTextBox IsRequired="true" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="発効日" Label="発効日" IsGrid="false" Text='<%# Bind("発効日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="機種名" Label="機種名" IsGrid="false" Text='<%# Bind("機種名", "") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="指令No" Label="指令No" IsGrid="false" Text='<%# Bind("指令No", "") %>' ReadOnly="TRUE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="部品コード" Label="部品コード" IsGrid="false" Text='<%# Bind("部品コード", "") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="指令部品" Label="指令部品" IsGrid="false" Text='<%# Bind("指令部品", "") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="台数当たりの使用数" Label="台数当たりの使用数" IsGrid="false" Text='<%# Bind("台数当たりの使用数", "") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="月間企画台数" Label="月間企画台数" IsGrid="false" Text='<%# Bind("月間企画台数", "") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="ステータス" Label="ステータス" IsGrid="false" Text='<%# Bind("ステータス", "") %>' ReadOnly="TRUE" ValidationGroup="DetailUpdate" />
                                </table>
                            </td>

                            <td>
                                <table>
                                    <tr><td colspan="2" style="text-align:center">試打検査</td></tr>
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="試打検査予定日" Label="試打検査予定日" IsGrid="false" Text='<%# Bind("試打検査予定日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="試打検査数量" Label="試打検査数量" IsGrid="false" Text='<%# Bind("試打検査数量", "") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="試打検査注文日" Label="試打検査注文日" IsGrid="false" Text='<%# Bind("試打検査注文日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="試打検査納品日" Label="試打検査納品日" IsGrid="false" Text='<%# Bind("試打検査納品日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="試打検査確認日" Label="試打検査確認日" IsGrid="false" Text='<%# Bind("試打検査確認日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />

                                    <tr><td colspan="2" style="text-align:center">請求書</td></tr>

                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="型費請求書提出日" Label="型費請求書提出日" IsGrid="false" Text='<%# Bind("型費請求書提出日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <tr><td colspan="2" style="text-align:center">試打組立</td></tr>
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="試打組立用予定日" Label="試打組立用予定日" IsGrid="false" Text='<%# Bind("試打組立用予定日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="試打組立用数量" Label="試打組立用数量" IsGrid="false" Text='<%# Bind("試打組立用数量", "") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="試打組立用注文日" Label="試打組立用注文日" IsGrid="false" Text='<%# Bind("試打組立用注文日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="試打組立用納品日" Label="試打組立用納品日" IsGrid="false" Text='<%# Bind("試打組立用納品日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="試打組立予定日" Label="試打組立予定日" IsGrid="false" Text='<%# Bind("試打組立予定日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                </table>
                            </td>

                            <td>
                                <table>
                                    <tr><td colspan="2" style="text-align:center">量試、量産</td></tr>
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="量試予定日" Label="量試予定日" IsGrid="false" Text='<%# Bind("量試予定日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="量産開始予定日" Label="量産開始予定日" IsGrid="false" Text='<%# Bind("量産開始予定日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailUpdate" />
                                    <tr><td colspan="2" style="text-align:center">他</td></tr>
                                    <y:YTextBox IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="作成ユーザー" Label="作成ユーザー" IsGrid="false" Text='<%# Bind("作成ユーザー", "") %>' ReadOnly="TRUE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="最終更新ユーザー" Label="最終更新ユーザー" IsGrid="false" Text='<%# Bind("最終更新ユーザー", "") %>' ReadOnly="TRUE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="true" DataFormatString="yyyy/MM/dd hh:mm ss" IsInteger="false" runat="server" ID="作成日時" Label="作成日時" IsGrid="false" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm ss}") %>' ReadOnly="TRUE" ValidationGroup="DetailUpdate" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="true" DataFormatString="yyyy/MM/dd hh:mm ss" IsInteger="false" runat="server" ID="最終更新日時" Label="最終更新日時" IsGrid="false" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm ss}") %>' ReadOnly="TRUE" ValidationGroup="DetailUpdate" />
                                </table>
                            </td>
                        </tr>
                    </table>
                    <asp:ValidationSummary runat="server" EnableClientScript="true" ValidationGroup="DetailUpdate" />
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
                                    <y:YTextBox IsRequired="true" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="発効日" Label="発効日" IsGrid="false" Text='<%# Bind("発効日") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="機種名" Label="機種名" IsGrid="false" Text='<%# Bind("機種名", "") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="指令No" Label="指令No" IsGrid="false" Text='<%# Bind("指令No", "") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="部品コード" Label="部品コード" IsGrid="false" Text='<%# Bind("部品コード", "") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="指令部品" Label="指令部品" IsGrid="false" Text='<%# Bind("指令部品", "") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="台数当たりの使用数" Label="台数当たりの使用数" IsGrid="false" Text='<%# Bind("台数当たりの使用数", "") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="月間企画台数" Label="月間企画台数" IsGrid="false" Text='<%# Bind("月間企画台数", "") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="ステータス" Label="ステータス" IsGrid="false" Text='<%# Bind("ステータス", "") %>' ReadOnly="TRUE" ValidationGroup="DetailInsert" />
                                </table>
                            </td>

                            <td>
                                <table>
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="YTextBox1" Label="試打検査予定日" IsGrid="false" Text='<%# Bind("試打検査予定日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="YTextBox2" Label="試打検査数量" IsGrid="false" Text='<%# Bind("試打検査数量", "") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="試打検査注文日" Label="試打検査注文日" IsGrid="false" Text='<%# Bind("試打検査注文日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="YTextBox3" Label="試打検査納品日" IsGrid="false" Text='<%# Bind("試打検査納品日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="YTextBox4" Label="試打検査確認日" IsGrid="false" Text='<%# Bind("試打検査確認日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="型費請求書提出日" Label="型費請求書提出日" IsGrid="false" Text='<%# Bind("型費請求書提出日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="YTextBox5" Label="試打組立用予定日" IsGrid="false" Text='<%# Bind("試打組立用予定日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="YTextBox6" Label="試打組立用数量" IsGrid="false" Text='<%# Bind("試打組立用数量", "") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="試打組立用注文日" Label="試打組立用注文日" IsGrid="false" Text='<%# Bind("試打組立用注文日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="YTextBox7" Label="試打組立用納品日" IsGrid="false" Text='<%# Bind("試打組立用納品日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="YTextBox8" Label="試打組立予定日" IsGrid="false" Text='<%# Bind("試打組立予定日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                </table>
                            </td>
                            <td>
                                <table>
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="YTextBox9" Label="量試予定日" IsGrid="false" Text='<%# Bind("量試予定日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="YTextBox10" Label="量産開始予定日" IsGrid="false" Text='<%# Bind("量産開始予定日", "{0:yyyy/MM/dd}") %>' ReadOnly="FALSE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="YTextBox11" Label="作成ユーザー" IsGrid="false" Text='<%# Bind("作成ユーザー", "") %>' ReadOnly="TRUE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="YTextBox12" Label="最終更新ユーザー" IsGrid="false" Text='<%# Bind("最終更新ユーザー", "") %>' ReadOnly="TRUE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="true" DataFormatString="yyyy/MM/dd hh:mm ss" IsInteger="false" runat="server" ID="YTextBox13" Label="作成日時" IsGrid="false" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm ss}") %>' ReadOnly="TRUE" ValidationGroup="DetailInsert" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="true" DataFormatString="yyyy/MM/dd hh:mm ss" IsInteger="false" runat="server" ID="YTextBox14" Label="最終更新日時" IsGrid="false" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm ss}") %>' ReadOnly="TRUE" ValidationGroup="DetailInsert" />
                                </table>
                            </td>
                        </tr>
                    </table>
                    <asp:ValidationSummary runat="server" EnableClientScript="true" ValidationGroup="DetailInsert" />
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
                                    <y:YTextBox IsRequired="true" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="発効日" Label="発効日" IsGrid="false" Text='<%# Bind("発効日", "{0:yyyy/MM/dd}") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="機種名" Label="機種名" IsGrid="false" Text='<%# Bind("機種名", "") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="指令No" Label="指令No" IsGrid="false" Text='<%# Bind("指令No", "") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="部品コード" Label="部品コード" IsGrid="false" Text='<%# Bind("部品コード", "") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="指令部品" Label="指令部品" IsGrid="false" Text='<%# Bind("指令部品", "") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="台数当たりの使用数" Label="台数当たりの使用数" IsGrid="false" Text='<%# Bind("台数当たりの使用数", "") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="月間企画台数" Label="月間企画台数" IsGrid="false" Text='<%# Bind("月間企画台数", "") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="ステータス" Label="ステータス" IsGrid="false" Text='<%# Bind("ステータス", "") %>' ReadOnly="TRUE" />
                                </table>
                            </td>

                            <td>
                                <table>
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="YTextBox15" Label="試打検査予定日" IsGrid="false" Text='<%# Bind("試打検査予定日", "{0:yyyy/MM/dd}") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="YTextBox16" Label="試打検査数量" IsGrid="false" Text='<%# Bind("試打検査数量", "") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="試打検査注文日" Label="試打検査注文日" IsGrid="false" Text='<%# Bind("試打検査注文日", "{0:yyyy/MM/dd}") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="YTextBox17" Label="試打検査納品日" IsGrid="false" Text='<%# Bind("試打検査納品日", "{0:yyyy/MM/dd}") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="YTextBox18" Label="試打検査確認日" IsGrid="false" Text='<%# Bind("試打検査確認日", "{0:yyyy/MM/dd}") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="型費請求書提出日" Label="型費請求書提出日" IsGrid="false" Text='<%# Bind("型費請求書提出日", "{0:yyyy/MM/dd}") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="YTextBox19" Label="試打組立用予定日" IsGrid="false" Text='<%# Bind("試打組立用予定日", "{0:yyyy/MM/dd}") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="YTextBox20" Label="試打組立用数量" IsGrid="false" Text='<%# Bind("試打組立用数量", "") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="試打組立用注文日" Label="試打組立用注文日" IsGrid="false" Text='<%# Bind("試打組立用注文日", "{0:yyyy/MM/dd}") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="YTextBox21" Label="試打組立用納品日" IsGrid="false" Text='<%# Bind("試打組立用納品日", "{0:yyyy/MM/dd}") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="YTextBox22" Label="試打組立予定日" IsGrid="false" Text='<%# Bind("試打組立予定日", "{0:yyyy/MM/dd}") %>' ReadOnly="TRUE" />
                                </table>
                            </td>
                            <td>
                                <table>
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="YTextBox23" Label="量試予定日" IsGrid="false" Text='<%# Bind("量試予定日", "{0:yyyy/MM/dd}") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="false" IsDate="true" DataFormatString="yyyy/MM/dd" IsInteger="false" runat="server" ID="YTextBox24" Label="量産開始予定日" IsGrid="false" Text='<%# Bind("量産開始予定日", "{0:yyyy/MM/dd}") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="YTextBox25" Label="作成ユーザー" IsGrid="false" Text='<%# Bind("作成ユーザー", "") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="YTextBox26" Label="最終更新ユーザー" IsGrid="false" Text='<%# Bind("最終更新ユーザー", "") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="true" DataFormatString="yyyy/MM/dd hh:mm ss" IsInteger="false" runat="server" ID="YTextBox27" Label="作成日時" IsGrid="false" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm ss}") %>' ReadOnly="TRUE" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="true" DataFormatString="yyyy/MM/dd hh:mm ss" IsInteger="false" runat="server" ID="YTextBox28" Label="最終更新日時" IsGrid="false" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm ss}") %>' ReadOnly="TRUE" />
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
                    <asp:LinkButton CommandName="New" runat="server" Text="新規追加" />
                </EmptyDataTemplate>
            </asp:FormView>

            <asp:SqlDataSource ID="mainDataSource" runat="server"
                SelectCommand="select * from T量産指令"
                UpdateCommand=" update T量産指令 set 発効日 = @発効日, 機種名 = @機種名, 部品コード = @部品コード, 指令部品 = @指令部品, 台数当たりの使用数 = @台数当たりの使用数, 月間企画台数 = @月間企画台数, ステータス = @ステータス, 試打検査予定日 = @試打検査予定日, 試打検査数量 = @試打検査数量, 試打検査注文日 = @試打検査注文日, 試打検査納品日 = @試打検査納品日, 試打検査確認日 = @試打検査確認日, 型費請求書提出日 = @型費請求書提出日, 試打組立用予定日 = @試打組立用予定日, 試打組立用数量 = @試打組立用数量, 試打組立用注文日 = @試打組立用注文日, 試打組立用納品日 = @試打組立用納品日, 試打組立予定日 = @試打組立予定日, 量試予定日 = @量試予定日, 量産開始予定日 = @量産開始予定日, 作成ユーザー = @作成ユーザー, 最終更新ユーザー = @最終更新ユーザー, 最終更新日時 = current_timestamp where 指令No = @original_指令No and 最終更新日時 = @original_最終更新日時"
                InsertCommand=" insert into T量産指令 (発効日, 機種名, 指令No, 部品コード, 指令部品, 台数当たりの使用数, 月間企画台数, ステータス, 試打検査予定日, 試打検査数量, 試打検査注文日, 試打検査納品日, 試打検査確認日, 型費請求書提出日, 試打組立用予定日, 試打組立用数量, 試打組立用注文日, 試打組立用納品日, 試打組立予定日, 量試予定日, 量産開始予定日, 作成ユーザー, 最終更新ユーザー, 作成日時, 最終更新日時) values (@発効日, @機種名, @指令No, @部品コード, @指令部品, @台数当たりの使用数, @月間企画台数, @ステータス, @試打検査予定日, @試打検査数量, @試打検査注文日, @試打検査納品日, @試打検査確認日, @型費請求書提出日, @試打組立用予定日, @試打組立用数量, @試打組立用注文日, @試打組立用納品日, @試打組立予定日, @量試予定日, @量産開始予定日, @作成ユーザー, @最終更新ユーザー, current_timestamp, current_timestamp)"
                DeleteCommand="delete from T量産指令  where 指令No = @original_指令No  and 最終更新日時 = @original_最終更新日時"
                ConflictDetection="CompareAllValues"
                OldValuesParameterFormatString="original_{0}"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                OnUpdating="mainDataSource_Updating"
                OnUpdated="mainDataSource_Updated"
                OnDeleting="mainDataSource_Deleting"
                OnInserted="mainDataSource_Inserted"
                OnInserting="mainDataSource_Inserting">

                <InsertParameters>
                    <asp:FormParameter Name="発効日" FormField="発効日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="機種名" FormField="機種名" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="指令No" FormField="指令No" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="部品コード" FormField="部品コード" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="指令部品" FormField="指令部品" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="台数当たりの使用数" FormField="台数当たりの使用数" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="月間企画台数" FormField="月間企画台数" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="ステータス" FormField="ステータス" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打検査予定日" FormField="試打検査予定日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打検査数量" FormField="試打検査数量" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打検査注文日" FormField="試打検査注文日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打検査納品日" FormField="試打検査納品日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打検査確認日" FormField="試打検査確認日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="型費請求書提出日" FormField="型費請求書提出日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打組立用予定日" FormField="試打組立用予定日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打組立用数量" FormField="試打組立用数量" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打組立用注文日" FormField="試打組立用注文日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打組立用納品日" FormField="試打組立用納品日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打組立予定日" FormField="試打組立予定日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="量試予定日" FormField="量試予定日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="量産開始予定日" FormField="量産開始予定日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="作成ユーザー" FormField="作成ユーザー" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="最終更新ユーザー" FormField="最終更新ユーザー" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="作成日時" FormField="作成日時" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="最終更新日時" FormField="最終更新日時" ConvertEmptyStringToNull="true" />
                </InsertParameters>

                <UpdateParameters>
                    <asp:FormParameter Name="発効日" FormField="発効日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="機種名" FormField="機種名" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="部品コード" FormField="部品コード" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="指令部品" FormField="指令部品" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="台数当たりの使用数" FormField="台数当たりの使用数" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="月間企画台数" FormField="月間企画台数" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="ステータス" FormField="ステータス" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打検査予定日" FormField="試打検査予定日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打検査数量" FormField="試打検査数量" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打検査注文日" FormField="試打検査注文日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打検査納品日" FormField="試打検査納品日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打検査確認日" FormField="試打検査確認日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="型費請求書提出日" FormField="型費請求書提出日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打組立用予定日" FormField="試打組立用予定日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打組立用数量" FormField="試打組立用数量" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打組立用注文日" FormField="試打組立用注文日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打組立用納品日" FormField="試打組立用納品日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="試打組立予定日" FormField="試打組立予定日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="量試予定日" FormField="量試予定日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="量産開始予定日" FormField="量産開始予定日" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="作成ユーザー" FormField="作成ユーザー" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="最終更新ユーザー" FormField="最終更新ユーザー" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="作成日時" FormField="作成日時" ConvertEmptyStringToNull="true" />

                    <asp:Parameter Name="original_指令No" Type="String" />
                    <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="original_指令No" Type="String" />
                    <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
                </DeleteParameters>
            </asp:SqlDataSource>

        </div>

    </form>
</body>
</html>
