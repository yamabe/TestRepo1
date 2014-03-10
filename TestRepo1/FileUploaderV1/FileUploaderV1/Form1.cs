using FileUploaderV1.Properties;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Collections;
using System.Threading;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace FileUploaderV1
{
    public partial class Form1 : Form
    {
        //System.Collections.ObjectModel.ObservableCollection<String> list = new System.Collections.ObjectModel.ObservableCollection<string>();

        StringBuilder sb = new StringBuilder();

        private delegate void updateUIDelegate();

        public void updateUI()
        {
            if (textBox1.InvokeRequired)
            {
                textBox1.Invoke(new updateUIDelegate(updateUI));
            }
            else
            {
                textBox1.Text = sb.ToString();
            }
        }

        public Form1()
        {
            InitializeComponent();

            //list.CollectionChanged += (sender, e) => {


            //};

            this.Disposed  += (s, e) =>
            {
                if (_watcher != null)
                {
                    _watcher.Dispose();
                }
                if (_watcher2 != null)
                {
                    _watcher2.Dispose();
                }
            };
          
            // this.WindowState = FormWindowState.Minimized;
        }

       public void addMessage(String mes)
        {
            sb.AppendLine(mes);
            updateUI();

        }

       private void Form1_Resize(object sender, EventArgs e)
       {
           if (this.WindowState == FormWindowState.Minimized)
           {

               //フォームを非表示にする

               this.Visible = false;



               //タスクトレイに表示するアイコンを設定する

               System.Drawing.Icon ico = new System.Drawing.Icon("favicon.ico");

               notifyIcon1.Icon = ico;



               //タスクトレイにアイコンを表示する

               notifyIcon1.Visible = true;

           }

           else
           {

               // タスクトレイのアイコンを非表示にする

               notifyIcon1.Visible = true;

           }

       }

        //private void notifyIcon1_DoubleClick(object sender, EventArgs e)
        //{

        //}

        //private void Form1_ClientSizeChanged(object sender, EventArgs e)
        //{

        //}

        //private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        //{

        //}

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            // トレイリストのアイコンを非表示にする  
            notifyIcon1.Visible = false;
        }

        private void Form1_ClientSizeChanged(object sender, EventArgs e)
        {
            if (this.WindowState == System.Windows.Forms.FormWindowState.Minimized)
            {
                // フォームが最小化の状態であればフォームを非表示にする  
                this.Hide();
                // トレイリストのアイコンを表示する  
                notifyIcon1.Visible = true;
            }
        }

        private void notifyIcon1_DoubleClick(object sender, EventArgs e)
        {
            // フォームを表示する  
            this.Visible = true;
            // 現在の状態が最小化の状態であれば通常の状態に戻す  
            if (this.WindowState == FormWindowState.Minimized)
            {
                this.WindowState = FormWindowState.Normal;
            }
            // フォームをアクティブにする  
            this.Activate();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ArrangeFilesService svc = new ArrangeFilesService(this);
            List<String> messages = svc.Execute();

            foreach (String mes in messages)
            {
                addMessage(mes);
            }
        }

        private FileSystemWatcher _watcher;
        private void button2_Click(object sender, EventArgs e)
        {
            FileWatcherService svc = new FileWatcherService(this);

           _watcher=  svc.Execute();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (_watcher != null)
            {
                _watcher.Dispose();
                _watcher = null;
            }
        }


        private FileSystemWatcher _watcher2;
        private void button4_Click(object sender, EventArgs e)
        {
            var svc = new AutoUnzipServie(this);
            this._watcher2 = svc.Execute();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            if (_watcher2 != null)
            {
                _watcher2.Dispose();
                _watcher2 = null;
            }
        }

        
    }
}
