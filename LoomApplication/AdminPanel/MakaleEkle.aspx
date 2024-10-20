<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/YoneticiMaster.Master" AutoEventWireup="true" CodeBehind="MakaleEkle.aspx.cs" Inherits="LoomApplication.AdminPanel.MakaleEkle" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/FormStyle.css" rel="stylesheet" />
    <script src="paketler/ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formPanel">
        <div class="panelBaslik">
            <h3>Makale Ekle</h3>
        </div>
        <div class="panelIci bolunmus">
            <asp:Panel ID="pnl_basarili" runat="server" CssClass="panel basarili" Visible="false">
                <span>Kategori Ekleme İşlemi Başarılı</span>
            </asp:Panel>
            <asp:Panel ID="pnl_basarisiz" runat="server" CssClass="panel basarisiz" Visible="false">
                <asp:Label ID="lbl_mesaj" runat="server"></asp:Label>
            </asp:Panel>
            <div class="sol">
                <div class="satir">
                    <label>Makale Baslik</label><br />
                    <asp:TextBox ID="tb_baslik" runat="server" CssClass="metinKutu" placeholder="Makale Başlığı Giriniz"></asp:TextBox>
                </div>
                <div class="satir">
                    <label>Makale Kategorisi</label><br />
                    <asp:DropDownList ID="ddl_kategoriler" runat="server" CssClass="metinKutu" DataTextField="Isim" DataValueField="ID" AppendDataBoundItems="true">
                        <asp:ListItem Value="-1" Text="Kategori Seçiniz"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="satir">
                    <label>Makale Kategorisi</label><br />
                    <asp:DropDownList ID="ddl_oyunlar" runat="server" CssClass="metinKutu" DataTextField="Isim" DataValueField="ID" AppendDataBoundItems="true">
                        <asp:ListItem Value="-1" Text="Oyun Seçiniz"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="satir">
                    <label>Kapak Resmi</label><br />
                    <asp:FileUpload ID="fu_resim" runat="server" CssClass="metinKutu" />
                </div>
                <div class="satir">
                    <asp:CheckBox ID="cb_durum" runat="server" CssClass="check" Text="Makale Aktif" />
                </div>
                <div class="satir" style="padding-top: 15px;">
                    <asp:LinkButton ID="lbtn_ekle" runat="server" CssClass="formButon" OnClick="lbtn_ekle_Click">Makale Ekle</asp:LinkButton>
                    <div style="clear: both"></div>
                </div>
            </div>
            <div class="sag">
                <div class="satir">
                    <label>Makale Özet</label><br />
                    <asp:TextBox ID="tb_ozet" runat="server" TextMode="MultiLine" CssClass="metinKutu area"></asp:TextBox>
                </div>
                <div class="satir">
                    <label>Makale İçerik</label><br />
                    <asp:TextBox ID="tb_icerik" runat="server" TextMode="MultiLine" CssClass="metinKutu area"></asp:TextBox>
                    <script>
                        CKEDITOR.replace('ContentPlaceHolder1_tb_icerik');
                    </script>
                </div>
            </div>
            <div style="clear: both"></div>
        </div>
    </div>
</asp:Content>
