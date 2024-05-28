using Beneficiari_practica.Pages;
using LiveCharts.Wpf;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;

namespace Beneficiari_practica.pages
{
    /// <summary>
    /// Interaction logic for Dashboard.xaml
    /// </summary>
    public partial class Dashboard : Page
    {
        private Border _previouslyClickedBorder;

        public Dashboard()
        {
            InitializeComponent();
        }

        private new void MouseEnter(object sender, MouseEventArgs e)
        {
            Mouse.OverrideCursor = Cursors.Hand;
            var border = (Border)sender;
            border.Background = new SolidColorBrush(Color.FromRgb(180, 243, 237));
        }
        private new void MouseLeave(object sender, MouseEventArgs e)
        {
            Mouse.OverrideCursor = null;

            var border = (Border)sender;
            if (border != _previouslyClickedBorder)
            {
                border.Background = Brushes.Transparent;
            }
        }

        private void LogoutCase(object sender, RoutedEventArgs e)
        {
            Window.GetWindow(this).Close();

            MainWindow login = new MainWindow();
            login.Show();
        }


        private void Location_Click(object sender, RoutedEventArgs e)
        {
            DashboardField_Click(sender, e);

            var mainWindow = (MainPage)Window.GetWindow(this);
            var beneficiariButtons = (BeneficiariButtons)mainWindow.Buttons.Content;


            beneficiariButtons.ShowDataGrid();
            beneficiariButtons.CreateData();

            toggleVisibility(true);
        }

        private void Beneficiari_Click(object sender, RoutedEventArgs e)
        {
            DashboardField_Click(sender, e);

            var mainWindow = (MainPage)Window.GetWindow(this);
            var beneficiariButtons = (BeneficiariButtons)mainWindow.Buttons.Content;

            beneficiariButtons.LoadData();

            var main = new MainPage();
            main.Buttons.Visibility = Visibility.Visible;

            toggleVisibility(true);

        }


        private void DashboardField_Click(object sender, RoutedEventArgs e)
        {
            var border = (Border)sender;

            var isMouseOver = border.IsMouseOver;

            if (_previouslyClickedBorder != null)
            {
                _previouslyClickedBorder.Background = Brushes.Transparent;
            }

            border.Background = new SolidColorBrush(Color.FromRgb(255, 255, 255));
            _previouslyClickedBorder = border;


            var main = new MainPage();
            main.Buttons.Visibility = Visibility.Visible;
        }

        private void ShowChart_Click(object sender, MouseButtonEventArgs e)
        {
            DashboardField_Click(sender, e);

            toggleVisibility(false);
        }

        private void toggleVisibility(bool vis) {
            var mainWindow = (MainPage)Window.GetWindow(this);
            mainWindow.ToggleDataGridVisibility(vis);
        }
    }
}
