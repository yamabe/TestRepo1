<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LinkButton ID="LinkButton6" runat="server" PostBackUrl="~/MTankaMitsumori.aspx" Text="単価見積もり" />
    

        <br />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/MZairyo.aspx" Text="材料マスタメンテナンス" />
    

        <br />
        <br />
        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/MZairyoKikaku.aspx" Text="材料規格メンテナンス" />

        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

        <br />
        <br />
        <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/MCompany.aspx" Text="会社マスタメンテナンス" />

        <br />
        <br />
        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/MUser.aspx" Text="ユーザーマスタメンテナンス" />
        <br />
        <br />
        <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/MCode.aspx" Text="コードマスタメンテナンス" />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
