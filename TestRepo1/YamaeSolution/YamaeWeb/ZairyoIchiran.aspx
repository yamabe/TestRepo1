<%@ Page Title="" Language="C#" MasterPageFile="~/YMasterPage.master" AutoEventWireup="true" CodeFile="ZairyoIchiran.aspx.cs" Inherits="ZairyoIchiran" %>

<%@ Register TagPrefix="y" Namespace="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>材料一覧</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Main" runat="Server">

    <y:YDropDownList ID="検索材料メーカー" AutoPostBack="true" DefaultValue="" Label="材料メーカー" IsGrid="false" ValidationGroup="Search" runat="server" DataSourceID="検索材料メーカーDataSource" DataTextField="会社名称" DataValueField="会社ID" AddEmptyItem="true" AppendDataBoundItems="true" />
    <y:YDropDownList ID="検索材質大分類" AutoPostBack="true"  DefaultValue="" Label="材質大分類" IsGrid="false" ValidationGroup="Search" runat="server" DataSourceID="検索材質大分類DataSource" DataTextField="名称" DataValueField="コードID" AddEmptyItem="true" AppendDataBoundItems="true" />
    <y:YDropDownList ID="検索材質" AutoPostBack="true"  DefaultValue="" Label="材質" IsGrid="false" ValidationGroup="Search" runat="server" DataSourceID="検索材質DataSource" DataTextField="名称" DataValueField="コードID" AddEmptyItem="true" AppendDataBoundItems="true" />

    
    <y:YDropDownList ID="順序" Width="160" runat="server" Label="順序" AutoPostBack="true">
        <asp:ListItem Value=" t1.材料メーカー,t1.材料名称" Text="材料メーカー,材料名称" Selected="True"></asp:ListItem>
        <asp:ListItem Value=" t4.名称,t1.材料メーカー,t1.材料名称" Text="材質大分類"></asp:ListItem>
        <asp:ListItem Value=" t5.名称,t1.材料メーカー,t1.材料名称" Text="材質"></asp:ListItem>
        <asp:ListItem Value=" t1.密度 desc,t1.材料メーカー,t1.材料名称" Text="密度" ></asp:ListItem>
        <asp:ListItem Value=" t2.耐寒 desc,t1.材料メーカー,t1.材料名称" Text="耐寒" ></asp:ListItem>
        <asp:ListItem Value=" t2.耐熱 desc,t1.材料メーカー,t1.材料名称" Text="耐熱" ></asp:ListItem>
        <asp:ListItem Value=" t2.難燃性 desc,t1.材料メーカー,t1.材料名称" Text="難燃性" ></asp:ListItem>
    </y:YDropDownList>

    <asp:Button runat="server" ID="Clear" Text="クリア" OnClick="Clear_Click" />
    <br />

    <y:YList ID="検索定尺仕入金額" Rows="2" Height="40" Width="80" runat="server" Label="定尺仕入金額" AutoPostBack="true">
        <asp:ListItem Value="" Text="表示する" Selected="True"></asp:ListItem>
        <asp:ListItem Value="(入)" Text="表示しない"></asp:ListItem>
    </y:YList>
    <y:YList ID="検索M2あたり材料費" Rows="2" Height="40" Width="80" runat="server" Label="M2あたり材料費" AutoPostBack="true">
        <asp:ListItem Value="" Text="表示する"></asp:ListItem>
        <asp:ListItem Value="(㎡)" Text="表示しない" Selected="True"></asp:ListItem>
    </y:YList>
    <y:YList ID="検索定尺売り金額" Rows="2" Height="40" Width="80" runat="server" Label="定尺売り金額" AutoPostBack="true">
        <asp:ListItem Value="" Text="表示する"></asp:ListItem>
        <asp:ListItem Value="(売)" Text="表示しない" Selected="True"></asp:ListItem>
    </y:YList>
    <y:YList ID="検索利益率" Rows="2" Height="40" Width="80" runat="server" Label="利益率" AutoPostBack="true">
        <asp:ListItem Value="" Text="表示する"></asp:ListItem>
        <asp:ListItem Value="(利)" Text="表示しない" Selected="True"></asp:ListItem>
    </y:YList>


        
    

    <y:YDropDownList runat="server" ID="ページサイズ" OnSelectedIndexChanged="pageSize_SelectedIndexChanged">
        <asp:ListItem Text="すべて" Value="すべて" Selected="True" />
        <asp:ListItem Text="12" Value="12" />
        <asp:ListItem Text="30" Value="30" />
        <asp:ListItem Text="60" Value="60" />
    </y:YDropDownList>

    <y:BaseGridView CssClass="GridView" ID="mainGridView" runat="server"
        DataKeyNames="材料ID" AutoGenerateColumns="false"
        AllowRowClick="false"
        PagerStyle-CssClass="grid_pager" AlternatingRowStyle-Wrap="false" RowStyle-Wrap="false">
    </y:BaseGridView>

      <y:BaseSqlDataSource runat="server" ID="検索材料メーカーDataSource"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        SelectCommand="select t2.会社ID, t2.会社名称 from ( SELECT distinct(材料メーカー) as 材料メーカー FROM `m材料価格`) as t1 left outer join m会社 as t2 on t1.材料メーカー = t2.会社ID
                    ">
    </y:BaseSqlDataSource>

    <y:BaseSqlDataSource runat="server" ID="検索材質大分類DataSource"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        SelectCommand="
                select t2.コードID, t2.名称 from ( SELECT distinct(材質大分類) as 材質大分類 FROM `m材料価格`) as t1 left outer join mコード as t2 on t2.グループ = '材質大分類' and t1.材質大分類 = t2.コードID 
                    ">
    </y:BaseSqlDataSource>

    <y:BaseSqlDataSource runat="server" ID="検索材質DataSource"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        SelectCommand="
                select t2.コードID, t2.名称 from ( SELECT distinct(材質) as 材質 FROM `m材料価格`) as t1 left outer join mコード as t2 on t2.グループ = '材質' and t1.材質 = t2.コードID 
                    ">
    </y:BaseSqlDataSource>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Chart" runat="Server">
</asp:Content>

