<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<%@ Register Assembly="WebApplication1" TagPrefix="yuc" 
        Namespace="yuc"%>

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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="c1" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowInsertButton=true ShowEditButton=true ShowDeleteButton=true />
        <asp:BoundField DataField="c1" HeaderText="c1" ReadOnly="True" 
                SortExpression="c1"   />
        <asp:BoundField DataField="c2" HeaderText="c2" SortExpression="c2"  />
            <asp:BoundField DataField="c3dt" HeaderText="c3dt" SortExpression="c3dt" />
        </Columns>
        </asp:GridView>
        <br />

        <asp:DetailsView runat="server" AlternatingRowStyle-BackColor="Blue" 
            AutoGenerateRows="False" DataKeyNames="c1" DataSourceID="SqlDataSource1">
        
<AlternatingRowStyle BackColor="Blue"></AlternatingRowStyle>
            <Fields>
                <asp:BoundField DataField="c1" HeaderText="c1" ReadOnly="True" 
                    SortExpression="c1" />
                <asp:BoundField DataField="c2" HeaderText="c2" SortExpression="c2" />
                <asp:BoundField DataField="c3dt" HeaderText="c3dt" SortExpression="c3dt" />
            </Fields>
        </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Table2] WHERE [c1] = @original_c1 AND (([c2] = @original_c2) OR ([c2] IS NULL AND @original_c2 IS NULL)) AND (([c3dt] = @original_c3dt) OR ([c3dt] IS NULL AND @original_c3dt IS NULL))" 
            InsertCommand="INSERT INTO [Table2] ([c1], [c2], [c3dt]) VALUES (@c1, @c2, @c3dt)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Table2]" 
            UpdateCommand="UPDATE [Table2] SET [c2] = @c2, [c3dt] = @c3dt WHERE [c1] = @original_c1 AND (([c2] = @original_c2) OR ([c2] IS NULL AND @original_c2 IS NULL)) AND (([c3dt] = @original_c3dt) OR ([c3dt] IS NULL AND @original_c3dt IS NULL))">
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

    </div>
    <p>

        <asp:Button ID="Button1" Text="test" runat="server" />


    </p>
    </form>
</body>
</html>
