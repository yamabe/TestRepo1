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
                

            FileSystemWatcher watcher = new FileSystemWatcher();
            watcher.Path = Resources.WATCHER_DIR;

            watcher.IncludeSubdirectories = true;
            watcher.Created += watcher_Created;
            watcher.Error += watcher_Error;


            watcher.EnableRaisingEvents = true;
            
            addMessage("監視開始" + watcher.Path + " → " + Resources.UPLOAD_DIR); 

           // this.WindowState = FormWindowState.Minimized;
        }

        void addMessage(String mes)
        {
            sb.AppendLine(mes);
            updateUI();

        }

        void watcher_Error(object sender, ErrorEventArgs e)
        {
            addMessage("ERROR:" + e.ToString());
        }

        void watcher_Created(object sender, FileSystemEventArgs e)
        {
            try
            {
                bool isSuccess = false;
                for (int i = 0; i < 30; i++)
                {
                    try
                    {
                        if (File.Exists(e.FullPath))
                        {
                            FileInfo fi = new FileInfo(e.FullPath);

                            var userName = Resources.USER_NAME;
                            var newName = string.Format(DateTime.Now.ToString("yyyyMMdd_hhMMsss_{0}_{1}"), userName, fi.Name);

                            var fullPath = Path.Combine(Resources.UPLOAD_DIR, newName);

                            fi.CopyTo(fullPath, true);

                            addMessage("Copy:" + fi.Name + "→" + newName);
                            isSuccess = true;
                            break;
                            // ＤＢに登録する
                        }
                        else
                        {
                            isSuccess = true;
                        }
                    }
                    catch 
                    {
                        addMessage(String.Format("Retry{0}回目:", i) + e.FullPath);
                        Thread.Sleep(500);
                    }

                }

                if (!isSuccess)
                {
                    addMessage("処理失敗：" + e.FullPath);

                }
            }
            catch (Exception ex)
            {

                addMessage("ERROR:" + ex.ToString());
            }
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
    }
}
