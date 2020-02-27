<%@ Page Title="" Language="C#" MasterPageFile="~/AdminUse.Master" AutoEventWireup="true" CodeBehind="BoothJobPost.aspx.cs" Inherits="KnowYourVote.BoothJobPost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style6 {
        font-size: large;
    }
    .auto-style7 {
        width: 100%;
    }
        .auto-style8 {
            text-align: left;
            font-size: medium;
            color: #9933FF;
        }
        .auto-style9 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
    </p>
    <p>
        Step 1 : Select Booth.</p>
    <p>
                    <span class="auto-style6">District : </span><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="D_name" DataValueField="D_Id" AutoPostBack="True">
                    </asp:DropDownList>
                &nbsp;</p>
    <p>
        Assembly : <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Asbl_Name" DataValueField="Asbl_Id" AutoPostBack="True">
                    </asp:DropDownList>
                &nbsp;</p>
    <p>
        Booth: <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="B_name" DataValueField="B_Id" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" Width="87px">
                    </asp:DropDownList>
                </p>
    <p>
        &nbsp;</p>
    <p>
        Step2 : See PersonList.</p>
    <p class="auto-style9">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource4" CssClass="auto-style8" Width="941px">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Contact_no" HeaderText="Contact_no" SortExpression="Contact_no" />
            </Columns>
        </asp:GridView>
    </p>
    <h5><p>
        Step3 : Enter PersonId in JOB,Every Post Selection is not required..</p></h5>
    <table class="auto-style7">
        <tr>
            <td>JOB</td>
            <td>Enter Person Id</td>
        </tr>
        <tr>
            <td>BoothLevelOfficer</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Campus Ambassadors</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Election Agent</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Pooling Agent</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Counting Agent</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>District-Assembly</td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <h5><p>
        Step4 : Notify Officers.</p></h5>
    <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save Changes &gt;&gt;" />
    </p>
    <p>
        &nbsp;</p>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [D_name], [D_Id] FROM [District]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Assembly].Asbl_Id,[Assembly].Asbl_Name FROM District INNER JOIN [Assembly] ON District.D_Id = [Assembly].AsblD_Id WHERE (District.D_Id = @D_nm)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="D_nm" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT BOOTH.B_name,BOOTH.B_Id FROM [Assembly] INNER JOIN BOOTH ON [Assembly].Asbl_Id = BOOTH.BA_Id WHERE ([Assembly].Asbl_Id = @A_nm)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" DefaultValue="1" Name="A_nm" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT USER_DATA.Id, USER_DATA.fname AS FirstName, USER_DATA.lname AS LastName, USER_DATA.email AS Email, USER_DATA.cell_no1 AS Contact_no FROM BOOTH INNER JOIN USER_DATA ON BOOTH.B_Id = USER_DATA.U_BId WHERE (USER_DATA.U_BId = @B_Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" DefaultValue="1" Name="B_Id" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>