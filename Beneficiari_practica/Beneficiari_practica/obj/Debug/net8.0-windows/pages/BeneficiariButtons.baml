   M S B A M L   `   `   `  ����O  KBeneficiari_practica, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:Beneficiari_practica.PagesBeneficiari_practica.Pages  5      3    -Beneficiari_practica.Pages.BeneficiariButtons   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      c _MahApps.Metro.IconPacks.Core, Version=4.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=4.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5      6local(clr-namespace:Beneficiari_practica.Pages   5        N� Title$  BeneficiariButtons��5
       � 	Resources 5         	BoolToVis��%   &	        �� 5   
   6'   5      .��5      � .+�5   
   ��  �� Orientation$ 
Horizontal=�6   $��50��6.   $	��Top=�6:   $
��0 15q�6R   .+�5      �� $��Beneficiari��6   $��Center=�6+   $��30 0 0 0q�6F     textblock_beneficiari#��[ 6X   �� 5      -   5        $��Add new Beneficiari��5      $��Center=�63   $��	890 0 0 0q�6O     button_beneficiari#��[ 6c   6�   �� 5      -   5        $��Export Data��5      $��Center=�6+   $��20 0 0 0q�6G   #��[ 6Z   6�   5      �� 5   
   $ 
Horizontal=�6   $	��Top=�6.   $��20 60q�6F   .+�5      �� $��20��6   $��10 0 0 0q�6!     border_underline#��[ 63   ._�5      �� $��Beneficiari��6   $��Center=�6/     textblock_changer#��[ 6J   5      �� 5      $��20��6   $��10 0 0 0q�6!   #��[ 63   ._�5      �� $��Numere��6   $��Center=�6*   #��[ 6E   5      �� 5      $��20��6   $��10 0 0 0q�6!   #��[ 63   ._�5       �� $��	Email-uri��6   $��Center=�6-   #��[ 6H   5!      5"      �� 5$   
   $ 
Horizontal=�6   $��30��6/   $
��0 90q�6;   $	��Top=�6I   .+�5%      �� $��31 Beneficiari��6   $
��20 0q�6.   $��Center=�6<   �� 5&      $ 
Horizontal=�6   $��	940 0 0 0q�62   $��Center=�6E   .+�5'      �� $��	Filter by��6   � 5(      $	��180��6   $
��Left=�6#   .+�5)      �� $
��20 0q�6    $��Center=�6.   ���#b0b9c6 J� IsHitTestVisible$ False��6^    K� ZIndex$ 1��6w   $��Search here ...��6�   y�6�   ��  �� ElementName$ 	txtSearch�� �� Path$ Text.IsEmpty� �� 	Converter# [  �� 5*      -   5         ��Name$ 	txtSearch��5*        textboxSearch#��[ 61   6X   .  (MahApps.Metro.IconPacks.PackIconMaterial  5+      	   Kind$	 Magnify=�6,   $��15��6;   $��15��6F   $��Center=�6R   $��0 0 15 0q�6m   ���#b0b9c6$��Right=�6�   5,      5-      5.      &   System.Windows.Controls.DataGrid  50   
   -   5        
  Name$
 dataGrid��50   �     DataGridStyle1#���  6     DataGridCellStyle1   	CellStyle# �  6<     DataGridColumnHeaderStyle1   ColumnHeaderStyle# �  6m    	 DataGridRowStyle1   RowStyle# � 	 6�   $��
0,130,0,15q�6�      Columns 51      4  .System.Windows.Controls.DataGridCheckBoxColumn  52      ,  &System.Windows.Controls.DataGridColumn   CanUserResize$
 True��6)      Width5  /System.Windows.Controls.DataGridLengthConverter$
 auto 6>    
 CheckBoxStyle11  +System.Windows.Controls.DataGridBoundColumn   ElementStyle# [
 6K   -   5        Checkbox_Column��   HeaderTemplate 53      �� 54      .R�55      �� -   5        #��[
 55   '   6�   56      58      0  *System.Windows.Controls.DataGridTextColumn  5:         Header$ BeneficiarID��6%      
IsReadOnly$
 True��6;   $ False��6M   $
 auto 6c      Binding 6p   �� *BenificiarId+  5;      $
 Name��6%   $
 True��63   $
 auto 6E    6R   �� *Nume+  5<      $ Surname��6%   $
 True��66   $
 auto 6H    6U   �� *	Prenume+  5=      $ Adress��6%   $
 True��65   $
 auto 6G    6T   �� *Adresa+  5>      $ Document ID��6%   $
 True��6:   $
 auto 6L    6Y   �� *TipDocument+  5?      $ Phone��6%   $
 True��64   $
 auto 6F    6S   �� *	Telefon+  5@      $ Location��6%   $
 True��67   $
 auto 6I    6V   �� *Mediul+  5A      $ Location Code��6%   $
 True��6<   $
 auto 6N    6[   �� *CodLocalitate+  5B      $ Card Number��6%   $
 True��6:   $
 auto 6L    6Y   �� *	NumarCont+  5C      $	 Sum��6%   $
 True��62   $
 auto 6D    6Q   �� *Suma+4  .System.Windows.Controls.DataGridTemplateColumn  5E      $ 
Operations��6)   $
 True��6=   $ * 6O      CellTemplate 5F      �� 5G      .R�5H      �� $ 
Horizontal=�6)   .+�5I   "   �� -   5          gridEditButton#��[ 5I   )   .��5J   &     $	 PencilOutline=�6<     pagingButtonIcon#��[ 6Q   5K   #   �� 5L   "   -   5          gridRemoveButton#��[ 5L   )   $��5 0 0 0q�6S   .��5M   &     $	 DeleteOutline=�6<   #��[ 6Q   5N   #   5O      5P      5R      5T      � 5V   
   -	   5         �Name$ addBeneficiary��5V   #   $��Center=�6     popup_width#��[ 6;   .��5W      ��   popup_border#��[ 6   ._�5X      �� .+�5Y      �� $ 
Horizontal=�6!   .+�5Z      �� $
��Nume��6      popup_label_width#��[ 6/   �� 5[      -
   5        $ add_name��5[   "     popup_textbox#��[ 64   5\      �� 5]      $ 
Horizontal=�6!   .+�5^      �� $��Prenume��6    #��[ 62   �� 5_      -   5        $ add_surname��5_   "   #��[ 67   5`      �� 5a      $ 
Horizontal=�6!   .+�5b      �� $��Adresa��6    #��[ 61   �� 5c      -   5        $ add_address��5c   "   #��[ 67   5d      �� 5e      $ 
Horizontal=�6!   .+�5f      �� $��Document��6    #��[ 63   �� 5g      -   5        $ add_document��5g   "   #��[ 68   5h      �� 5i      $ 
Horizontal=�6!   .+�5j      �� $��Telefon��6    #��[ 62   �� 5k      -   5        $ 	add_phone��5k   "   #��[ 65   5l      �� 5m      $ 
Horizontal=�6!   .+�5n      �� $��Mediul��6    #��[ 61   �� 5o      -   5        $ 
add_mediul��5o   "   #��[ 66   5p      �� 5q      $ 
Horizontal=�6!   .+�5r      �� $��Cod Localitate��6    #��[ 69   �� 5s      -   5        $ add_codLocalitate��5s   "   #��[ 6=   5t      �� 5u      $ 
Horizontal=�6!   .+�5v      �� $��Card Number��6    #��[ 66   �� 5w      -   5        $ add_cardNumber��5w   "   #��[ 6:   5x      �� 5y      $ 
Horizontal=�6!   .+�5z      �� $
��Suma��6    #��[ 6/   �� 5{      -   5        $ add_sum��5{   "   #��[ 63   5|      �� 5}      $ 
Horizontal=�6!   .+�5~      �� $��Email��6    #��[ 60   �� 5      -   5        $ 	add_email��5   "   #��[ 65   5�      �� 5�      $ 
Horizontal=�6!   $��Center=�6:   .+�5�      �� -   5        $��Enter��5�   !   $��10q�6P   $��50��6\   �� 5�      -   5        $��Close��5�   !   $��10q�6O   $��50��6[   5�      5�      5�      5�      � 5�   
   -   5        $ updateBeneficiary��5�   #   $��Center=�6   #��[ 6>   .��5�      �� #��[ 6   ._�5�      �� .+�5�      �� $ 
Horizontal=�6!   .+�5�      �� $
��Nume��6    #��[ 6/   �� 5�      -   5        $ update_name��5�   "   #��[ 67   5�      �� 5�      $ 
Horizontal=�6!   .+�5�      �� $��Prenume��6    #��[ 62   �� 5�      -   5        $ update_surname��5�   "   #��[ 6:   5�      �� 5�      $ 
Horizontal=�6!   .+�5�      �� $��Adresa��6    #��[ 61   �� 5�      -   5        $ update_address��5�   "   #��[ 6:   5�      �� 5�      $ 
Horizontal=�6!   .+�5�      �� $��Document��6    #��[ 63   �� 5�      -   5        $ update_document��5�   "   #��[ 6;   5�      �� 5�      $ 
Horizontal=�6!   .+�5�      �� $��Telefon��6    #��[ 62   �� 5�      -   5        $ update_phone��5�   "   #��[ 68   5�      �� 5�      $ 
Horizontal=�6!   .+�5�      �� $��Mediul��6    #��[ 61   �� 5�      -   5        $ update_mediul��5�   "   #��[ 69   5�      �� 5�      $ 
Horizontal=�6!   .+�5�      �� $��Cod Localitate��6    #��[ 69   �� 5�      -   5        $ update_codLocalitate��5�   "   #��[ 6@   5�      �� 5�      $ 
Horizontal=�6!   .+�5�      �� $��Card Number��6    #��[ 66   �� 5�      -   5        $ update_cardNumber��5�   "   #��[ 6=   5�      �� 5�      $ 
Horizontal=�6!   .+�5�      �� $
��Suma��6    #��[ 6/   �� 5�      -   5        $ 
update_sum��5�   "   #��[ 66   5�      �� 5�      $ 
Horizontal=�6!   .+�5�      �� $��Email��6    #��[ 60   �� 5�      -    5        $ update_email��5�   "   #��[ 68   5�      �� 5�      $ 
Horizontal=�6!   $��Center=�6:   .+�5�      �� -!   5        $��Enter��5�   !   $��10q�6S   $��50��6_   �� 5�      -"   5        $��Close��5�   !   $��10q�6R   $��50��6^   5�      5�      5�      5�      5�      5�      