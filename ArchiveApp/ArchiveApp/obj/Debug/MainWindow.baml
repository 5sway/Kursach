   M S B A M L   `   `   `  ����E  AArchiveApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:ArchiveApp
ArchiveApp  5   	       ArchiveApp.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   *localclr-namespace:ArchiveApp     5   	     � Icon$   /Resources/ArchiveIcon.png��5   	    � Title$ Archive��6+    � 
ResizeMode$ CanResizeWithGrip=�5	   	    � WindowStyle$ SingleBorderWindow=�6(    � ShowInTaskbar . 
�������$	��450��5   	   $	��800��6   $	��700��6(   $
��1400��68   .��5      �  � ColumnDefinitions 5   
   �� 5      $	��160 �6   �� 5       � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      $��* �6   �� 5      $��0* �6   .+�5   
   � ���#bae3e8$��0��6$   $��2��61   6G   � 5   
   -   5        $��MenuGrid��5      ���#bae3e8$��Stretch=�64   $��Stretch=�6P   $��1��5       K� ZIndex$ -1��6   60   �� 5   
   -   5        $��Title��5      $��16(�6!   $��АИС "ИС Архив"��6/   $
��Left=�6E   $��Center=�5      $��30,0,0,0q�5      $��1��6&   68   �� 5   
   -   5        $��MainBtn��5      ���#bae3e8$��1��65   $��50��6B   $	��Top=�6N   $��Stretch=�5      $��0q�5      $��Главное��6%   $
��Left=�5      $��20,0,0,0q�63   $��14(�6F   6T   �� 5    
   -   5        $��DocBtn��5       ���#bae3e8$��1��64   $��50��6A   $	��Top=�6M   $��0,50,0,0q�5!      $��Stretch=�6#   $��0q�6A   $��Документы��5"      $
��Left=�6%   $��20,0,0,0q�6G   $��14(�6Z   6h   �� 5#   
   -   5        $��ReqBtn��5#      ���#bae3e8$��1��64   $��50��6A   $	��Top=�6M   $��	0,150,0,0q�5$      $��Stretch=�6$   $��0q�6C   $��Запросы��5%      $
��Left=�6#   $��20,0,0,0q�6E   $��14(�6X   6f   �� 5&   
   -   5        $��CardBtn��5&      ���#bae3e8$��1��65   $��50��6B   $	��Top=�6N   $��	0,100,0,0q�5'      $��Stretch=�6$   $��0q�6B   $��Карточки��5(      $
��Left=�6$   $��20,0,0,0q�6F   $��14(�6Y   6g   �� 5)   
   -   5        $��ExitBtn��5)      ���#bae3e8$��1��65   $��50��6B   $��Bottom=�6N   $��0,0,0,0q�5*      $��Stretch=�6"   $��0q�6@   $��
Выйти��5+      $
��Left=�6!   $��20,0,0,0q�6C   $��14(�6V   6d    � 5,   
   -   5        $��	MainFrame��5,   M     � NavigationUIVisibility$ Hidden=�6   $��1��60   $��1��6=   6M   �� 5-   
   -	   5        $��	SearchBtn��5-      $��1��6"   $��25��62   $��25��6=   $��Center=�6I   $��Right=�5.      $��	0,0,100,0q�6-   $ 1��6@   
�������.��50      �� $��/Resources/SearchIcon.png��6   69   51      �� 52   
   -
   5        $��NotBtn��52      
������ $��0q�68   $��1��6L   $��Center=�53      $��Right=�6,   $��25��6H   $��25��54      $��0,0,60,0q�6   .��55      �� $��/Resources/NotIcon.png��6   66   56      �� 57   
   -   5        $��
RefreshBtn��57      
������ $��0q�6<   $��1��6P   $��Center=�58      $��Right=�6,   $��25��6H   $��25��59      $��0,0,20,0q�6   .��5:      �� $��/Resources/UpdateIcon.png��6   6:   5;      �� 5<   
   $ ��/Resources/ArchiveIcon.png��6   $��Center=�64   $
��Left=�6O   $��30��6j   $��30��5=      $��15,0,0,0q�6   6/   �� 5>   
   -   5        $��	BurgerBtn��5>      
������ $��0q�6;   $��Center=�6O   $��Right=�5?      $��30��5@      $��30��6   $��0,0,30,0q�6(   .��5A      �� $��/Resources/BurgerIcon.png��6   69   5B      �� 5C   
   -   5        $��	SearchBox��5C      $��1��6#   $��25��63   $	��250��6?   $��Center=�6K   $��Center=�5D      $��Right=�5E      $
��Left=�6.   $��	0,0,100,0q�6P   $��5,0,0,0q�5F      5G   Y   �� 5H   
   -   5        $��
SearchText��5H      $��
Поиск��6&   $��1��63   $��Center=�6C   $��Right=�5I      	 �� TextAlignment$
	 Left=�60   $��14(�6E   $��	0,0,303,0q�5J      6)   5K      5L      