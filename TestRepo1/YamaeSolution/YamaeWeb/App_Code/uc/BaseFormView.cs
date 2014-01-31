using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace uc
{

    /// <summary>
    /// BaseFormView の概要の説明です
    /// </summary>
    public class BaseFormView : FormView
    {
        public BaseForm BaseForm
        {
            get { return (BaseForm)this.Page; }
        }

        public BaseFormView()
        {
            //
            // TODO: コンストラクター ロジックをここに追加します
            //

        }

        protected override void OnItemUpdating(FormViewUpdateEventArgs e)
        {

            ConvertCheckBoxValue(e.NewValues);
            base.OnItemUpdating(e);
        }

        protected override void OnItemInserting(FormViewInsertEventArgs e)
        {
            ConvertCheckBoxValue(e.Values);
            base.OnItemInserting(e);
        }

        public void ChangeModeToEdit(int rowIndex)
        {
            this.PageIndex = rowIndex;
            this.ChangeMode(FormViewMode.Edit);
        }

        private void ConvertCheckBoxValue(IOrderedDictionary values)
        {
            // チェックボックスの値を設定する。

            // チェックボックスのControlを検索
            // チェックボックスのIDからコマンドのパラメーターを取得
            // bool文字列を設定する

            foreach (Control c in this.Row.Controls)
            {
                foreach (Control c2 in c.Controls)
                {
                    if (c2 is YCheckBox)
                    {
                        YCheckBox check = c2 as YCheckBox;
                        values[check.ID] = check.Checked.ToString();
                    }
                }
            }
        }

    }
}