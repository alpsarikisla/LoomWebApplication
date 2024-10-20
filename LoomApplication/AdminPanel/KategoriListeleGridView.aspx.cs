using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoomApplication.AdminPanel
{
    public partial class KategoriListeleGridView : System.Web.UI.Page
    {
        DataModel dm = new DataModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            //gv_kategoriler.DataSource = dm.KategorileriGetir();
            //gv_kategoriler.DataBind();//Bu satır yazılmaz ise veriler listelenmez

            gv_belirlikolon.DataSource = dm.KategorileriGetir();
            gv_belirlikolon.DataBind();
        }
    }
}