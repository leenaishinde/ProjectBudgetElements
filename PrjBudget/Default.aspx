<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PrjBudget.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Budget Elements Entry </title>
</head>
<body  bgcolor="Silver">
    <form id="form1" runat="server">
    <div>
            <br />
    <h2 style="color: #808000; font-size: x-large; font-weight: bolder; text-align:center">
       Budget Elements Entry</h2>
    <br />
        <asp:HiddenField  ID="hfElementID" runat="server" />
      
        <table>
           
            <tr>
                <td>
                    <asp:Label Text="Name" runat="server" />
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtName" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Comments" runat="server" />
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtComments" runat="server" />                

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Amount" runat="server" />
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtAmount" runat="server"  />
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label Text="User" runat="server" />
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtUser" runat="server"  />
                </td>
            </tr>
            <tr>
            <td></td>
                <td colspan="2">
                    <asp:Button Text="Save" ID="btnSave" runat="server" OnClick="btnSave_Click" />
                    <asp:Button Text="Delete" ID="btnDelete" runat="server" OnClick="btnDelete_Click" />
                    <asp:Button Text="Clear" ID="btnClear" runat="server" OnClick="btnClear_Click" />
                      <asp:Button Text="ExportData" ID="btnExport" runat="server" OnClick="btnExport_Click" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2">
                    <asp:Label Text="" ID="lblSuccessMessage" runat="server" ForeColor="Green" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2">
                    <asp:Label Text="" ID="lblErrorMessage" runat="server" ForeColor="Red" />
                </td>
            </tr>
        </table>
        <br/>
         
        <asp:GridView ID="gvElement" runat="server" AutoGenerateColumns="false">
            <Columns>
                 <asp:BoundField DataField="ElementID" HeaderText="ElementID" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Comments" HeaderText="Comments" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" />
                <asp:BoundField DataField="ModifiedUser" HeaderText="ModifiedUser" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton Text="View" ID="lnkSelect" CommandArgument='<%# Eval("ElementID") %>' runat="server" OnClick="lnkSelect_OnClick"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
        <br />
        <br />
       
    </form>
</body>
</html>

