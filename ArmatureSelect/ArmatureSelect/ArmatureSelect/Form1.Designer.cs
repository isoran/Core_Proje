namespace ArmatureSelect
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.OnTimeLabel = new System.Windows.Forms.Label();
            this.FlashPerMinuteLabel = new System.Windows.Forms.Label();
            this.Lightintensitylabel = new System.Windows.Forms.Label();
            this.ontimetextbox = new System.Windows.Forms.TextBox();
            this.fpmcomboBox = new System.Windows.Forms.ComboBox();
            this.intensitycomboBox = new System.Windows.Forms.ComboBox();
            this.fpmdetails = new System.Windows.Forms.Label();
            this.PeakPowerlabel = new System.Windows.Forms.Label();
            this.AveragePclabel = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(376, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(122, 125);
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            this.pictureBox1.Click += new System.EventHandler(this.pictureBox1_Click);
            // 
            // OnTimeLabel
            // 
            this.OnTimeLabel.AutoSize = true;
            this.OnTimeLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.OnTimeLabel.Location = new System.Drawing.Point(12, 24);
            this.OnTimeLabel.Name = "OnTimeLabel";
            this.OnTimeLabel.Size = new System.Drawing.Size(142, 16);
            this.OnTimeLabel.TabIndex = 1;
            this.OnTimeLabel.Text = "Lamp On Time (ms)";
            this.OnTimeLabel.Click += new System.EventHandler(this.OnTimeLabel_Click);
            // 
            // FlashPerMinuteLabel
            // 
            this.FlashPerMinuteLabel.AutoSize = true;
            this.FlashPerMinuteLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.FlashPerMinuteLabel.Location = new System.Drawing.Point(12, 58);
            this.FlashPerMinuteLabel.Name = "FlashPerMinuteLabel";
            this.FlashPerMinuteLabel.Size = new System.Drawing.Size(123, 16);
            this.FlashPerMinuteLabel.TabIndex = 2;
            this.FlashPerMinuteLabel.Text = "Flash Per Minute";
            this.FlashPerMinuteLabel.Click += new System.EventHandler(this.FlashPerMinute_Click);
            // 
            // Lightintensitylabel
            // 
            this.Lightintensitylabel.AutoSize = true;
            this.Lightintensitylabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.Lightintensitylabel.Location = new System.Drawing.Point(12, 87);
            this.Lightintensitylabel.Name = "Lightintensitylabel";
            this.Lightintensitylabel.Size = new System.Drawing.Size(102, 16);
            this.Lightintensitylabel.TabIndex = 3;
            this.Lightintensitylabel.Text = "Light Intensity";
            this.Lightintensitylabel.Click += new System.EventHandler(this.Lightintensitylabel_Click);
            // 
            // ontimetextbox
            // 
            this.ontimetextbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.ontimetextbox.Location = new System.Drawing.Point(189, 23);
            this.ontimetextbox.Name = "ontimetextbox";
            this.ontimetextbox.Size = new System.Drawing.Size(138, 22);
            this.ontimetextbox.TabIndex = 4;
            this.ontimetextbox.Text = "300";
            this.ontimetextbox.TextChanged += new System.EventHandler(this.ontimetextbox_TextChanged);
            // 
            // fpmcomboBox
            // 
            this.fpmcomboBox.Cursor = System.Windows.Forms.Cursors.Hand;
            this.fpmcomboBox.DisplayMember = "1";
            this.fpmcomboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.fpmcomboBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.fpmcomboBox.FormattingEnabled = true;
            this.fpmcomboBox.Location = new System.Drawing.Point(189, 53);
            this.fpmcomboBox.Name = "fpmcomboBox";
            this.fpmcomboBox.Size = new System.Drawing.Size(142, 24);
            this.fpmcomboBox.TabIndex = 5;
            this.fpmcomboBox.SelectedIndexChanged += new System.EventHandler(this.fpmcomboBox_SelectedIndexChanged);
            this.fpmcomboBox.TextChanged += new System.EventHandler(this.fpmcomboBox_TextChanged);
            // 
            // intensitycomboBox
            // 
            this.intensitycomboBox.Cursor = System.Windows.Forms.Cursors.Hand;
            this.intensitycomboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.intensitycomboBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.intensitycomboBox.FormattingEnabled = true;
            this.intensitycomboBox.Location = new System.Drawing.Point(189, 87);
            this.intensitycomboBox.Name = "intensitycomboBox";
            this.intensitycomboBox.Size = new System.Drawing.Size(142, 24);
            this.intensitycomboBox.TabIndex = 6;
            this.intensitycomboBox.SelectedIndexChanged += new System.EventHandler(this.intensitycomboBox_SelectedIndexChanged);
            // 
            // fpmdetails
            // 
            this.fpmdetails.AutoSize = true;
            this.fpmdetails.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.fpmdetails.ForeColor = System.Drawing.Color.DarkBlue;
            this.fpmdetails.Location = new System.Drawing.Point(333, 58);
            this.fpmdetails.Name = "fpmdetails";
            this.fpmdetails.Size = new System.Drawing.Size(23, 16);
            this.fpmdetails.TabIndex = 7;
            this.fpmdetails.Text = "---";
            this.fpmdetails.TextChanged += new System.EventHandler(this.fpmdetails_TextChanged);
            this.fpmdetails.Click += new System.EventHandler(this.fpmdetails_Click);
            // 
            // PeakPowerlabel
            // 
            this.PeakPowerlabel.AutoSize = true;
            this.PeakPowerlabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.PeakPowerlabel.Location = new System.Drawing.Point(12, 173);
            this.PeakPowerlabel.Name = "PeakPowerlabel";
            this.PeakPowerlabel.Size = new System.Drawing.Size(212, 16);
            this.PeakPowerlabel.TabIndex = 8;
            this.PeakPowerlabel.Text = "Peak Power Consumption (W)";
            // 
            // AveragePclabel
            // 
            this.AveragePclabel.AutoSize = true;
            this.AveragePclabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.AveragePclabel.Location = new System.Drawing.Point(12, 205);
            this.AveragePclabel.Name = "AveragePclabel";
            this.AveragePclabel.Size = new System.Drawing.Size(235, 16);
            this.AveragePclabel.TabIndex = 10;
            this.AveragePclabel.Text = "Average Power Consumption (W)";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label1.Location = new System.Drawing.Point(253, 168);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(19, 20);
            this.label1.TabIndex = 11;
            this.label1.Text = "0";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label2.Location = new System.Drawing.Point(253, 205);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(19, 20);
            this.label2.TabIndex = 12;
            this.label2.Text = "0";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // button1
            // 
            this.button1.AccessibleRole = System.Windows.Forms.AccessibleRole.None;
            this.button1.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.button1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.button1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button1.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.button1.ForeColor = System.Drawing.SystemColors.WindowText;
            this.button1.Location = new System.Drawing.Point(257, 125);
            this.button1.Name = "button1";
            this.button1.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.button1.Size = new System.Drawing.Size(75, 35);
            this.button1.TabIndex = 13;
            this.button1.Text = "OK";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Form1
            // 
            this.AcceptButton = this.button1;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Window;
            this.ClientSize = new System.Drawing.Size(505, 250);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.AveragePclabel);
            this.Controls.Add(this.PeakPowerlabel);
            this.Controls.Add(this.fpmdetails);
            this.Controls.Add(this.intensitycomboBox);
            this.Controls.Add(this.fpmcomboBox);
            this.Controls.Add(this.ontimetextbox);
            this.Controls.Add(this.Lightintensitylabel);
            this.Controls.Add(this.FlashPerMinuteLabel);
            this.Controls.Add(this.OnTimeLabel);
            this.Controls.Add(this.pictureBox1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Name = "Form1";
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Show;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Armature Select Program";
            this.TransparencyKey = System.Drawing.Color.Red;
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Form1_FormClosed);
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label OnTimeLabel;
        private System.Windows.Forms.Label FlashPerMinuteLabel;
        private System.Windows.Forms.Label Lightintensitylabel;
        private System.Windows.Forms.TextBox ontimetextbox;
        private System.Windows.Forms.ComboBox fpmcomboBox;
        private System.Windows.Forms.ComboBox intensitycomboBox;
        private System.Windows.Forms.Label fpmdetails;
        private System.Windows.Forms.Label PeakPowerlabel;
        private System.Windows.Forms.Label AveragePclabel;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button button1;
    }
}

