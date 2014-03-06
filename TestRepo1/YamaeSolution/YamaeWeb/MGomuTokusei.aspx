<%@ Page Language="C#" MasterPageFile="~/YMasterPage.master" AutoEventWireup="true" CodeFile="MGomuTokusei.aspx.cs" Inherits="MGomuTokusei" %>

<%@ Register TagPrefix="y" Namespace="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>ゴム特性一覧表</title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">

    <script type="text/javascript">
    </script>

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="Main" runat="Server">
    <y:YDropDownList ID="検索耐熱性" AutoPostBack="true" DefaultValue="" Label="耐熱性【℃】" IsGrid="false" ValidationGroup="Search" runat="server" AddEmptyItem="true" AppendDataBoundItems="true">
        <asp:ListItem Value="" Text="(選択なし)" />
        <asp:ListItem Value="80" />
        <asp:ListItem Value="100" />
        <asp:ListItem Value="120" />
        <asp:ListItem Value="140" />
        <asp:ListItem Value="160" />
        <asp:ListItem Value="180" />
        <asp:ListItem Value="200" />
        <asp:ListItem Value="220" />
        <asp:ListItem Value="240" />
        <asp:ListItem Value="260" />
    </y:YDropDownList>

    <y:YDropDownList ID="検索耐炎" AutoPostBack="true" DefaultValue="" Label="耐炎" IsGrid="false" ValidationGroup="Search" runat="server" AddEmptyItem="true" AppendDataBoundItems="true">
        <asp:ListItem Value="" Text="(選択なし)" />
        <asp:ListItem Value="×" />
        <asp:ListItem Value="△" />
        <asp:ListItem Value="○" />
        <asp:ListItem Value="◎" />
    </y:YDropDownList>

    <y:YDropDownList ID="検索耐薬_有機酸" AutoPostBack="true" DefaultValue="" Label="有機酸" IsGrid="false" ValidationGroup="Search" runat="server">
        <asp:ListItem Value="" Text="(選択なし)" />
        <asp:ListItem Value="×" />
        <asp:ListItem Value="△" />
        <asp:ListItem Value="○" />
        <asp:ListItem Value="◎" />
    </y:YDropDownList>

        <y:YDropDownList ID="検索耐薬_高濃度無機酸" AutoPostBack="true" DefaultValue="" Label="無機酸(高)" IsGrid="false" ValidationGroup="Search" runat="server">
        <asp:ListItem Value="" Text="(選択なし)" />
        <asp:ListItem Value="×" />
        <asp:ListItem Value="△" />
        <asp:ListItem Value="○" />
        <asp:ListItem Value="◎" />
    </y:YDropDownList>
    <y:YDropDownList ID="検索耐薬_低濃度無機酸" AutoPostBack="true" DefaultValue="" Label="無機酸(低)" IsGrid="false" ValidationGroup="Search" runat="server">
        <asp:ListItem Value="" Text="(選択なし)" />
        <asp:ListItem Value="×" />
        <asp:ListItem Value="△" />
        <asp:ListItem Value="○" />
        <asp:ListItem Value="◎" />
    </y:YDropDownList>


    <y:YDropDownList ID="検索耐薬_高濃度アルカリ" AutoPostBack="true" DefaultValue="" Label="アルカリ(高)" IsGrid="false" ValidationGroup="Search" runat="server" >
        <asp:ListItem Value="" Text="(選択なし)" />
        <asp:ListItem Value="×" />
        <asp:ListItem Value="△" />
        <asp:ListItem Value="○" />
        <asp:ListItem Value="◎" />

    </y:YDropDownList>
    <y:YDropDownList ID="検索耐薬_低濃度アルカリ" AutoPostBack="true" DefaultValue="" Label="アルカリ(低)" IsGrid="false" ValidationGroup="Search" runat="server" >
        <asp:ListItem Value="" Text="(選択なし)" />
        <asp:ListItem Value="×" />
        <asp:ListItem Value="△" />
        <asp:ListItem Value="○" />
        <asp:ListItem Value="◎" />

    </y:YDropDownList>


    <br />

    <y:YList ID="検索純ゴム性質" Rows="2" Height="40" Width="80" runat="server" Label="純ゴム性質" AutoPostBack="true">
        <asp:ListItem Value="" Text="表示する"></asp:ListItem>
        <asp:ListItem Value="比重_始,比重_終,ムーニー粘土_始,ムーニー粘土_終," Text="表示しない" Selected="True"></asp:ListItem>
    </y:YList>

    <y:YList ID="検索機械的性質" Rows="2" Height="40" Width="80" runat="server" Label="機械的性質" AutoPostBack="true">
        <asp:ListItem Value="" Text="表示する"></asp:ListItem>
        <asp:ListItem Value="かたさ範囲_始,かたさ範囲_終,引張強さ_始,引張強さ_終,伸び_始,伸び_終,反発弾性,引裂,耐摩耗性,耐屈曲亀裂性,圧縮永久歪," Text="表示しない" Selected="True"></asp:ListItem>
    </y:YList>


    <y:YList ID="検索耐熱炎" Rows="2" Height="40" Width="80" runat="server" Label="検索耐熱炎" AutoPostBack="true">
        <asp:ListItem Value="" Text="表示する" Selected="True"></asp:ListItem>
        <asp:ListItem Value="耐熱性,耐寒性,耐熱性_発泡,耐寒性_発泡,耐炎性," Text="表示しない"></asp:ListItem>
    </y:YList>


    <y:YList ID="検索耐環境性質" Rows="2" Height="40" Width="80" runat="server" Label="耐環境性質" AutoPostBack="true">
        <asp:ListItem Value="" Text="表示する"></asp:ListItem>
        <asp:ListItem Value="耐老化性,耐光性,耐オゾン性,耐ガス透過性値_始,耐ガス透過性値_終,耐ガス透過性,耐放射線性," Text="表示しない" Selected="True"></asp:ListItem>
    </y:YList>


    <y:YList ID="検索電気的性質" Rows="2" Height="40" Width="80" runat="server" Label="電気的性質" AutoPostBack="true">
        <asp:ListItem Value="" Text="表示する"></asp:ListItem>
        <asp:ListItem Value="電気絶縁性_始,電気絶縁性_終," Text="表示しない" Selected="True"></asp:ListItem>
    </y:YList>

    <y:YList ID="検索耐油耐溶剤" Rows="2" Height="40" Width="80" runat="server" Label="耐油・耐溶剤" AutoPostBack="true">
        <asp:ListItem Value="" Text="表示する"></asp:ListItem>
        <asp:ListItem Value="耐油_ガソリン,耐油_ベンゼントルエン,耐油_トリクレン,耐油_アルコール,耐油_エーテル,耐油_ケトン,耐油_酢酸エチル," Text="表示しない" Selected="True"></asp:ListItem>
    </y:YList>

    <y:YList ID="検索耐薬品" Rows="2" Height="40" Width="80" runat="server" Label="耐薬品" AutoPostBack="true">
        <asp:ListItem Value="" Text="表示する" Selected="True"></asp:ListItem>
        <asp:ListItem Value="耐薬_水,耐薬_有機酸,耐薬_高濃度無機酸,耐薬_低濃度無機酸,耐薬_高濃度アルカリ,耐薬_低濃度アルカリ," Text="表示しない"></asp:ListItem>
    </y:YList>
    <br />
    <asp:Button runat="server" ID="Clear" Text="クリア" OnClick="Clear_Click" />
    <y:YDropDownList runat="server" ID="ページサイズ" OnSelectedIndexChanged="pageSize_SelectedIndexChanged" />
       <y:YDropDownList ID="順序" Width="160" runat="server" Label="順序" AutoPostBack="true">
        <asp:ListItem Value="ゴム名"></asp:ListItem>
        <asp:ListItem Value="ゴム特性ID"  Selected="True"></asp:ListItem>
        <asp:ListItem Value="圧縮永久歪 desc"></asp:ListItem>
        <asp:ListItem Value="耐熱性"></asp:ListItem>
        <asp:ListItem Value="耐熱性_発泡"></asp:ListItem>
        <asp:ListItem Value="耐炎性 desc"></asp:ListItem>
        <asp:ListItem Value="耐薬_有機酸 desc" Text="有機酸"></asp:ListItem>
        <asp:ListItem Value="耐薬_高濃度無機酸 desc,耐薬_低濃度無機酸 desc" Text="無機酸"></asp:ListItem>
        <asp:ListItem Value="耐薬_高濃度アルカリ desc,耐薬_低濃度アルカリ desc" Text="アルカリ"></asp:ListItem>
        <asp:ListItem Value="耐薬_水"></asp:ListItem>
        <asp:ListItem Value="耐光性"></asp:ListItem>
        <asp:ListItem Value="耐オゾン性"></asp:ListItem>
        <asp:ListItem Value="耐ガス透過性"></asp:ListItem>
        <asp:ListItem Value="耐放射線性"></asp:ListItem>
        <asp:ListItem Value="耐油_ガソリン,耐油_ベンゼントルエン,耐油_トリクレン" Text="耐油"></asp:ListItem>
        <asp:ListItem Value="耐油_アルコール,耐油_エーテル,耐油_ケトン,耐油_酢酸エチル" Text="耐溶剤"></asp:ListItem>
    </y:YDropDownList>

    <y:BaseGridView CssClass="GridView" ID="mainGridView" runat="server"
        DataSourceID="mainDataSource"
        DataKeyNames="ゴム特性ID,最終更新日時" AutoGenerateColumns="false"
        AllowPaging="true"
        PageSize="12"
        AllowSorting="false"
        ScrollHeight="450"
        PagerStyle-CssClass="grid_pager">
        <Columns>
            <asp:CommandField ShowEditButton="true" ControlStyle-Width="25" ItemStyle-Width="25"></asp:CommandField>
            <asp:ButtonField CommandName="ShowDetailUpdate" Text="詳細編集" ControlStyle-Width="50" />

   <y:YBoundField HeaderText="ゴム特性ID" DataFormatStringEditing="" DataField="ゴム特性ID" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"      IsRequired="true" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="ゴム名" DataFormatStringEditing="" DataField="ゴム名" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="ゴム名略称" DataFormatStringEditing="" DataField="ゴム名略称" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="60"  ItemStyle-Width="60"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="比重_始" DataFormatStringEditing="" DataField="比重_始" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="60"  ItemStyle-Width="60"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="比重_終" DataFormatStringEditing="" DataField="比重_終" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="60"  ItemStyle-Width="60"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="ムーニー粘土_始" DataFormatStringEditing="" DataField="ムーニー粘土_始" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="60"  ItemStyle-Width="60"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="ムーニー粘土_終" DataFormatStringEditing="" DataField="ムーニー粘土_終" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="60"  ItemStyle-Width="60"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="かたさ範囲_始" DataFormatStringEditing="" DataField="かたさ範囲_始" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="かたさ範囲_終" DataFormatStringEditing="" DataField="かたさ範囲_終" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="引張強さ_始" DataFormatStringEditing="" DataField="引張強さ_始" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="65"  ItemStyle-Width="65"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="引張強さ_終" DataFormatStringEditing="" DataField="引張強さ_終" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="65"  ItemStyle-Width="65"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="伸び_始" DataFormatStringEditing="" DataField="伸び_始" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="65"  ItemStyle-Width="65"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="伸び_終" DataFormatStringEditing="" DataField="伸び_終" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="65"  ItemStyle-Width="65"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="反発弾性" DataFormatStringEditing="" DataField="反発弾性" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="引裂" DataFormatStringEditing="" DataField="引裂" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="圧縮永久歪" DataFormatStringEditing="" DataField="圧縮永久歪" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐摩耗性" DataFormatStringEditing="" DataField="耐摩耗性" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐屈曲亀裂性" DataFormatStringEditing="" DataField="耐屈曲亀裂性" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐熱性" DataFormatStringEditing="" DataField="耐熱性" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="耐寒性" DataFormatStringEditing="" DataField="耐寒性" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="耐熱性_発泡" DataFormatStringEditing="" DataField="耐熱性_発泡" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="耐寒性_発泡" DataFormatStringEditing="" DataField="耐寒性_発泡" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="耐老化性" DataFormatStringEditing="" DataField="耐老化性" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐光性" DataFormatStringEditing="" DataField="耐光性" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐オゾン性" DataFormatStringEditing="" DataField="耐オゾン性" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐炎性" DataFormatStringEditing="" DataField="耐炎性" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="電気絶縁性_始" DataFormatStringEditing="" DataField="電気絶縁性_始" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="電気絶縁性_終" DataFormatStringEditing="" DataField="電気絶縁性_終" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="耐ガス透過性値_始" DataFormatStringEditing="" DataField="耐ガス透過性値_始" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="耐ガス透過性値_終" DataFormatStringEditing="" DataField="耐ガス透過性値_終" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="耐ガス透過性" DataFormatStringEditing="" DataField="耐ガス透過性" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐放射線性" DataFormatStringEditing="" DataField="耐放射線性" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐油_ガソリン" DataFormatStringEditing="" DataField="耐油_ガソリン" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐油_ベンゼントルエン" DataFormatStringEditing="" DataField="耐油_ベンゼントルエン" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐油_トリクレン" DataFormatStringEditing="" DataField="耐油_トリクレン" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐油_アルコール" DataFormatStringEditing="" DataField="耐油_アルコール" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐油_エーテル" DataFormatStringEditing="" DataField="耐油_エーテル" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐油_ケトン" DataFormatStringEditing="" DataField="耐油_ケトン" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐油_酢酸エチル" DataFormatStringEditing="" DataField="耐油_酢酸エチル" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐薬_水" DataFormatStringEditing="" DataField="耐薬_水" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐薬_有機酸" DataFormatStringEditing="" DataField="耐薬_有機酸" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐薬_高濃度無機酸" DataFormatStringEditing="" DataField="耐薬_高濃度無機酸" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐薬_低濃度無機酸" DataFormatStringEditing="" DataField="耐薬_低濃度無機酸" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐薬_高濃度アルカリ" DataFormatStringEditing="" DataField="耐薬_高濃度アルカリ" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="耐薬_低濃度アルカリ" DataFormatStringEditing="" DataField="耐薬_低濃度アルカリ" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="58"  ItemStyle-Width="58"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="主な用途" DataFormatStringEditing="" DataField="主な用途" ReadOnly="FALSE"  IsBoolean="FALSE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="削除フラグ" DataFormatStringEditing="" DataField="削除フラグ" ReadOnly="FALSE"  IsBoolean="TRUE"  ControlStyle-Width="65"  ItemStyle-Width="65"  ItemStyle-Wrap="false"      IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   />
 <y:YBoundField HeaderText="作成ユーザー" DataFormatStringEditing="" DataField="作成ユーザー" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Auto"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="最終更新ユーザー" DataFormatStringEditing="" DataField="最終更新ユーザー" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Auto"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   IsDropDownList="true"  />
 <y:YBoundField HeaderText="作成日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="作成日時" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Auto"   />
 <y:YBoundField HeaderText="最終更新日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="最終更新日時" ReadOnly="TRUE"  IsBoolean="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"      IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Auto"   />

        </Columns>
    </y:BaseGridView>
    <y:BaseValidationSummary ID="mainValidationSummary" runat="server" EnableClientScript="true" />

    <br />
    <y:BaseFormView ID="mainFormView"
        runat="server"
        DataKeyNames="ゴム特性ID,最終更新日時" DataSourceID="mainDataSource" BackColor="#DEBA84"
        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3"
        CellSpacing="2" GridLines="Both"
        AllowPaging="true">
        <EditItemTemplate>
            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="True"
                CommandName="Update" Text="更新" ValidationGroup="DetailUpdate" />
            &nbsp;<asp:LinkButton ID="LinkButton3" runat="server"
                CausesValidation="False" CommandName="Cancel" Text="キャンセル" />

            &nbsp;<asp:LinkButton ID="LinkButton6" runat="server" CausesValidation="False"
                CommandName="New" Text="新規作成" />
            <table>
                <tr>
                    <td>
                        <table>
<y:YTextBox   id="ゴム名"  Label="ゴム名【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("ゴム名", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="100"/>
<y:YTextBox   id="ゴム名略称"  Label="ゴム名略称【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("ゴム名略称", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="60"/>
<y:YTextBox   id="比重_始"  Label="比重_始【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("比重_始", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="60"/>
<y:YTextBox   id="比重_終"  Label="比重_終【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("比重_終", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="60"/>
<y:YTextBox   id="ムーニー粘土_始"  Label="ムーニー粘土_始【ML1+4(100℃)】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("ムーニー粘土_始", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="60"/>
<y:YTextBox   id="ムーニー粘土_終"  Label="ムーニー粘土_終【ML1+4(100℃)】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("ムーニー粘土_終", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="60"/>
<y:YTextBox   id="かたさ範囲_始"  Label="かたさ範囲_始【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("かたさ範囲_始", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40"/>
<y:YTextBox   id="かたさ範囲_終"  Label="かたさ範囲_終【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("かたさ範囲_終", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40"/>
<y:YTextBox   id="引張強さ_始"  Label="引張強さ_始【Mpa】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("引張強さ_始", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="65"/>
<y:YTextBox   id="引張強さ_終"  Label="引張強さ_終【Mpa】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("引張強さ_終", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="65"/>
<y:YTextBox   id="伸び_始"  Label="伸び_始【%】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("伸び_始", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="65"/>
<y:YTextBox   id="伸び_終"  Label="伸び_終【%】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("伸び_終", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="65"/>
<y:YDropDownList   id="反発弾性"  Label="反発弾性【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("反発弾性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="引裂"  Label="引裂【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("引裂") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="圧縮永久歪"  Label="圧縮永久歪【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("圧縮永久歪") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐摩耗性"  Label="耐摩耗性【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐摩耗性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐屈曲亀裂性"  Label="耐屈曲亀裂性【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐屈曲亀裂性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YTextBox   id="耐熱性"  Label="耐熱性【℃】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("耐熱性", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40"/>
<y:YTextBox   id="耐寒性"  Label="耐寒性【℃】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("耐寒性", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40"/>
<y:YTextBox   id="耐熱性_発泡"  Label="耐熱性_発泡【℃】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("耐熱性_発泡", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40"/>
<y:YTextBox   id="耐寒性_発泡"  Label="耐寒性_発泡【℃】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("耐寒性_発泡", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40"/>
<y:YDropDownList   id="耐老化性"  Label="耐老化性【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐老化性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐光性"  Label="耐光性【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐光性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐オゾン性"  Label="耐オゾン性【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐オゾン性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐炎性"  Label="耐炎性【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐炎性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YTextBox   id="電気絶縁性_始"  Label="電気絶縁性_始【Ωcm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("電気絶縁性_始", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="40"/>
<y:YTextBox   id="電気絶縁性_終"  Label="電気絶縁性_終【Ωcm】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("電気絶縁性_終", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="40"/>
<y:YTextBox   id="耐ガス透過性値_始"  Label="耐ガス透過性値_始【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("耐ガス透過性値_始", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="58"/>
<y:YTextBox   id="耐ガス透過性値_終"  Label="耐ガス透過性値_終【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("耐ガス透過性値_終", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="58"/>
<y:YDropDownList   id="耐ガス透過性"  Label="耐ガス透過性【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐ガス透過性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐放射線性"  Label="耐放射線性【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐放射線性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐油_ガソリン"  Label="耐油_ガソリン【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐油_ガソリン") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐油_ベンゼントルエン"  Label="耐油_ベンゼントルエン【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐油_ベンゼントルエン") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐油_トリクレン"  Label="耐油_トリクレン【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐油_トリクレン") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐油_アルコール"  Label="耐油_アルコール【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐油_アルコール") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐油_エーテル"  Label="耐油_エーテル【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐油_エーテル") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐油_ケトン"  Label="耐油_ケトン【MEK】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐油_ケトン") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐油_酢酸エチル"  Label="耐油_酢酸エチル【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐油_酢酸エチル") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐薬_水"  Label="耐薬_水【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐薬_水") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐薬_有機酸"  Label="耐薬_有機酸【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐薬_有機酸") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐薬_高濃度無機酸"  Label="耐薬_高濃度無機酸【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐薬_高濃度無機酸") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐薬_低濃度無機酸"  Label="耐薬_低濃度無機酸【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐薬_低濃度無機酸") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐薬_高濃度アルカリ"  Label="耐薬_高濃度アルカリ【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐薬_高濃度アルカリ") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐薬_低濃度アルカリ"  Label="耐薬_低濃度アルカリ【-】"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("耐薬_低濃度アルカリ") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YTextBox   id="主な用途"  Label="主な用途"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("主な用途", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="40"/>
<y:YCheckBox   id="削除フラグ"  Label="削除フラグ"   IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="65"/>
<y:YDropDownList   id="作成ユーザー"  Label="作成ユーザー"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("作成ユーザー") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Auto"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100"/>
<y:YDropDownList   id="最終更新ユーザー"  Label="最終更新ユーザー"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("最終更新ユーザー") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Auto"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100"/>
<y:YTextBox   id="作成日時"  Label="作成日時"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'     IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Auto"   Width="100"/>
<y:YTextBox   id="最終更新日時"  Label="最終更新日時"   IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'     IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Auto"   Width="100"/>
</table>
                    </td>

                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true" ValidationGroup="DetailUpdate" />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True"
                CommandName="Update" Text="更新" ValidationGroup="DetailUpdate" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server"
                CausesValidation="False" CommandName="Cancel" Text="キャンセル" />

            &nbsp;<asp:LinkButton ID="LinkButton7" runat="server" CausesValidation="False"
                CommandName="New" Text="新規作成" />
        </EditItemTemplate>
        <EditRowStyle BackColor="pink" Font-Bold="True" ForeColor="black" />
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            <table>
                <tr>
                    <td>
                        <table>
<y:YTextBox   id="ゴム特性ID" DefaultValue=""  Label="ゴム特性ID【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("ゴム特性ID", "") %>'     IsRequired="true" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="70" />
<y:YTextBox   id="ゴム名" DefaultValue=""  Label="ゴム名【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("ゴム名", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="100" />
<y:YTextBox   id="ゴム名略称" DefaultValue=""  Label="ゴム名略称【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("ゴム名略称", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="60" />
<y:YTextBox   id="比重_始" DefaultValue=""  Label="比重_始【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("比重_始", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="60" />
<y:YTextBox   id="比重_終" DefaultValue=""  Label="比重_終【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("比重_終", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="60" />
<y:YTextBox   id="ムーニー粘土_始" DefaultValue=""  Label="ムーニー粘土_始【ML1+4(100℃)】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("ムーニー粘土_始", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="60" />
<y:YTextBox   id="ムーニー粘土_終" DefaultValue=""  Label="ムーニー粘土_終【ML1+4(100℃)】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("ムーニー粘土_終", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="60" />
<y:YTextBox   id="かたさ範囲_始" DefaultValue=""  Label="かたさ範囲_始【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("かたさ範囲_始", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40" />
<y:YTextBox   id="かたさ範囲_終" DefaultValue=""  Label="かたさ範囲_終【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("かたさ範囲_終", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40" />
<y:YTextBox   id="引張強さ_始" DefaultValue=""  Label="引張強さ_始【Mpa】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("引張強さ_始", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="65" />
<y:YTextBox   id="引張強さ_終" DefaultValue=""  Label="引張強さ_終【Mpa】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("引張強さ_終", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="65" />
<y:YTextBox   id="伸び_始" DefaultValue=""  Label="伸び_始【%】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("伸び_始", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="65" />
<y:YTextBox   id="伸び_終" DefaultValue=""  Label="伸び_終【%】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("伸び_終", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="65" />
<y:YDropDownList   id="反発弾性" DefaultValue=""  Label="反発弾性【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("反発弾性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="引裂" DefaultValue=""  Label="引裂【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("引裂") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="圧縮永久歪" DefaultValue=""  Label="圧縮永久歪【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("圧縮永久歪") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐摩耗性" DefaultValue=""  Label="耐摩耗性【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐摩耗性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐屈曲亀裂性" DefaultValue=""  Label="耐屈曲亀裂性【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐屈曲亀裂性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YTextBox   id="耐熱性" DefaultValue=""  Label="耐熱性【℃】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("耐熱性", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40" />
<y:YTextBox   id="耐寒性" DefaultValue=""  Label="耐寒性【℃】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("耐寒性", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40" />
<y:YTextBox   id="耐熱性_発泡" DefaultValue=""  Label="耐熱性_発泡【℃】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("耐熱性_発泡", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40" />
<y:YTextBox   id="耐寒性_発泡" DefaultValue=""  Label="耐寒性_発泡【℃】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("耐寒性_発泡", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40" />
<y:YDropDownList   id="耐老化性" DefaultValue=""  Label="耐老化性【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐老化性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐光性" DefaultValue=""  Label="耐光性【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐光性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐オゾン性" DefaultValue=""  Label="耐オゾン性【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐オゾン性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐炎性" DefaultValue=""  Label="耐炎性【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐炎性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YTextBox   id="電気絶縁性_始" DefaultValue=""  Label="電気絶縁性_始【Ωcm】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("電気絶縁性_始", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="40" />
<y:YTextBox   id="電気絶縁性_終" DefaultValue=""  Label="電気絶縁性_終【Ωcm】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("電気絶縁性_終", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="40" />
<y:YTextBox   id="耐ガス透過性値_始" DefaultValue=""  Label="耐ガス透過性値_始【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("耐ガス透過性値_始", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="58" />
<y:YTextBox   id="耐ガス透過性値_終" DefaultValue=""  Label="耐ガス透過性値_終【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("耐ガス透過性値_終", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="58" />
<y:YDropDownList   id="耐ガス透過性" DefaultValue=""  Label="耐ガス透過性【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐ガス透過性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐放射線性" DefaultValue=""  Label="耐放射線性【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐放射線性") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐油_ガソリン" DefaultValue=""  Label="耐油_ガソリン【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐油_ガソリン") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐油_ベンゼントルエン" DefaultValue=""  Label="耐油_ベンゼントルエン【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐油_ベンゼントルエン") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐油_トリクレン" DefaultValue=""  Label="耐油_トリクレン【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐油_トリクレン") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐油_アルコール" DefaultValue=""  Label="耐油_アルコール【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐油_アルコール") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐油_エーテル" DefaultValue=""  Label="耐油_エーテル【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐油_エーテル") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐油_ケトン" DefaultValue=""  Label="耐油_ケトン【MEK】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐油_ケトン") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐油_酢酸エチル" DefaultValue=""  Label="耐油_酢酸エチル【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐油_酢酸エチル") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐薬_水" DefaultValue=""  Label="耐薬_水【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐薬_水") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐薬_有機酸" DefaultValue=""  Label="耐薬_有機酸【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐薬_有機酸") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐薬_高濃度無機酸" DefaultValue=""  Label="耐薬_高濃度無機酸【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐薬_高濃度無機酸") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐薬_低濃度無機酸" DefaultValue=""  Label="耐薬_低濃度無機酸【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐薬_低濃度無機酸") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐薬_高濃度アルカリ" DefaultValue=""  Label="耐薬_高濃度アルカリ【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐薬_高濃度アルカリ") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YDropDownList   id="耐薬_低濃度アルカリ" DefaultValue=""  Label="耐薬_低濃度アルカリ【-】"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("耐薬_低濃度アルカリ") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58" />
<y:YTextBox   id="主な用途" DefaultValue=""  Label="主な用途"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Text='<%# Bind("主な用途", "") %>'     IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="40" />
<y:YCheckBox   id="削除フラグ" DefaultValue=""  Label="削除フラグ"  IsGrid="false"  ReadOnly="FALSE"  ValidationGroup="DetailInsert" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="65" />
<y:YDropDownList   id="作成ユーザー" DefaultValue=""  Label="作成ユーザー"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("作成ユーザー") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Auto"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100" />
<y:YDropDownList   id="最終更新ユーザー" DefaultValue=""  Label="最終更新ユーザー"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" SelectedValue='<%# Bind("最終更新ユーザー") %>'    IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Auto"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100" />
<y:YTextBox   id="作成日時" DefaultValue=""  Label="作成日時"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'     IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Auto"   Width="100" />
<y:YTextBox   id="最終更新日時" DefaultValue=""  Label="最終更新日時"  IsGrid="false"  ReadOnly="TRUE"  ValidationGroup="DetailInsert" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'     IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Auto"   Width="100" />

 </table>
                    </td>

                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true" ValidationGroup="DetailInsert" />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                CommandName="Insert" Text="挿入" ValidationGroup="DetailInsert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server"
                CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
        </InsertItemTemplate>
        <ItemTemplate>

            <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False"
                CommandName="Edit" Text="編集" />
            &nbsp;<asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False"
                CommandName="Delete" Text="削除" />
            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False"
                CommandName="New" Text="新規作成" />
            <table>
                <tr>
                    <td>
                        <table>
<y:YTextBox   id="ゴム特性ID"  Label="ゴム特性ID【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("ゴム特性ID", "") %>'    IsRequired="true" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="70"/>
<y:YTextBox   id="ゴム名"  Label="ゴム名【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("ゴム名", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="100"/>
<y:YTextBox   id="ゴム名略称"  Label="ゴム名略称【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("ゴム名略称", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="60"/>
<y:YTextBox   id="比重_始"  Label="比重_始【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("比重_始", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="60"/>
<y:YTextBox   id="比重_終"  Label="比重_終【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("比重_終", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="60"/>
<y:YTextBox   id="ムーニー粘土_始"  Label="ムーニー粘土_始【ML1+4(100℃)】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("ムーニー粘土_始", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="60"/>
<y:YTextBox   id="ムーニー粘土_終"  Label="ムーニー粘土_終【ML1+4(100℃)】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("ムーニー粘土_終", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="60"/>
<y:YTextBox   id="かたさ範囲_始"  Label="かたさ範囲_始【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("かたさ範囲_始", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40"/>
<y:YTextBox   id="かたさ範囲_終"  Label="かたさ範囲_終【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("かたさ範囲_終", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40"/>
<y:YTextBox   id="引張強さ_始"  Label="引張強さ_始【Mpa】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("引張強さ_始", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="65"/>
<y:YTextBox   id="引張強さ_終"  Label="引張強さ_終【Mpa】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("引張強さ_終", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="65"/>
<y:YTextBox   id="伸び_始"  Label="伸び_始【%】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("伸び_始", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="65"/>
<y:YTextBox   id="伸び_終"  Label="伸び_終【%】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("伸び_終", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="65"/>
<y:YDropDownList   id="反発弾性"  Label="反発弾性【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("反発弾性") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="引裂"  Label="引裂【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("引裂") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="圧縮永久歪"  Label="圧縮永久歪【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("圧縮永久歪") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐摩耗性"  Label="耐摩耗性【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐摩耗性") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐屈曲亀裂性"  Label="耐屈曲亀裂性【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐屈曲亀裂性") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YTextBox   id="耐熱性"  Label="耐熱性【℃】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("耐熱性", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40"/>
<y:YTextBox   id="耐寒性"  Label="耐寒性【℃】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("耐寒性", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40"/>
<y:YTextBox   id="耐熱性_発泡"  Label="耐熱性_発泡【℃】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("耐熱性_発泡", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40"/>
<y:YTextBox   id="耐寒性_発泡"  Label="耐寒性_発泡【℃】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("耐寒性_発泡", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="40"/>
<y:YDropDownList   id="耐老化性"  Label="耐老化性【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐老化性") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐光性"  Label="耐光性【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐光性") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐オゾン性"  Label="耐オゾン性【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐オゾン性") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐炎性"  Label="耐炎性【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐炎性") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YTextBox   id="電気絶縁性_始"  Label="電気絶縁性_始【Ωcm】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("電気絶縁性_始", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="40"/>
<y:YTextBox   id="電気絶縁性_終"  Label="電気絶縁性_終【Ωcm】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("電気絶縁性_終", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="40"/>
<y:YTextBox   id="耐ガス透過性値_始"  Label="耐ガス透過性値_始【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("耐ガス透過性値_始", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="58"/>
<y:YTextBox   id="耐ガス透過性値_終"  Label="耐ガス透過性値_終【-】"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("耐ガス透過性値_終", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Input"   Width="58"/>
<y:YDropDownList   id="耐ガス透過性"  Label="耐ガス透過性【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐ガス透過性") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐放射線性"  Label="耐放射線性【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐放射線性") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐油_ガソリン"  Label="耐油_ガソリン【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐油_ガソリン") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐油_ベンゼントルエン"  Label="耐油_ベンゼントルエン【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐油_ベンゼントルエン") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐油_トリクレン"  Label="耐油_トリクレン【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐油_トリクレン") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐油_アルコール"  Label="耐油_アルコール【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐油_アルコール") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐油_エーテル"  Label="耐油_エーテル【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐油_エーテル") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐油_ケトン"  Label="耐油_ケトン【MEK】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐油_ケトン") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐油_酢酸エチル"  Label="耐油_酢酸エチル【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐油_酢酸エチル") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐薬_水"  Label="耐薬_水【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐薬_水") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐薬_有機酸"  Label="耐薬_有機酸【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐薬_有機酸") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐薬_高濃度無機酸"  Label="耐薬_高濃度無機酸【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐薬_高濃度無機酸") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐薬_低濃度無機酸"  Label="耐薬_低濃度無機酸【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐薬_低濃度無機酸") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐薬_高濃度アルカリ"  Label="耐薬_高濃度アルカリ【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐薬_高濃度アルカリ") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YDropDownList   id="耐薬_低濃度アルカリ"  Label="耐薬_低濃度アルカリ【-】"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("耐薬_低濃度アルカリ") %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"  DataSourceID="特性マークDataSource" DataTextField="名称" DataValueField="名称"   AppendDataBoundItems="true"   Width="58"/>
<y:YTextBox   id="主な用途"  Label="主な用途"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("主な用途", "") %>'    IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="40"/>
<y:YCheckBox   id="削除フラグ"  Label="削除フラグ"  IsGrid="false"  ReadOnly="TRUE" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>'   IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" CssClass="Input"   Width="65"/>
<y:YDropDownList   id="作成ユーザー"  Label="作成ユーザー"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("作成ユーザー") %>'   IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Auto"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100"/>
<y:YDropDownList   id="最終更新ユーザー"  Label="最終更新ユーザー"  IsGrid="false"  ReadOnly="TRUE" SelectedValue='<%# Bind("最終更新ユーザー") %>'   IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" CssClass="Auto"  DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId"   AppendDataBoundItems="true"   Width="100"/>
<y:YTextBox   id="作成日時"  Label="作成日時"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'    IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Auto"   Width="100"/>
<y:YTextBox   id="最終更新日時"  Label="最終更新日時"  IsGrid="false"  ReadOnly="TRUE" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>'    IsRequired="FALSE" IsDate="true"  DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Auto"   Width="100"/>
     </table>
                    </td>

                </tr>
            </table>
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False"
                CommandName="Edit" Text="編集" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False"
                CommandName="Delete" Text="削除" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False"
                CommandName="New" Text="新規作成" />

        </ItemTemplate>
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <EmptyDataTemplate>
            <asp:LinkButton ID="LinkButton8" CommandName="New" runat="server" Text="新規追加" />
        </EmptyDataTemplate>
    </y:BaseFormView>

    <y:BaseSqlDataSource ID="mainDataSource" runat="server"
        SelectCommand="select * from mゴム特性"
        UpdateCommand=" update mゴム特性 set 
                ゴム名 = @ゴム名,ゴム名略称 = @ゴム名略称,比重_始 = @比重_始,比重_終 = @比重_終,ムーニー粘土_始 = @ムーニー粘土_始,ムーニー粘土_終 = @ムーニー粘土_終,かたさ範囲_始 = @かたさ範囲_始,かたさ範囲_終 = @かたさ範囲_終,引張強さ_始 = @引張強さ_始,引張強さ_終 = @引張強さ_終,伸び_始 = @伸び_始,伸び_終 = @伸び_終,反発弾性 = @反発弾性,引裂 = @引裂,圧縮永久歪 = @圧縮永久歪,耐摩耗性 = @耐摩耗性,耐屈曲亀裂性 = @耐屈曲亀裂性,耐熱性 = @耐熱性,耐寒性 = @耐寒性,耐熱性_発泡 = @耐熱性_発泡,耐寒性_発泡 = @耐寒性_発泡,耐老化性 = @耐老化性,耐光性 = @耐光性,耐オゾン性 = @耐オゾン性,耐炎性 = @耐炎性,電気絶縁性_始 = @電気絶縁性_始,電気絶縁性_終 = @電気絶縁性_終,耐ガス透過性値_始 = @耐ガス透過性値_始,耐ガス透過性値_終 = @耐ガス透過性値_終,耐ガス透過性 = @耐ガス透過性,耐放射線性 = @耐放射線性,耐油_ガソリン = @耐油_ガソリン,耐油_ベンゼントルエン = @耐油_ベンゼントルエン,耐油_トリクレン = @耐油_トリクレン,耐油_アルコール = @耐油_アルコール,耐油_エーテル = @耐油_エーテル,耐油_ケトン = @耐油_ケトン,耐油_酢酸エチル = @耐油_酢酸エチル,耐薬_水 = @耐薬_水,耐薬_有機酸 = @耐薬_有機酸,耐薬_高濃度無機酸 = @耐薬_高濃度無機酸,耐薬_低濃度無機酸 = @耐薬_低濃度無機酸,耐薬_高濃度アルカリ = @耐薬_高濃度アルカリ,耐薬_低濃度アルカリ = @耐薬_低濃度アルカリ,主な用途 = @主な用途,削除フラグ = @削除フラグ,作成ユーザー = @作成ユーザー,最終更新ユーザー = @最終更新ユーザー,作成日時 = @作成日時,最終更新日時 = @最終更新日時
                where ゴム特性ID = @original_ゴム特性ID and 最終更新日時 = @original_最終更新日時"
        InsertCommand=" insert into mゴム特性 
                (ゴム名,ゴム名略称,比重_始,比重_終,ムーニー粘土_始,ムーニー粘土_終,かたさ範囲_始,かたさ範囲_終,引張強さ_始,引張強さ_終,伸び_始,伸び_終,反発弾性,引裂,耐摩耗性,耐屈曲亀裂性,耐熱性,耐寒性,耐熱性_発泡,耐寒性_発泡,耐老化性,耐光性,耐オゾン性,耐炎性,電気絶縁性_始,電気絶縁性_終,耐ガス透過性,耐放射線性,耐油_ガソリン,耐油_ベンゼントルエン,耐油_トリクレン,耐油_アルコール,耐油_エーテル,耐油_ケトン,耐油_酢酸エチル,耐薬_水,耐薬_有機酸,耐薬_高濃度無機酸,耐薬_低濃度無機酸,耐薬_高濃度アルカリ,耐薬_低濃度アルカリ,主な用途,削除フラグ,作成ユーザー,最終更新ユーザー,作成日時,最終更新日時) 
                 values 
                (@ゴム名,@ゴム名略称,@比重_始,@比重_終,@ムーニー粘土_始,@ムーニー粘土_終,@かたさ範囲_始,@かたさ範囲_終,@引張強さ_始,@引張強さ_終,@伸び_始,@伸び_終,@反発弾性,@引裂,@耐摩耗性,@耐屈曲亀裂性,@耐熱性,@耐寒性,@耐熱性_発泡,@耐寒性_発泡,@耐老化性,@耐光性,@耐オゾン性,@耐炎性,@電気絶縁性_始,@電気絶縁性_終,@耐ガス透過性,@耐放射線性,@耐油_ガソリン,@耐油_ベンゼントルエン,@耐油_トリクレン,@耐油_アルコール,@耐油_エーテル,@耐油_ケトン,@耐油_酢酸エチル,@耐薬_水,@耐薬_有機酸,@耐薬_高濃度無機酸,@耐薬_低濃度無機酸,@耐薬_高濃度アルカリ,@耐薬_低濃度アルカリ,@主な用途,@削除フラグ,@作成ユーザー,@最終更新ユーザー,@作成日時,@最終更新日時) ;
                 "
        DeleteCommand="update mゴム特性  set 削除フラグ = 'True' where ゴム特性ID = @original_ゴム特性ID and 最終更新日時 = @original_最終更新日時"
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original_{0}"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        OnUpdating="mainDataSource_Updating"
        OnInserting="mainDataSource_Inserting">

        <InsertParameters>
<asp:formparameter  name="ゴム特性ID" formfield="ゴム特性ID"   ConvertEmptyStringToNull="true"  　Type="Int32" />
<asp:formparameter  name="ゴム名" formfield="ゴム名"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="ゴム名略称" formfield="ゴム名略称"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="比重_始" formfield="比重_始"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="比重_終" formfield="比重_終"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="ムーニー粘土_始" formfield="ムーニー粘土_始"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="ムーニー粘土_終" formfield="ムーニー粘土_終"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="かたさ範囲_始" formfield="かたさ範囲_始"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="かたさ範囲_終" formfield="かたさ範囲_終"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="引張強さ_始" formfield="引張強さ_始"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="引張強さ_終" formfield="引張強さ_終"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="伸び_始" formfield="伸び_始"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="伸び_終" formfield="伸び_終"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="反発弾性" formfield="反発弾性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="引裂" formfield="引裂"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="圧縮永久歪" formfield="圧縮永久歪"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐摩耗性" formfield="耐摩耗性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐屈曲亀裂性" formfield="耐屈曲亀裂性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐熱性" formfield="耐熱性"   ConvertEmptyStringToNull="true"  　Type="Int32" />
<asp:formparameter  name="耐寒性" formfield="耐寒性"   ConvertEmptyStringToNull="true"  　Type="Int32" />
<asp:formparameter  name="耐熱性_発泡" formfield="耐熱性_発泡"   ConvertEmptyStringToNull="true"  　Type="Int32" />
<asp:formparameter  name="耐寒性_発泡" formfield="耐寒性_発泡"   ConvertEmptyStringToNull="true"  　Type="Int32" />
<asp:formparameter  name="耐老化性" formfield="耐老化性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐光性" formfield="耐光性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐オゾン性" formfield="耐オゾン性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐炎性" formfield="耐炎性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="電気絶縁性_始" formfield="電気絶縁性_始"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="電気絶縁性_終" formfield="電気絶縁性_終"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐ガス透過性値_始" formfield="耐ガス透過性値_始"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="耐ガス透過性値_終" formfield="耐ガス透過性値_終"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="耐ガス透過性" formfield="耐ガス透過性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐放射線性" formfield="耐放射線性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐油_ガソリン" formfield="耐油_ガソリン"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐油_ベンゼントルエン" formfield="耐油_ベンゼントルエン"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐油_トリクレン" formfield="耐油_トリクレン"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐油_アルコール" formfield="耐油_アルコール"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐油_エーテル" formfield="耐油_エーテル"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐油_ケトン" formfield="耐油_ケトン"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐油_酢酸エチル" formfield="耐油_酢酸エチル"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐薬_水" formfield="耐薬_水"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐薬_有機酸" formfield="耐薬_有機酸"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐薬_高濃度無機酸" formfield="耐薬_高濃度無機酸"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐薬_低濃度無機酸" formfield="耐薬_低濃度無機酸"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐薬_高濃度アルカリ" formfield="耐薬_高濃度アルカリ"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐薬_低濃度アルカリ" formfield="耐薬_低濃度アルカリ"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="主な用途" formfield="主な用途"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="削除フラグ" formfield="削除フラグ"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="作成ユーザー" formfield="作成ユーザー"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="最終更新ユーザー" formfield="最終更新ユーザー"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="作成日時" formfield="作成日時"   ConvertEmptyStringToNull="true"  　Type="DateTime" />
<asp:formparameter  name="最終更新日時" formfield="最終更新日時"   ConvertEmptyStringToNull="true"  　Type="DateTime" />
        </InsertParameters>

        <UpdateParameters>

<asp:formparameter  name="ゴム名" formfield="ゴム名"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="ゴム名略称" formfield="ゴム名略称"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="比重_始" formfield="比重_始"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="比重_終" formfield="比重_終"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="ムーニー粘土_始" formfield="ムーニー粘土_始"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="ムーニー粘土_終" formfield="ムーニー粘土_終"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="かたさ範囲_始" formfield="かたさ範囲_始"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="かたさ範囲_終" formfield="かたさ範囲_終"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="引張強さ_始" formfield="引張強さ_始"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="引張強さ_終" formfield="引張強さ_終"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="伸び_始" formfield="伸び_始"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="伸び_終" formfield="伸び_終"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="反発弾性" formfield="反発弾性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="引裂" formfield="引裂"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="圧縮永久歪" formfield="圧縮永久歪"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐摩耗性" formfield="耐摩耗性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐屈曲亀裂性" formfield="耐屈曲亀裂性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐熱性" formfield="耐熱性"   ConvertEmptyStringToNull="true"  　Type="Int32" />
<asp:formparameter  name="耐寒性" formfield="耐寒性"   ConvertEmptyStringToNull="true"  　Type="Int32" />
<asp:formparameter  name="耐熱性_発泡" formfield="耐熱性_発泡"   ConvertEmptyStringToNull="true"  　Type="Int32" />
<asp:formparameter  name="耐寒性_発泡" formfield="耐寒性_発泡"   ConvertEmptyStringToNull="true"  　Type="Int32" />
<asp:formparameter  name="耐老化性" formfield="耐老化性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐光性" formfield="耐光性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐オゾン性" formfield="耐オゾン性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐炎性" formfield="耐炎性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="電気絶縁性_始" formfield="電気絶縁性_始"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="電気絶縁性_終" formfield="電気絶縁性_終"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐ガス透過性値_始" formfield="耐ガス透過性値_始"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="耐ガス透過性値_終" formfield="耐ガス透過性値_終"   ConvertEmptyStringToNull="true"  　Type="Decimal" />
<asp:formparameter  name="耐ガス透過性" formfield="耐ガス透過性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐放射線性" formfield="耐放射線性"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐油_ガソリン" formfield="耐油_ガソリン"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐油_ベンゼントルエン" formfield="耐油_ベンゼントルエン"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐油_トリクレン" formfield="耐油_トリクレン"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐油_アルコール" formfield="耐油_アルコール"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐油_エーテル" formfield="耐油_エーテル"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐油_ケトン" formfield="耐油_ケトン"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐油_酢酸エチル" formfield="耐油_酢酸エチル"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐薬_水" formfield="耐薬_水"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐薬_有機酸" formfield="耐薬_有機酸"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐薬_高濃度無機酸" formfield="耐薬_高濃度無機酸"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐薬_低濃度無機酸" formfield="耐薬_低濃度無機酸"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐薬_高濃度アルカリ" formfield="耐薬_高濃度アルカリ"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="耐薬_低濃度アルカリ" formfield="耐薬_低濃度アルカリ"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="主な用途" formfield="主な用途"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="削除フラグ" formfield="削除フラグ"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="作成ユーザー" formfield="作成ユーザー"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="最終更新ユーザー" formfield="最終更新ユーザー"   ConvertEmptyStringToNull="true"  　Type="String" />
<asp:formparameter  name="作成日時" formfield="作成日時"   ConvertEmptyStringToNull="true"  　Type="DateTime" />
<asp:formparameter  name="最終更新日時" formfield="最終更新日時"   ConvertEmptyStringToNull="true"  　Type="DateTime" />

            <asp:Parameter Name="original_ゴム特性ID" Type="String" />
            <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_ゴム特性ID" Type="String" />
            <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
        </DeleteParameters>
    </y:BaseSqlDataSource>


    <y:BaseSqlDataSource runat="server" ID="特性マークDataSource"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        SelectCommand="SELECT  `コードID` ,  `名称`  
                    FROM  `Mコード` 
                    WHERE  `グループ` =  'ゴム特性マーク'
                    ">
    </y:BaseSqlDataSource>


    <y:BaseSqlDataSource runat="server" ID="ユーザーDataSource"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        SelectCommand="SELECT ユーザーId, ユーザー名 FROM `Mユーザー` ">
    </y:BaseSqlDataSource>


</asp:Content>
