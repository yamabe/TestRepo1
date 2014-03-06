<%@ Page Language="C#" MasterPageFile="~/YMasterPage.master"  AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>メニュー画面</title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">


</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="Main" runat="Server">

        <asp:LinkButton ID="LinkButton6" runat="server" PostBackUrl="~/MTankaMitsumori.aspx" Text="単価見積もり" />
    

        <br />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/MZairyoKakaku.aspx" Text="材料価格メンテナンス" />
        <br />
        <br />
        <asp:LinkButton ID="LinkButton7" runat="server" PostBackUrl="~/MZairyoZokusei.aspx" Text="材料属性メンテナンス" />
    
    

        <br />
        <br />
        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/MZairyoKikaku.aspx" Text="材料規格メンテナンス" />

            <br />
        <br />
        <asp:LinkButton ID="LinkButton8" runat="server" PostBackUrl="~/ZairyoIchiran.aspx" Text="材料一覧" />

        <br />
        <br />
        <asp:LinkButton ID="LinkButton10" runat="server" PostBackUrl="~/MGomuTokusei.aspx" Text="ゴム特性一覧" />

            <br />
        <br />
        <asp:LinkButton ID="LinkButton11" runat="server" PostBackUrl="~/FileList.aspx" Text="ファイル一覧" />

            <br />
        <br />
        <asp:LinkButton ID="LinkButton12" runat="server" PostBackUrl="~/FileUpload.aspx" Text="ファイル登録" />

        <br />
        <br />
        <asp:LinkButton ID="LinkButton9" runat="server" PostBackUrl="~/Logout.aspx" Text="ログアウト" />
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
    
 
</asp:Content>
