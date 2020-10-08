<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="Seven_module_project.Pages.Customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="CustomerName" DataValueField="CustomerName"></asp:DropDownList>


        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SalesInvoicesConnectionString4 %>" SelectCommand="SELECT [CustomerName] FROM [Customers] WHERE ([CustomerID] = @CustomerID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" DefaultValue="1" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>


    </div>


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
            <asp:BoundField DataField="CustomerBIN" HeaderText="CustomerBIN" SortExpression="CustomerBIN" />
        </Columns>
</asp:GridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SalesInvoicesConnectionString3 %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>

</asp:Content>
