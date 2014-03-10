using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FileUploaderV1
{
    public partial class Form2 : Form
    {
        public String FileName
        {
            get;
            set;

        }

        public String Password
        {
            get;
            set;
        }

        public Form2()
        {
            InitializeComponent();

            this.Load += (s, o) =>
            {
                this.label1.Text = this.FileName;
                this.Activate();
            };
        }



        private void button1_Click(object sender, EventArgs e)
        {
            Password = this.textBox1.Text;
            if (String.IsNullOrEmpty(Password))
            {
                return;

            }
            this.Close();
            DialogResult = System.Windows.Forms.DialogResult.OK;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Password = this.textBox1.Text;
            DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.Close();
        }
    }
}
