using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO.Ports;



namespace GmSoft_Charger
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            var ports = SerialPort.GetPortNames();
            comboBox1.DataSource = ports;

            comboBox2.Items.AddRange(new string[] { "9600", "19200", "38400", "57600" });

            var DataBits = new string[] { "1", "2", "3", "4", "5", "6", "7", "8" };
            comboBox3.Items.AddRange(DataBits);
            
            var IdNumber = new string[] { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" };
            comboBox4.DataSource = IdNumber;

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
             
        }

        private void button1_Click(object sender, EventArgs e)
        {
            timer1.Start();
            try
            {
                serialPort1.PortName = comboBox1.Text;
                serialPort1.BaudRate = Convert.ToInt16(comboBox2.Text);
                serialPort1.DataBits = Convert.ToInt16(comboBox3.Text);

                if (!serialPort1.IsOpen)
                {
                    serialPort1.Open();
                    Sinyal.Visible = true;
                    Sinyal.Text = "Bağlantı Kuruldu";
                    Sinyal.ForeColor = Color.Green;
                    
                }
              
            }
            catch (Exception)
            {
                Sinyal.Visible = true;
                Sinyal.Text = "Bağlantı Kurulamadı!";
                Sinyal.ForeColor = Color.Red;

            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            try
            {
                string bilgi = (serialPort1.ReadExisting());
                textBox3.Text = bilgi.ToString();
                listBox1.Items.Add(textBox3.Text);
                System.Threading.Thread.Sleep(1200);
            }
            catch
            {


            }


        }

        private void button2_Click(object sender, EventArgs e)
        {
            timer1.Stop();
            serialPort1.Close();
            Sinyal.Visible = true;
            Sinyal.Text = "Bağlantı Sonlandırıldı";
            Sinyal.ForeColor = Color.Yellow;
            textBox1.Text = "";
            textBox2.Text = "";
            textBox3.Text = ""; 
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                if (serialPort1.IsOpen)
                {
                    serialPort1.WriteLine(textBox4.Text);
                    listBox2.Items.Add(textBox4.Text);

                }


            }
            catch (Exception)
            {
                MessageBox.Show("VERİ GÖNDERİLEMEDİ");


            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            listBox2.Items.Clear();
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
