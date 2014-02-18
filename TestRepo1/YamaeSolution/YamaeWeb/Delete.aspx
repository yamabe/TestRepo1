<%@ Page Language="C#"  MasterPageFile="~/YMasterPage.master" AutoEventWireup="true" CodeFile="Delete.aspx.cs" Inherits="Delete" %>
<%@ Register TagPrefix="y" Namespace="uc" %>


<asp:content id="Content1" contentplaceholderid="head" runat="Server">
    <title>削除画面</title>
</asp:content>

<asp:content id="Content3" contentplaceholderid="script" runat="Server">
    <script type="text/javascript">

        
        function pageLoad() {
            window.close();
        }
    </script>
</asp:content>

<asp:content id="Content5" contentplaceholderid="Main" runat="Server">
</asp:content>
