<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<%@ Register Assembly="WebApplication1" TagPrefix="yuc" Namespace="yuc" %>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="材料ID,最終更新日時"
            DataSourceID="SqlDataSource1" OnRowEditing="GridView1_RowEditing" onrowcommand="GridView1_RowCommand"
            >
            <Columns>
                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true"/>
                <asp:ButtonField ButtonType="Link" CommandName="Copy" Text="Copy" />
 <yuc:YBoundField HeaderText="削除フラグ" IsBoolean="true" IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" DataField="削除フラグ" ReadOnly="FALSE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"   />
 <yuc:YBoundField HeaderText="材料ID"  IsRequired="true" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" DataField="材料ID" ReadOnly="TRUE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"   />
 <yuc:YBoundField HeaderText="材料名称"  IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" DataField="材料名称" ReadOnly="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"   />
 <yuc:YBoundField HeaderText="材質"  IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" DataField="材質" ReadOnly="FALSE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"   />
 <yuc:YBoundField HeaderText="定尺寸法縦"  IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" DataField="定尺寸法縦" ReadOnly="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"   />
 <yuc:YBoundField HeaderText="定尺寸法横"  IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" DataField="定尺寸法横" ReadOnly="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"   />
 <yuc:YBoundField HeaderText="厚み"  IsRequired="false" IsDate="false"  DataFormatString="" IsInteger="true" runat="server" DataField="厚み" ReadOnly="FALSE"  ControlStyle-Width="40"  ItemStyle-Width="40"  ItemStyle-Wrap="false"   />
 <yuc:YBoundField HeaderText="定尺仕入金額"  IsRequired="false" IsDate="false"  DataFormatString="{0:f2}" IsInteger="true" runat="server" DataField="定尺仕入金額" ReadOnly="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"   />
 <yuc:YBoundField HeaderText="定尺売り金額"  IsRequired="false" IsDate="false"  DataFormatString="{0:f2}" IsInteger="true" runat="server" DataField="定尺売り金額" ReadOnly="FALSE"  ControlStyle-Width="70"  ItemStyle-Width="70"  ItemStyle-Wrap="false"   />
 <yuc:YBoundField HeaderText="作成ユーザー名"  IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" DataField="作成ユーザー名" ReadOnly="TRUE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"   />
 <yuc:YBoundField HeaderText="最終更新ユーザー名"  IsRequired="FALSE" IsDate="false"  DataFormatString="" IsInteger="false" runat="server" DataField="最終更新ユーザー名" ReadOnly="TRUE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"   />
 <yuc:YBoundField HeaderText="作成日時"  IsRequired="FALSE" IsDate="true"  DataFormatString="" IsInteger="false" runat="server" DataField="作成日時" ReadOnly="TRUE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"   />
 <yuc:YBoundField HeaderText="最終更新日時"  IsRequired="FALSE" IsDate="true"  DataFormatString="" IsInteger="false" runat="server" DataField="最終更新日時" ReadOnly="TRUE"  ControlStyle-Width="100"  ItemStyle-Width="100"  ItemStyle-Wrap="false"   />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <br />
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="材料ID" DataSourceID="SqlDataSource1"
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" CellSpacing="2" GridLines="Both">
            <EditItemTemplate>
                材料ID:
                <asp:Label ID="材料IDLabel1" runat="server" Text='<%# Eval("材料ID") %>' />
                <br />
                材料名称:
                <asp:TextBox ID="材料名称TextBox" runat="server" Text='<%# Bind("材料名称") %>' />
                <br />
                材質:
                <asp:TextBox ID="材質TextBox" runat="server" Text='<%# Bind("材質") %>' />
                <br />
                定尺寸法縦:
                <asp:TextBox ID="定尺寸法縦TextBox" runat="server" Text='<%# Bind("定尺寸法縦") %>' />
                <br />
                定尺寸法横:
                <asp:TextBox ID="定尺寸法横TextBox" runat="server" Text='<%# Bind("定尺寸法横") %>' />
                <br />
                厚み:
                <asp:TextBox ID="厚みTextBox" runat="server" Text='<%# Bind("厚み") %>' />
                <br />
                定尺仕入金額:
                <asp:TextBox ID="定尺仕入金額TextBox" runat="server" Text='<%# Bind("定尺仕入金額") %>' />
                <br />
                定尺売り金額:
                <asp:TextBox ID="定尺売り金額TextBox" runat="server" Text='<%# Bind("定尺売り金額") %>' />
                <br />
                作成ユーザー名:
                <asp:TextBox ID="作成ユーザー名TextBox" runat="server" Text='<%# Bind("作成ユーザー名") %>' />
                <br />
                最終更新ユーザー名:
                <asp:TextBox ID="最終更新ユーザー名TextBox" runat="server" Text='<%# Bind("最終更新ユーザー名") %>' />
                <br />
                作成日時:
                <asp:TextBox ID="作成日時TextBox" runat="server" Text='<%# Bind("作成日時") %>' />
                <br />
                最終更新日時:
                <asp:TextBox ID="最終更新日時TextBox" runat="server" Text='<%# Bind("最終更新日時") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                    CommandName="Cancel" Text="キャンセル" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                材料ID:
                <asp:TextBox ID="材料IDTextBox" runat="server" Text='<%# Bind("材料ID") %>' />
                <br />
                材料名称:
                <asp:TextBox ID="材料名称TextBox" runat="server" Text='<%# Bind("材料名称") %>' />
                <br />
                材質:
                <asp:TextBox ID="材質TextBox" runat="server" Text='<%# Bind("材質") %>' />
                <br />
                定尺寸法縦:
                <asp:TextBox ID="定尺寸法縦TextBox" runat="server" Text='<%# Bind("定尺寸法縦") %>' />
                <br />
                定尺寸法横:
                <asp:TextBox ID="定尺寸法横TextBox" runat="server" Text='<%# Bind("定尺寸法横") %>' />
                <br />
                厚み:
                <asp:TextBox ID="厚みTextBox" runat="server" Text='<%# Bind("厚み") %>' />
                <br />
                定尺仕入金額:
                <asp:TextBox ID="定尺仕入金額TextBox" runat="server" Text='<%# Bind("定尺仕入金額") %>' />
                <br />
                定尺売り金額:
                <asp:TextBox ID="定尺売り金額TextBox" runat="server" Text='<%# Bind("定尺売り金額") %>' />
                <br />
                作成ユーザー名:
                <asp:TextBox ID="作成ユーザー名TextBox" runat="server" Text='<%# Bind("作成ユーザー名") %>' />
                <br />
                最終更新ユーザー名:
                <asp:TextBox ID="最終更新ユーザー名TextBox" runat="server" Text='<%# Bind("最終更新ユーザー名") %>' />
                <br />
                作成日時:
                <asp:TextBox ID="作成日時TextBox" runat="server" Text='<%# Bind("作成日時") %>' />
                <br />
                最終更新日時:
                <asp:TextBox ID="最終更新日時TextBox" runat="server" Text='<%# Bind("最終更新日時") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="挿入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                    CommandName="Cancel" Text="キャンセル" />
            </InsertItemTemplate>
            <ItemTemplate>
                材料ID:
                <asp:Label ID="材料IDLabel" runat="server" Text='<%# Eval("材料ID") %>' />
                <br />
                材料名称:
                <asp:Label ID="材料名称Label" runat="server" Text='<%# Bind("材料名称") %>' />
                <br />
                材質:
                <asp:Label ID="材質Label" runat="server" Text='<%# Bind("材質") %>' />
                <br />
                定尺寸法縦:
                <asp:Label ID="定尺寸法縦Label" runat="server" Text='<%# Bind("定尺寸法縦") %>' />
                <br />
                定尺寸法横:
                <asp:Label ID="定尺寸法横Label" runat="server" Text='<%# Bind("定尺寸法横") %>' />
                <br />
                厚み:
                <asp:Label ID="厚みLabel" runat="server" Text='<%# Bind("厚み") %>' />
                <br />
                定尺仕入金額:
                <asp:Label ID="定尺仕入金額Label" runat="server" Text='<%# Bind("定尺仕入金額") %>' />
                <br />
                定尺売り金額:
                <asp:Label ID="定尺売り金額Label" runat="server" Text='<%# Bind("定尺売り金額") %>' />
                <br />
                作成ユーザー名:
                <asp:Label ID="作成ユーザー名Label" runat="server" Text='<%# Bind("作成ユーザー名") %>' />
                <br />
                最終更新ユーザー名:
                <asp:Label ID="最終更新ユーザー名Label" runat="server" Text='<%# Bind("最終更新ユーザー名") %>' />
                <br />
                作成日時:
                <asp:Label ID="作成日時Label" runat="server" Text='<%# Bind("作成日時") %>' />
                <br />
                最終更新日時:
                <asp:Label ID="最終更新日時Label" runat="server" Text='<%# Bind("最終更新日時") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="編集" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="削除" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="新規作成" />
            </ItemTemplate>
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <EmptyDataTemplate>
                <asp:LinkButton ID="LinkButton1" CommandName="New" runat="server" Text="新規追加" />
            </EmptyDataTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [T単価] WHERE [材料ID] = @original_材料ID AND [最終更新日時] = @original_最終更新日時"
            InsertCommand="INSERT INTO [T単価] ([材料名称], [材質], [定尺寸法縦], [定尺寸法横], [厚み], [定尺仕入金額], [定尺売り金額], [作成ユーザー名], [最終更新ユーザー名], [作成日時], [最終更新日時]) VALUES ( @材料名称, @材質, @定尺寸法縦, @定尺寸法横, @厚み, @定尺仕入金額, @定尺売り金額, @作成ユーザー名, @最終更新ユーザー名, current_timestamp, current_timestamp)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [T単価]"
            UpdateCommand="UPDATE [T単価] SET 削除フラグ= @削除フラグ, [材料名称] = @材料名称, [材質] = @材質, [定尺寸法縦] = @定尺寸法縦, [定尺寸法横] = @定尺寸法横, [厚み] = @厚み, [定尺仕入金額] = @定尺仕入金額, [定尺売り金額] = @定尺売り金額, [最終更新ユーザー名] = @最終更新ユーザー名,  [最終更新日時] = @最終更新日時 WHERE [材料ID] = @original_材料ID AND [最終更新日時] = @original_最終更新日時">
            <DeleteParameters>
                <asp:Parameter Name="original_材料ID" Type="Int32" />
                <asp:Parameter Name="original_材料名称" Type="String" />
                <asp:Parameter Name="original_材質" Type="String" />
                <asp:Parameter Name="original_定尺寸法縦" Type="Int32" />
                <asp:Parameter Name="original_定尺寸法横" Type="Int32" />
                <asp:Parameter Name="original_厚み" Type="Int32" />
                <asp:Parameter Name="original_定尺仕入金額" Type="Decimal" />
                <asp:Parameter Name="original_定尺売り金額" Type="Decimal" />
                <asp:Parameter Name="original_作成ユーザー名" Type="String" />
                <asp:Parameter Name="original_最終更新ユーザー名" Type="String" />
                <asp:Parameter Name="original_作成日時" Type="DateTime" />
                <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="材料ID" Type="Int32" />
                <asp:Parameter Name="材料名称" Type="String" />
                <asp:Parameter Name="材質" Type="String" />
                <asp:Parameter Name="定尺寸法縦" Type="Int32" />
                <asp:Parameter Name="定尺寸法横" Type="Int32" />
                <asp:Parameter Name="厚み" Type="Int32" />
                <asp:Parameter Name="定尺仕入金額" Type="Decimal" />
                <asp:Parameter Name="定尺売り金額" Type="Decimal" />
                <asp:Parameter Name="作成ユーザー名" Type="String" />
                <asp:Parameter Name="最終更新ユーザー名" Type="String" />
                <asp:Parameter Name="作成日時" Type="DateTime" />
                <asp:Parameter Name="最終更新日時" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:FormParameter Name="材料名称" Type="String" />
                <asp:FormParameter Name="材質" Type="String" />
                <asp:FormParameter Name="定尺寸法縦" Type="Int32" />
                <asp:FormParameter Name="定尺寸法横" Type="Int32" />
                <asp:FormParameter Name="厚み" Type="Int32" />
                <asp:FormParameter Name="定尺仕入金額" Type="Decimal" />
                <asp:FormParameter Name="定尺売り金額" Type="Decimal" />
                <asp:FormParameter Name="削除フラグ" Type="String" />
                <asp:Parameter Name="作成ユーザー名" Type="String" />
                <asp:FormParameter Name="最終更新ユーザー名" Type="String" />
                <asp:FormParameter Name="作成日時" Type="DateTime" />
                <asp:Parameter Name="最終更新日時" Type="DateTime" />
                <asp:Parameter Name="original_材料ID" Type="Int32" />
                <asp:Parameter Name="original_材料名称" Type="String" />
                <asp:Parameter Name="original_材質" Type="String" />
                <asp:Parameter Name="original_定尺寸法縦" Type="Int32" />
                <asp:Parameter Name="original_定尺寸法横" Type="Int32" />
                <asp:Parameter Name="original_厚み" Type="Int32" />
                <asp:Parameter Name="original_定尺仕入金額" Type="Decimal" />
                <asp:Parameter Name="original_定尺売り金額" Type="Decimal" />
                <asp:Parameter Name="original_作成ユーザー名" Type="String" />
                <asp:Parameter Name="original_最終更新ユーザー名" Type="String" />
                <asp:Parameter Name="original_作成日時" Type="DateTime" />
                <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource runat="server" ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [T単価] WHERE [材料ID] = @original_材料ID AND (([材料名称] = @original_材料名称) OR ([材料名称] IS NULL AND @original_材料名称 IS NULL)) AND (([材質] = @original_材質) OR ([材質] IS NULL AND @original_材質 IS NULL)) AND (([定尺寸法縦] = @original_定尺寸法縦) OR ([定尺寸法縦] IS NULL AND @original_定尺寸法縦 IS NULL)) AND (([定尺寸法横] = @original_定尺寸法横) OR ([定尺寸法横] IS NULL AND @original_定尺寸法横 IS NULL)) AND (([厚み] = @original_厚み) OR ([厚み] IS NULL AND @original_厚み IS NULL)) AND (([定尺仕入金額] = @original_定尺仕入金額) OR ([定尺仕入金額] IS NULL AND @original_定尺仕入金額 IS NULL)) AND (([定尺売り金額] = @original_定尺売り金額) OR ([定尺売り金額] IS NULL AND @original_定尺売り金額 IS NULL)) AND (([作成ユーザー名] = @original_作成ユーザー名) OR ([作成ユーザー名] IS NULL AND @original_作成ユーザー名 IS NULL)) AND (([最終更新ユーザー名] = @original_最終更新ユーザー名) OR ([最終更新ユーザー名] IS NULL AND @original_最終更新ユーザー名 IS NULL)) AND [作成日時] = @original_作成日時 AND [最終更新日時] = @original_最終更新日時 AND [削除フラグ] = @original_削除フラグ" 
            InsertCommand="INSERT INTO [T単価] ([材料名称], [材質], [定尺寸法縦], [定尺寸法横], [厚み], [定尺仕入金額], [定尺売り金額], [作成ユーザー名], [最終更新ユーザー名], [作成日時], [最終更新日時], [削除フラグ]) VALUES (@材料名称, @材質, @定尺寸法縦, @定尺寸法横, @厚み, @定尺仕入金額, @定尺売り金額, @作成ユーザー名, @最終更新ユーザー名, @作成日時, @最終更新日時, @削除フラグ)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [T単価]" 
            UpdateCommand="UPDATE [T単価] SET [材料名称] = @材料名称, [材質] = @材質, [定尺寸法縦] = @定尺寸法縦, [定尺寸法横] = @定尺寸法横, [厚み] = @厚み, [定尺仕入金額] = @定尺仕入金額, [定尺売り金額] = @定尺売り金額, [作成ユーザー名] = @作成ユーザー名, [最終更新ユーザー名] = @最終更新ユーザー名, [作成日時] = @作成日時, [最終更新日時] = @最終更新日時, [削除フラグ] = @削除フラグ WHERE [材料ID] = @original_材料ID AND (([材料名称] = @original_材料名称) OR ([材料名称] IS NULL AND @original_材料名称 IS NULL)) AND (([材質] = @original_材質) OR ([材質] IS NULL AND @original_材質 IS NULL)) AND (([定尺寸法縦] = @original_定尺寸法縦) OR ([定尺寸法縦] IS NULL AND @original_定尺寸法縦 IS NULL)) AND (([定尺寸法横] = @original_定尺寸法横) OR ([定尺寸法横] IS NULL AND @original_定尺寸法横 IS NULL)) AND (([厚み] = @original_厚み) OR ([厚み] IS NULL AND @original_厚み IS NULL)) AND (([定尺仕入金額] = @original_定尺仕入金額) OR ([定尺仕入金額] IS NULL AND @original_定尺仕入金額 IS NULL)) AND (([定尺売り金額] = @original_定尺売り金額) OR ([定尺売り金額] IS NULL AND @original_定尺売り金額 IS NULL)) AND (([作成ユーザー名] = @original_作成ユーザー名) OR ([作成ユーザー名] IS NULL AND @original_作成ユーザー名 IS NULL)) AND (([最終更新ユーザー名] = @original_最終更新ユーザー名) OR ([最終更新ユーザー名] IS NULL AND @original_最終更新ユーザー名 IS NULL)) AND [作成日時] = @original_作成日時 AND [最終更新日時] = @original_最終更新日時 AND [削除フラグ] = @original_削除フラグ" >
            <DeleteParameters>
                <asp:Parameter Name="original_材料ID" Type="Int32" />
                <asp:Parameter Name="original_材料名称" Type="String" />
                <asp:Parameter Name="original_材質" Type="String" />
                <asp:Parameter Name="original_定尺寸法縦" Type="Int32" />
                <asp:Parameter Name="original_定尺寸法横" Type="Int32" />
                <asp:Parameter Name="original_厚み" Type="Int32" />
                <asp:Parameter Name="original_定尺仕入金額" Type="Int32" />
                <asp:Parameter Name="original_定尺売り金額" Type="Int32" />
                <asp:Parameter Name="original_作成ユーザー名" Type="String" />
                <asp:Parameter Name="original_最終更新ユーザー名" Type="String" />
                <asp:Parameter Name="original_作成日時" Type="DateTime" />
                <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
                <asp:Parameter Name="original_削除フラグ" Type="Boolean" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="材料名称" Type="String" />
                <asp:Parameter Name="材質" Type="String" />
                <asp:Parameter Name="定尺寸法縦" Type="Int32" />
                <asp:Parameter Name="定尺寸法横" Type="Int32" />
                <asp:Parameter Name="厚み" Type="Int32" />
                <asp:Parameter Name="定尺仕入金額" Type="Int32" />
                <asp:Parameter Name="定尺売り金額" Type="Int32" />
                <asp:Parameter Name="作成ユーザー名" Type="String" />
                <asp:Parameter Name="最終更新ユーザー名" Type="String" />
                <asp:Parameter Name="作成日時" Type="DateTime" />
                <asp:Parameter Name="最終更新日時" Type="DateTime" />
                <asp:Parameter Name="削除フラグ" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="材料名称" Type="String" />
                <asp:Parameter Name="材質" Type="String" />
                <asp:Parameter Name="定尺寸法縦" Type="Int32" />
                <asp:Parameter Name="定尺寸法横" Type="Int32" />
                <asp:Parameter Name="厚み" Type="Int32" />
                <asp:Parameter Name="定尺仕入金額" Type="Int32" />
                <asp:Parameter Name="定尺売り金額" Type="Int32" />
                <asp:Parameter Name="作成ユーザー名" Type="String" />
                <asp:Parameter Name="最終更新ユーザー名" Type="String" />
                <asp:Parameter Name="作成日時" Type="DateTime" />
                <asp:Parameter Name="最終更新日時" Type="DateTime" />
                <asp:Parameter Name="削除フラグ" Type="Boolean" />
                <asp:Parameter Name="original_材料ID" Type="Int32" />
                <asp:Parameter Name="original_材料名称" Type="String" />
                <asp:Parameter Name="original_材質" Type="String" />
                <asp:Parameter Name="original_定尺寸法縦" Type="Int32" />
                <asp:Parameter Name="original_定尺寸法横" Type="Int32" />
                <asp:Parameter Name="original_厚み" Type="Int32" />
                <asp:Parameter Name="original_定尺仕入金額" Type="Int32" />
                <asp:Parameter Name="original_定尺売り金額" Type="Int32" />
                <asp:Parameter Name="original_作成ユーザー名" Type="String" />
                <asp:Parameter Name="original_最終更新ユーザー名" Type="String" />
                <asp:Parameter Name="original_作成日時" Type="DateTime" />
                <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
                <asp:Parameter Name="original_削除フラグ" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
