using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;

namespace SampleGridView.DataModel
{
    class SampleDataGroup
    {
        public SampleDataGroup(String title)
        {
            this._title = title;
        }

        private string _title = string.Empty;
        public string Title
        {
            get { return this._title; }
            set { this._title = value; }
        }

        private ObservableCollection<SampleDataItem> _items = new ObservableCollection<SampleDataItem>();
        public ObservableCollection<SampleDataItem> Items
        {
            get { return this._items; }
        }
    }
}