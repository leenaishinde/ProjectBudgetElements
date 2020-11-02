<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExportPage.aspx.cs" Inherits="PrjBudget.ExportPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Export</title>
</head>
<body bgcolor="Silver">
    <form id="form1" runat="server">
     <br />
    <h2 style="color: #808000; font-size: x-large; font-weight: bolder; text-align:center">
       Export Budget Elements</h2>
    <br />
   
    <div>
        <asp:GridView ID="GridView1" runat="server"  CellPadding="6" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
       <br />
       &nbsp&nbsp&nbsp &nbsp&nbsp&nbsp  &nbsp&nbsp&nbsp<asp:Button ID="btnExportToExcel" runat="server" Text="Export To Excel" OnClick="btnExportToExcel_Click"  />
        &nbsp&nbsp&nbsp &nbsp&nbsp&nbsp  &nbsp&nbsp&nbsp<asp:Button ID="btnSendApproval" runat="server" Text="Send For Approval" OnClick="btnSendApproval_Click"  />
            &nbsp&nbsp&nbsp &nbsp&nbsp&nbsp  &nbsp&nbsp&nbsp<asp:Button ID="btnBack" runat="server" Text="Back To Budget Entry " OnClick="btnBack_Click"   />
      
    </div>
   
    </form>
</body>
</html>
