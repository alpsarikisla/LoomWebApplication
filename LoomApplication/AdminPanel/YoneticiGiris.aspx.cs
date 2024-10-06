using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoomApplication.AdminPanel
{
    public partial class YoneticiGiris : System.Web.UI.Page
    {
        DataModel dm = new DataModel();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtn_giris_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(tb_mail.Text))
            {
                if (!string.IsNullOrEmpty(tb_sifre.Text))
                {
                    Yonetici y = dm.YoneticiGiris(tb_mail.Text, tb_sifre.Text);
                    if (y != null)
                    {
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        pnl_hata.Visible = true;
                        lbl_hatametin.Text = "Kullanıcı Bulunamadı";
                    }
                }
                else
                {
                    pnl_hata.Visible = true;
                    lbl_hatametin.Text = "Şifre boş bırakılamaz";
                }
            }
            else
            {
                pnl_hata.Visible = true;
                lbl_hatametin.Text = "Mail adresi boş bırakılamaz";
            }
        }
    }
}