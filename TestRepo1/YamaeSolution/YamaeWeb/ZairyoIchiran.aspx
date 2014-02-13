<%@ Page Title="" Language="C#" MasterPageFile="~/YMasterPage.master" AutoEventWireup="true" CodeFile="ZairyoIchiran.aspx.cs" Inherits="ZairyoIchiran" %>
<%@ Register TagPrefix="y" Namespace="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <title>材料一覧</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="script" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Main" Runat="Server">

        <y:YDropDownList runat="server" ID="ページサイズ" OnSelectedIndexChanged="pageSize_SelectedIndexChanged" />

       <y:BaseGridView CssClass="GridView" ID="mainGridView" runat="server"
        DataKeyNames="材料ID" AutoGenerateColumns="false"
        AllowPaging="true"
        PageSize="60"
        AllowSorting="true"
           AllowRowClick="false"
        PagerStyle-CssClass="grid_pager" AlternatingRowStyle-Wrap="false" RowStyle-Wrap="false">
          
    </y:BaseGridView>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Chart" Runat="Server">
</asp:Content>

