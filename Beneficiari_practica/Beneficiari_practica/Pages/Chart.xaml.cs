using Beneficiari_practica.Data;
using LiveCharts;
using LiveCharts.Wpf;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;

namespace Beneficiari_practica.Pages
{
    public partial class Chart : Page
    {
        public Chart()
        {
            InitializeComponent();

            LoadData();

            PointLabel = chartPoint => $"{chartPoint.SeriesView.Title}: {chartPoint.Y}";
            DataContext = this;
        }

        private void MouseEnter(object sender, MouseEventArgs e)
        {
            Mouse.OverrideCursor = Cursors.Hand;
            if (sender is Border border)
            {
                border.Background = new SolidColorBrush(Color.FromRgb(180, 243, 237));
            }
        }

        private void MouseLeave(object sender, MouseEventArgs e)
        {
            Mouse.OverrideCursor = null;
            if (sender is Border border)
            {
                border.Background = new SolidColorBrush(Color.FromRgb(79, 209, 197)); // Original color
            }
        }

        public void LoadData()
        {
            using (var context = new BeneficiariContext())
            {
                var mediulCounts = context.Beneficiaris
                    .GroupBy(b => b.Mediul)
                    .Select(g => new { Mediul = g.Key, Count = g.Count() })
                    .ToList();

                SeriesCollection = new SeriesCollection();
                foreach (var mediulCount in mediulCounts)
                {
                    SeriesCollection.Add(new PieSeries
                    {
                        Title = mediulCount.Mediul,
                        Values = new ChartValues<double> { mediulCount.Count },
                        DataLabels = true
                    });
                }

                var localitateCounts = context.Beneficiaris
                    .GroupBy(b => b.CodLocalitate)
                    .Select(g => new { CodLocalitate = g.Key, Count = g.Count() })
                    .ToList();

                SeriesCollection1 = new SeriesCollection();
                foreach (var localitateCount in localitateCounts)
                {
                    SeriesCollection1.Add(new PieSeries
                    {
                        Title = localitateCount.CodLocalitate,
                        Values = new ChartValues<double> { localitateCount.Count },
                        DataLabels = true
                    });
                }
            }

            DataContext = null;
            DataContext = this;
        }

        public void refreshData(object sender, RoutedEventArgs e)
        {
            LoadData();
        }

        public Func<ChartPoint, string> PointLabel { get; set; }

        public SeriesCollection SeriesCollection { get; set; }
        public SeriesCollection SeriesCollection1 { get; set; }
    }
}
