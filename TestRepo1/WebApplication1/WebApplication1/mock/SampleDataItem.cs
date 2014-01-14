using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleGridView.DataModel
{
    class SampleDataItem
    {
        private static Uri _baseUri = new Uri("ms-appx:///");

        public SampleDataItem(String title, String subtitle)
        {
            this._title = title;
            this._subtitle = subtitle;
        }

        private string _title = string.Empty;
        public string Title
        {
            get { return this._title; }
            set { this._title = value; }
        }

        private string _subtitle = string.Empty;
        public string Subtitle
        {
            get { return this._subtitle; }
            set { this._subtitle = value; }
        }

    }
}