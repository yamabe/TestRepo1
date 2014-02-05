<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MZairyo.aspx.cs" Inherits="MZairyo" %>

<%@ Register TagPrefix="y" Namespace="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>材料マスタメンテナンス画面</title>
    <link href="css/style.css" rel="stylesheet" />
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
                DataKeyNames="材料ID,最終更新日時" AutoGenerateColumns="false"
                AllowPaging="true"
                
                PageSize="12"

                 AllowSorting="true"
                PagerStyle-CssClass="grid_pager"

                >
                <Columns>
                    <asp:CommandField ShowEditButton="true" ControlStyle-Width="25" ItemStyle-Width="25"></asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True" ControlStyle-Width="25" ItemStyle-Width="25"></asp:CommandField>
                    <asp:ButtonField CommandName="ShowDetailUpdate" Text="詳細編集" ControlStyle-Width="50" />

                    <asp:ButtonField ButtonType="Link" CommandName="Copy" Text="Copy" />

 <y:YBoundField HeaderText="材料ID"  IsRequired="true" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" DataFormatStringEditing="" DataField="材料ID" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"     />
 <y:YBoundField HeaderText="材料名称"  IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" DataFormatStringEditing="" DataField="材料名称" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"     />
 <y:YBoundField HeaderText="材質大分類"  IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" DataFormatStringEditing="" DataField="材質大分類" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"    DataSourceID="材質大分類DataSource" DataTextField="名称" DataValueField="コードID"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="材質"  IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" DataFormatStringEditing="" DataField="材質" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"    DataSourceID="材質DataSource" DataTextField="名称" DataValueField="コードID"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="定尺寸法縦"  IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" DataFormatStringEditing="" DataField="定尺寸法縦" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"     />
 <y:YBoundField HeaderText="定尺寸法横"  IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" DataFormatStringEditing="" DataField="定尺寸法横" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"     />
 <y:YBoundField HeaderText="厚み"  IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" DataFormatStringEditing="" DataField="厚み" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"     />
 <y:YBoundField HeaderText="定尺仕入金額"  IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server" DataFormatStringEditing="{0:f2}" DataField="定尺仕入金額" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"     />
 <y:YBoundField HeaderText="定尺売り金額"  IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server" DataFormatStringEditing="{0:f2}" DataField="定尺売り金額" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"     />
 <y:YBoundField HeaderText="削除フラグ"  IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" DataFormatStringEditing="" DataField="削除フラグ" ReadOnly="FALSE"  IsBoolean="TRUE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"     />
 <y:YBoundField HeaderText="作成ユーザー"  IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" DataFormatStringEditing="" DataField="作成ユーザー" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"    DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="最終更新ユーザー"  IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" DataFormatStringEditing="" DataField="最終更新ユーザー" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"    DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="作成日時"  IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="作成日時" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"     />
 <y:YBoundField HeaderText="最終更新日時"  IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="最終更新日時" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"     />
              </Columns>
            </y:BaseGridView>
            <y:BaseValidationSummary ID="mainValidationSummary" runat="server" EnableClientScript="true" />

            <br />

            <y:BaseFormView ID="mainFormView"
                runat="server"
                DataKeyNames="材料ID,最終更新日時" DataSourceID="mainDataSource" BackColor="#DEBA84"
                BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" GridLines="Both"
                AllowPaging="true">
                <EditItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <table>
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  id="材料名称"  Label="材料名称"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("材料名称", "") %>'   />
<y:YDropDownList   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  id="材質大分類"  Label="材質大分類"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("材質大分類") %>'  DataSourceID="材質大分類DataSource" DataTextField="名称" DataValueField="コードID"   AppendDataBoundItems="true"  />
<y:YDropDownList   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  id="材質"  Label="材質"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("材質") %>'  DataSourceID="材質DataSource" DataTextField="名称" DataValueField="コードID"   AppendDataBoundItems="true"  />
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  id="定尺寸法縦"  Label="定尺寸法縦"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺寸法縦", "") %>'   />
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  id="定尺寸法横"  Label="定尺寸法横"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺寸法横", "") %>'   />
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  id="厚み"  Label="厚み"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("厚み", "") %>'   />
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"  id="定尺仕入金額"  Label="定尺仕入金額"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺仕入金額", "{0:f2}") %>'   />
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"  id="定尺売り金額"  Label="定尺売り金額"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("定尺売り金額", "{0:f2}") %>'   />
<y:YCheckBox   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  id="削除フラグ"  Label="削除フラグ"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'  />
<y:YDropDownList   IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  id="作成ユーザー"  Label="作成ユーザー"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("作成ユーザー") %>'  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"  />
<y:YDropDownList   IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  id="最終更新ユーザー"  Label="最終更新ユーザー"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("最終更新ユーザー") %>'  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"  />
<y:YTextBox   IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"  id="作成日時"  Label="作成日時"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'   />
<y:YTextBox   IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"  id="最終更新日時"  Label="最終更新日時"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'   />
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
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  id="材料名称"  Label="材料名称"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("材料名称", "") %>'    />
<y:YDropDownList   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  id="材質大分類"  Label="材質大分類"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("材質大分類") %>'  DataSourceID="材質大分類DataSource" DataTextField="名称" DataValueField="コードID"   AppendDataBoundItems="true"   />
<y:YDropDownList   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  id="材質"  Label="材質"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("材質") %>'  DataSourceID="材質DataSource" DataTextField="名称" DataValueField="コードID"   AppendDataBoundItems="true"   />
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  id="定尺寸法縦"  Label="定尺寸法縦"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("定尺寸法縦", "") %>'    />
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  id="定尺寸法横"  Label="定尺寸法横"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("定尺寸法横", "") %>'    />
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  id="厚み"  Label="厚み"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("厚み", "") %>'    />
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"  id="定尺仕入金額"  Label="定尺仕入金額"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("定尺仕入金額", "{0:f2}") %>'    />
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"  id="定尺売り金額"  Label="定尺売り金額"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("定尺売り金額", "{0:f2}") %>'    />
<y:YCheckBox   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  id="削除フラグ"  Label="削除フラグ"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'   />
<y:YDropDownList   IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  id="作成ユーザー"  Label="作成ユーザー"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("作成ユーザー") %>'  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   />
<y:YDropDownList   IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  id="最終更新ユーザー"  Label="最終更新ユーザー"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("最終更新ユーザー") %>'  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   />
<y:YTextBox   IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"  id="作成日時"  Label="作成日時"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'    />
<y:YTextBox   IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"  id="最終更新日時"  Label="最終更新日時"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'    />
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
<y:YTextBox   IsRequired="true" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  id="材料ID"  Label="材料ID"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("材料ID", "") %>'   />
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  id="材料名称"  Label="材料名称"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("材料名称", "") %>'   />
<y:YDropDownList   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  id="材質大分類"  Label="材質大分類"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("材質大分類") %>'  DataSourceID="材質大分類DataSource" DataTextField="名称" DataValueField="コードID"   AppendDataBoundItems="true"  />
<y:YDropDownList   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  id="材質"  Label="材質"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("材質") %>'  DataSourceID="材質DataSource" DataTextField="名称" DataValueField="コードID"   AppendDataBoundItems="true"  />
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  id="定尺寸法縦"  Label="定尺寸法縦"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("定尺寸法縦", "") %>'   />
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  id="定尺寸法横"  Label="定尺寸法横"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("定尺寸法横", "") %>'   />
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  id="厚み"  Label="厚み"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("厚み", "") %>'   />
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"  id="定尺仕入金額"  Label="定尺仕入金額"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("定尺仕入金額", "{0:f2}") %>'   />
<y:YTextBox   IsRequired="false" IsDate="false"  DataFormatString="{0:c2}" IsInteger="true" runat="server"  id="定尺売り金額"  Label="定尺売り金額"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("定尺売り金額", "{0:f2}") %>'   />
<y:YCheckBox   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server"  id="削除フラグ"  Label="削除フラグ"  IsGrid="false"  ReadOnly="TRUE" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'  />
<y:YDropDownList   IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  id="作成ユーザー"  Label="作成ユーザー"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("作成ユーザー") %>'  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"  />
<y:YDropDownList   IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server"  id="最終更新ユーザー"  Label="最終更新ユーザー"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("最終更新ユーザー") %>'  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"  />
<y:YTextBox   IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"  id="作成日時"  Label="作成日時"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'   />
<y:YTextBox   IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server"  id="最終更新日時"  Label="最終更新日時"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'   />
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
                SelectCommand="select * from M材料"
                UpdateCommand=" update M材料 set 材料名称 = @材料名称, 材質大分類 = @材質大分類, 材質 = @材質, 定尺寸法縦 = @定尺寸法縦, 定尺寸法横 = @定尺寸法横, 厚み = @厚み, 定尺仕入金額 = @定尺仕入金額, 定尺売り金額 = @定尺売り金額, 削除フラグ = @削除フラグ, 最終更新ユーザー = @最終更新ユーザー, 最終更新日時 = @最終更新日時 where 材料ID = @original_材料ID and 最終更新日時 = @original_最終更新日時"
                InsertCommand=" insert into M材料 (材料ID, 材料名称, 材質大分類, 材質, 定尺寸法縦, 定尺寸法横, 厚み, 定尺仕入金額, 定尺売り金額, 削除フラグ, 作成ユーザー, 最終更新ユーザー, 作成日時, 最終更新日時) values (@材料ID, @材料名称, @材質大分類, @材質, @定尺寸法縦, @定尺寸法横, @厚み, @定尺仕入金額, @定尺売り金額, @削除フラグ, @作成ユーザー, @最終更新ユーザー, @作成日時, @最終更新日時); SET @NewParameter=LAST_INSERT_ID(); "
                DeleteCommand="update M材料  set 削除フラグ = 'True' where 材料ID = @original_材料ID  and 最終更新日時 = @original_最終更新日時"
                ConflictDetection="CompareAllValues"
                OldValuesParameterFormatString="original_{0}"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                                OnUpdating="mainDataSource_Updating"
                OnInserting="mainDataSource_Inserting">

                <InsertParameters>
<asp:formparameter  name="材料ID" formfield="材料ID"   ConvertEmptyStringToNull="true"  　Type="Int32" />
<asp:formparameter  name="材料名称" formfield="材料名称"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="材質大分類" formfield="材質大分類"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="材質" formfield="材質"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="定尺寸法縦" formfield="定尺寸法縦"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="定尺寸法横" formfield="定尺寸法横"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="厚み" formfield="厚み"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="定尺仕入金額" formfield="定尺仕入金額"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="定尺売り金額" formfield="定尺売り金額"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="削除フラグ" formfield="削除フラグ"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="作成ユーザー" formfield="作成ユーザー"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="最終更新ユーザー" formfield="最終更新ユーザー"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="作成日時" formfield="作成日時"   ConvertEmptyStringToNull="true"  　Type="DateTime" />
<asp:formparameter  name="最終更新日時" formfield="最終更新日時"   ConvertEmptyStringToNull="true"  　Type="DateTime" />

                    <asp:Parameter Direction="Output" Name="RETURN_VALUE" Type="Int32" />
                </InsertParameters>

                <UpdateParameters>
<asp:formparameter  name="材料名称" formfield="材料名称"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="材質大分類" formfield="材質大分類"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="材質" formfield="材質"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="定尺寸法縦" formfield="定尺寸法縦"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="定尺寸法横" formfield="定尺寸法横"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="厚み" formfield="厚み"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="定尺仕入金額" formfield="定尺仕入金額"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="定尺売り金額" formfield="定尺売り金額"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="削除フラグ" formfield="削除フラグ"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="最終更新ユーザー" formfield="最終更新ユーザー"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="最終更新日時" formfield="最終更新日時"   ConvertEmptyStringToNull="true"  　Type="DateTime" />

                    <asp:Parameter Name="original_材料ID" Type="String" />
                    <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="original_材料ID" Type="String" />
                    <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
                </DeleteParameters>
            </y:BaseSqlDataSource>

            <y:BaseSqlDataSource runat="server" ID="材質大分類DataSource"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                SelectCommand="SELECT  `コードID` ,  `名称`  
                    FROM  `Mコード` 
                    WHERE  `グループ` =  '材質大分類'
                    AND (`削除フラグ` is null or `削除フラグ` !=  'true')
                    ">
            </y:BaseSqlDataSource>

            <y:BaseSqlDataSource runat="server" ID="材質DataSource"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                SelectCommand="SELECT  `コードID` ,  `名称`  
                    FROM  `Mコード` 
                    WHERE  `グループ` =  '材質'
                    AND (`削除フラグ` is null or `削除フラグ` !=  'true')
                    ">
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

