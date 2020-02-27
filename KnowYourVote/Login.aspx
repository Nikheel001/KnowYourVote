<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KnowYourVote.Login" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

            .auto-style4 {
                font-size: large;
            }
             
            button { background-color: #4682f4;  color: white;  padding: 14px 20px;  margin: 8px 0;  border: none;  cursor: pointer;  width: 100%;  } 
 
 .modal { display: none; position: fixed; z-index: 1;  left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgb(0,0,0); background-color: rgba(0,0,0,0.4); padding-top: 40px; } 
 .animate { -webkit-animation: animatezoom 0.3s; animation: animatezoom 0.3s } 
 .modal-content { background-color: #fefefe; margin: 5% auto 15% auto; border: 1px solid #888; width: 50%; } 
 
 .imgcontainer { text-align: center; margin: 24px 0 12px 0; position: relative; } 
             
 .container { padding: 16px; } 
                        
 input[type=text] { width: 100%; padding: 12px 20px;  margin: 8px 0;  display: inline-block;  border: 1px solid #ccc;  box-sizing: border-box;  } 

 input[type=password] { width: 100%; padding: 12px 20px;  margin: 8px 0;  display: inline-block;  border: 1px solid #ccc;  box-sizing: border-box;  } 

            span.psw { display: block; float: none; }  
 span.psw { float: right; padding-top: 16px; } 
 
        .auto-style6 {
            width: 100%;
        }
 
        .auto-style9 {
            text-align: left;
        }
        .auto-style10 {
            text-align: center;
            width: 642px;
        }
 
        .auto-style11 {
            width: 100%;
            font-size: large;
        }
 
        .auto-style12 {
            text-align: left;
            width: 751px;
        }
 
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style6">
            <tr>
                <td class="auto-style10">
                    <label>
                    <span class="auto-style6" style="color:blue">
                    <span class="auto-style4">User-email-id</span></span></label><span class="auto-style4"> &gt;&gt;</span></td>
                <td class="auto-style12">
                    <br class="auto-style4" />
                    <span class="auto-style4">
                        <asp:Image ID="Image3" width="26px" height="25px" runat="server" ImageUrl="~/images/mail.png" />
                    &nbsp;</span><asp:TextBox ID="TextBox1" runat="server" Width="298px" CssClass="auto-style6" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email is required" ControlToValidate="TextBox1" ForeColor="Red" Display="Dynamic" CssClass="auto-style11" >*</asp:RequiredFieldValidator>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ControlToValidate="TextBox1" ForeColor="Red" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="auto-style11" >*</asp:RegularExpressionValidator>
                </td>
                <td class="auto-style9">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <label>
                    <span class="auto-style6" style="color:blue">
                    <br class="auto-style4" />
                    <span class="auto-style4">Password </span></span></label>
                    <span class="auto-style4">
                    &nbsp;
                    &gt;&gt;</span></td>
                <td class="auto-style12">
                        <br class="auto-style4" />
                        <span class="auto-style4">
                        <asp:Image ID="Image4" width="26px" height="25px" runat="server" ImageUrl="~/images/pwd.png" />
                    </span>
                    <asp:TextBox ID="TextBox2" runat="server" Width="298px" Type="password" MaxLength="15"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="password is required" ControlToValidate="TextBox2" ForeColor="Red" CssClass="auto-style11" Display="Dynamic" >*</asp:RequiredFieldValidator>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox2" CssClass="auto-style11" ErrorMessage="Invalid Password" ForeColor="Red" ValidationExpression="(^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,32}$)?(^(?=.*\d)(?=.*[a-z])(?=.*[@#$%^&amp;+=]).{8,32}$)?(^(?=.*\d)(?=.*[A-Z])(?=.*[@#$%^&amp;+=]).{8,32}$)?(^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&amp;+=]).{8,32}$)?" Display="Dynamic">*</asp:RegularExpressionValidator>
                </td>
                <td class="auto-style9">
        <asp:Label ID="Label1" runat="server" CssClass="auto-style4" ForeColor="Red" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <br class="auto-style4" />
                    <br class="auto-style4" />
                    <asp:Button ID="Button1" runat="server" Text="Login" CssClass="auto-style4" Width="146px" PostBackUrl="Canpass.aspx" />
                    <span class="auto-style4">&nbsp;
                </span>
                </td>
                <td class="auto-style12">
                    <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" HeaderText="Validation Errors" Height="95px" />
                    <span class="auto-style4">&nbsp;
                </span>
                </td>
                <td class="auto-style9">
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>