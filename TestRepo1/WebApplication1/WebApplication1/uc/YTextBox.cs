using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.ComponentModel;
using System.Drawing;

namespace yuc
{
    [ToolboxData("<{0}:YTextBox runat=server></{0}:YTextBox>")]
    public class YTextBox: TextBox
    {
        private bool _isRequired;

          [
        Bindable(true),
        Category("Appearance"),
        DefaultValue(""),
        Description("The text for the name label.")
        ]
        public bool IsRequired {
            set{_isRequired = value;}
            get { return _isRequired; }
        }

        private RequiredFieldValidator nameValidator;

        protected override void CreateChildControls()
        {

            base.CreateChildControls();

            if (_isRequired)
            {
                nameValidator = new RequiredFieldValidator();
                //nameValidator.ID = "validator1";
                nameValidator.ControlToValidate = this.ID;
                nameValidator.Text = "Failed validation.";
                nameValidator.ErrorMessage = "入力エラー";
                nameValidator.Display = ValidatorDisplay.Static;
                nameValidator.ForeColor = Color.Red;
                base.Controls.Add(nameValidator);
            }




        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            if (_isRequired)
            {
                nameValidator.RenderControl(writer);
            }
        }


    }
}