<%@ Page Language="C#" MasterPageFile="~/YMasterPage.master" AutoEventWireup="true" CodeFile="MUser.aspx.cs" Inherits="MUser" %>

<%@ Register TagPrefix="y" Namespace="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>ユーザーマスタメンテナンス画面</title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="Main" runat="Server">

    <y:YCheckBox ID="検索削除フラグ" DefaultValue="" Label="削除フラグ" IsGrid="false" ValidationGroup="Search" runat="server" />


    <asp:Button runat="server" ID="検索" Text="検索" OnClick="検索_Click" />
    <asp:Button runat="server" ID="Clear" Text="クリア" OnClick="Clear_Click" />
    <y:YDropDownList runat="server" ID="ページサイズ" OnSelectedIndexChanged="pageSize_SelectedIndexChanged" />

    <y:BaseGridView CssClass="GridView" ID="mainGridView" runat="server"
        DataSourceID="mainDataSource"
        DataKeyNames="ユーザーID,最終更新日時" AutoGenerateColumns="false">
        <Columns>
            <asp:CommandField ShowEditButton="true" ControlStyle-Width="25" ItemStyle-Width="25"></asp:CommandField>
            <asp:CommandField ShowDeleteButton="True" ControlStyle-Width="25" ItemStyle-Width="25"></asp:CommandField>
            <asp:ButtonField CommandName="ShowDetailUpdate" Text="詳細編集" ControlStyle-Width="50" />

            <asp:ButtonField ButtonType="Link" CommandName="Copy" Text="Copy" />

 <y:YBoundField HeaderText="ユーザーID" DataFormatStringEditing="" DataField="ユーザーID" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="true" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   />
 <y:YBoundField HeaderText="ユーザー名" DataFormatStringEditing="" DataField="ユーザー名" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   />
 <y:YBoundField HeaderText="パスワード" DataFormatStringEditing="" DataField="パスワード" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   />
 <y:YBoundField HeaderText="ホスト名" DataFormatStringEditing="" DataField="ホスト名" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   />
 <y:YBoundField HeaderText="備考" DataFormatStringEditing="" DataField="備考" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="削除フラグ" DataFormatStringEditing="" DataField="削除フラグ" ReadOnly="FALSE"  IsBoolean="TRUE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   />
 <y:YBoundField HeaderText="作成ユーザー" DataFormatStringEditing="" DataField="作成ユーザー" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass=""  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="最終更新ユーザー" DataFormatStringEditing="" DataField="最終更新ユーザー" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass=""  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="作成日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="作成日時" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass=""   />
 <y:YBoundField HeaderText="最終更新日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="最終更新日時" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass=""   />
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
<y:YTextBox   id="ユーザーID"  Label="ユーザーID"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("ユーザーID", "") %>'     IsRequired="true" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   Width="70"/>
<y:YTextBox   id="ユーザー名"  Label="ユーザー名"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("ユーザー名", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   Width="100"/>
<y:YTextBox   id="パスワード"  Label="パスワード"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("パスワード", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   Width="100"/>
<y:YTextBox   id="ホスト名"  Label="ホスト名"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("ホスト名", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   Width="100"/>
<y:YTextBox   id="備考"  Label="備考"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("備考", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   TextMode="MultiLine" Rows="5"  Width="100"/>
<y:YCheckBox   id="削除フラグ"  Label="削除フラグ"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   Width="40"/>
<y:YDropDownList   id="作成ユーザー"  Label="作成ユーザー"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("作成ユーザー") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass=""  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100"/>
<y:YDropDownList   id="最終更新ユーザー"  Label="最終更新ユーザー"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("最終更新ユーザー") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass=""  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100"/>
<y:YTextBox   id="作成日時"  Label="作成日時"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'     IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass=""   Width="100"/>
<y:YTextBox   id="最終更新日時"  Label="最終更新日時"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'     IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass=""   Width="100"/>
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
<y:YTextBox   id="ユーザー名" DefaultValue=""  Label="ユーザー名"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("ユーザー名", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   Width="100" />
<y:YTextBox   id="パスワード" DefaultValue=""  Label="パスワード"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("パスワード", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   Width="100" />
<y:YTextBox   id="ホスト名" DefaultValue=""  Label="ホスト名"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("ホスト名", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   Width="100" />
<y:YTextBox   id="備考" DefaultValue=""  Label="備考"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("備考", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   TextMode="MultiLine" Rows="5"  Width="100" />
<y:YCheckBox   id="削除フラグ" DefaultValue=""  Label="削除フラグ"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   Width="40" />
<y:YDropDownList   id="作成ユーザー" DefaultValue=""  Label="作成ユーザー"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("作成ユーザー") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass=""  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100" />
<y:YDropDownList   id="最終更新ユーザー" DefaultValue=""  Label="最終更新ユーザー"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("最終更新ユーザー") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass=""  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100" />
<y:YTextBox   id="作成日時" DefaultValue=""  Label="作成日時"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'     IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass=""   Width="100" />
<y:YTextBox   id="最終更新日時" DefaultValue=""  Label="最終更新日時"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'     IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass=""   Width="100" />
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
<y:YTextBox   id="ユーザーID"  Label="ユーザーID"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("ユーザーID", "") %>'    IsRequired="true" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   Width="70"/>
<y:YTextBox   id="ユーザー名"  Label="ユーザー名"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("ユーザー名", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   Width="100"/>
<y:YTextBox   id="パスワード"  Label="パスワード"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("パスワード", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   Width="100"/>
<y:YTextBox   id="ホスト名"  Label="ホスト名"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("ホスト名", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   Width="100"/>
<y:YTextBox   id="備考"  Label="備考"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("備考", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   TextMode="MultiLine" Rows="5"  Width="100"/>
<y:YCheckBox   id="削除フラグ"  Label="削除フラグ"  IsGrid="false"  ReadOnly="TRUE" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass=""   Width="40"/>
<y:YDropDownList   id="作成ユーザー"  Label="作成ユーザー"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("作成ユーザー") %>'   IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass=""  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100"/>
<y:YDropDownList   id="最終更新ユーザー"  Label="最終更新ユーザー"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("最終更新ユーザー") %>'   IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass=""  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100"/>
<y:YTextBox   id="作成日時"  Label="作成日時"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'    IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass=""   Width="100"/>
<y:YTextBox   id="最終更新日時"  Label="最終更新日時"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'    IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass=""   Width="100"/>
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
        UpdateCommand=" update Mユーザー set 
        ユーザー名 = @ユーザー名, パスワード = @パスワード, ホスト名 = @ホスト名, 備考 = @備考, 削除フラグ = @削除フラグ, 最終更新ユーザー = @最終更新ユーザー, 最終更新日時 = @最終更新日時  
        where ユーザーID = @original_ユーザーID and 最終更新日時 = @original_最終更新日時"
        InsertCommand=" insert into Mユーザー 
        (ユーザーID, ユーザー名, パスワード, ホスト名,備考, 削除フラグ, 作成ユーザー, 最終更新ユーザー, 作成日時, 最終更新日時) values 
        (@ユーザーID, @ユーザー名, @パスワード,@ホスト名,@備考,  @削除フラグ, @作成ユーザー, @最終更新ユーザー,  current_timestamp, current_timestamp); "
        DeleteCommand="update Mユーザー    set 削除フラグ = 'True' where ユーザーID = @original_ユーザーID  and 最終更新日時 = @original_最終更新日時"
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original_{0}"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        OnUpdating="mainDataSource_Updating"
        OnInserting="mainDataSource_Inserting">

        <InsertParameters>
<asp:formparameter  name="ユーザーID" formfield="ユーザーID"   ConvertEmptyStringToNull="true"  　Type="Int32" />
<asp:formparameter  name="ユーザー名" formfield="ユーザー名"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="パスワード" formfield="パスワード"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="ホスト名" formfield="ホスト名"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="備考" formfield="備考"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="削除フラグ" formfield="削除フラグ"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="作成ユーザー" formfield="作成ユーザー"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="最終更新ユーザー" formfield="最終更新ユーザー"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="作成日時" formfield="作成日時"   ConvertEmptyStringToNull="true"  　Type="DateTime" />
<asp:formparameter  name="最終更新日時" formfield="最終更新日時"   ConvertEmptyStringToNull="true"  　Type="DateTime" />
        </InsertParameters>

        <UpdateParameters>
<asp:formparameter  name="ユーザー名" formfield="ユーザー名"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="パスワード" formfield="パスワード"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="ホスト名" formfield="ホスト名"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="備考" formfield="備考"   ConvertEmptyStringToNull="true"  　Type="String" />
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
        SelectCommand="SELECT ユーザーId, ユーザー名 FROM `Mユーザー`">
    </y:BaseSqlDataSource>

</asp:Content>
