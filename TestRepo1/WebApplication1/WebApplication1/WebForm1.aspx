<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<%@ Register Assembly="WebApplication1" TagPrefix="yuc" Namespace="yuc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="c1"
            DataSourceID="SqlDataSource1" OnRowEditing="GridView1_RowEditing">
            <Columns>
                <asp:CommandField ShowInsertButton="false" ShowEditButton="true" ShowDeleteButton="true" />
                <yuc:YBoundField DataField="c1" HeaderText="c1" IsRequired="True" SortExpression="c1" />
                <yuc:YBoundField DataField="c2" HeaderText="c2" SortExpression="c2" />
                <yuc:YBoundField DataField="c3dt" HeaderText="c3dt" SortExpression="c3dt" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:DetailsView ID="detailsView1" runat="server" AlternatingRowStyle-BackColor="Blue"
            AutoGenerateRows="False" DataKeyNames="c1" DataSourceID="SqlDataSource1" AllowPaging="True"
            CellPadding="4" ForeColor="#333333" GridLines="None" OnItemInserted="Unnamed1_ItemInserted"
            OnItemInserting="Unnamed1_ItemInserting">
            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:CommandField ShowDeleteButton="true" ShowEditButton="true" ShowInsertButton="True" />
                <y:yboundfield headertext="材料ID" isrequired="true" isdate="false" dataformatstring=""
                    isinteger="true" runat="server" datafield="材料ID" readonly="TRUE" controlstyle-width="70"
                    itemstyle-width="70" itemstyle-wrap="false" />
                <y:yboundfield headertext="材料名称" isrequired="false" isdate="false" dataformatstring=""
                    isinteger="false" runat="server" datafield="材料名称" readonly="FALSE" controlstyle-width="100"
                    itemstyle-width="100" itemstyle-wrap="false" />
                <y:yboundfield headertext="材質" isrequired="false" isdate="false" dataformatstring=""
                    isinteger="false" runat="server" datafield="材質" readonly="FALSE" controlstyle-width="100"
                    itemstyle-width="100" itemstyle-wrap="false" />
                <y:yboundfield headertext="定尺寸法縦" isrequired="false" isdate="false" dataformatstring=""
                    isinteger="true" runat="server" datafield="定尺寸法縦" readonly="FALSE" controlstyle-width="70"
                    itemstyle-width="70" itemstyle-wrap="false" />
                <y:yboundfield headertext="定尺寸法横" isrequired="false" isdate="false" dataformatstring=""
                    isinteger="true" runat="server" datafield="定尺寸法横" readonly="FALSE" controlstyle-width="70"
                    itemstyle-width="70" itemstyle-wrap="false" />
                <y:yboundfield headertext="厚み" isrequired="false" isdate="false" dataformatstring=""
                    isinteger="true" runat="server" datafield="厚み" readonly="FALSE" controlstyle-width="40"
                    itemstyle-width="40" itemstyle-wrap="false" />
                <y:yboundfield headertext="定尺仕入金額" isrequired="false" isdate="false" dataformatstring=""
                    isinteger="true" runat="server" datafield="定尺仕入金額" readonly="FALSE" controlstyle-width="70"
                    itemstyle-width="70" itemstyle-wrap="false" />
                <y:yboundfield headertext="定尺売り金額" isrequired="false" isdate="false" dataformatstring=""
                    isinteger="true" runat="server" datafield="定尺売り金額" readonly="FALSE" controlstyle-width="70"
                    itemstyle-width="70" itemstyle-wrap="false" />
                <y:yboundfield headertext="作成ユーザー名" isrequired="FALSE" isdate="false" dataformatstring=""
                    isinteger="false" runat="server" datafield="作成ユーザー名" readonly="TRUE" controlstyle-width="100"
                    itemstyle-width="100" itemstyle-wrap="false" />
                <y:yboundfield headertext="最終更新ユーザー名" isrequired="FALSE" isdate="false" dataformatstring=""
                    isinteger="false" runat="server" datafield="最終更新ユーザー名" readonly="TRUE" controlstyle-width="100"
                    itemstyle-width="100" itemstyle-wrap="false" />
                <y:yboundfield headertext="作成日時" isrequired="FALSE" isdate="true" dataformatstring="yyyy/MM/dd hh:mm ss"
                    isinteger="false" runat="server" datafield="作成日時" readonly="TRUE" controlstyle-width="100"
                    itemstyle-width="100" itemstyle-wrap="false" />
                <y:yboundfield headertext="最終更新日時" isrequired="FALSE" isdate="true" dataformatstring="yyyy/MM/dd hh:mm ss"
                    isinteger="false" runat="server" datafield="最終更新日時" readonly="TRUE" controlstyle-width="100"
                    itemstyle-width="100" itemstyle-wrap="false" />
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <EmptyDataTemplate>
                <asp:LinkButton CommandName="New" runat="server" Text="新規追加" />
            </EmptyDataTemplate>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Table2] WHERE [c1] = @original_c1 AND (([c2] = @original_c2) OR ([c2] IS NULL AND @original_c2 IS NULL)) AND (([c3dt] = @original_c3dt) OR ([c3dt] IS NULL AND @original_c3dt IS NULL))"
            InsertCommand="INSERT INTO [Table2] ([c1], [c2], [c3dt]) VALUES (@c1, @c2, @c3dt)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Table2]"
            UpdateCommand="UPDATE [Table2] SET [c2] = @c2, [c3dt] = @c3dt WHERE [c1] = @original_c1 AND (([c2] = @original_c2) OR ([c2] IS NULL AND @original_c2 IS NULL)) AND (([c3dt] = @original_c3dt) OR ([c3dt] IS NULL AND @original_c3dt IS NULL))"
            OnInserted="SqlDataSource1_Inserted" OnInserting="SqlDataSource1_Inserting" OnUpdating="SqlDataSource1_Updating"
            OnUpdated="SqlDataSource1_Updated">
            <DeleteParameters>
                <asp:Parameter Name="original_c1" Type="String" />
                <asp:Parameter Name="original_c2" Type="String" />
                <asp:Parameter Name="original_c3dt" Type="DateTime" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="c1" Type="String" />
                <asp:Parameter Name="c2" Type="String" />
                <asp:Parameter Name="c3dt" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="c2" Type="String" />
                <asp:Parameter Name="c3dt" Type="DateTime" />
                <asp:Parameter Name="original_c1" Type="String" />
                <asp:Parameter Name="original_c2" Type="String" />
                <asp:Parameter Name="original_c3dt" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="材料ID" DataSourceID="SqlDataSource2"
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" CellSpacing="2" GridLines="Both">
            <EditItemTemplate>
                材料ID:
                <asp:Label ID="材料IDLabel1" runat="server" Text='<%# Eval("材料ID") %>' />
                <br />
                材料名称:
                <asp:TextBox ID="材料名称TextBox" runat="server" Text='<%# Bind("材料名称") %>' />
                <br />
                材質:
                <asp:TextBox ID="材質TextBox" runat="server" Text='<%# Bind("材質") %>' />
                <br />
                定尺寸法縦:
                <asp:TextBox ID="定尺寸法縦TextBox" runat="server" Text='<%# Bind("定尺寸法縦") %>' />
                <br />
                定尺寸法横:
                <asp:TextBox ID="定尺寸法横TextBox" runat="server" Text='<%# Bind("定尺寸法横") %>' />
                <br />
                厚み:
                <asp:TextBox ID="厚みTextBox" runat="server" Text='<%# Bind("厚み") %>' />
                <br />
                定尺仕入金額:
                <asp:TextBox ID="定尺仕入金額TextBox" runat="server" Text='<%# Bind("定尺仕入金額") %>' />
                <br />
                定尺売り金額:
                <asp:TextBox ID="定尺売り金額TextBox" runat="server" Text='<%# Bind("定尺売り金額") %>' />
                <br />
                作成ユーザー名:
                <asp:TextBox ID="作成ユーザー名TextBox" runat="server" Text='<%# Bind("作成ユーザー名") %>' />
                <br />
                最終更新ユーザー名:
                <asp:TextBox ID="最終更新ユーザー名TextBox" runat="server" 
                    Text='<%# Bind("最終更新ユーザー名") %>' />
                <br />
                作成日時:
                <asp:TextBox ID="作成日時TextBox" runat="server" Text='<%# Bind("作成日時") %>' />
                <br />
                最終更新日時:
                <asp:TextBox ID="最終更新日時TextBox" runat="server" Text='<%# Bind("最終更新日時") %>' />
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
                材料ID:
                <asp:TextBox ID="材料IDTextBox" runat="server" Text='<%# Bind("材料ID") %>' />
                <br />
                材料名称:
                <asp:TextBox ID="材料名称TextBox" runat="server" Text='<%# Bind("材料名称") %>' />
                <br />
                材質:
                <asp:TextBox ID="材質TextBox" runat="server" Text='<%# Bind("材質") %>' />
                <br />
                定尺寸法縦:
                <asp:TextBox ID="定尺寸法縦TextBox" runat="server" Text='<%# Bind("定尺寸法縦") %>' />
                <br />
                定尺寸法横:
                <asp:TextBox ID="定尺寸法横TextBox" runat="server" Text='<%# Bind("定尺寸法横") %>' />
                <br />
                厚み:
                <asp:TextBox ID="厚みTextBox" runat="server" Text='<%# Bind("厚み") %>' />
                <br />
                定尺仕入金額:
                <asp:TextBox ID="定尺仕入金額TextBox" runat="server" Text='<%# Bind("定尺仕入金額") %>' />
                <br />
                定尺売り金額:
                <asp:TextBox ID="定尺売り金額TextBox" runat="server" Text='<%# Bind("定尺売り金額") %>' />
                <br />
                作成ユーザー名:
                <asp:TextBox ID="作成ユーザー名TextBox" runat="server" Text='<%# Bind("作成ユーザー名") %>' />
                <br />
                最終更新ユーザー名:
                <asp:TextBox ID="最終更新ユーザー名TextBox" runat="server" 
                    Text='<%# Bind("最終更新ユーザー名") %>' />
                <br />
                作成日時:
                <asp:TextBox ID="作成日時TextBox" runat="server" Text='<%# Bind("作成日時") %>' />
                <br />
                最終更新日時:
                <asp:TextBox ID="最終更新日時TextBox" runat="server" Text='<%# Bind("最終更新日時") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="挿入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                    CommandName="Cancel" Text="キャンセル" />
            </InsertItemTemplate>
            <ItemTemplate>
                材料ID:
                <asp:Label ID="材料IDLabel" runat="server" Text='<%# Eval("材料ID") %>' />
                <br />
                材料名称:
                <asp:Label ID="材料名称Label" runat="server" Text='<%# Bind("材料名称") %>' />
                <br />
                材質:
                <asp:Label ID="材質Label" runat="server" Text='<%# Bind("材質") %>' />
                <br />
                定尺寸法縦:
                <asp:Label ID="定尺寸法縦Label" runat="server" Text='<%# Bind("定尺寸法縦") %>' />
                <br />
                定尺寸法横:
                <asp:Label ID="定尺寸法横Label" runat="server" Text='<%# Bind("定尺寸法横") %>' />
                <br />
                厚み:
                <asp:Label ID="厚みLabel" runat="server" Text='<%# Bind("厚み") %>' />
                <br />
                定尺仕入金額:
                <asp:Label ID="定尺仕入金額Label" runat="server" Text='<%# Bind("定尺仕入金額") %>' />
                <br />
                定尺売り金額:
                <asp:Label ID="定尺売り金額Label" runat="server" Text='<%# Bind("定尺売り金額") %>' />
                <br />
                作成ユーザー名:
                <asp:Label ID="作成ユーザー名Label" runat="server" Text='<%# Bind("作成ユーザー名") %>' />
                <br />
                最終更新ユーザー名:
                <asp:Label ID="最終更新ユーザー名Label" runat="server" Text='<%# Bind("最終更新ユーザー名") %>' />
                <br />
                作成日時:
                <asp:Label ID="作成日時Label" runat="server" Text='<%# Bind("作成日時") %>' />
                <br />
                最終更新日時:
                <asp:Label ID="最終更新日時Label" runat="server" Text='<%# Bind("最終更新日時") %>' />
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
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            
            DeleteCommand="DELETE FROM [T単価] WHERE [材料ID] = @original_材料ID AND (([材料名称] = @original_材料名称) OR ([材料名称] IS NULL AND @original_材料名称 IS NULL)) AND (([材質] = @original_材質) OR ([材質] IS NULL AND @original_材質 IS NULL)) AND (([定尺寸法縦] = @original_定尺寸法縦) OR ([定尺寸法縦] IS NULL AND @original_定尺寸法縦 IS NULL)) AND (([定尺寸法横] = @original_定尺寸法横) OR ([定尺寸法横] IS NULL AND @original_定尺寸法横 IS NULL)) AND (([厚み] = @original_厚み) OR ([厚み] IS NULL AND @original_厚み IS NULL)) AND (([定尺仕入金額] = @original_定尺仕入金額) OR ([定尺仕入金額] IS NULL AND @original_定尺仕入金額 IS NULL)) AND (([定尺売り金額] = @original_定尺売り金額) OR ([定尺売り金額] IS NULL AND @original_定尺売り金額 IS NULL)) AND (([作成ユーザー名] = @original_作成ユーザー名) OR ([作成ユーザー名] IS NULL AND @original_作成ユーザー名 IS NULL)) AND (([最終更新ユーザー名] = @original_最終更新ユーザー名) OR ([最終更新ユーザー名] IS NULL AND @original_最終更新ユーザー名 IS NULL)) AND [作成日時] = @original_作成日時 AND [最終更新日時] = @original_最終更新日時" InsertCommand="INSERT INTO [T単価] ([材料ID], [材料名称], [材質], [定尺寸法縦], [定尺寸法横], [厚み], [定尺仕入金額], [定尺売り金額], [作成ユーザー名], [最終更新ユーザー名], [作成日時], [最終更新日時]) VALUES (@材料ID, @材料名称, @材質, @定尺寸法縦, @定尺寸法横, @厚み, @定尺仕入金額, @定尺売り金額, @作成ユーザー名, @最終更新ユーザー名, @作成日時, @最終更新日時)"
            SelectCommand="SELECT * FROM [T単価]" 
            UpdateCommand="UPDATE [T単価] SET [材料名称] = @材料名称, [材質] = @材質, [定尺寸法縦] = @定尺寸法縦, [定尺寸法横] = @定尺寸法横, [厚み] = @厚み, [定尺仕入金額] = @定尺仕入金額, [定尺売り金額] = @定尺売り金額, [作成ユーザー名] = @作成ユーザー名, [最終更新ユーザー名] = @最終更新ユーザー名, [作成日時] = @作成日時, [最終更新日時] = @最終更新日時 WHERE [材料ID] = @original_材料ID AND (([材料名称] = @original_材料名称) OR ([材料名称] IS NULL AND @original_材料名称 IS NULL)) AND (([材質] = @original_材質) OR ([材質] IS NULL AND @original_材質 IS NULL)) AND (([定尺寸法縦] = @original_定尺寸法縦) OR ([定尺寸法縦] IS NULL AND @original_定尺寸法縦 IS NULL)) AND (([定尺寸法横] = @original_定尺寸法横) OR ([定尺寸法横] IS NULL AND @original_定尺寸法横 IS NULL)) AND (([厚み] = @original_厚み) OR ([厚み] IS NULL AND @original_厚み IS NULL)) AND (([定尺仕入金額] = @original_定尺仕入金額) OR ([定尺仕入金額] IS NULL AND @original_定尺仕入金額 IS NULL)) AND (([定尺売り金額] = @original_定尺売り金額) OR ([定尺売り金額] IS NULL AND @original_定尺売り金額 IS NULL)) AND (([作成ユーザー名] = @original_作成ユーザー名) OR ([作成ユーザー名] IS NULL AND @original_作成ユーザー名 IS NULL)) AND (([最終更新ユーザー名] = @original_最終更新ユーザー名) OR ([最終更新ユーザー名] IS NULL AND @original_最終更新ユーザー名 IS NULL)) AND [作成日時] = @original_作成日時 AND [最終更新日時] = @original_最終更新日時" 
            ConflictDetection="CompareAllValues" 
            OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="original_材料ID" Type="Int32" />
                <asp:Parameter Name="original_材料名称" Type="String" />
                <asp:Parameter Name="original_材質" Type="String" />
                <asp:Parameter Name="original_定尺寸法縦" Type="Int32" />
                <asp:Parameter Name="original_定尺寸法横" Type="Int32" />
                <asp:Parameter Name="original_厚み" Type="Int32" />
                <asp:Parameter Name="original_定尺仕入金額" Type="Int32" />
                <asp:Parameter Name="original_定尺売り金額" Type="Int32" />
                <asp:Parameter Name="original_作成ユーザー名" Type="String" />
                <asp:Parameter Name="original_最終更新ユーザー名" Type="String" />
                <asp:Parameter Name="original_作成日時" Type="DateTime" />
                <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="材料ID" Type="Int32" />
                <asp:Parameter Name="材料名称" Type="String" />
                <asp:Parameter Name="材質" Type="String" />
                <asp:Parameter Name="定尺寸法縦" Type="Int32" />
                <asp:Parameter Name="定尺寸法横" Type="Int32" />
                <asp:Parameter Name="厚み" Type="Int32" />
                <asp:Parameter Name="定尺仕入金額" Type="Int32" />
                <asp:Parameter Name="定尺売り金額" Type="Int32" />
                <asp:Parameter Name="作成ユーザー名" Type="String" />
                <asp:Parameter Name="最終更新ユーザー名" Type="String" />
                <asp:Parameter Name="作成日時" Type="DateTime" />
                <asp:Parameter Name="最終更新日時" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="材料名称" Type="String" />
                <asp:Parameter Name="材質" Type="String" />
                <asp:Parameter Name="定尺寸法縦" Type="Int32" />
                <asp:Parameter Name="定尺寸法横" Type="Int32" />
                <asp:Parameter Name="厚み" Type="Int32" />
                <asp:Parameter Name="定尺仕入金額" Type="Int32" />
                <asp:Parameter Name="定尺売り金額" Type="Int32" />
                <asp:Parameter Name="作成ユーザー名" Type="String" />
                <asp:Parameter Name="最終更新ユーザー名" Type="String" />
                <asp:Parameter Name="作成日時" Type="DateTime" />
                <asp:Parameter Name="最終更新日時" Type="DateTime" />
                <asp:Parameter Name="original_材料ID" Type="Int32" />
                <asp:Parameter Name="original_材料名称" Type="String" />
                <asp:Parameter Name="original_材質" Type="String" />
                <asp:Parameter Name="original_定尺寸法縦" Type="Int32" />
                <asp:Parameter Name="original_定尺寸法横" Type="Int32" />
                <asp:Parameter Name="original_厚み" Type="Int32" />
                <asp:Parameter Name="original_定尺仕入金額" Type="Int32" />
                <asp:Parameter Name="original_定尺売り金額" Type="Int32" />
                <asp:Parameter Name="original_作成ユーザー名" Type="String" />
                <asp:Parameter Name="original_最終更新ユーザー名" Type="String" />
                <asp:Parameter Name="original_作成日時" Type="DateTime" />
                <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
