<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendApproval.aspx.cs" Inherits="PrjBudget.SendApproval" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>File Upload</title>
  <style type="text/css">
.code-keyword{color:Blue;}.code-leadattribute{color:#800000;}.code-attribute{color:red;}
        #form1
        {
            height: 84px;
        }
    </style>
</head>
<body bgcolor="Silver">
    <form id="form1" runat="server">
           <br />
    <h2 style="color: #808000; font-size: x-large; font-weight: bolder; text-align:center">
       Send For Approval</h2>
    <br />
    <div>  
   <table>
    <tr>
    <td> 
        Select File
        </td>
        <td>

       <asp:FileUpload 
       ID="FileUpload1"   runat="server"  ToolTip="Select Only Excel File" 
         accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" /> 
        </td>
        <td> 
        <asp:Button ID="Button1" runat="server" Text="Upload" onclick="Button1_Click" />
        </td>
        <td>
        
            <asp:Button ID="Button2" runat="server" Text="View Files" 
                onclick="Button2_Click" />
               </td>
               <td><asp:Button ID="btnBack" runat="server" Text="Back To Initial Page " OnClick="btnBack_Click"   /></td>
        </tr>
        
</table>
<table><tr><td><p><asp:Label ID="Label2" runat="server" Text="label"></asp:Label>  </p></td></tr></table>
  
   <br />    <br /> <br /> <br />  <br />    <br /> <br /> <br /> 
<asp:GridView ID="GridView1" runat="server" Caption="Excel Files " 
        CaptionAlign="Top" HorizontalAlign="Justify" 
         DataKeyNames="id" onselectedindexchanged="GridView1_SelectedIndexChanged" 
        ToolTip="Excel FIle DownLoad Tool" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
        <RowStyle BackColor="#E3EAEB" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Download" ControlStyle-ForeColor="Blue"/>
        </Columns>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView> 
    </div>
 </form>
       

</body>
</html>
