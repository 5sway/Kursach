   M S B A M L   `   `   `  ����E  AArchiveApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:ArchiveApp
ArchiveApp  5          ArchiveApp.UserPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      *localclr-namespace:ArchiveApp     5      -   5          N� Title$  UserPage��5	      .��5      � 
������� � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��50 �6   �� 5      $
��Auto �6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ DataGridTable��5         AutoGenerateColumns .     HeadersVisibility$ Column=�5         CanUserAddRows .     CanUserResizeColumns .    CanUserResizeRows .     CanUserSortColumns . 	   GridLinesVisibility$		 All=�5      $��1q�5      $��5,5,5,0q�5      
   
IsReadOnly
 .    Columns 5      4  .System.Windows.Controls.DataGridTemplateColumn  5       ,  &System.Windows.Controls.DataGridColumn   Header$ Роль��6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 67      SortMemberPath$ 	Role.Name��6A      CellTemplate 5!      �� 5"      .R�5#      �� ��6(   �� *	Role.Name+5$         CellEditingTemplate 5&      �� 5'      .R�5(      ��  �� DisplayMemberPath$
 Name��5)   '    �� SelectedValuePath$ Id��5*   '   ��5(   '   ��  �� Path$ DataContext.Roles� �� RelativeSource ��  �� AncestorType$
 PageL� �� SelectedValue 5+   '   �� *	Role_Id+ �� UpdateSourceTrigger$ PropertyChanged=�5,      5.      0  *System.Windows.Controls.DataGridTextColumn  50      $ 
Логин��6%   $ * 6N   1  +System.Windows.Controls.DataGridBoundColumn   Binding 64   �� *Login+6N     51      $ Пароль��6%   $ * 6R    65   �� *
Password+6R     52      $ Имя��6%   $ * 6K    62   �� *Name+6K     53      $ Фамилия��6%   $ * 6T    66   �� *	Last_Name+6T     54      $ Отчество��6%   $ * 6V    67   �� *
First_Name+6V     55      $! Номер телефона��6%   $ * 6^    6=   �� *Phone_Number+6^     56      $ Эл.Почта��6%   $ * 6Q    67   �� *Email+6Q   58      �� 5:   
   -   5        $��AddBtn��5:      $��Добавить��6   ���#bae3e8$��Center=�5;      $
��Left=�6,   $��5,0,0,0q�5<      $	��120��6"   $��40��6.   $��1��6:   6G   �� 5=   
   -   5        $��DelBtn��5=      $��Удалить��6   ���#bae3e8$��Center=�5>      $
��Left=�6,   $��	130,0,0,0q�5?      $	��120��6$   $��40��60   $��1��6<   6I   �� 5@   
   -   5        $��EditBtn��5@      $��Изменить��6    ���#bae3e8$��Center=�5A      $��Right=�6,   $��0,0,5,0q�5B      $	��120��6"   $��40��6.   $��1��6:   6G   5C      5D      