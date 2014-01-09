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
    
        <yuc:YTextBox runat="server" ID="test" IsRequired="true"/>
        <yuc:YTextBox runat="server" ID="YTextBox1" IsRequired="false"  />

        <asp:DetailsView runat="server" AlternatingRowStyle-BackColor="Blue">
        
        <Fields>
            <asp:TemplateField>
                <EditItemTemplate></EditItemTemplate>
            </asp:TemplateField>
        </Fields>
        </asp:DetailsView>

    </div>
    <p>

        <asp:Button ID="Button1" Text="test" runat="server" />


    </p>
    </form>
</body>
</html>
