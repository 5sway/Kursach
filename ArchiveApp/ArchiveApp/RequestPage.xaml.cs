﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
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
using System.Data.Entity;

namespace ArchiveApp
{
    public partial class RequestPage : Page
    {
        private bool isAddingNewRow = false;        // Флаг добавления новой строки
        private Request newRequest;                 // Новый запрос для добавления
        private int currentUserId = UserData.CurrentUserId; // ID текущего пользователя
        public ObservableCollection<Request> Requests { get; set; } // Коллекция запросов
        public List<KeyValuePair<bool?, string>> StatusList { get; set; } // Список статусов
        public List<Document> Documents { get; set; } // Список документов
        public List<User> Users { get; set; }       // Список пользователей

        public RequestPage()
        {
            InitializeComponent();                  // Инициализация компонентов страницы
            DataContext = this;                     // Установка контекста данных
            Requests = new ObservableCollection<Request>(); // Инициализация коллекции запросов
            LoadStatusList();                      // Загрузка списка статусов
            LoadDocuments();                       // Загрузка списка документов
            LoadUsers();                           // Загрузка списка пользователей
            LoadData();                            // Загрузка данных запросов
        }

        private void LoadStatusList()
        {
            StatusList = new List<KeyValuePair<bool?, string>> // Создание списка статусов
            {
                new KeyValuePair<bool?, string>(true, "Принято"), // Статус "Принято"
                new KeyValuePair<bool?, string>(false, "Отклонено") // Статус "Отклонено"
            };
        }

        private void LoadDocuments()
        {
            using (var context = new ArchiveBaseEntities()) // Подключение к базе данных
            {
                Documents = context.Document.ToList(); // Загрузка всех документов
            }
        }

        private void LoadUsers()
        {
            using (var context = new ArchiveBaseEntities()) // Подключение к базе данных
            {
                Users = context.User.ToList();      // Загрузка всех пользователей
            }
        }

        private void LoadData()
        {
            using (var context = new ArchiveBaseEntities()) // Подключение к базе данных
            {
                var requests = context.Request      // Загрузка запросов с связанными данными
                    .Include(r => r.User)           // Включение данных пользователей
                    .Include(r => r.Document)       // Включение данных документов
                    .ToList();

                Requests.Clear();                   // Очистка текущей коллекции
                foreach (var req in requests)       // Заполнение коллекции
                    Requests.Add(req);
            }
            DataGridTable.ItemsSource = Requests;   // Установка источника данных для DataGrid
            DataGridTable.IsReadOnly = true;        // Установка режима "только чтение"
        }

        private void DelBtn_Click(object sender, RoutedEventArgs e)
        {
            var selectedRequests = DataGridTable.SelectedItems.Cast<Request>().ToList(); // Получение выбранных запросов
            if (selectedRequests.Count == 0)        // Проверка наличия выбранных элементов
            {
                MessageBox.Show("Выберите хотя бы один элемент для удаления!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (MessageBox.Show($"Вы точно хотите удалить {selectedRequests.Count} элементов?", // Подтверждение удаления
                "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    using (var context = new ArchiveBaseEntities()) // Подключение к базе данных
                    {
                        foreach (var req in selectedRequests) // Удаление каждого запроса
                        {
                            var reqToRemove = context.Request.Find(req.Id); // Поиск запроса в базе
                            if (reqToRemove != null)
                                context.Request.Remove(reqToRemove); // Удаление запроса
                        }
                        context.SaveChanges();          // Сохранение изменений
                    }
                    MessageBox.Show("Данные удалены!"); // Уведомление об успешном удалении
                    LoadData();                        // Перезагрузка данных
                }
                catch (Exception ex)                    // Обработка ошибок
                {
                    MessageBox.Show($"Ошибка при удалении: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void EditBtn_Click(object sender, RoutedEventArgs e)
        {
            if (DataGridTable.IsReadOnly)           // Переключение в режим редактирования
            {
                DataGridTable.IsReadOnly = false;   // Разрешение редактирования
                EditBtn.Content = "Сохранить";      // Изменение текста кнопки
            }
            else                                    // Сохранение изменений
            {
                DataGridTable.IsReadOnly = true;    // Блокировка редактирования
                EditBtn.Content = "Изменить";       // Восстановление текста кнопки
                SaveChanges();                     // Сохранение изменений
            }
        }

        private void SaveChanges()
        {
            try
            {
                using (var context = new ArchiveBaseEntities()) // Подключение к базе данных
                {
                    if (isAddingNewRow && newRequest != null) // Добавление нового запроса
                    {
                        if (string.IsNullOrWhiteSpace(newRequest.Reason) || newRequest.Document_Id == 0) // Проверка обязательных полей
                        {
                            RemoveEmptyRow();       // Удаление пустой строки при ошибке
                            return;
                        }
                        var requestToAdd = new Request // Создание нового запроса
                        {
                            Request_Date = newRequest.Request_Date,
                            Reason = newRequest.Reason,
                            Status = newRequest.Status,
                            User_Id = newRequest.User_Id,
                            Document_Id = newRequest.Document_Id
                        };
                        context.Request.Add(requestToAdd); // Добавление запроса в базу
                        context.SaveChanges();      // Сохранение изменений
                    }

                    foreach (var req in Requests.Where(r => r.Id != 0)) // Обновление существующих запросов
                    {
                        var reqToUpdate = context.Request.Find(req.Id); // Поиск запроса в базе
                        if (reqToUpdate != null)    // Обновление полей
                        {
                            reqToUpdate.Request_Date = req.Request_Date;
                            reqToUpdate.Reason = req.Reason;
                            reqToUpdate.Status = req.Status;
                            reqToUpdate.Document_Id = req.Document_Id;
                        }
                    }
                    context.SaveChanges();          // Сохранение всех изменений
                }
                isAddingNewRow = false;             // Сброс флага добавления
                newRequest = null;                  // Очистка нового запроса
                LoadData();                        // Перезагрузка данных
            }
            catch (Exception ex)                    // Обработка ошибок
            {
                MessageBox.Show($"Ошибка при сохранении: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void RemoveEmptyRow()
        {
            if (newRequest != null && Requests.Contains(newRequest)) // Удаление пустой строки
                Requests.Remove(newRequest);
            isAddingNewRow = false;                 // Сброс флага добавления
            newRequest = null;                      // Очистка нового запроса
            DataGridTable.IsReadOnly = true;        // Установка режима "только чтение"
            EditBtn.Content = "Изменить";           // Восстановление текста кнопки
        }

        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            if (isAddingNewRow) return;             // Защита от повторного добавления

            isAddingNewRow = true;                  // Установка флага добавления
            var currentUser = Users.FirstOrDefault(u => u.Id == currentUserId); // Поиск текущего пользователя
            newRequest = new Request                // Создание нового запроса
            {
                Id = 0,                            // ID=0 для новой записи
                Request_Date = DateTime.Now,       // Текущая дата
                Reason = "",                       // Пустое основание
                Status = null,                     // Статус не установлен
                User_Id = currentUserId,           // ID текущего пользователя
                Document_Id = 0,                   // Документ не выбран
                Document = null,                   // Связанный документ не установлен
                User = currentUser                 // Данные текущего пользователя
            };

            Requests.Add(newRequest);               // Добавление в коллекцию
            DataGridTable.SelectedItem = newRequest; // Установка фокуса на новую строку
            DataGridTable.ScrollIntoView(newRequest); // Прокрутка к новой строке
            DataGridTable.IsReadOnly = false;       // Разрешение редактирования
            EditBtn.Content = "Сохранить";          // Изменение текста кнопки
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)   // Обновление данных при отображении страницы
                LoadData();
        }
    }
}