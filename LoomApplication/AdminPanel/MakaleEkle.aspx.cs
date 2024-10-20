using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer;

namespace LoomApplication.AdminPanel
{
    public partial class MakaleEkle : System.Web.UI.Page
    {
        DataModel dm = new DataModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddl_kategoriler.DataSource = dm.KategorileriGetir(true);
                ddl_kategoriler.DataBind();
                ddl_oyunlar.DataSource = dm.OyunlariGetir();
                ddl_oyunlar.DataBind();
            }
        }

        protected void lbtn_ekle_Click(object sender, EventArgs e)
        {
            Yonetici y = (Yonetici)Session["GirisYapanYonetici"];
            Makale mak = new Makale();
            mak.Baslik = tb_baslik.Text;
            mak.Kategori_ID = Convert.ToInt32(ddl_kategoriler.SelectedItem.Value);
            mak.Oyun_ID = Convert.ToInt32(ddl_oyunlar.SelectedItem.Value);
            mak.Yazar_ID = y.ID;
            mak.Ozet = tb_ozet.Text;
            mak.Icerik = tb_icerik.Text;
            mak.Durum = cb_durum.Checked;
            mak.EklemeTarihi = DateTime.Now;
            bool isValidExtension = true;
            if (fu_resim.HasFile)//Resim seçilmiş ise
            {
                string isim = Guid.NewGuid().ToString();
                FileInfo fi = new FileInfo(fu_resim.FileName);
                string uzanti = fi.Extension;//.jpg
                if (uzanti == ".jpg" || uzanti == ".png")
                {
                    string tamisim = isim + uzanti;
                    mak.KapakResim = tamisim;
                    fu_resim.SaveAs(Server.MapPath("../MakaleResimleri/" + tamisim));
                }
                else
                {
                    isValidExtension = false;
                }
            }
            else
            {
                mak.KapakResim = "none.png";
            }
            if (isValidExtension)
            {
                if (dm.MakaleEkle(mak))
                {
                    pnl_basarisiz.Visible = false;
                    pnl_basarili.Visible = true;
                }
                else
                {
                    pnl_basarisiz.Visible = true;
                    pnl_basarili.Visible = false;
                    lbl_mesaj.Text = "Makale eklenirken bir hata oluştu";
                }
            }
            else
            {
                pnl_basarisiz.Visible = true;
                pnl_basarili.Visible = false;
                lbl_mesaj.Text = "Resim uzantısı JPG veya PNG olmalıdır";
            }
        }
    }
}