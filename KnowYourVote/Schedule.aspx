<%@ Page Title="" Language="C#" MasterPageFile="~/PublicUse.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="KnowYourVote.Schedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        text-align: center;
    }
    
    table 
    {
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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="EventTitle" HeaderText="EventTitle" SortExpression="EventTitle" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="Information" HeaderText="Information" SortExpression="Information" />
            <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
        </Columns>
    </asp:GridView>
    </p>
<p class="auto-style1">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT EVENT_SCHEDULE.ename AS EventTitle, EVENT_SCHEDULE.stime AS Date, EVENT_SCHEDULE.description AS Information, [Assembly].Asbl_Name AS Location FROM EVENT_SCHEDULE INNER JOIN [Assembly] ON EVENT_SCHEDULE.incity = [Assembly].Asbl_Id"></asp:SqlDataSource>
    </p>
</asp:Content>