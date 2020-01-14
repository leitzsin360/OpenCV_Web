<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.Master" AutoEventWireup="true" CodeBehind="viewResults.aspx.cs" Inherits="OpenCVWeb.viewResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center;">
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" ShowHeaderWhenEmpty="True" Width="420px" RowStyle-VerticalAlign="Middle" DataKeyNames="number" DataSourceID="LinqDataSource2" style="margin: 0 auto;text-align:center;">
            <AlternatingRowStyle BackColor="#0099FF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
            <Columns>
                <asp:BoundField DataField="number" HeaderText="number" ReadOnly="True" SortExpression="number" />
                <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
            </Columns>
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
        <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="OpenCVWeb.LicensePlateDataContext" EntityTypeName="" TableName="License">
        </asp:LinqDataSource>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="更新数据" class="btn btn-primary" OnClick="Button1_Click" />
        <br />
        <br />
    </div>
</asp:Content>
