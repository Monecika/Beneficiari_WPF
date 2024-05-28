using Beneficiari_practica.Data;
using Beneficiari_practica.Models;
using ClosedXML.Excel;
using DocumentFormat.OpenXml.Office2010.Excel;
using Microsoft.EntityFrameworkCore;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using Microsoft.Win32;


namespace Beneficiari_practica.Pages
{
    /// <summary>
    /// Interaction logic for BeneficiariButtons.xaml
    /// </summary>
    public partial class BeneficiariButtons : Page
    {
        private int ID;

        public BeneficiariButtons(bool load = true)
        {
            InitializeComponent();

            if (load)
                LoadData();

            createNewTable();
        }

        private void MouseEnter(object sender, System.Windows.Input.MouseEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Hand;
        }

        private void MouseLeave(object sender, System.Windows.Input.MouseEventArgs e)
        {
            Mouse.OverrideCursor = null;
        }

        private void DeleteFromTable()
        {
            using (var context = new BeneficiariContext())
            {

                var allData = context.BeneficiarisCopy.ToList();

                foreach (var entity in allData)
                {
                    context.Entry(entity).State = EntityState.Deleted;
                }

                context.SaveChanges();
            }
        }

        private void createNewTable()
        {

            DeleteFromTable();

            using (var context = new BeneficiariContext())
            {
                var beneficiariData = context.Beneficiaris.ToList();

                foreach (var item in beneficiariData)
                {
                    var newItem = new BeneficiariCopy
                    {
                        BenificiarId = item.BenificiarId,
                        Nume = item.Nume,
                        Prenume = item.Prenume,
                        Adresa = item.Adresa,
                        Telefon = item.Telefon,
                        Mediul = item.Mediul,
                        CodLocalitate = item.CodLocalitate,
                        Email = item.Email,
                    };
                    context.BeneficiarisCopy.Add(newItem);
                }
                context.SaveChanges();
            }
        }

        public void LoadData(string searchFilter = "", string sortFilter = "")
        {
            using (var context = new BeneficiariContext())
            {
                var beneficiariWithConturi = from beneficiar in context.Beneficiaris
                                             join cont in context.ConturiBancares
                                                 on beneficiar.BenificiarId equals cont.BeneficiarId into contGroup
                                             from cont in contGroup.DefaultIfEmpty()
                                             join documente in context.DocumenteIdentitates
                                                 on beneficiar.BenificiarId equals documente.BeneficiarId into docGroup
                                             from documente in docGroup.DefaultIfEmpty()
                                             join istoric in context.IstoricTranzactiis
                                                 on beneficiar.BenificiarId equals istoric.BeneficiarId into istoricGroup
                                             from istoric in istoricGroup.DefaultIfEmpty()
                                             where (string.IsNullOrEmpty(searchFilter) || beneficiar.CodLocalitate.Contains(searchFilter)) && (string.IsNullOrEmpty(sortFilter) || beneficiar.Mediul == sortFilter)
                                             select new
                                             {
                                                 beneficiar.BenificiarId,
                                                 beneficiar.Nume,
                                                 beneficiar.Prenume,
                                                 beneficiar.Adresa,
                                                 TipDocument = documente != null ? documente.TipDocument : "none",
                                                 beneficiar.Telefon,
                                                 beneficiar.Mediul,
                                                 beneficiar.CodLocalitate,
                                                 beneficiar.Email,
                                                 NumarCont = cont != null ? cont.NumarCont : "none",
                                                 Suma = istoric != null ? istoric.Suma : 0
                                             };
                this.dataGrid.ItemsSource = beneficiariWithConturi.ToList();
            }
        }

        public void CreateData()
        {
            LoadData(txtSearch.Text, "rural");
        }

        private int ExtractID(object sender, RoutedEventArgs e)
        {
            var element = sender as System.Windows.Controls.Button;
            var dataContext = element?.DataContext;

            int beneficiarID = int.Parse(dataContext?.GetType()
                .GetProperties()
                .FirstOrDefault()?.GetValue(dataContext)
                .ToString());

            return beneficiarID;
        }

        public void ShowDataGrid(bool showDataGrid)
        {
            dataGrid.Visibility = showDataGrid ? Visibility.Visible : Visibility.Hidden;
        }

        private void LoadFields(int beneficiarID)
        {
            using (var context = new BeneficiariContext())
            {
                var beneficiar = context.Beneficiaris
                    .FirstOrDefault(b => b.BenificiarId == beneficiarID);

                if (beneficiar != null)
                {
                    update_name.Text = beneficiar.Nume;
                    update_surname.Text = beneficiar.Prenume;
                    update_address.Text = beneficiar.Adresa;
                    update_phone.Text = beneficiar.Telefon;
                    update_mediul.Text = beneficiar.Mediul;
                    update_codLocalitate.Text = beneficiar.CodLocalitate;
                    update_email.Text = beneficiar.Email;
                }

                var documente = context.DocumenteIdentitates
                    .FirstOrDefault(b => b.BeneficiarId == beneficiarID);

                if (documente != null)
                {
                    update_document.Text = documente.NumarDocument;
                }

                var conturi = context.ConturiBancares
                    .FirstOrDefault(b => b.BeneficiarId == beneficiarID);

                if (conturi != null)
                {
                    update_cardNumber.Text = conturi.NumarCont;
                }

                var istoric = context.IstoricTranzactiis
                    .FirstOrDefault(b => b.BeneficiarId == beneficiarID);

                if (istoric != null)
                {
                    update_sum.Text = istoric.TipTranzactie;
                }
            }
        }

        private void UpdateFields(int beneficiarID)
        {
            using (var context = new BeneficiariContext())
            {
                var beneficiar = context.Beneficiaris
                    .FirstOrDefault(b => b.BenificiarId == beneficiarID);

                if (beneficiar != null)
                {
                    beneficiar.Nume = update_name.Text;
                    beneficiar.Prenume = update_surname.Text;
                    beneficiar.Adresa = update_address.Text;
                    beneficiar.Telefon = update_phone.Text;
                    beneficiar.Mediul = update_mediul.Text;
                    beneficiar.CodLocalitate = update_codLocalitate.Text;
                    beneficiar.Email = update_email.Text;
                }

                var documente = context.DocumenteIdentitates
                    .FirstOrDefault(d => d.BeneficiarId == beneficiarID);

                if (documente != null)
                {
                    documente.NumarDocument = update_document.Text;
                }

                var conturi = context.ConturiBancares
                    .FirstOrDefault(c => c.BeneficiarId == beneficiarID);

                if (conturi != null)
                {
                    conturi.NumarCont = update_cardNumber.Text;
                }

                var istoric = context.IstoricTranzactiis
                    .FirstOrDefault(i => i.BeneficiarId == beneficiarID);

                if (istoric != null)
                {
                    istoric.TipTranzactie = update_sum.Text;
                }

                context.SaveChanges();
            }
        }

        private void AddField()
        {
            using (var context = new BeneficiariContext())
            {
                var beneficiar = new Beneficiari
                {
                    Nume = add_name.Text,
                    Prenume = add_surname.Text,
                    Adresa = add_address.Text,
                    Telefon = add_phone.Text,
                    Mediul = add_mediul.Text,
                    CodLocalitate = add_codLocalitate.Text,
                    Email = add_email.Text
                };

                context.Beneficiaris.Add(beneficiar);
                context.SaveChanges();
            }

            using (var context = new BeneficiariContext())
            {
                var documente = new DocumenteIdentitate
                {
                    NumarDocument = add_document.Text
                };

                context.DocumenteIdentitates.Add(documente);
                context.SaveChanges();
            }

            using (var context = new BeneficiariContext())
            {
                var conturi = new ConturiBancare
                {
                    NumarCont = add_cardNumber.Text
                };

                context.ConturiBancares.Add(conturi);
                context.SaveChanges();
            }

            using (var context = new BeneficiariContext())
            {
                var istoric = new IstoricTranzactii
                {
                    Suma = double.Parse(add_sum.Text),
                    DataTranzactie = DateTime.Now
                };

                context.IstoricTranzactiis.Add(istoric);

                context.SaveChanges();
            }
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            int beneficiarID = ExtractID(sender, e);

            using (var context = new BeneficiariContext())
            {
                var beneficiar = context.Beneficiaris
                    .SingleOrDefault(b => b.BenificiarId == beneficiarID);
                context.Beneficiaris.Remove(beneficiar);
                context.SaveChanges();
            }
            System.Windows.MessageBox.Show("Data was deleted");
            LoadData();
        }

        private void EditButton_click(object sender, RoutedEventArgs e)
        {
            updateBeneficiary.IsOpen = true;
            ID = ExtractID(sender, e);
            LoadFields(ID);
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            addBeneficiary.IsOpen = true;
        }

        private void add_CloseButton_Click(object sender, RoutedEventArgs e)
        {
            addBeneficiary.IsOpen = false;
        }
        private void add_EnterButton_Click(object sender, RoutedEventArgs e)
        {
            add_CloseButton_Click(sender, e);

            AddField();

            LoadData();
            System.Windows.MessageBox.Show("The data was added");
        }

        private void update_CloseButton_Click(object sender, RoutedEventArgs e)
        {
            updateBeneficiary.IsOpen = false;
        }
        private void update_EnterButton_Click(object sender, RoutedEventArgs e)
        {
            update_CloseButton_Click(sender, e);
            UpdateFields(ID);
            LoadData();
        }

        private void txtSearch_TextChanged(object sender, RoutedEventArgs e)
        {
            LoadData(txtSearch.Text, "");
        }

        private void CheckAllCheckBoxes(bool isChecked, DependencyObject depObj)
        {
            if (depObj != null)
            {
                for (int i = 0; i < VisualTreeHelper.GetChildrenCount(depObj); i++)
                {
                    DependencyObject child = VisualTreeHelper.GetChild(depObj, i);
                    if (child != null && child is System.Windows.Controls.CheckBox checkBox)
                    {
                        checkBox.IsChecked = isChecked;
                    }

                    CheckAllCheckBoxes(isChecked, child);
                }
            }
        }

        private void CheckAllCheckBoxes(object sender, RoutedEventArgs e)
        {
            CheckAllCheckBoxes(true, this);
        }
        private void UncheckAllCheckBoxes(object sender, RoutedEventArgs e)
        {
            CheckAllCheckBoxes(false, this);
        }

        public void HideDataGrid()
        {
            dataGrid.Visibility = Visibility.Hidden;
        }
        public void ShowDataGrid()
        {
            dataGrid.Visibility = Visibility.Visible;
        }

        public void ExportData(object sender, RoutedEventArgs e)
        {
            System.Windows.Forms.SaveFileDialog sfd = new System.Windows.Forms.SaveFileDialog()
            {
                Filter = "Excel Workbook|*.xlsx"
            };

            if (sfd.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                try
                {
                    using (var context = new BeneficiariContext())
                    {
                        var beneficiariWithConturi = from beneficiar in context.Beneficiaris
                                                     join cont in context.ConturiBancares
                                                         on beneficiar.BenificiarId equals cont.BeneficiarId into contGroup
                                                     from cont in contGroup.DefaultIfEmpty()
                                                     join documente in context.DocumenteIdentitates
                                                         on beneficiar.BenificiarId equals documente.BeneficiarId into docGroup
                                                     from documente in docGroup.DefaultIfEmpty()
                                                     join istoric in context.IstoricTranzactiis
                                                         on beneficiar.BenificiarId equals istoric.BeneficiarId into istoricGroup
                                                     from istoric in istoricGroup.DefaultIfEmpty()
                                                     select new
                                                     {
                                                         beneficiar.BenificiarId,
                                                         beneficiar.Nume,
                                                         beneficiar.Prenume,
                                                         beneficiar.Adresa,
                                                         TipDocument = documente != null ? documente.TipDocument : "none",
                                                         beneficiar.Telefon,
                                                         beneficiar.Mediul,
                                                         beneficiar.CodLocalitate,
                                                         beneficiar.Email,
                                                         NumarCont = cont != null ? cont.NumarCont : "none",
                                                         Suma = istoric != null ? istoric.Suma : 0
                                                     };

                        using (XLWorkbook workbook = new XLWorkbook())
                        {
                            var worksheet = workbook.Worksheets.Add("Sheet1");

                            int row = 1;
                            foreach (var item in beneficiariWithConturi)
                            {
                                worksheet.Cell(row, 1).Value = item.BenificiarId;
                                worksheet.Cell(row, 2).Value = item.Nume;
                                worksheet.Cell(row, 3).Value = item.Prenume;
                                worksheet.Cell(row, 4).Value = item.Adresa;
                                worksheet.Cell(row, 5).Value = item.TipDocument;
                                worksheet.Cell(row, 6).Value = item.Telefon;
                                worksheet.Cell(row, 7).Value = item.Mediul;
                                worksheet.Cell(row, 8).Value = item.CodLocalitate;
                                worksheet.Cell(row, 9).Value = item.Email;
                                worksheet.Cell(row, 10).Value = item.NumarCont;
                                worksheet.Cell(row, 11).Value = item.Suma;

                                row++;
                            }

                            workbook.SaveAs(sfd.FileName);
                        }
                    }
                    System.Windows.MessageBox.Show("You have exported your data to an Excel file", "Message", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch (Exception ex)
                {
                    System.Windows.MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }


    }

}
