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
            DataSourceID="SqlDataSource1" onrowediting="GridView1_RowEditing" >
            <Columns>
                <asp:CommandField ShowInsertButton="false" ShowEditButton="true" ShowDeleteButton="true" />
                <yuc:YBoundField DataField="c1" HeaderText="c1" IsRequired="True" SortExpression="c1" />
                <yuc:YBoundField DataField="c2" HeaderText="c2" SortExpression="c2" />
                <yuc:YBoundField DataField="c3dt" HeaderText="c3dt" SortExpression="c3dt" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:DetailsView 
            id="detailsView1"
        runat="server" AlternatingRowStyle-BackColor="Blue" AutoGenerateRows="False"
            DataKeyNames="c1" DataSourceID="SqlDataSource1" AllowPaging="True" CellPadding="4"
            ForeColor="#333333" GridLines="None" 
            oniteminserted="Unnamed1_ItemInserted" oniteminserting="Unnamed1_ItemInserting">
            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            
            <Fields>
                <asp:CommandField ShowDeleteButton="true" ShowEditButton="true" ShowInsertButton="True" />
                <yuc:YBoundField DataField="c1" HeaderText="c1" IsRequired="True" SortExpression="c1" />
                <yuc:YBoundField DataField="c2" HeaderText="c2" IsRequired="True"  SortExpression="c2" />
                <yuc:YBoundField DataField="c3dt" HeaderText="c3dt" IsRequired="True" SortExpression="c3dt" />
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <EmptyDataTemplate>
                <asp:LinkButton CommandName="New" runat="server" Text="新規追加" />
            </EmptyDataTemplate>
        </asp:DetailsView>

        

        <asp:SqlDataSource ID="SqlDataSource1" 
        
            
        runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Table2] WHERE [c1] = @original_c1 AND (([c2] = @original_c2) OR ([c2] IS NULL AND @original_c2 IS NULL)) AND (([c3dt] = @original_c3dt) OR ([c3dt] IS NULL AND @original_c3dt IS NULL))"
            InsertCommand="INSERT INTO [Table2] ([c1], [c2], [c3dt]) VALUES (@c1, @c2, @c3dt)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Table2]"
            
            UpdateCommand="UPDATE [Table2] SET [c2] = @c2, [c3dt] = @c3dt WHERE [c1] = @original_c1 AND (([c2] = @original_c2) OR ([c2] IS NULL AND @original_c2 IS NULL)) AND (([c3dt] = @original_c3dt) OR ([c3dt] IS NULL AND @original_c3dt IS NULL))" 
            oninserted="SqlDataSource1_Inserted" oninserting="SqlDataSource1_Inserting" 
            onupdating="SqlDataSource1_Updating" onupdated="SqlDataSource1_Updated">
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

        <asp:FormView ID="FormView1" 
        runat="server" 
        DataKeyNames="c1" DataSourceID="SqlDataSource2" BackColor="#DEBA84" 
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            CellSpacing="2" GridLines="Both"


        >
            <EditItemTemplate>
                c1:
                <asp:Label ID="c1Label1" runat="server" Text='<%# Eval("c1") %>' />
                <br />
                c2:
                <yuc:YTextBox IsRequired="true" ID="c2" runat="server" Text='<%# Bind("c2") %>' />
                <br />
                c3dt:
                <asp:TextBox ID="c3dt" runat="server" Text='<%# Bind("c3dt") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                c1:
                <asp:TextBox ID="c1TextBox" runat="server" Text='<%# Bind("c1") %>' />
                <br />
                c2:
                <asp:TextBox ID="c2TextBox" runat="server" Text='<%# Bind("c2") %>' />
                <br />
                c3dt:
                <asp:TextBox ID="c3dtTextBox" runat="server" Text='<%# Bind("c3dt") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="挿入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
            </InsertItemTemplate>
            <ItemTemplate>

            
            
                c1:
                <asp:Label ID="c1Label" runat="server" Text='<%# Eval("c1") %>' />
                <br />
                c2:
                <asp:Label ID="c2Label" runat="server" Text='<%# Bind("c2") %>' />
                <br />
                c3dt:
                <asp:Label ID="c3dtLabel" runat="server" Text='<%# Bind("c3dt") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="編集" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="削除" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="新規作成" />

            
            
            </ItemTemplate>
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        </asp:FormView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Table2] WHERE [c1] = @c1" 
            InsertCommand="INSERT INTO [Table2] ([c1], [c2], [c3dt]) VALUES (@c1, @c2, @c3dt)" 
            SelectCommand="SELECT * FROM [Table2]" 
            UpdateCommand="UPDATE [Table2] SET [c2] = @c2, [c3dt] = @c3dt WHERE [c1] = @c1">
            <DeleteParameters>
                <asp:Parameter Name="c1" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="c1" Type="String" />
                <asp:Parameter Name="c2" Type="String" />
                <asp:Parameter Name="c3dt" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="c2" Type="String" />
                <asp:Parameter Name="c3dt" Type="DateTime" />
                <asp:Parameter Name="c1" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
    </form>
</body>
</html>
