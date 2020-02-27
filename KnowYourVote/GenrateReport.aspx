<%@ Page Title="" Language="C#" MasterPageFile="~/PublicUse.Master" AutoEventWireup="true" CodeBehind="GenrateReport.aspx.cs" Inherits="KnowYourVote.GenrateReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 100%;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even){background-color: #f2f2f2}

        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style1">
    </p>
    <h4 class="auto-style1">FIND BOOTH INFORMATION</h4>
    <h4 class="auto-style1">DISTRICT : <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="D_name" DataValueField="D_Id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></h4>
    <h4 class="auto-style1">
        <asp:Label ID="Label3" runat="server" Text="ASSEMBLY" Visible="False"></asp:Label>
&nbsp;: <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Asbl_Name" DataValueField="Asbl_Id" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True" Visible="False"></asp:DropDownList></h4>
        <table class="auto-style2">
            <tr>
                <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Height="160px" Visible="False" Width="495px">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                            <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [D_name], [D_Id] FROM [District]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Assembly].Asbl_Id,[Assembly].Asbl_Name FROM District INNER JOIN [Assembly] ON District.D_Id = [Assembly].AsblD_Id WHERE (District.D_Id = @D_Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="D_Id" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT BOOTH.B_Id AS ID, BOOTH.B_name AS NAME, BOOTH.B_loc AS Location FROM [Assembly] INNER JOIN BOOTH ON [Assembly].Asbl_Id = BOOTH.BA_Id WHERE ([Assembly].Asbl_Id = @A_nm)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" DefaultValue="1" Name="A_nm" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
