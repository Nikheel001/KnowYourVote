<%@ Page Title="" Language="C#" MasterPageFile="~/AdminUse.Master" AutoEventWireup="true" CodeBehind="ManageBooth.aspx.cs" Inherits="KnowYourVote.ManageBooth" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
        }
        .auto-style2 {
            width: 100%;
            height: 500px;
        }
        .auto-style3 {
            height: 217px;
            text-align: center;
        }
        .auto-style4 {
            height: 197px;
            text-align: center;
        }
        .auto-style5 {
            text-align: center;
            height: 197px;
            width: 281px;
        }
        .auto-style6 {
            text-align: center;
            height: 109px;
            width: 281px;
        }
        .auto-style7 {
            height: 109px;
        }
        .auto-style8 {
            width: 100%;
        }
        .auto-style9 {
            width: 667px;
        }
        .auto-style11 {
            text-align: center;
        }
        .auto-style12 {
            height: 217px;
            text-align: center;
            width: 281px;
        }
        .auto-style13 {
            height: 217px;
            text-align: center;
            width: 1299px;
        }
        .auto-style14 {
            text-align: center;
            height: 197px;
            width: 1299px;
        }
        .auto-style15 {
            text-align: center;
            height: 109px;
            width: 1299px;
        }
        #r3 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4 class="auto-style11">MANAGE BOOTH</h4>
    <h4 class="auto-style11">DISTRICT : <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="D_name" DataValueField="D_Id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></h4>
    <h4 class="auto-style11">
        <asp:Label ID="Label3" runat="server" Text="ASSEMBLY" Visible="False"></asp:Label>
&nbsp;: <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Asbl_Name" DataValueField="Asbl_Id" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True" Visible="False"></asp:DropDownList></h4>
    
    <table class="auto-style2" >
        <tr>
            <td class="auto-style12">
                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="A" OnCheckedChanged="RadioButton1_CheckedChanged" Text="ADD BOOTH" AutoPostBack="True" Visible="False" />
            </td>
            <td class="auto-style13">
                <div runat="server" id="r1" class="auto-style11">
                <asp:Wizard ID="Wizard1" runat="server" Height="131px" Width="658px" OnFinishButtonClick="Wizard1_FinishButtonClick">
                    <WizardSteps>
                        <asp:WizardStep runat="server" title="Add booth information.">
                            <div class="auto-style1">
                                Booth name :
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Booth name must not be empty." ForeColor="Red"></asp:RequiredFieldValidator>
                                <br />
                                Booth address :
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Booth address must not be empty." ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </asp:WizardStep>
                    </WizardSteps>
                </asp:Wizard>
                </div>
            </td>
            <td class="auto-style3"></td>
        <tr>
            <td class="auto-style5">
                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="A" OnCheckedChanged="RadioButton2_CheckedChanged" Text="REMOVE BOOTH" AutoPostBack="True" Visible="False" />
            </td>
            <td class="auto-style14">
                <div runat="server" id="r2" class="auto-style11">
                BOOTH :&nbsp; <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="B_name" DataValueField="B_Id" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="142px"></asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server" Text="Remove booth &gt;&gt;" OnClick="Button4_Click" />
                </div>
            </td>
            <td class="auto-style4"></td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:RadioButton ID="RadioButton3" runat="server" GroupName="A" OnCheckedChanged="RadioButton3_CheckedChanged" Text="GENERATE REPORT" AutoPostBack="True" Visible="False" />
            </td>
            <td class="auto-style15">
                <div runat="server" id="r3">
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="GENERATE REPORT &gt;&gt;" ToolTip="Scroll Down" />
                </div>
            </td>
            <td class="auto-style7">&nbsp;</td>
        </tr>
    </table>

    <p class="auto-style11">
        &nbsp;</p>
                <table class="auto-style8">
                    <tr>
                        <td class="auto-style9">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [D_name], [D_Id] FROM [District]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Assembly].Asbl_Id,[Assembly].Asbl_Name FROM District INNER JOIN [Assembly] ON District.D_Id = [Assembly].AsblD_Id WHERE (District.D_Id = @D_Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="D_Id" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT BOOTH.B_name,BOOTH.B_Id FROM [Assembly] INNER JOIN BOOTH ON [Assembly].Asbl_Id = BOOTH.BA_Id WHERE ([Assembly].Asbl_Id = @A_nm)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" DefaultValue="1" Name="A_nm" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
                        </td>
                        <td class="auto-style11">
                            &nbsp;</td>
                    </tr>
    </table>
</asp:Content>