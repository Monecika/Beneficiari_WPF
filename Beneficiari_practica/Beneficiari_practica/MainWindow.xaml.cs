using Beneficiari_practica;
using Beneficiari_practica.Data;
using Beneficiari_practica.Models;
using System.Windows;
using System.Windows.Input;

namespace Beneficiari_practica
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            Window parentWindow = Window.GetWindow(this);
            parentWindow.WindowState = WindowState.Maximized;
        }

        private void Label_MouseEnter(object sender, MouseEventArgs e)
        {
            Mouse.OverrideCursor = Cursors.Hand;
        }

        private void Label_MouseLeave(object sender, MouseEventArgs e)
        {
            Mouse.OverrideCursor = null;
        }

        private void btn_SignIn_Click(object sender, RoutedEventArgs e)
        {
            string username = textBox_username.Text;
            string password = textBox_pass.Password;
            using (var context = new BeneficiariContext())
            {
                bool isValidUser = context.LoginUsers.Any(u => u.Username == username && u.Pass == password);

                if (isValidUser)
                {
                    MessageBox.Show("Login successful");
                    MainPage mainPage = new MainPage();
                    mainPage.Show();
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Failed to login. Invalid credentials");
                }
            }
        }

        private void btn_SignUp_Click(object sender, RoutedEventArgs e)
        {
            string username = textBox_username.Text;
            string password = textBox_pass.Password;
            
            using (var context = new BeneficiariContext()) {
                LoginUser user = new LoginUser();

                user.Username = username;
                user.Pass = password;

                bool isUserPresent = context.LoginUsers.Any(u => u.Username == username && u.Pass == password);
                if (isUserPresent)
                {
                    MessageBox.Show("User already exists");
                }
                else {
                    context.LoginUsers.Add(user);
                    context.SaveChanges();
                }
            }
            lbl_signin_Click(sender, e);
        }

        private void lbl_signUp_Click(object sender, RoutedEventArgs e)
        {
            SignIn_Change.Visibility = Visibility.Visible;
            stack_NoAccount.Visibility = Visibility.Collapsed;
            stack_Account.Visibility = Visibility.Visible;

            SignIn_btn_border.Visibility = Visibility.Collapsed;
            SignUp_btn_border.Visibility = Visibility.Visible;
        }

        private void lbl_signin_Click(object sender, RoutedEventArgs e)
        {
            SignIn_Change.Visibility = Visibility.Collapsed;
            stack_NoAccount.Visibility = Visibility.Visible;
            stack_Account.Visibility = Visibility.Collapsed;

            SignIn_btn_border.Visibility = Visibility.Visible;
            SignUp_btn_border.Visibility = Visibility.Collapsed;
        }
    }
}