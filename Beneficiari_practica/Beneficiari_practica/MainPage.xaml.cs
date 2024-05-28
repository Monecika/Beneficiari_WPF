using Beneficiari_practica.Data;
using Beneficiari_practica.pages;
using Beneficiari_practica.Pages;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace Beneficiari_practica
{
    public partial class MainPage : Window
    {
        public MainPage()
        {
            InitializeComponent();
            loadFrame();

            Window parentWindow = Window.GetWindow(this);
            parentWindow.WindowState = WindowState.Maximized;
        }

        public void loadFrame()
        {
            Buttons.Content = new BeneficiariButtons();
            DashBoard.Content = new Dashboard();
            Chart.Content = new Chart();
        }

        public void ToggleDataGridVisibility(bool showDataGrid)
        {
            var beneficiariButtons = (BeneficiariButtons)Buttons.Content;
            beneficiariButtons.ShowDataGrid(showDataGrid);

            if (showDataGrid)
                Panel.SetZIndex(Chart, 0);
            else
                Panel.SetZIndex(Chart, 999);
        }
    }
}
