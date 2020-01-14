<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.Master" AutoEventWireup="true" CodeBehind="openImage.aspx.cs" Inherits="OpenCVWeb.openImage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center;">
        <asp:FileUpload ID="FileUpload1" runat="server" Style="margin: 0 auto;"/>   
        <br />
        <asp:Button ID="Button1" runat="server" Text="确定选择" class="btn btn-primary" OnClick="Button1_Click"/>
        <br />
        <br />
        <asp:Image ID="Image1" runat="server" ImageAlign="Middle"/>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="识别车牌" class="btn btn-primary" OnClick="Button2_Click" Visible="False"/>
    </div>
</asp:Content>
