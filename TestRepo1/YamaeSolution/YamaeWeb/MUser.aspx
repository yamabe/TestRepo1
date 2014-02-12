<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MUser.aspx.cs" Inherits="MUser" %>

<%@ Register TagPrefix="y" Namespace="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>ユーザーマスタメンテナンス画面</title>
    <link href="css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Menu.aspx" Text="メニュー画面へ" />
            <br />

            <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
                EnableScriptLocalization="true" ID="mainScriptManager" />

            
            <y:YCheckBox   id="検索削除フラグ" DefaultValue=""  Label="削除フラグ"  IsGrid="false"    ValidationGroup="Search"    runat="server" />

            
            <asp:Button runat="server" ID="検索" Text="検索" OnClick="検索_Click" /> 
            <asp:Button runat="server" ID="Clear" Text="クリア" OnClick="Clear_Click" /> 

            <y:BaseGridView CssClass="GridView" ID="mainGridView" runat="server"
                DataSourceID="mainDataSource"
                DataKeyNames="ユーザーID,最終更新日時" AutoGenerateColumns="false">
                <Columns>
                    <asp:CommandField ShowEditButton="true" ControlStyle-Width="25" ItemStyle-Width="25"></asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True" ControlStyle-Width="25" ItemStyle-Width="25"></asp:CommandField>
                    <asp:ButtonField CommandName="ShowDetailUpdate" Text="詳細編集" ControlStyle-Width="50" />

                    <asp:ButtonField ButtonType="Link" CommandName="Copy" Text="Copy" />

                    <y:YBoundField HeaderText="ユーザーID" IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" DataFormatStringEditing="" DataField="ユーザーID" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="ユーザー名" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" DataFormatStringEditing="" DataField="ユーザー名" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="パスワード" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" DataFormatStringEditing="" DataField="パスワード" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="削除フラグ" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" DataFormatStringEditing="" DataField="削除フラグ" ReadOnly="FALSE" IsBoolean="TRUE" ControlStyle-Width="40" ItemStyle-Width="40" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="作成ユーザー" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" DataFormatStringEditing="" DataField="作成ユーザー" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" IsDropDownList="true" />
                    <y:YBoundField HeaderText="最終更新ユーザー" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" DataFormatStringEditing="" DataField="最終更新ユーザー" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" IsDropDownList="true" />
                    <y:YBoundField HeaderText="作成日時" IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="作成日時" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" />
                    <y:YBoundField HeaderText="最終更新日時" IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="最終更新日時" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" />
                </Columns>
            </y:BaseGridView>
            <y:BaseValidationSummary ID="mainValidationSummary" runat="server" EnableClientScript="true" />

            <br />

            <y:BaseFormView ID="mainFormView"
                runat="server"
                DataKeyNames="ユーザーID,最終更新日時" DataSourceID="mainDataSource" BackColor="#DEBA84"
                BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" GridLines="Both"
                AllowPaging="true"
                AllowSorting="true"
                PagerStyle-CssClass="grid_pager">
                <EditItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <table>
                                    <y:YTextBox IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="ユーザー名" Label="ユーザー名" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("ユーザー名", "") %>' />
                                    <y:YTextBox IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="パスワード" Label="パスワード" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("パスワード", "") %>' />
                                    <y:YCheckBox IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="削除フラグ" Label="削除フラグ" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>' />
                                    <y:YDropDownList IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="作成ユーザー" Label="作成ユーザー" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("作成ユーザー") %>' DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" />
                                    <y:YDropDownList IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="最終更新ユーザー" Label="最終更新ユーザー" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("最終更新ユーザー") %>' DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" ID="作成日時" Label="作成日時" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' />
                                    <y:YTextBox IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" ID="最終更新日時" Label="最終更新日時" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' />
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
                                    <y:YTextBox IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="ユーザー名" Label="ユーザー名" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("ユーザー名", "") %>' />
                                    <y:YTextBox IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="パスワード" Label="パスワード" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("パスワード", "") %>' />
                                    <y:YCheckBox IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="削除フラグ" Label="削除フラグ" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>' />
                                    <y:YDropDownList IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="作成ユーザー" Label="作成ユーザー" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" SelectedValue='<%# Bind("作成ユーザー") %>' DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" />
                                    <y:YDropDownList IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="最終更新ユーザー" Label="最終更新ユーザー" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" SelectedValue='<%# Bind("最終更新ユーザー") %>' DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" ID="作成日時" Label="作成日時" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' />
                                    <y:YTextBox IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" ID="最終更新日時" Label="最終更新日時" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' />
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
                                    <y:YTextBox IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="ユーザーID" Label="ユーザーID" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ユーザーID", "") %>' />
                                    <y:YTextBox IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="ユーザー名" Label="ユーザー名" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("ユーザー名", "") %>' />
                                    <y:YTextBox IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="パスワード" Label="パスワード" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("パスワード", "") %>' />
                                    <y:YCheckBox IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" ID="削除フラグ" Label="削除フラグ" IsGrid="false" ReadOnly="TRUE" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>' />
                                    <y:YDropDownList IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="作成ユーザー" Label="作成ユーザー" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("作成ユーザー") %>' DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" />
                                    <y:YDropDownList IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" ID="最終更新ユーザー" Label="最終更新ユーザー" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("最終更新ユーザー") %>' DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" />
                                    <y:YTextBox IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" ID="作成日時" Label="作成日時" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' />
                                    <y:YTextBox IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" ID="最終更新日時" Label="最終更新日時" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' />
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
                SelectCommand="select * from Mユーザー "
                UpdateCommand=" update Mユーザー set ユーザー名 = @ユーザー名, パスワード = @パスワード, 削除フラグ = @削除フラグ, 最終更新ユーザー = @最終更新ユーザー, 最終更新日時 = @最終更新日時  where ユーザーID = @original_ユーザーID and 最終更新日時 = @original_最終更新日時"
                InsertCommand=" insert into Mユーザー (ユーザーID, ユーザー名, パスワード, 削除フラグ, 作成ユーザー, 最終更新ユーザー, 作成日時, 最終更新日時) values (@ユーザーID, @ユーザー名, @パスワード, @削除フラグ, @作成ユーザー, @最終更新ユーザー,  current_timestamp, current_timestamp); SET @NewParameter=LAST_INSERT_ID(); "
                DeleteCommand="update Mユーザー    set 削除フラグ = 'True' where ユーザーID = @original_ユーザーID  and 最終更新日時 = @original_最終更新日時"
                ConflictDetection="CompareAllValues"
                OldValuesParameterFormatString="original_{0}"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                OnUpdating="mainDataSource_Updating"
                OnInserting="mainDataSource_Inserting">

                <InsertParameters>
                    <asp:FormParameter Name="ユーザーID" FormField="ユーザーID" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="ユーザー名" FormField="ユーザー名" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="パスワード" FormField="パスワード" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="削除フラグ" FormField="削除フラグ" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="作成ユーザー" FormField="作成ユーザー" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="最終更新ユーザー" FormField="最終更新ユーザー" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="作成日時" FormField="作成日時" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="最終更新日時" FormField="最終更新日時" ConvertEmptyStringToNull="true" />

                    <asp:Parameter Direction="Output" Name="RETURN_VALUE" Type="Int32" />
                </InsertParameters>

                <UpdateParameters>
                    <asp:FormParameter Name="ユーザー名" FormField="ユーザー名" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="パスワード" FormField="パスワード" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="削除フラグ" FormField="削除フラグ" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="最終更新ユーザー" FormField="最終更新ユーザー" ConvertEmptyStringToNull="true" />
                    <asp:FormParameter Name="最終更新日時" FormField="最終更新日時" ConvertEmptyStringToNull="true" />

                    <asp:Parameter Name="original_ユーザーID" Type="String" />
                    <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="original_ユーザーID" Type="String" />
                    <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
                </DeleteParameters>
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

