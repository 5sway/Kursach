   M S B A M L   `   `   `  ���� E  AArchiveApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:ArchiveApp
ArchiveApp      ArchiveApp.MainWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     *localclr-namespace:ArchiveApp       � Icon$   /Resources/ArchiveIcon.png�� � Title$ Archive�� � 
ResizeMode$ CanResizeWithGrip=� � WindowStyle$ SingleBorderWindow=� � ShowInTaskbar . 
�������$	��500��$
��1200��$	��600��$
��1400�� � 	Resources    RotateAnimation �� TargetProperty W� From	 W� To	 g� Duration  ReloadAnimation
 g� 	BeginTime��%  &	        &	 g     �� .��W� $9 3(UIElement.RenderTransform).(RotateTransform.Angle)�$ 0X�$	 360X�$	 0:0:0.5D��� .��W� $ Opacity�$ 1X�$ 0X�$	 0:0:0.3D�$
 0:0:0.1X�W� $ Opacity�$ 0X�$ 1X�$	 0:0:0.3D�$
 0:0:0.2X�.��� -    �Name$ MainGrid�� � ColumnDefinitions �� $	��160 ���  � RowDefinitions �� $��40 ��� $��* ��� $��0* �.+�� ���#bae3e8$��0��$��2��� -   $��MenuGrid�����#bae3e8$��Stretch=�$��Stretch=�$��1�� K� ZIndex$ -1��|�.   � FocusVisualStyle Z� �� -   $��TitleTxt��$��16(�$��АИС "ИС Архив"��$
��Left=�$��Center=�$��30,0,0,0q�$��1���� -   $��RepBtn��$��1��$��25��$��25��$��Center=�$��Right=�$��0q�$��0,0,60,0q�$ 1��
������ .���� $��/Resources/RepIcon.png���� -   $��MainBtn��
������ $��1��$��50��$	��Top=�$��Stretch=�$��0q�$��Главное��$
��Left=�$��20,0,0,0q�$��14(��� -   $��DocBtn��
������ $��1��$��50��$	��Top=�$��0,50,0,0q�$��Stretch=�$��0q�$��Документы��$
��Left=�$��20,0,0,0q�$��14(��� -   $��ReqBtn��
������ $��1��$��50��$	��Top=�$��	0,150,0,0q�$��Stretch=�$��0q�$��Запросы��$
��Left=�$��20,0,0,0q�$��14(��� -   $��CardBtn��
������ $��1��$��50��$	��Top=�$��	0,100,0,0q�$��Stretch=�$��0q�$��Карточки��$
��Left=�$��20,0,0,0q�$��14(��� -	   $��ExitBtn��
������ $��1��$��50��$��Bottom=�$��0,0,0,0q�$��Stretch=�$��0q�$��
Выйти��$
��Left=�$��20,0,0,0q�$��14(� � -
   $��	MainFrame��  � NavigationUIVisibility$ Hidden=�$��1��$��1���� -   $��	SearchBtn��$��1��$��25��$��25��$��Center=�$��Right=�$��	0,0,140,0q�$ 1��
�������.���� $��/Resources/SearchIcon.png���� -   $��NotBtn��
������ $��0q�$��1��$��Center=�$��Right=�$��25��$��25��$��	0,0,100,0q�.���� $��/Resources/NotIcon.png���� -   $��
RefreshBtn��
������ $��0q�$��1��$��Center=�$��Right=�$��25��$��25��$��0,0,20,0q�z���  �� CenterX$
 12.5Q� �� CenterY$
 12.5Q�.���� $��/Resources/UpdateIcon.png���� $ ��/Resources/ArchiveIcon.png��$��Center=�$
��Left=�$��30��$��30��$��15,0,0,0q��� -   $��	BurgerBtn��
������ $��0q�$��Center=�$��Right=�$��30��$��30��$��0,0,30,0q�.���� $��/Resources/BurgerIcon.png���� -   $��	SearchBox��$��1��$��25��$	��250��$��Center=�$��Center=�$��Right=�$
��Left=�$��	0,0,140,0q�$��5,0,0,0q��� -   $��
SearchText��$��
Поиск��$��1��$��Center=�$��Right=� �� TextAlignment$
 Left=�$��14(�$��	0,0,133,0q� J� IsHitTestVisible . $	��255��$��30�� �� Padding$ 	5,5.5,0,0q�