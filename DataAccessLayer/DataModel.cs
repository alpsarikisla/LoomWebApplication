using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DataModel
    {
        SqlConnection con; SqlCommand cmd;

        public DataModel()
        {
            con = new SqlConnection(ConnectionStrings.ConStr);
            cmd = con.CreateCommand();
        }

        #region Yönetici Metotları

        public Yonetici YoneticiGiris(string mail, string sifre)
        {
            try
            {
                cmd.CommandText = "SELECT Y.ID, Y.YoneticiTur_ID, YT.Isim, Y.Isim, Y.Soyisim, Y.Mail, Y.Sifre, Y.KullaniciAdi, Y.AktifMi FROM Yoneticiler AS Y JOIN YoneticiTurleri AS YT ON Y.YoneticiTur_ID = YT.ID WHERE Y.Mail = @mail AND Y.Sifre = @sifre";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@mail", mail);
                cmd.Parameters.AddWithValue("@sifre", sifre);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                Yonetici y = new Yonetici();
                while (reader.Read())
                {
                    y.ID = reader.GetInt32(0);
                    y.YoneticiTur_ID = reader.GetInt32(1);
                    y.YoneticiTur = reader.GetString(2);
                    y.Isim = reader.GetString(3);
                    y.Soyisim = reader.GetString(4);
                    y.Mail = reader.GetString(5);
                    y.Sifre = reader.GetString(6);
                    y.KullaniciAdi = reader.GetString(7);
                    y.AktifMi = reader.GetBoolean(8);
                }
               
                return y;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        #endregion

        #region Kategori Metotları

        public int KategoriEkle(Kategori kat)
        {
            try
            {
                cmd.CommandText = "INSERT INTO Kategoriler(Isim, Durum) VALUES(@isim, @durum) SELECT @@IDENTITY";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@isim", kat.Isim);
                cmd.Parameters.AddWithValue("@durum", kat.Durum);
                con.Open();
                int id = Convert.ToInt32(cmd.ExecuteScalar());
                return id;
            }
            catch
            {
                return -1;
            }
            finally
            {
                con.Close();
            }
        }

        public List<Kategori> KategorileriGetir()
        {
            List<Kategori> kategoriler = new List<Kategori>();
            try
            {
                cmd.CommandText = "SELECT Durum, ID, Isim FROM Kategoriler";
                cmd.Parameters.Clear();
                con.Open();
                SqlDataReader okuyucu = cmd.ExecuteReader();
                Kategori kk;
                while (okuyucu.Read())
                {
                    kk = new Kategori();
                    kk.ID = okuyucu.GetInt32(1);
                    kk.Isim = okuyucu.GetString(2);
                    kk.Durum = okuyucu.GetBoolean(0);
                    kk.DurumStr = okuyucu.GetBoolean(0) ? "Aktif" : "Pasif";
                    kategoriler.Add(kk);
                }
                return kategoriler;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public List<Kategori> KategorileriGetir(bool durum)
        {
            string d = durum ? "1" : "0";
            List<Kategori> kategoriler = new List<Kategori>();
            try
            {
                cmd.CommandText = "SELECT Durum, ID, Isim FROM Kategoriler WHERE Durum = " + d;
                cmd.Parameters.Clear();
                con.Open();
                SqlDataReader okuyucu = cmd.ExecuteReader();
                Kategori kk;
                while (okuyucu.Read())
                {
                    kk = new Kategori();
                    kk.ID = okuyucu.GetInt32(1);
                    kk.Isim = okuyucu.GetString(2);
                    kk.Durum = okuyucu.GetBoolean(0);
                    kk.DurumStr = okuyucu.GetBoolean(0) ? "Aktif" : "Pasif";
                    kategoriler.Add(kk);
                }
                return kategoriler;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public void KategoriDurumDegistir(int id)
        {
            try
            {
                cmd.CommandText = "SELECT Durum FROM Kategoriler WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                bool durum = Convert.ToBoolean(cmd.ExecuteScalar());
                cmd.CommandText = "UPDATE Kategoriler SET Durum = @d WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@d", !durum);
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }
        public void KategoriSil(int id)
        {
            try
            {
                cmd.CommandText = "DELETE FROM Kategoriler WHERE ID = @id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public Kategori KategoriGetir(int id)
        {
            try
            {
                cmd.CommandText = "SELECT ID, Isim, Durum FROM Kategoriler WHERE ID = @id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                SqlDataReader okuyucu = cmd.ExecuteReader();
                Kategori k = new Kategori();
                while (okuyucu.Read())
                {
                    k.ID = okuyucu.GetInt32(0);
                    k.Isim = okuyucu.GetString(1);
                    k.Durum = okuyucu.GetBoolean(2);
                }
                return k;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }
        public bool KategoriGuncelle(Kategori kat)
        {
            try
            {
                cmd.CommandText = "UPDATE Kategoriler SET Isim=@isim, Durum=@durum WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", kat.ID);
                cmd.Parameters.AddWithValue("@isim", kat.Isim);
                cmd.Parameters.AddWithValue("@durum", kat.Durum);
                con.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                con.Close();
            }
        }

        #endregion

        #region Oyun Metotları

        public List<Oyun> OyunlariGetir()
        {
            List<Oyun> oyunlar = new List<Oyun>();
            try
            {
                cmd.CommandText = "SELECT Durum, ID, Isim FROM Oyunlar";
                cmd.Parameters.Clear();
                con.Open();
                SqlDataReader okuyucu = cmd.ExecuteReader();
                Oyun kk;
                while (okuyucu.Read())
                {
                    kk = new Oyun();
                    kk.ID = okuyucu.GetInt32(1);
                    kk.Isim = okuyucu.GetString(2);
                    kk.Durum = okuyucu.GetBoolean(0);
                    kk.DurumStr = okuyucu.GetBoolean(0) ? "Aktif" : "Pasif";
                    oyunlar.Add(kk);
                }
                return oyunlar;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        #endregion

        #region Makale Metotları

        public bool MakaleEkle(Makale mak)
        {
           
            try
            {
                cmd.CommandText = "INSERT INTO Icerikler(Kategori_ID, Yazar_ID, Oyun_ID, Ozet, Icerik, KapakResmi, Eklemetarihi, GoruntulemeSayi, Durum, Baslik) VALUES(@kategori_ID, @yazar_ID, @oyun_ID, @ozet, @icerik, @kapakResmi, @eklemetarihi, @goruntulemeSayi, @durum, @baslik)";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kategori_ID", mak.Kategori_ID);
                cmd.Parameters.AddWithValue("@yazar_ID", mak.Yazar_ID);
                cmd.Parameters.AddWithValue("@oyun_ID", mak.Oyun_ID);
                cmd.Parameters.AddWithValue("@ozet", mak.Ozet);
                cmd.Parameters.AddWithValue("@icerik", mak.Icerik);
                cmd.Parameters.AddWithValue("@kapakResmi", mak.KapakResim);
                cmd.Parameters.AddWithValue("@eklemetarihi", mak.EklemeTarihi);
                cmd.Parameters.AddWithValue("@goruntulemeSayi", mak.GoruntulemeSayi);
                cmd.Parameters.AddWithValue("@durum", mak.Durum);
                cmd.Parameters.AddWithValue("@baslik", mak.Baslik);
                con.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                con.Close();
            }
        }

        #endregion
    }
}
