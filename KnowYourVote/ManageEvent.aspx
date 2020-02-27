<%@ Page Title="" Language="C#" MasterPageFile="~/AdminUse.Master" AutoEventWireup="true" CodeBehind="ManageEvent.aspx.cs" Inherits="KnowYourVote.ManageEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            height: 619px;
            margin-right: 174px;
            margin-top: 36px;
            width: 1378px;
        }
        .auto-style6 {
            text-align: left;
        }
        .auto-style7 {
            margin-left: 74px;
        }
        .auto-style8 {
            text-align: left;
        }
        .auto-style9 {
            text-align: left;
        }
        .auto-style10 {
            height: 273px;
        }
        .auto-style11 {
            text-align: center;
            height: 184px;
            margin-left: 76px;
        }
        .auto-style12 {
            text-align: right;
            height: 258px;
        }
        .auto-style13 {
            text-align: left;
            height: 258px;
        }
        .auto-style15 {
            text-align: right;
            height: 168px;
        }
        .auto-style16 {
            text-align: left;
            height: 168px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
        <table class="auto-style4">
        <tr>
            <td class="auto-style13">
                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="B" OnCheckedChanged="RadioButton1_CheckedChanged" Text="Add Event" AutoPostBack="True" />
            </td>
            <td class="auto-style12">
                <div runat="server" id="r1" class="auto-style10">
                    <asp:Wizard ID="Wizard1" runat="server" Height="252px" Width="957px" ActiveStepIndex="0" CssClass="auto-style7" OnFinishButtonClick="Wizard1_FinishButtonClick">
                        <WizardSteps>
                            <asp:WizardStep runat="server" title="Enter Title and select date">
                                <div class="auto-style9">
                                    Title :&nbsp;
                                    <asp:TextBox ID="TextBox1" runat="server" Width="158px"></asp:TextBox>
                                    &nbsp;&nbsp;
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Fill Title" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    Date :
                                    <asp:TextBox ID="TextBox2" runat="server" Width="163px"></asp:TextBox>
                                    &nbsp;
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter a date" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                </div>
                            </asp:WizardStep>
                            <asp:WizardStep runat="server" title="Select Assembly and enter description.">
                                <div class="auto-style9">
                                    Assembly :
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Asbl_Name" DataValueField="Asbl_Id" Width="82px">
                                    </asp:DropDownList>
                                    <br />
                                    Description:<br />
                                    <asp:TextBox ID="TextBox3" runat="server" Height="78px" Width="511px"></asp:TextBox>
                                </div>
                            </asp:WizardStep>
                        </WizardSteps>
                    </asp:Wizard>
                </div>
            </td>
            <tr>
            <td class="auto-style16">
                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="B" OnCheckedChanged="RadioButton2_CheckedChanged" Text="Remove Event" AutoPostBack="True" />
            </td>
            <td class="auto-style15">
                <div runat="server" id="r2" class="auto-style11">
                    <br />
                    <h4>Event : <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="ename" DataValueField="Event_Id" Width="142px"></asp:DropDownList></h4>
                    <br />
                <asp:Button ID="Button4" runat="server" Text="Remove Event &gt;&gt;" OnClick="Button4_Click" />
                </div>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:RadioButton ID="RadioButton3" runat="server" GroupName="B" OnCheckedChanged="RadioButton3_CheckedChanged" Text="See Notice Board" AutoPostBack="True" />
            </td>
            <td class="auto-style8">
                <div runat="server" id="r3">
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="TO NOTICE BOARD &gt;&gt;" ToolTip="Scroll Down" />
                </div>
            </td>
        </tr>
    </table>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Asbl_Name], [Asbl_Id] FROM [Assembly]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ename], [Event_Id] FROM [EVENT_SCHEDULE]"></asp:SqlDataSource>
</asp:Content>