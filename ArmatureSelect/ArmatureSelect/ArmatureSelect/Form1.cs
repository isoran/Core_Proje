using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ArmatureSelect
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void OnTimeLabel_Click(object sender, EventArgs e)
        {

        }

        private void FlashPerMinute_Click(object sender, EventArgs e)
        {

        }

        private void Lightintensitylabel_Click(object sender, EventArgs e)
        {

        }

        private void fpmcomboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void Form1_Load(object sender, EventArgs e)
        {

            

            string[] FpmList = { "1", "20", "30", "40", "50", "60" };
            fpmcomboBox.Items.AddRange(FpmList);
            string[] IntensityList = { "2.000cd Red", "2.000cd White", "20.000cd White", "Low Type-A 10cd", "Low Type-B 32cd" };
            intensitycomboBox.Items.AddRange(IntensityList);

            






        }

        private void intensitycomboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (intensitycomboBox.Text == "2.000cd Red")
            {
                label1.Text = "80";   
            }
            else if (intensitycomboBox.Text == "2.000cd White")
            {
                label1.Text = "80";
            }
            else if (intensitycomboBox.Text == "20.000cd White")
            {
                label1.Text = "455";
            }
            else if (intensitycomboBox.Text == "Low Type-A 10cd")
            {
                label1.Text = "3,5";
            }
            else if (intensitycomboBox.Text == "Low Type-B 32cd")
            {
                label1.Text = "7";
            }


        }

        private void fpmdetails_Click(object sender, EventArgs e)
        {
            

        }

        private void fpmdetails_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void fpmcomboBox_TextChanged(object sender, EventArgs e)
        {
            if (fpmcomboBox.Text == "1")
            {
                fpmdetails.Text = "Steady";
            }
            else if (fpmcomboBox.Text != "1")
            {
                fpmdetails.Text = (fpmcomboBox.Text)+("FPM");
            }
        }

        private void label2_Click(object sender, EventArgs e)
        {
              
        }

       
        private void ontimetextbox_TextChanged(object sender, EventArgs e)
        {

        }

        private void Form1_TextChanged(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            double ontime = 1, fpm = 1, peakpower = 1, avrpower = 1, divide = 0;
            
            ontime = Convert.ToDouble(ontimetextbox.Text);
            fpm = Convert.ToDouble(fpmcomboBox.Text);
            peakpower = Convert.ToDouble(label1.Text);
            divide = fpm * (ontime/1000);

            if (fpm == 1)
            {
                string sonuc = peakpower.ToString("0.##");
                label2.Text = Convert.ToString(sonuc);
                

            }
            else if (fpm != 1)
            {
                avrpower = peakpower / (60/divide);
                string sonuc = avrpower.ToString("0.##");
                label2.Text = Convert.ToString(sonuc);


            }
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            MessageBox.Show("BYE");
        }
    }
}
