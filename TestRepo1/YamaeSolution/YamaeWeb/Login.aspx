<%@ Page Language="C#" MasterPageFile="~/YMasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register TagPrefix="y" Namespace="uc" %>


<asp:content id="Content1" contentplaceholderid="head" runat="Server">
    <title>ログイン画面</title>
</asp:content>

<asp:content id="Content3" contentplaceholderid="script" runat="Server">
</asp:content>

<asp:content id="Content5" contentplaceholderid="Main" runat="Server">

            
        <y:YList ID="ユーザーID" Rows="11" Width="170" runat="server" DataSourceID="mainDataSource" Label="ユーザー" DataTextField="ユーザー名" DataValueField="ユーザーID"></y:YList>

        <y:YTextBox id="パスワード" runat="server" TextMode="Password" Label="パスワード" />
        </table>

        <asp:Button runat="server" Text="ログイン" OnClick="Unnamed_Click" />

        <y:BaseSqlDataSource ID="mainDataSource" runat="server"
                SelectCommand="select * from Mユーザー"
                ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
                ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
                >
            </y:BaseSqlDataSource>
    
</asp:content>
