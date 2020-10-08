<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehiclesInfo1.aspx.cs" Inherits="Seven_module_project.Pages.VehiclesInfo1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>


<div>

    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="VehicleId" DataSourceID="SqlDataSource2">
        <Fields>
            <asp:TemplateField HeaderText="VehicleId" InsertVisible="False" SortExpression="VehicleId">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("VehicleId") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("VehicleId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CustomerID" SortExpression="CustomerID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("CustomerID") %>' DataSourceID="SqlDataSource3" DataTextField="CustomerName" DataValueField="CustomerID"></asp:DropDownList>

                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:SalesInvoicesConnectionString %>' SelectCommand="SELECT [CustomerID], [CustomerName] FROM [Customers]"></asp:SqlDataSource>
                    <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CustomerID") %>'></asp:TextBox>--%>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("CustomerID") %>' DataSourceID="SqlDataSource4" DataTextField="CustomerName" DataValueField="CustomerID"></asp:DropDownList>

                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:SalesInvoicesConnectionString2 %>' SelectCommand="SELECT [CustomerID], [CustomerName] FROM [Customers]"></asp:SqlDataSource>
                    <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CustomerID") %>'></asp:TextBox>--%>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CustomerID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="VehicleName" SortExpression="VehicleName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("VehicleName") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("VehicleName") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("VehicleName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UnitPrice" SortExpression="UnitPrice">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MadeYear" SortExpression="MadeYear">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("MadeYear") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("MadeYear") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("MadeYear") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ImageUrl" SortExpression="ImageUrl">
                <EditItemTemplate>
                ImageUpload:<asp:FileUpload ID="FileUpload2" runat="server" />

                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ImageUrl") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
               Image Upload: <asp:FileUpload ID="FileUpload1" runat="server" />

                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ImageUrl") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Bind("ImageUrl") %>' />

                   <%-- <asp:Label ID="Label5" runat="server" Text='<%# Bind("ImageUrl") %>'></asp:Label>--%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
        DeleteCommand="DELETE FROM [Vehicles] WHERE [VehicleId] = @original_VehicleId " 
        InsertCommand="INSERT INTO [Vehicles] ([CustomerID], [VehicleName], [UnitPrice], [MadeYear], [ImageUrl]) VALUES (@CustomerID, @VehicleName, @UnitPrice, @MadeYear, @ImageUrl)" OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Vehicles] WHERE ([VehicleId] = @VehicleId)" 
        UpdateCommand="UPDATE [Vehicles] SET [CustomerID] = @CustomerID, [VehicleName] = @VehicleName, [UnitPrice] = @UnitPrice, [MadeYear] = @MadeYear, [ImageUrl] = @ImageUrl WHERE [VehicleId] = @original_VehicleId">
        <DeleteParameters>
            <asp:Parameter Name="original_VehicleId" Type="Int32" />
           
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CustomerID" Type="Int32" />
            <asp:Parameter Name="VehicleName" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="MadeYear" />
            <asp:Parameter Name="ImageUrl" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="1" Name="VehicleId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CustomerID" Type="Int32" />
            <asp:Parameter Name="VehicleName" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="MadeYear" />
            <asp:Parameter Name="ImageUrl" Type="String" />
            <asp:Parameter Name="original_VehicleId" Type="Int32" />
           
        </UpdateParameters>
    </asp:SqlDataSource>

</div>



   <div>



   </div>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="VehicleId" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:TemplateField HeaderText="VehicleId" InsertVisible="False" SortExpression="VehicleId">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("VehicleId") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("VehicleId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CustomerID" SortExpression="CustomerID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("CustomerID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("CustomerID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="VehicleName" SortExpression="VehicleName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("VehicleName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("VehicleName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UnitPrice" SortExpression="UnitPrice">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MadeYear" SortExpression="MadeYear">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("MadeYear") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("MadeYear") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ImageUrl" SortExpression="ImageUrl">
                <EditItemTemplate>
                  
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ImageUrl") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100" Width="100" ImageUrl='<%# Bind("ImageUrl") %>'/>
                  <%--  <asp:Label ID="Label1" runat="server" Text='<%# Bind("ImageUrl") %>'></asp:Label>--%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [VehicleId], [CustomerID], [VehicleName], [UnitPrice], [MadeYear], [ImageUrl] FROM [Vehicles]"></asp:SqlDataSource>
 </div>
    <br />


</asp:Content>
