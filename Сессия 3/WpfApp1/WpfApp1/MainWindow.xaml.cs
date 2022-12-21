using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            OGridDad.ItemsSource = АбонентыEntities.GetContext().Разговоры.ToList();
        }

        private void OGridDad_SelectionChanged(object sender)
        {

        }

        private void OGridDad_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var РазговорыForRemoving = OGridDad.SelectedItems.Cast<Разговоры>().ToList();
            if (MessageBox.Show($"Вы точно хотите удалить следующие {РазговорыForRemoving.Count()} элементов?.", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    for (int i = 0; i < РазговорыForRemoving.Count; i++)
                    {
                        АбонентыEntities.GetContext().Разговоры.Remove(РазговорыForRemoving[i]);
                    }
                    АбонентыEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");
                    OGridDad.ItemsSource = АбонентыEntities.GetContext().Разговоры.ToList();

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }
    }
}
