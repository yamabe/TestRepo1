<%@ Page Language="C#" MasterPageFile="~/YMasterPage.master" AutoEventWireup="true" CodeFile="MZairyoZokusei.aspx.cs" Inherits="MZairyoZokusei" %>

<%@ Register TagPrefix="y" Namespace="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>材料属性メンテナンス画面</title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">

    <script type="text/javascript">

        var autoCalculateControl = [];

        function pageLoad() {

            <% if (mainFormView.FindControl("材料名称") != null)
               { %>


            var 材料名称 = $('#<%=  mainFormView.FindControl("材料名称").ClientID%>'); 材料名称.css({ 'text-align': 'right', 'margin-right': '25px' }); 材料名称.next().css({ 'left': '72px' }); 材料名称.next().next().css({ 'left': '72px' });
            var 材料メーカー = $('#<%=  mainFormView.FindControl("材料メーカー").ClientID%>'); 材料メーカー.css({ 'text-align': 'right', 'margin-right': '25px' }); 材料メーカー.next().css({ 'left': '72px' }); 材料メーカー.next().next().css({ 'left': '72px' });
            var 材質大分類 = $('#<%=  mainFormView.FindControl("材質大分類").ClientID%>'); 材質大分類.css({ 'text-align': 'right', 'margin-right': '25px' }); 材質大分類.next().css({ 'left': '72px' }); 材質大分類.next().next().css({ 'left': '72px' });
            var 材質 = $('#<%=  mainFormView.FindControl("材質").ClientID%>'); 材質.css({ 'text-align': 'right', 'margin-right': '25px' }); 材質.next().css({ 'left': '72px' }); 材質.next().next().css({ 'left': '72px' });
            var 耐寒 = $('#<%=  mainFormView.FindControl("耐寒").ClientID%>'); 耐寒.css({ 'text-align': 'right', 'margin-right': '25px' }); 耐寒.next().css({ 'left': '72px' }); 耐寒.next().next().css({ 'left': '72px' });
            var 耐熱 = $('#<%=  mainFormView.FindControl("耐熱").ClientID%>'); 耐熱.css({ 'text-align': 'right', 'margin-right': '25px' }); 耐熱.next().css({ 'left': '72px' }); 耐熱.next().next().css({ 'left': '72px' });
            var 難燃性 = $('#<%=  mainFormView.FindControl("難燃性").ClientID%>'); 難燃性.css({ 'text-align': 'right', 'margin-right': '25px' }); 難燃性.next().css({ 'left': '72px' }); 難燃性.next().next().css({ 'left': '72px' });
            var 削除フラグ = $('#<%=  mainFormView.FindControl("削除フラグ").ClientID%>'); 削除フラグ.css({ 'text-align': 'right', 'margin-right': '25px' }); 削除フラグ.next().css({ 'left': '72px' }); 削除フラグ.next().next().css({ 'left': '72px' });
            var 作成ユーザー = $('#<%=  mainFormView.FindControl("作成ユーザー").ClientID%>'); 作成ユーザー.css({ 'text-align': 'right', 'margin-right': '25px' }); 作成ユーザー.next().css({ 'left': '72px' }); 作成ユーザー.next().next().css({ 'left': '72px' });
            var 最終更新ユーザー = $('#<%=  mainFormView.FindControl("最終更新ユーザー").ClientID%>'); 最終更新ユーザー.css({ 'text-align': 'right', 'margin-right': '25px' }); 最終更新ユーザー.next().css({ 'left': '72px' }); 最終更新ユーザー.next().next().css({ 'left': '72px' });
            var 作成日時 = $('#<%=  mainFormView.FindControl("作成日時").ClientID%>'); 作成日時.css({ 'text-align': 'right', 'margin-right': '25px' }); 作成日時.next().css({ 'left': '72px' }); 作成日時.next().next().css({ 'left': '72px' });
            var 最終更新日時 = $('#<%=  mainFormView.FindControl("最終更新日時").ClientID%>'); 最終更新日時.css({ 'text-align': 'right', 'margin-right': '25px' }); 最終更新日時.next().css({ 'left': '72px' }); 最終更新日時.next().next().css({ 'left': '72px' });

         



             <% } %>

        }

        $(document).ready(function () {


        });

        function UpdateDetail() {
            //$("#autoCalculate").click();

            for (var i = 0; i < autoCalculateControl.length; i++) {

                var num = autoCalculateControl[i].val();
                console.log(num + " isnan" + isnan(num) + "   infinity(p):" + (num == number.positive_infinity) + "    inifinity(n):" + (num == number.negative_infinity));
                if (isnan(num) ||
                    num == number.positive_infinity ||
                    num == number.negative_infinity) {
                    autoCalculateControl[i].val("0");
                    console.log(autoCalculateControl[i].val());
                }

            }


            return true;
        }
        function InsertDetail() {
            return UpdateDetail();
        }

    </script>

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="Main" runat="Server">



    <y:YCheckBox ID="検索削除フラグ" DefaultValue="" Label="削除フラグ" IsGrid="false" ValidationGroup="Search" runat="server" />

    <asp:Button runat="server" ID="検索" Text="検索" OnClick="検索_Click" />
    <asp:Button runat="server" ID="Clear" Text="クリア" OnClick="Clear_Click" />
    <y:YDropDownList runat="server" ID="ページサイズ" OnSelectedIndexChanged="pageSize_SelectedIndexChanged" />

    <y:BaseGridView CssClass="GridView" ID="mainGridView" runat="server"
        DataSourceID="mainDataSource"
        DataKeyNames="材料属性ID,最終更新日時" AutoGenerateColumns="false"
        AllowPaging="true"
        PageSize="12"
        AllowSorting="true"
        PagerStyle-CssClass="grid_pager">
        <Columns>
            <asp:CommandField ShowEditButton="true" ControlStyle-Width="25" ItemStyle-Width="25"></asp:CommandField>
            <asp:CommandField ShowDeleteButton="True" ControlStyle-Width="25" ItemStyle-Width="25"></asp:CommandField>
            <asp:ButtonField CommandName="ShowDetailUpdate" Text="詳細編集" ControlStyle-Width="50" />

            <y:YBoundField HeaderText="材料属性ID" DataFormatStringEditing="" DataField="材料属性ID" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="70" ItemStyle-Width="70" ItemStyle-Wrap="false" IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
            <y:YBoundField HeaderText="材料名称" DataFormatStringEditing="" DataField="材料名称" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
            <y:YBoundField HeaderText="材料メーカー" DataFormatStringEditing="" DataField="材料メーカー" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="材料メーカーDataSource" DataTextField="会社名称" DataValueField="会社ID" AppendDataBoundItems="true" IsDropDownList="true" />
            <y:YBoundField HeaderText="材質大分類" DataFormatStringEditing="" DataField="材質大分類" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" DataSourceID="材質大分類DataSource" DataTextField="名称" DataValueField="コードID" AppendDataBoundItems="true" IsDropDownList="true" />
            <y:YBoundField HeaderText="材質" DataFormatStringEditing="" DataField="材質" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" DataSourceID="材質DataSource" DataTextField="名称" DataValueField="コードID" AppendDataBoundItems="true" IsDropDownList="true" />
            <y:YBoundField HeaderText="耐寒" DataFormatStringEditing="" DataField="耐寒" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
            <y:YBoundField HeaderText="耐熱" DataFormatStringEditing="" DataField="耐熱" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
            <y:YBoundField HeaderText="難燃性" DataFormatStringEditing="" DataField="難燃性" ReadOnly="FALSE" IsBoolean="FALSE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" />
            <y:YBoundField HeaderText="削除フラグ" DataFormatStringEditing="" DataField="削除フラグ" ReadOnly="FALSE" IsBoolean="TRUE" ControlStyle-Width="65" ItemStyle-Width="65" ItemStyle-Wrap="false" IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" />
            <y:YBoundField HeaderText="作成ユーザー" DataFormatStringEditing="" DataField="作成ユーザー" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" IsDropDownList="true" />
            <y:YBoundField HeaderText="最終更新ユーザー" DataFormatStringEditing="" DataField="最終更新ユーザー" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" IsDropDownList="true" />
            <y:YBoundField HeaderText="作成日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="作成日時" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Auto" />
            <y:YBoundField HeaderText="最終更新日時" DataFormatStringEditing="{0:yyyy/MM/dd hh:mm:ss}" DataField="最終更新日時" ReadOnly="TRUE" IsBoolean="FALSE" ControlStyle-Width="100" ItemStyle-Width="100" ItemStyle-Wrap="false" IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Auto" />
        </Columns>
    </y:BaseGridView>
    <y:BaseValidationSummary ID="mainValidationSummary" runat="server" EnableClientScript="true" />

    <br />
    <y:BaseFormView ID="mainFormView"
        runat="server"
        DataKeyNames="材料属性ID,最終更新日時" DataSourceID="mainDataSource" BackColor="#DEBA84"
        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3"
        CellSpacing="2" GridLines="Both"
        AllowPaging="true">
        <EditItemTemplate>
            <table>
                <tr>
                    <td>
                        <table>
                            <y:YTextBox ID="材料属性ID" Label="材料属性ID" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("材料属性ID", "") %>' IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="70" />
                            <y:YTextBox ID="材料名称" Label="材料名称" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("材料名称", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" DataSourceID="材料DataSource" DataTextField="会社名称" DataValueField="会社ID" AppendDataBoundItems="true" Width="100" />
                            <y:YDropDownList ID="材料メーカー" Label="材料メーカー" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("材料メーカー") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="材料メーカーDataSource" DataTextField="会社名称" DataValueField="会社ID" AppendDataBoundItems="true" Width="100" />
                            <y:YDropDownList ID="材質大分類" Label="材質大分類" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("材質大分類") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" DataSourceID="材質大分類DataSource" DataTextField="名称" DataValueField="コードID" AppendDataBoundItems="true" Width="100" />
                            <y:YDropDownList ID="材質" Label="材質" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("材質") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" DataSourceID="材質DataSource" DataTextField="名称" DataValueField="コードID" AppendDataBoundItems="true" Width="100" />
                            <y:YTextBox ID="耐寒" Label="耐寒" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("耐寒", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                            <y:YTextBox ID="耐熱" Label="耐熱" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("耐熱", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                            <y:YTextBox ID="難燃性" Label="難燃性" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Text='<%# Bind("難燃性", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                            <y:YCheckBox ID="削除フラグ" Label="削除フラグ" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailUpdate" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="65" />
                            <y:YDropDownList ID="作成ユーザー" Label="作成ユーザー" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("作成ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                            <y:YDropDownList ID="最終更新ユーザー" Label="最終更新ユーザー" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" SelectedValue='<%# Bind("最終更新ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                            <y:YTextBox ID="作成日時" Label="作成日時" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Auto" Width="100" />
                            <y:YTextBox ID="最終更新日時" Label="最終更新日時" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailUpdate" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Auto" Width="100" />
                        </table>
                    </td>

                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true" ValidationGroup="DetailUpdate" />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True"
                CommandName="Update" Text="更新" ValidationGroup="DetailUpdate" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server"
                CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
        </EditItemTemplate>
        <EditRowStyle BackColor="pink" Font-Bold="True" ForeColor="black" />
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            <table>
                <tr>
                    <td>
                        <table>
                            <y:YTextBox ID="材料名称" DefaultValue="" Label="材料名称" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("材料名称", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" DataSourceID="材料DataSource" DataTextField="会社名称" DataValueField="会社ID" AppendDataBoundItems="true" Width="100" />
                            <y:YDropDownList ID="材料メーカー" DefaultValue="" Label="材料メーカー" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" SelectedValue='<%# Bind("材料メーカー") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="材料メーカーDataSource" DataTextField="会社名称" DataValueField="会社ID" AppendDataBoundItems="true" Width="100" />
                            <y:YDropDownList ID="材質大分類" DefaultValue="" Label="材質大分類" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" SelectedValue='<%# Bind("材質大分類") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" DataSourceID="材質大分類DataSource" DataTextField="名称" DataValueField="コードID" AppendDataBoundItems="true" Width="100" />
                            <y:YDropDownList ID="材質" DefaultValue="" Label="材質" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" SelectedValue='<%# Bind("材質") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" DataSourceID="材質DataSource" DataTextField="名称" DataValueField="コードID" AppendDataBoundItems="true" Width="100" />
                            <y:YTextBox ID="耐寒" DefaultValue="" Label="耐寒" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("耐寒", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                            <y:YTextBox ID="耐熱" DefaultValue="" Label="耐熱" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("耐熱", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                            <y:YTextBox ID="難燃性" DefaultValue="" Label="難燃性" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Text='<%# Bind("難燃性", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                            <y:YCheckBox ID="削除フラグ" DefaultValue="" Label="削除フラグ" IsGrid="false" ReadOnly="FALSE" ValidationGroup="DetailInsert" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="65" />
                            <y:YDropDownList ID="作成ユーザー" DefaultValue="" Label="作成ユーザー" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" SelectedValue='<%# Bind("作成ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                            <y:YDropDownList ID="最終更新ユーザー" DefaultValue="" Label="最終更新ユーザー" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" SelectedValue='<%# Bind("最終更新ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                            <y:YTextBox ID="作成日時" DefaultValue="" Label="作成日時" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Auto" Width="100" />
                            <y:YTextBox ID="最終更新日時" DefaultValue="" Label="最終更新日時" IsGrid="false" ReadOnly="TRUE" ValidationGroup="DetailInsert" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Auto" Width="100" />
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
            <table>
                <tr>
                    <td>
                        <table>
                            <y:YTextBox ID="材料属性ID" Label="材料属性ID" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材料属性ID", "") %>' IsRequired="true" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="70" />
                            <y:YTextBox ID="材料名称" Label="材料名称" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("材料名称", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" DataSourceID="材料DataSource" DataTextField="会社名称" DataValueField="会社ID" AppendDataBoundItems="true" Width="100" />
                            <y:YDropDownList ID="材料メーカー" Label="材料メーカー" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("材料メーカー") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" DataSourceID="材料メーカーDataSource" DataTextField="会社名称" DataValueField="会社ID" AppendDataBoundItems="true" Width="100" />
                            <y:YDropDownList ID="材質大分類" Label="材質大分類" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("材質大分類") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" DataSourceID="材質大分類DataSource" DataTextField="名称" DataValueField="コードID" AppendDataBoundItems="true" Width="100" />
                            <y:YDropDownList ID="材質" Label="材質" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("材質") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" DataSourceID="材質DataSource" DataTextField="名称" DataValueField="コードID" AppendDataBoundItems="true" Width="100" />
                            <y:YTextBox ID="耐寒" Label="耐寒" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("耐寒", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                            <y:YTextBox ID="耐熱" Label="耐熱" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("耐熱", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                            <y:YTextBox ID="難燃性" Label="難燃性" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("難燃性", "") %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Input" Width="65" />
                            <y:YCheckBox ID="削除フラグ" Label="削除フラグ" IsGrid="false" ReadOnly="TRUE" Checked='<%# ConvertToBoolean(Eval("削除フラグ")) %>' IsRequired="false" IsDate="false" DataFormatString="" IsInteger="false" runat="server" CssClass="Input" Width="65" />
                            <y:YDropDownList ID="作成ユーザー" Label="作成ユーザー" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("作成ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                            <y:YDropDownList ID="最終更新ユーザー" Label="最終更新ユーザー" IsGrid="false" ReadOnly="TRUE" SelectedValue='<%# Bind("最終更新ユーザー") %>' IsRequired="FALSE" IsDate="false" DataFormatString="" IsInteger="true" runat="server" CssClass="Auto" DataSourceID="ユーザーDataSource" DataTextField="ユーザー名" DataValueField="ユーザーId" AppendDataBoundItems="true" Width="100" />
                            <y:YTextBox ID="作成日時" Label="作成日時" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("作成日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Auto" Width="100" />
                            <y:YTextBox ID="最終更新日時" Label="最終更新日時" IsGrid="false" ReadOnly="TRUE" Text='<%# Bind("最終更新日時", "{0:yyyy/MM/dd hh:mm:ss}") %>' IsRequired="FALSE" IsDate="true" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" IsInteger="false" runat="server" CssClass="Auto" Width="100" />
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
            <asp:LinkButton ID="LinkButton1" CommandName="New" runat="server" Text="新規追加" />
        </EmptyDataTemplate>
    </y:BaseFormView>

    <y:BaseSqlDataSource ID="mainDataSource" runat="server"
        SelectCommand="select * from m材料属性"
        UpdateCommand=" update m材料属性 set 
                材料名称 = @材料名称,材料メーカー = @材料メーカー,材質大分類 = @材質大分類,材質 = @材質,耐寒 = @耐寒,耐熱 = @耐熱,難燃性 = @難燃性,削除フラグ = @削除フラグ,最終更新ユーザー = @最終更新ユーザー,最終更新日時 = @最終更新日時, 
                where 材料属性ID = @original_材料属性ID and 最終更新日時 = @original_最終更新日時"
        InsertCommand=" insert into m材料属性 
                (材料名称,材料メーカー,材質大分類,材質,耐寒,耐熱,難燃性,削除フラグ,作成ユーザー,最終更新ユーザー,作成日時,最終更新日時)
                 values 
                (@材料名称,@材料メーカー,@材質大分類,@材質,@耐寒,@耐熱,@難燃性,@削除フラグ,@作成ユーザー,@最終更新ユーザー,@作成日時,@最終更新日時);
                 SET @NewParameter=LAST_INSERT_ID(); "
        DeleteCommand="update m材料属性  set 削除フラグ = 'True' where 材料属性ID = @original_材料属性ID and 最終更新日時 = @original_最終更新日時"
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original_{0}"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        OnUpdating="mainDataSource_Updating"
        OnInserting="mainDataSource_Inserting">

        <InsertParameters>
            <asp:FormParameter Name="材料属性ID" FormField="材料属性ID" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="材料名称" FormField="材料名称" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="材料メーカー" FormField="材料メーカー" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="材質大分類" FormField="材質大分類" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="材質" FormField="材質" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="耐寒" FormField="耐寒" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="耐熱" FormField="耐熱" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="難燃性" FormField="難燃性" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="削除フラグ" FormField="削除フラグ" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="作成ユーザー" FormField="作成ユーザー" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="最終更新ユーザー" FormField="最終更新ユーザー" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="作成日時" FormField="作成日時" ConvertEmptyStringToNull="true" Type="DateTime" />
            <asp:FormParameter Name="最終更新日時" FormField="最終更新日時" ConvertEmptyStringToNull="true" Type="DateTime" />
            <asp:Parameter Direction="Output" Name="RETURN_VALUE" Type="Int32" />
        </InsertParameters>

        <UpdateParameters>

            <asp:FormParameter Name="材料名称" FormField="材料名称" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="材料メーカー" FormField="材料メーカー" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="材質大分類" FormField="材質大分類" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="材質" FormField="材質" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="耐寒" FormField="耐寒" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="耐熱" FormField="耐熱" ConvertEmptyStringToNull="true" Type="Decimal" />
            <asp:FormParameter Name="難燃性" FormField="難燃性" ConvertEmptyStringToNull="true" Type="Int32" />
            <asp:FormParameter Name="削除フラグ" FormField="削除フラグ" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="最終更新ユーザー" FormField="最終更新ユーザー" ConvertEmptyStringToNull="true" Type="String" />
            <asp:FormParameter Name="最終更新日時" FormField="最終更新日時" ConvertEmptyStringToNull="true" Type="DateTime" />

            <asp:Parameter Name="original_材料属性ID" Type="String" />
            <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_材料属性ID" Type="String" />
            <asp:Parameter Name="original_最終更新日時" Type="DateTime" />
        </DeleteParameters>
    </y:BaseSqlDataSource>

    <y:BaseSqlDataSource runat="server" ID="材質大分類DataSource"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        SelectCommand="SELECT  `コードID` ,  `名称`  
                    FROM  `Mコード` 
                    WHERE  `グループ` =  '材質大分類'
                    ">
    </y:BaseSqlDataSource>

    <y:BaseSqlDataSource runat="server" ID="材質DataSource"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        SelectCommand="SELECT  `コードID` ,  `名称`  
                    FROM  `Mコード` 
                    WHERE  `グループ` =  '材質'
                    ">
    </y:BaseSqlDataSource>


    <y:BaseSqlDataSource runat="server" ID="ユーザーDataSource"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        SelectCommand="SELECT ユーザーId, ユーザー名 FROM `Mユーザー` ">
    </y:BaseSqlDataSource>


    <y:BaseSqlDataSource runat="server" ID="材料メーカーDataSource"
        ConnectionString="<%$ ConnectionStrings:mysqlConLocal %>"
        ProviderName="<%$ ConnectionStrings:mysqlConLocal.ProviderName %>"
        SelectCommand="SELECT  `会社ID` ,  `会社名称`  
                    FROM  `M会社` 
                    ">
    </y:BaseSqlDataSource>

</asp:Content>
