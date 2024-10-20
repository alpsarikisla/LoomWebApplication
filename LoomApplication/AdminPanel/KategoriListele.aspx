<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/YoneticiMaster.Master" AutoEventWireup="true" CodeBehind="KategoriListele.aspx.cs" Inherits="LoomApplication.AdminPanel.KategoriListele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/FormStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formPanel">
        <div class="panelBaslik">
            <h3>Kategori Listele</h3>
        </div>
        <div class="panelIci">
            <asp:ListView ID="lv_kategoriler" runat="server" OnItemCommand="lv_kategoriler_ItemCommand">
                <LayoutTemplate>
                    <table class="schrodinger" cellpadding="0" cellspacing="0">
                        <tr>
                            <th>No</th>
                            <th width="80%">Kategori Adı</th>
                            <th >Durum</th>
                            <th>Seçenekler</th>
                        </tr>
                        <%-- Burası listenin ana taşıyısı --%>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("ID") %></td>
                        <td><%# Eval("Isim") %></td>
                        <td><%# Eval("DurumStr") %></td>
                        <td>
                            <asp:LinkButton ID="lbtn_durumdegistir" runat="server" CssClass="tablobuton durum" CommandArgument='<%# Eval("ID") %>' CommandName="durum">Durum Değiştir</asp:LinkButton>
                            <asp:LinkButton ID="lbtn_sil" runat="server" CssClass="tablobuton sil" CommandArgument='<%# Eval("ID") %>' CommandName="sil">Sil</asp:LinkButton>
                            <a href='KategoriDuzenle.aspx?kid=<%# Eval("ID") %>' class="tablobuton duzenle">Düzenle</a>
                        </td>
                    </tr>
                </ItemTemplate>
              <%--  <AlternatingItemTemplate>
                    <tr class="alternate">
                        <td><%# Eval("ID") %></td>
                        <td><%# Eval("Isim") %></td>
                        <td><%# Eval("DurumStr") %></td>
                        <td></td>
                    </tr>
                </AlternatingItemTemplate>--%>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
