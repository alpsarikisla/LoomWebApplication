<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/YoneticiMaster.Master" AutoEventWireup="true" CodeBehind="KategoriListeleGridView.aspx.cs" Inherits="LoomApplication.AdminPanel.KategoriListeleGridView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/FormStyle.css" rel="stylesheet" />
    <style>
        #ContentPlaceHolder1_gv_belirlikolon
        {
            width:100%;
        }
        #ContentPlaceHolder1_gv_belirlikolon tbody tr th
        {
            padding:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formPanel">
        <div class="panelBaslik">
            <h3>Kategori Listele</h3>
        </div>
        <div class="panelIci">
            <asp:GridView ID="gv_kategoriler" runat="server"></asp:GridView>

            <asp:GridView ID="gv_belirlikolon" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="No" DataField="ID" />
                    <asp:BoundField HeaderText="Kategori Adı" DataField="Isim" />
                </Columns>
                
            </asp:GridView>
        </div>
    </div>
</asp:Content>
