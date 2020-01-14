<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="OpenCVWeb.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="content/bootstrap.min.css" rel="stylesheet" />
    <link href="content/loginStyle.css" rel="stylesheet" />
    <link rel="Shortcut Icon" href="images/logo.ico" type="image/x-icon" />
    <title>车牌识别系统</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login">
            <h2 style="color:white;text-align:center;">登录</h2>
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon1">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                </span>
                <asp:TextBox ID="username" runat="server" class="form-control" placeholder="Username" aria-describedby="basic-addon1"></asp:TextBox>
            </div>
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon2">
                    <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
                </span>
                <asp:TextBox ID="password" runat="server" class="form-control" placeholder="Password" aria-describedby="basic-addon2" TextMode="Password"></asp:TextBox>
            </div>
            <asp:Button ID="Button1" runat="server" Text="登录" class="btn btn-primary" OnClick="Button1_Click" />
        </div>
    </form>

    <script src="scripts/jquery-3.4.1.js"></script>
    <script src="scripts/bootstrap.min.js"></script>    
</body>
</html>
