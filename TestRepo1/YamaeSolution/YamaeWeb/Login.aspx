<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register TagPrefix="y" Namespace="uc" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            
        <y:YDropDownList ID="ユーザーID" runat="server" DataSourceID="mainDataSource" Label="ユーザー" DataTextField="ユーザー名" DataValueField="ユーザーID"></y:YDropDownList>

        <y:YTextBox id="パスワード" runat="server" TextMode="Password" Label="パスワード" />
        </table>

        <asp:Button runat="server" Text="ログイン" OnClick="Unnamed_Click" />

        <y:BaseSqlDataSource ID="mainDataSource" runat="server"
                SelectCommand="select * from Mユーザー"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                >
            </y:BaseSqlDataSource>
    
    </div>
    </form>
</body>
</html>
