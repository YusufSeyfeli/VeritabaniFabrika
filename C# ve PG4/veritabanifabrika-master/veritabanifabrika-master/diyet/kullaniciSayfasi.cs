﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.OleDb;
using Npgsql;

namespace veritabanifabrika
{
    public partial class kullaniciSayfasi : Form
    {

        public kullaniciSayfasi(string tc, string parola)
        {
            InitializeComponent();
        }

        public kullaniciSayfasi()
        {
        }

        Giris frm1 = new Giris();
        DateTime datee = DateTime.Now;

        private void randevuAra_Load(object sender, EventArgs e)
        {
            uyeBilgileriniGoster();
            foreach (Control asd in panel1.Controls)
            {
                if (asd.Text != "Randevu Saatini Seçin")
                {
                    if (asd.BackColor != Color.Red)
                    {
                        asd.Click += new EventHandler(asd_Click);
                    }
                }
            }
        }
        void uyeBilgileriniGoster()
        {
            String tcNo = lblTC.Text;
            frm1.connsql.Open();
            // Veritabanında bir tablo üzerinde işlem yapmak için NpgsqlCommand nesnesi oluştur
            NpgsqlCommand cmd = new NpgsqlCommand("Select * From Uyeler where TC='" + tcNo + "' ", frm1.connsql);
            cmd.ExecuteNonQuery();
            NpgsqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                lblTC.Text = rd["TC"].ToString();
                lblAdSoyad.Text = rd["Adı"].ToString() + " " + rd["Soyadı"].ToString();
                lblDogumYeriTarihi.Text = rd["DogumTarihi"].ToString();
                lblCinsiyet.Text = rd["Cinsiyeti"].ToString();
            }
            frm1.connsql.Close();
        }

        void asd_Click(object sender, EventArgs e)
        {

        }
        private void cmBoxRandevTarihi_SelectedIndexChanged(object sender, EventArgs e)
        {
            asd_Click(sender, e);
            panel1.Visible = true;

        }

        private void randevuAra_FormClosed(object sender, FormClosedEventArgs e)
        {
            frm1.connsql.Close();
            Application.Exit();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {

        }

        private void timer2_Tick(object sender, EventArgs e)
        {

        }

        private void altyazıyıDeğiştirToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            uyeBilgileriniGoster();
        }
        private void lblHastaneAdi_Click(object sender, EventArgs e)
        {

        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            frm1.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            uyeGuncelle guncelle = new uyeGuncelle(lblTC.Text, parola.Text);
            guncelle.ShowDialog();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label14_Click(object sender, EventArgs e)
        {

        }

        private void label17_Click(object sender, EventArgs e)
        {

        }

        private void richTextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void lblTel_Click(object sender, EventArgs e)
        {

        }

        private void lblCinsiyet_Click(object sender, EventArgs e)
        {

        }

        private void lblTC_Click(object sender, EventArgs e)
        {

        }

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
