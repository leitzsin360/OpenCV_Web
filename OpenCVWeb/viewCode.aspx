<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.Master" AutoEventWireup="true" CodeBehind="viewCode.aspx.cs" Inherits="OpenCVWeb.viewCode" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="code">
        main.cpp:<br />
        <asp:Button ID="Button1" runat="server" Text="查看main.cpp" CssClass="btn btn-primary" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="249px" TextMode="MultiLine" Width="668px" class="form-control" ReadOnly="True"></asp:TextBox>

        <br /><br />

        ImageProcess.hpp:<br />
        <asp:Button ID="Button2" runat="server" Text="查看ImageProcess.hpp" CssClass="btn btn-primary" OnClick="Button2_Click" />
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Height="249px" TextMode="MultiLine" Width="668px"  class="form-control" ReadOnly="True"></asp:TextBox>

        <br /><br />

        Recognition.hpp:<br />
        <asp:Button ID="Button3" runat="server" Text="查看Recognition.hpp" CssClass="btn btn-primary" OnClick="Button3_Click" />
        <br />
        <br />
        <asp:TextBox ID="TextBox3" runat="server" Height="249px" TextMode="MultiLine" Width="668px"  class="form-control" ReadOnly="True"></asp:TextBox>
        <br />
    </div>
</asp:Content>
