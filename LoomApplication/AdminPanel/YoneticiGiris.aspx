<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YoneticiGiris.aspx.cs" Inherits="LoomApplication.AdminPanel.YoneticiGiris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Loom Yönetici Giriş</title>
    <link href="css/GirisStyle.css" rel="stylesheet" />
    <meta name="robots" content="noindex, nofollow" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="karsilama">
            <h1>Giriş</h1>
            <label>Yönetici paneline giriş yapmak için lütfen bilgilerinizi giriniz</label>
            <div class="maincerceve">
                <div class="sol">
                    <asp:Panel ID="pnl_hata" runat="server" CssClass="hatakutu" Visible="false">
                        <asp:Label ID="lbl_hatametin" runat="server"></asp:Label>
                    </asp:Panel>
                    <div class="satir">
                        <label style="color:#1999ff;font-weight:900">MAİL İLE GİRİŞ YAPIN</label>
                        <asp:TextBox ID="tb_mail" runat="server" CssClass="metinKutu" placeholder="mail@mail.com" Text="dev@dev.com"></asp:TextBox>
                    </div>
                    <div class="satir">
                        <label style="color:#afafaf">PAROLA</label>
                        <asp:TextBox ID="tb_sifre" runat="server" CssClass="metinKutu" TextMode="Password"  placeholder="******"></asp:TextBox>
                    </div>
                    <div class="satir">
                        <asp:CheckBox ID="cb_hatirla" runat="server" CssClass="check" Text="Beni Hatırla"/>
                    </div>
                    <div class="satir" style="text-align:center">
                        <asp:LinkButton ID="lbtn_giris" runat="server" CssClass="girisButon" OnClick="lbtn_giris_Click">Giriş Yap</asp:LinkButton>
                    </div>
                </div>
                <div class="sag">
                    <img src="SayfaResimleri/eb17d0925c49ef13af6e84cdfeaad079.gif" style="width:100%" />
                    <label>QR koduyla giriş yapmak için<br /> loom mobil uygulamasını kullanın.</label>
                </div>
            <div style="clear:both"></div>
            </div>
        </div>

    </form>
</body>
</html>
