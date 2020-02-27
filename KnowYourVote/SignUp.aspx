<%@ Page Title="" Language="C#" MasterPageFile="~/AdminUse.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="KnowYourVote.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="Scripts/jquery-ui.js"></script>
    <link href="Scripts/jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.12.4.js"></script>

    <script>
        $(function ()
        {
            $(".datepicker").datepicker({ maxDate: '0' });
            $("#TextBox8").datepicker({changeMonth: true,changeYear: true});
        } );
  </script>

    <script language="C#" runat="server">

        protected void AgeValNik(object sender, EventArgs args)
        {
            try
            {
                DateTime dt = DateTime.Parse(TextBox8.Text);
                DateTime dt_n = DateTime.Now;
                DateTime dt18 = dt.AddYears(18);
                if((dt_n.Year - dt.Year) < 0 )
                {
                    TextBox8.Text = DateTime.Now.ToString();
                    TextBox13.Text = "0";
                    TextBox13.Visible = true;
                    Label1.Text = "Invalid date";
                }
                else
                {
                    TextBox13.Text = (dt_n.Year - dt.Year).ToString();
                    TextBox13.Visible = true;
                    Label1.Text = "";
                }
            }
            catch(Exception exc)
            {
                Label1.Text = "Invalid date";
            }
        }

        </script>

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style6 {
            font-size: medium;
        }
        .auto-style9 {
            font-size: large;
            text-align: left;
        }
        .auto-style11 {
            color: blue;
            font-size: large;
            text-align: left;
        }
        .auto-style15 {
            font-size: large;
            width: 891px;
            text-align: left;
        }
        .auto-style16 {
            width: 891px;
            text-align: center;
            height: 16px;
        }
        .auto-style17 {
            color: blue;
            font-size: large;
            width: 891px;
            text-align: left;
        }
        .auto-style18 {
            text-align: center;
        }
        .auto-style19 {
            text-align: center;
            width: 910px;
        }
        .auto-style20 {
            font-size: medium;
            height: 16px;
            width: 303px;
            text-align: left;
        }
        .auto-style21 {
            text-align: left;
            height: 16px;
            width: 910px;
        }
        .auto-style22 {
            font-size: medium;
            height: 50px;
            width: 303px;
            text-align: left;
        }
        .auto-style23 {
            text-align: left;
            height: 50px;
            width: 910px;
        }
        .auto-style24 {
            font-size: large;
            width: 891px;
            text-align: center;
            height: 50px;
        }
        .auto-style27 {
            color: blue;
            font-size: large;
            width: 891px;
            text-align: left;
            height: 66px;
        }
        .auto-style28 {
            font-size: medium;
            height: 66px;
            width: 303px;
            text-align: left;
        }
        .auto-style29 {
            text-align: center;
            height: 66px;
            width: 910px;
        }
        .auto-style30 {
            font-size: medium;
            width: 303px;
            text-align: left;
        }
        .auto-style31 {
            width: 303px;
            text-align: left;
        }
        .auto-style32 {
            color: blue;
            font-size: large;
            width: 303px;
            text-align: left;
        }
        .auto-style33 {
            text-align: left;
            width: 910px;
        }
        .auto-style34 {
            text-align: left;
        }
        .auto-style35 {
            font-size: medium;
            text-align: left;
        }
        </style>

<p class="auto-style9">
    <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server"></asp:Label>
</p>
<table class="auto-style1">
    <tr>
        <td class="auto-style30">First Name:</td>
        <td class="auto-style33">
            <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style6" MaxLength="20"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="First name is required" ControlToValidate="TextBox1" ForeColor="Red" CssClass="auto-style6">*</asp:RequiredFieldValidator>
            <span class="auto-style6">&nbsp;&nbsp;&nbsp;</span></td>
        <td class="auto-style15">&nbsp;</td>
        <td class="auto-style35" rowspan="12">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style30">Middle Name :</td>
        <td class="auto-style19">
            <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style6" MaxLength="20"></asp:TextBox>
        </td>
        <td class="auto-style15">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style22">Last Name :</td>
        <td class="auto-style23">
            <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style6" MaxLength="20"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="last name is required" ControlToValidate="TextBox3" ForeColor="Red" CssClass="auto-style6">*</asp:RequiredFieldValidator>
        </td>
        <td class="auto-style24"></td>
    </tr>
    <tr>
        <td class="auto-style20">Password :</td>
        <td class="auto-style21">
            <asp:TextBox ID="TextBox4" runat="server" Width="288px" CssClass="auto-style6" Type="password" MaxLength="15"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="password is required" ControlToValidate="TextBox4" ForeColor="Red" CssClass="auto-style6">*</asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" CssClass="auto-style6" ErrorMessage="Invalid Password" ForeColor="Red" ValidationExpression="(^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,32}$)?(^(?=.*\d)(?=.*[a-z])(?=.*[@#$%^&amp;+=]).{8,32}$)?(^(?=.*\d)(?=.*[A-Z])(?=.*[@#$%^&amp;+=]).{8,32}$)?(^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&amp;+=]).{8,32}$)?">*</asp:RegularExpressionValidator>
        </td>
        <td class="auto-style16">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style11">Required:(Length betweed 8 and 15, 1 Capital character, 1 Specialword, 1 number, 1 Small character)</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="auto-style30">Re-enter Password :</td>
        <td class="auto-style33">
            <asp:TextBox ID="TextBox10" runat="server" Width="288px" CssClass="auto-style6" Type="password" MaxLength="15"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Confirm password is required" ControlToValidate="TextBox5" ForeColor="Red" Display="Dynamic" CssClass="auto-style6">*</asp:RequiredFieldValidator>
            &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not match" ControlToValidate="TextBox10" ControlToCompare="TextBox4" Type="String" Operator="Equal" ForeColor="Red" Display="Dynamic" CssClass="auto-style6">*</asp:CompareValidator>
        </td>
        <td class="auto-style15">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style30">E-mail :</td>
        <td class="auto-style33">
            <asp:TextBox ID="TextBox5" runat="server" Width="298px" CssClass="auto-style6" MaxLength="30"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email is required" ControlToValidate="TextBox5" ForeColor="Red" Display="Dynamic" CssClass="auto-style6">*</asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ControlToValidate="TextBox5" ForeColor="Red" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="auto-style6">*</asp:RegularExpressionValidator>
        </td>
        <td class="auto-style15">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style30">Address :</td>
        <td class="auto-style33">
            <asp:TextBox ID="TextBox11" runat="server" CssClass="auto-style6" MaxLength="30"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox11" ErrorMessage="Enter address" ForeColor="Red" CssClass="auto-style6">*</asp:RequiredFieldValidator>
            &nbsp;<span class="auto-style6" style="color: blue">&nbsp;</span></td>
        <td class="auto-style17">hint:(house no Society/Street name)</td>
    </tr>
    <tr>
        <td class="auto-style28"><span class="auto-style6">Booth_location :</span></td>
        <td class="auto-style29">
            <div class="auto-style34">
            <asp:TextBox ID="TextBox12" runat="server" CssClass="auto-style6" MaxLength="15" Width="16px" ReadOnly="True"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox12" ErrorMessage="Select Booth location" ForeColor="Red" CssClass="auto-style6">*</asp:RequiredFieldValidator>
            </div>
            <h4 class="auto-style34">District :<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="D_name" DataValueField="D_Id" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList></h4>
            <h4 class="auto-style34">Assembly :<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Asbl_Name" DataValueField="Asbl_Id" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList></h4>
            <h4 class="auto-style34">Booth :<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="B_name" DataValueField="B_Id" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"></asp:DropDownList></h4>
        </td>
        <td class="auto-style27">Select nearest booth location.</td>
    </tr>
    <tr>
        <td class="auto-style31"><span class="auto-style6">Cell_no1 :</span></td>
        <td class="auto-style33">
            <asp:TextBox ID="TextBox6" runat="server" Width="298px" CssClass="auto-style6"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="One cell no is must" ControlToValidate="TextBox6" ForeColor="Red" CssClass="auto-style6">*</asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox6" CssClass="auto-style6" ErrorMessage="Invalid number" ForeColor="Red" ValidationExpression="^\+[1-9]{1}[0-9]{3,14}$">*</asp:RegularExpressionValidator>
        </td>
        <td class="auto-style17">hint:(Provide country code with number) ex(<u>+91</u>9999999999)</td>
    </tr>
    <tr>
        <td class="auto-style31"><span class="auto-style6">Cell_no2 :</span></td>
        <td class="auto-style33">
            <asp:TextBox ID="TextBox7" runat="server" Width="298px" CssClass="auto-style6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox7" CssClass="auto-style6" ErrorMessage="Invalid number" ForeColor="Red" ValidationExpression="^\+[1-9]{1}[0-9]{3,14}$">*</asp:RegularExpressionValidator>
            &nbsp;<asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TextBox7" ControlToValidate="TextBox6" CssClass="auto-style6" ErrorMessage="Two cell no must not be same" ForeColor="Red" Operator="NotEqual">*</asp:CompareValidator>
        </td>
        <td class="auto-style15">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style31"><span class="auto-style6">Birth bate :</span></td>
        <td class="auto-style33">
            <asp:TextBox ID="TextBox8" runat="server" AutoPostBack="True" CssClass="auto-style6" OnTextChanged="AgeValNik"></asp:TextBox>
        </td>
        <td class="auto-style17">(Enter date in dd/mm/yyyy Format)</td>
    </tr>
    <tr>
        <td class="auto-style32">&nbsp;Age :</td>
        <td class="auto-style33"><asp:TextBox ID="TextBox13" runat="server" AutoPostBack="True" ReadOnly="True" Width="34px" CssClass="auto-style6"></asp:TextBox>
            <span class="auto-style6">&nbsp;&nbsp;</span></td>
        <td class="auto-style15">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style31"><span class="auto-style6">Aadhar no :</span></td>
        <td class="auto-style33">
            <asp:TextBox ID="TextBox9" runat="server" Width="302px" CssClass="auto-style6" MaxLength="12"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="aadhar number is required" ControlToValidate="TextBox9" ForeColor="Red" CssClass="auto-style6" Display="Dynamic">*</asp:RequiredFieldValidator>
            <span class="auto-style6">&nbsp;</span><asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox9" CssClass="auto-style6" Display="Dynamic" ErrorMessage="No Characters allowed" ForeColor="Red" ValidationExpression="\d{12}">*</asp:RegularExpressionValidator>
        </td>
        <td class="auto-style15">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style31"><span class="auto-style6">Voter_Id :</span></td>
        <td class="auto-style33">
            <asp:TextBox ID="TextBox14" runat="server" Width="302px" CssClass="auto-style6" MaxLength="12"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="aadhar number is required" ControlToValidate="TextBox14" ForeColor="Red" CssClass="auto-style6" Display="Dynamic">*</asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox14" CssClass="auto-style6" Display="Dynamic" ErrorMessage="No Characters allowed" ForeColor="Red" ValidationExpression="^[A-Z]{3}[0-9]{7}$">*</asp:RegularExpressionValidator>
        </td>
        <td class="auto-style15">&nbsp;</td>
    </tr>
</table>
<asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" HeaderText="Validation Errors" Width="816px" />
<p class="auto-style18">
    <asp:Button ID="Button1" Style="color: lightyellow; background: cornflowerblue" runat="server" OnClick="Button1_Click" Text="Submit" Width="553px" CssClass="auto-style6" Font-Bold="True" Font-Size="32pt" Font-Underline="False" Height="111px" />
</p>
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

</asp:Content>