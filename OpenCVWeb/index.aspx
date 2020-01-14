<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="OpenCVWeb.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="content/bootstrap.min.css" rel="stylesheet" />
    <link href="content/indexStyle.css" rel="stylesheet" />
    <link rel="Shortcut Icon" href="images/logo.ico" type="image/x-icon" />
    <title>车牌识别系统</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="jumbotron">
            <div class="container">
                <h1>License Plate Recognition</h1>
                <h3>车牌识别系统</h3>
                <asp:Button ID="Button1" runat="server" Text="Start now" class="btn btn-primary btn-lg" OnClick="Button1_Click"/>
            </div>
        </div>
    </form>
    
    <script src="scripts/jquery-3.4.1.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
</body>
</html>
