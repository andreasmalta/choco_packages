==========================================================================================
Generic Universal Printer Driver PCL/PS/FAX
Printer Software Document
10/07/2022

PCL  Version 3.9.303.0
PS   Version 3.9.303.0
FAX  Version 3.9.303.0
Installer Version 3.2.22.0
PCL  Setup Package Version 3.9.303.0
PS   Setup Package Version 3.9.303.0
FAX  Setup Package Version 3.9.303.0

Copyright (C) 2003 KONICA MINOLTA, INC.

==========================================================================================
This document contains information about the software of this printer.
In addition, the problems that may happen when this printer is used 
and the solutions are mentioned.
Read through this document before you use this printer.

******************************************************************************************

Readme File Contents

******************************************************************************************
1. Software End User License Agreement
2. Introduction
3. System requirements
4. Changes to this printer driver from an earlier version
5. How to install/uninstall
6. File Composition
7. How to check the version in a printer driver
8. Attentions and Restrictions
9. Apache License
10. OpenSSL License
11. NetSNMP License

//////////////////////////////////////////////////////////////////////////////////////////
1. Software End User License Agreement
//////////////////////////////////////////////////////////////////////////////////////////
PLEASE READ CAREFULLY THE LICENSE AGREEMENT BELOW BEFORE OPENING THE 
PACKAGE OF THIS SOFTWARE ("SOFTWARE"), DOWNLOADING, INSTALLING OR 
USING THE SOFTWARE. OPENING THE PACKAGE, OR DOWNLOADING, INSTALLING 
OR USING THE SOFTWARE SHALL BE DEEMED YOUR LAWFUL ACCEPTANCE OF THE 
TERMS AND CONDITIONS BELOW. IF YOU DO NOT AGREE TO THEM, DO NOT 
DOWNLOAD, INSTALL, USE THE SOFTWARE, NOR OPEN THE PACKAGE.


1. COPYRIGHT AND INTELLECTUAL PROPERTY RIGHTS 
This is a license agreement and not an agreement for sale. KONICA MINOLTA, INC.
 ("KONICA MINOLTA") owns, or has been licensed from other owners ("KONICA MINOLTA Licensor"),
copyrights and other intellectual property rights of the Software,
and any and all rights and title to the Software and any copy made from it are retained
by KONICA MINOLTA or KONICA MINOLTA Licensor. In no event,
this Agreement shall be deemed to assign any copyright and/or any intellectual
property rights of the Software from KONICA MINOLTA or KONICA MINOLTA Licensor to you.
The Software is protected by copyright laws and international treaty provisions.

2. LICENSE 
KONICA MINOLTA hereby grants to you a non-exclusive and limited license, and you may:
(i) install and use the Software only on your computer(s) connected with a product for 
which this Software is designed;
(ii) allow users of the computers described above to use the Software, provided that 
you assure that all such users comply with the terms of this Agreement;
(iii) use the Software only for your own customary business or personal purpose;
(iv) make one copy of the Software only for backup purpose in the support of the 
normal and intended use of the Software;
(v) transfer the Software to other party by transferring a copy of this Agreement 
and all documentation along with the Software, provided that (a) you must, at the 
same time, either transfer to such other party or destroy all your other copies of 
the Software, (b) such transfer of possession terminates your license from KONICA 
MINOLTA, and (c) you must assure that such other party has agreed to accept the 
terms and conditions of this Agreement. If such other party does not accept such 
terms and conditions then you shall not transfer any copy of the Software.

3. RESTRICTIONS 
(1) You shall not without the written consent of KONICA MINOLTA:
(i)  use, copy, modify, merge or transfer copies of the Software except as provided herein;
(ii)  reverse engineer, reverse assemble, reverse compile or any other way analyze the Software;
(iii)  sublicense, rent, lease or distribute the Software or any copy thereof; or
(iv)  remove, use, or alter any trademark, logo, copyright or other proprietary notices, 
legends, symbols or labels in the Software.
(2) You agree that you will not export the Software in any form in violation of any 
applicable laws and regulations regarding export control of any country.

4. DISCLAIMER OF WARRANTIES
(1) If the Software is furnished on DVD or other tangible object that is used 
for storage of digital data (hereinafter collectively "Storage Medium"), KONICA MINOLTA 
warrants the Storage Medium to be free from the defects in material and workmanship 
under normal use, for a period of ninety (90) days from the date of delivery to you.
WITH THE EXCEPTION OF THE FOREGOING EXPRESS WARRANTIES APPLICABLE TO 
STORAGE MEDIUM ONLY, THE SOFTWARE IS PROVIDED TO YOU "AS IS" WITHOUT 
ANY WARRANTIES WHATSOEVER. KONICA MINOLTA, ITS AFFILIATE COMPANIES 
AND KONICA MINOLTA LICENSOR DISCLAIM ALL WARRANTIES WITH REGARD 
TO THE SOFTWARE, EXPRESS OR IMPLIED, INCLUDING, WITHOUT LIMITATION, 
IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
PURPOSE AND NON-INFRINGEMENT OF THIRD PARTY RIGHTS.
(2) IN NO EVENT WILL KONICA MINOLTA, ITS AFFILIATE COMPANIES NOR KONICA 
MINOLTA LICENSOR BE LIABLE FOR ANY LOST PROFITS, LOST DATA, OR ANY 
OTHER INDIRECT, SPECIAL, PUNITIVE, INCIDENTAL OR CONSEQUENTIAL DAMAGES 
THAT RESULT FROM USE OR INABILITY TO USE THE SOFTWARE INCLUDING WITHOUT 
LIMITATION, DAMAGES FOR LOSS OF GOODWILL, COMPUTER FAILURE OR 
MALFUNCTION OR ANY AND ALL OTHER COMMERCIAL OR OTHER DAMAGES OR 
LOSSES, EVEN IF KONICA MINOLTA, ITS AFFILIATE COMPANIES OR KONICA 
MINOLTA LICENSOR HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES 
OR FOR ANY CLAIM BY YOU BASED ON A THIRD PARTY CLAIM.
(3) The disclaimer of warranty hereunder does not affect your statutory rights.
In case of the disclaimer is not allowed by applicable law, the disclaimer shall 
only apply to you to the maximum extent permitted by the law.

5. TERMINATION
You may terminate this license at any time by destroying the Software and all your 
copies of it. This Agreement shall also terminate if you fail to comply with any 
terms hereof. Upon such termination, you must immediately destroy all copies of 
the Software in your possession.

6. GOVERNING LAW
This Agreement shall be governed by the laws of Japan.

7. SEVERABILITY
In the event that any part or parts of this agreement shall be held illegal or null 
and void by any court or administrative body of competent jurisdiction, such 
determination shall not effect the remaining parts of this agreement and they 
shall remain in full force and effect as if such part or parts determined illegal 
or void had not been included.

8. NOTICE TO US GOVERNMENT END USERS 
The Software is a "commercial item," as that term is defined at 48 C.F.R. 2.101 
(October 1995), consisting of "commercial computer software" and "commercial 
computer software documentation," as such terms are used in 48 C.F.R. 12.212 
(September 1995). Consistent with 48 C.F.R. 12.212 and 48 C.F.R. 227.7202-1 
through 227.7202-4 (June 1995), all U.S. Government End Users shall acquire the 
Software with only those rights set forth herein.


YOU ACKNOWLEDGE THAT YOU HAVE READ THIS AGREEMENT, UNDERSTAND IT, AND 
AGREE TO BE BOUND BY ITS TERMS AND CONDITIONS. NEITHER PARTY SHALL BE 
BOUND BY ANY OTHER STATEMENTS OR REPRESENTATIONS THAT ARE 
INCONSISTENT WITH THE TERMS AND CONDITIONS OF THIS AGREEMENT.
NO AMENDMENT TO THIS AGREEMENT IS EFFECTIVE UNLESS WRITTEN AND SIGNED 
BY PROPERLY AUTHORIZED REPRESENTATIVES OF EACH PARTY. BY OPENING 
THE PACKAGE, DOWNLOADING, INSTALLING OR USING THE SOFTWARE YOU AGREE 
TO ACCEPT THE TERMS OF THIS AGREEMENT.

//////////////////////////////////////////////////////////////////////////////////////////
2. Introduction
//////////////////////////////////////////////////////////////////////////////////////////
This printer driver is a software that controls Generic Multi Function Printer.
This is required to print with Generic Multi Function Printer from your PC.

Supported devices :
    Baseline
    Generic A3 common
    Generic A4 common
    Generic 50BW-2/50BW-2/36BW-2
    Generic 75BW-2/60BW-2
    Generic 36BW-3/28BW-3/22BW-3
    Generic 50C-2/50C-3/45C-3
    Generic 36C-1/28C-1/28C-1
    Color MF30-1/LP30-2
    Generic 75BW-2/60BW-2
    Generic 42BW-4/36BW-4/28BW-4/22BW-4
    Generic 65BW-3/60BW-3/55BW-3
    Generic 42BW-4/36BW-4
    Generic 60C-6(e)/60C-7(e)
    Generic 55C-6(e)/45C-6(e)/36C-6(e)/28C-6(e)/22C-6(e)
    Generic 75BW-5(e)/65BW-5(e)
    BW LP4700-1/BW LP4000-1/BW LP3300-1/BW LP330P-2
    Generic 55BW-5e/45BW-5e/36BW-5e/28BW-5e/22BW-5e
    C MF385-1/C MF335-1/C MF385-1FS
    BW MF402-1/BW MF332-1
    BW MF475-1/BW MF405-1
    BW MF25e-1
    C MF310P-1
    C MF311-1
    Generic 28C-2/22C-2/22C-3
    Generic 36BW-8/28BW-8/22BW-8
    Generic 36C-9/30C-9/25C-9
    Generic 28C-8/22C-8
    Generic 95BW-9/80BW-9/75BW-9
    Generic 65C-9/55C-9/45C-9
    Generic 35BW-1/25BW-1/20BW-1
    Generic 50C-1/45C-1/45C-2
    Generic 35C-4/35C-4P/25C-4/20C-4
    Generic 36BW-9/30BW-9
    Generic 55BW-9/45BW-9
    Generic 26C-7/22C-7
    Generic C MF385-2/C MF335-2/C MF385-2FS
    Generic 65BW-9e/55BW-9e/45BW-9e/36BW-9e/30BW-9e
    Generic 70C-10/65C-10
    BW LP470P-3/BW LP440P-3/BW LP360P-3
    BW MF442-3/BW MF362-3
    Generic BW MF475-3/BW MF405-3
    Generic PullPrinting
    Generic 36C-0i
    Generic 30C-0i
    Generic 25C-0i
    Generic C405-0i
    Generic C335-0i
    Generic C332-0i
    Generic C400-0i
    Generic C330-0i
    Generic 30BW-6i
    Generic 26BW-6i
    Generic 24BW-6i
    Generic 22BW-6i
    Generic BW 502-0i
    Generic BW 500-0i
    Generic BW 402-0i
    Generic BW 400-0i
    Generic 65C-0i
    Generic 55C-0i
    Generic 45C-0i
    Generic 65BW-0i
    Generic 55BW-0i
    Generic 45BW-0i
    Generic 36BW-0i
    Generic 30BW-0i
    Generic 70C-0i
    Generic BW75-0i
    Generic BW475-0i
    Generic BW405-0i
    Generic BW470-0i
    Generic 28C-7i
    Generic 25C-7i
    Generic 22C-7i
    Generic 28C-6i
    Generic 26C-6i
    Generic 25C-6i
    Generic 22C-6i
    Generic 95BW-0i
    Generic 85BW-0i

//////////////////////////////////////////////////////////////////////////////////////////
3. System requirements
//////////////////////////////////////////////////////////////////////////////////////////

Supported OS :
    Windows Server 2008 Standard *
    Windows Server 2008 Enterprise *
    Windows 7 Professional *
    Windows 7 Enterprise *
    Windows Server 2008 R2 Standard
    Windows Server 2008 R2 Enterprise
    Windows 8.1 *
    Windows 8.1 Pro *
    Windows 8.1 Enterprise *
    Windows Server 2012 Standard
    Windows Server 2012 Datacenter
    Windows Server 2012 Essentials
    Windows Server 2012 R2 Standard
    Windows Server 2012 R2 Datacenter
    Windows Server 2012 R2 Essentials
    Windows 10 Home*
    Windows 10 Pro *
    Windows 10 Enterprise *
    Windows 10 Education *
    Windows 11 Home
    Windows 11 Pro
    Windows 11 Enterprise
    Windows 11 Education
    Windows Server 2016 Standard
    Windows Server 2016 Datacenter
    Windows Server 2016 Essentials
    Windows Server 2019 Standard
    Windows Server 2019 Datacenter
    Windows Server 2019 Essentials
    Windows Server 2022 Standard
    Windows Server 2022 Datacenter
    Windows Server 2022 Datacenter:Azure Edition
    Windows Server 2022 Essentials

    * 32-bit (x86) and 64-bit (x64) editions of Windows are supported.

Support the following operation environments :
  <PCL driver>
    Windows Server 2008 R2 / 2012 / 2012 R2 Cluster Server Service
    Citrix Virtual Apps and Desktops 7 2006 / 2003
    Terminal Services
    Remote Desktop
    Terminal Services Easy Print
    Remote Desktop Easy Print

  <PS driver>
    Windows Server 2008 R2 / 2012 / 2012 R2 Cluster Server Service
    Citrix Virtual Apps and Desktops 7 2006 / 2003
    Terminal Services
    Remote Desktop

  <FAX driver>
    Windows Server 2008 R2 / 2012 / 2012 R2 Cluster Server Service
    Citrix Virtual Apps and Desktops 7 2006 / 2003
    Terminal Services
    Remote Desktop
    Terminal Services Easy Print
    Remote Desktop Easy Print

Other :
1. The following versions of  Microsoft .NET Framework must be installed in order 
to use the LDAP server in the Fax driver.
    Microsoft .NET Framework
     - Microsoft(R) .NET Framework 2.0 (SP1 or later)
     - Microsoft(R) .NET Framework 3.0 (SP1 or later)
     - Microsoft(R) .NET Framework 3.5
In Windows 7, Windows Server 2008 R2 necessary .NET Framework is installed.

//////////////////////////////////////////////////////////////////////////////////////////
4. Changes to this printer driver from an earlier version
//////////////////////////////////////////////////////////////////////////////////////////

  PCL/PS/FAX Version 3.9.303.0

==========================================================================================
4-1. Support the following models.
==========================================================================================
  Generic 95BW-0i
  Generic 85BW-0i

//////////////////////////////////////////////////////////////////////////////////////////
5. How to install/uninstall
//////////////////////////////////////////////////////////////////////////////////////////
There are two methods for installing this printer driver: automatic installation 
using an installer or manual installation using Add Printer. These two methods 
are described in the following sections.
The following is a description for Windows 11. See Users guide for details and for other OS.

==========================================================================================
5-1. Cautions when installing
==========================================================================================
Please read the following notes before use.

 1. When you start the installer and install the printer, it is necessary to log 
    in by the user who has the administrator power to the installing computer.

 2. When you selected a printer which belongs to one of computers in "WORKGROUP"
    of "Network" and installed the printer driver, you may not open the printer 
    property of the installed printer.
    ==>In this case, please install the printer driver by its installer.

 3. When you installed the network printer by using [Browse for Printer] in 
    [Devices and Printers] folder, you may not open the printer property of 
    the installed printer.
    ==>In this case, please install the printer driver in the way described below.
      3-1. Select [Local printer] and [Create a new port] in [Select a Printer Port] 
           window.
      3-2. Select [Local Port] for [Type of port] and enter "\\NetBios name\service name"
           for [Port Name]
      3-3. After that, install the printer driver according to the Wizard.

 4. When the driver installed in Windows Server 2008 is shared and installing 
    the driver with which the number of bits differ from the additional driver, 
    the message "Input the path to Windows Media" may be displayed.
    ==>In the case, please install the printer driver in the way described below.
      4-1. Please prepare the driver to add Windows Server 2008 and PC in which the OS 
           with the same number of bits is installed, and assign
           the drive (example: C drive) to which Windows is installed in the server
           side as a network drive.
      4-2. When the above-mentioned message comes out at the time of a driver addition,
           Please select [Reference] button and specify the file in which the
           above-mentioned network drive was required.

 5. When you specify the path of the shared printer by [Manual Selection] of Installer, 
    you can not find the printers from [Reference] button in Windows 7 and 
    Windows Server 2008 R2 or later operating system.
    ==>In this case, please enter the path of the shared printer directly. 

==========================================================================================
5-2. Automatic installation using an installer
==========================================================================================

 1. Turn on your computer and start Windows.

 2. Insert the Printer Driver DVD in the DVD drive of your computer.

 3. Click [Printer Install].

 4. Select the printer driver that you want to install and click.

 5. Read the contents of the displayed [Installer license agreement] screen.
    Click [AGREE] button, and then follow the instructions that appear on the 
    screen to complete the installation. 
    If you click [DISAGREE], the screen returns to the main menu screen and the 
    installation is cancelled.

==========================================================================================
5-3. Manual installation using Add Printer
==========================================================================================

Try the following manual installation steps if you cannot install from DVD install program.

 1. Insert the Printer Driver DVD in the DVD drive of your computer.

 2. Exit the installer.

 3. Open Devices and Printers by clicking the [Start] button , and then, 
    on the Start menu, clicking Devices and Printers.

 4. Click [Add a printer].

 5. Set the printer port based on printer connections.

   5-1. When you create a port on a network connection (LPR/Port9100)
    5-1-1. Click [The printer that I want isn't listed]
    5-1-2. Select [Add a local printer or network printer with manual settings].
           Click [Next].
    5-1-3. Select [Create a new port] and choose [Standard TCP/IP Port] for 
           the [Type of port]. Click [Next].
    5-1-4. Change [Device type] to [TCP/IP Device] and type the IP address 
           of the printer into the [Hostname or IPaddress] field.Click [Next].
    5-1-5. Select [Custom] from [Device type] and click [Settings].
    5-1-6. Change settings to suit the port and click [OK].
           For LPR connection, click [LPR], and then enter [lp] in the [Queue Name] box.
           For Port9100, click [RAW], and then enter the RAW port number (the default 
           setting is "9100") in the [Port Number] box.
    5-1-7. Click [Next].

   Skip to step 6.

   5-2. When you search for printers on network connection (LPR/Port9100)
    5-2-1. Turn on the power of the machine while it is connected to the network.
    5-2-2. Click [Add a Bluetooth, wireless or network discoverable printer].
           Connected printers are detected. It may take a long time to find all printers.
    5-2-3. In the list of available printers, select the one you want to use, 
           and then click [Next].
           If more than one printer is detected, select the printer with IP address of 
           this machine.


   Skip to step 6.

   5-3. When you search for printers on network connection (IPP)
    5-3-1. Turn on the power of the machine while it is connected to the network.
    5-3-2. Click [Add a Bluetooth, wireless or network discoverable printer].
    5-3-3. In the dialog box, click [The printer that I want isn't listed].
    5-3-4. In the URL field in the next dialog box enter the printer's 
           network pathname in one of the following formats and then choose [Next]:
           http://<IP_address_for_this_machine>/ipp

 6. Click [Browse].

 7. Click [Have Disk].

 8. Locate the directory on the DVD where the printer driver files are located 
    and then click "Open". Select the directory depending on using printer driver, 
    OS, and language.

 9. Click [OK].

 10. Click [OK] or [Next].

 11. Follow the on-screen instructions.

 12. Click [Finish].

This completes the printer driver installation.

 13. When installation is complete, make sure that the icon of the installed printer 
     appears in the [Printers] window.

 14. Remove the DVD from the DVD drive.

==========================================================================================
5-4. How to automatically uninstall the print driver from the [Start] menu
==========================================================================================
If you installed the printer driver using an installer program, the printer driver 
delete function is included.
- You must have administrative rights on the computer to uninstall the printer driver.

 1. Click Start and then click All Programs.

 2. Click [Generic] from the displayed menu.

 3. Select the printer driver that you want to delete and click [Uninstall Printer Driver].

 4. The installer appears and [Select a driver to uninstall] will be displayed.
    Please select the driver you want to delete and click [Uninstall].
    To complete the uninstall printer driver procedure, follow the directions provided 
    by the Wizard.

 5. When you are prompted to confirm the computer restart process, click [OK] and then 
    restart the computer.

This completes the uninstallation procedure.

==========================================================================================
5-5. Automatic uninstallation using an installer
==========================================================================================
You can delete the printer driver using the installer if you installed the driver 
using the installer.
- You must have administrative rights on the computer to uninstall the printer driver.

 1. Turn on your computer and start Windows.

 2. Insert the Printer Driver DVD in the DVD drive of your computer.
    The install program will start automatically and the main menu will be displayed. 

 3. Click [Printer Install] in the main menu screen.

 4. The [Installer license agreement] screen will appear.  Click the [Agree] button 
    to proceed.

 5. Select the printer driver that you want to delete and click.

 6. Select [Delete] and click next.

 7. Select the printer driver to be deleted from [Uninstall Printer Driver], and then 
    click [Uninstall].
    To complete the uninstall printer driver procedure, follow the directions provided 
    by the Wizard.

 8. When you are prompted to confirm the computer restart process, click [OK] and then 
    restart the computer.

This completes the uninstallation procedure.

==========================================================================================
5-6. How to uninstall manually
==========================================================================================
If a printer driver is installed without using an installer, the printer driver must be 
uninstalled manually.
- You must have administrative rights on the computer to uninstall the printer driver.
- If the User Account Control window appears, Click the Allow button 
  or the Continue button.

 1. Open Devices and Printers by clicking the [Start] button, and then, 
    on the Start menu, clicking Devices and Printers.

 2. Right-click the icon for the printer and select [Delete].

 3. On the Deletion Confirmation dialog box, click the [Yes] button.

 4. Click one of the printer icons displayed in [Devices and Printers], 
    and click [Print server property] on the toolbar.

 5. Click the [Driver] tab.

 6. Click [Changing print driver settings].

 7. Select the printer driver to be deleted from the Installed Printer Drivers list, 
    and then click [Delete].

 8. Select [Remove driver and driver package] on [Remove Driver And Package] screen 
    and click [OK].

 9. When you are prompted to confirm the deletion again, click [Delete].

 10. When you are prompted to confirm the deletion, click [Yes].

 11. Close the [Print Server Properties] dialog box, and then restart the computer.

This completes the uninstallation procedure.

//////////////////////////////////////////////////////////////////////////////////////////
6. File Composition
//////////////////////////////////////////////////////////////////////////////////////////

 [Windows]Folder
  |- [Driver]
      |- [PCL]
          |- [Driver]
              |- [Win_x64]
              |- [Win_x86]
          |- [Sub]                MultiLanguageFile
              |- [Lang]           MultiLanguageFile
          |- [UPDSetup64.exe]     Installer(64-bit)
          |- [UPDSetup.exe]       Installer(32-bit)
      |- [PS]
          |- [Driver]
              |- [Win_x64]
              |- [Win_x86]
          |- [Sub]                MultiLanguageFile
              |- [Lang]           MultiLanguageFile
          |- [UPDSetup64.exe]     Installer(64-bit)
          |- [UPDSetup.exe]       Installer(32-bit)
      |- [FAX]
          |- [Driver]
              |- [Win_x64]
              |- [Win_x86]
          |- [Sub]                MultiLanguageFile
              |- [Lang]           MultiLanguageFile
          |- [UPDSetup64.exe]     Installer(64-bit)
          |- [UPDSetup.exe]       Installer(32-bit)
      |- [Readme]
          |- [EN]
              |- [Readme.txt]     Readme file for English (This file)
          |- [JA]
              |- [Readme.txt]     Readme file for Japanese

//////////////////////////////////////////////////////////////////////////////////////////
7. How to check the version in a printer driver
//////////////////////////////////////////////////////////////////////////////////////////
The version information appears by selecting the following from the print settings of 
the driver in the printer folder after installing the printer driver.

  - PCL/PS/FAX
    [Other]Tab -> [About...]

//////////////////////////////////////////////////////////////////////////////////////////
8. Attentions and Restrictions
//////////////////////////////////////////////////////////////////////////////////////////

This printer offers many convenient functions.
Depending on the application, similar functions are realized by itself.
In such a case, please be careful of the setting method etc.

==========================================================================================
8-1. Attentions and Restrictions of each functions
==========================================================================================

 1. About Printer Font
  1-1. About Japanese Printer Driver
       When printing an original containing a Japanese font on a device 
       sold outside Japan with a Japanese printer driver, 
       set the download font format of the printer driver to 
       [Outline] or [Bitmap] and then print.

 2. Paper Size Setting  
  2-1. When not printing as paper size setting
       - Paper size can be set by the printer property, but it may become invalid 
         the paper size that is specified on the printer property according to 
         the application to use.
         ==>Please set the paper size on the Print menu of the application.

  2-2. Wide Paper
       When you use a Wide paper, load the paper in the tray and set the paper size 
       in the printer before the printing operation.  
       ==>For the setting procedure, please refer to the User's Guide for the printer.

  2-3. Registration of Custom Size
       Please perform registration of Custom Size by administrator.  

 3. Paper Tray Setting
  3-1. Cannot set Paper Tray.
       - To set an optional tray for the Paper Tray, the optional Paper Source unit
         is necessary.  Also, you need to select the Paper Source unit in 
         the [Device Option] setting of the printer driver.
         ==>Please check the existence of Paper Source unit and the [Device Option]
            setting.
       - Paper Tray may have restriction depending on the specified paper size.

  3-2. When Paper Tray setting doesn't work as specified.
       - Paper Tray can be set by the printer property, but it may become invalid 
         the Paper Tray that is specified on the printer property according to 
         the application to use.
         ==>Please set the Paper Tray on the Print menu of the application.
       - Paper may be fed from the tray other than the specified one depending on 
         the paper size set up on the printer.

 4. Original Orientation Setting
  4-1. Original Orientation setting doesn't work as specified.
       Original Orientation can be set by the printer property, but it may become 
       invalid the Original Orientation that is specified on the printer property 
       depending on the application to use.
       ==>Please set Original Orientation in the application.

 5. Collate Functions
  5-1. Collate doesn't work as specified.
       Collate is able to be set by the printer property, but the following 
       situation may occur depending on the application to use if you specify 
       Collate on the Print menu.
       - If [Combination] is specified, the last page of No. n copies and 
         the first page of No. n+1 copies are printed on the same paper.
       - If [2-Sided] is specified, the first page of No. n+1 copies is printed on
         2nd side of the last page of No. n copies.
       - If [Booklet] is specified, all prints are collected into one book and printed.
       - If [Staple] is specified, all prints are collected into one set and stapled.
       - If [Distribution Control Number] is specified, all prints are printed with 
         the same number. 
       - If [Secure Print] is specified, the waiting documents for print for specified
         number of copies are stored in the printer.
       - If [Watermark] is specified only on the first page of multiple copies of 
         printing, it will be stamped only on the first page of the first copy.
       - Even if [Offset] is specified, it will be output without offset.
         ==>Please set No Collate on the Print menu and specify Collate on 
            the printer property.

 6. Copies Setting
  6-1. Copies Setting doesn't work as specified.
       Copies can be set by the printer property and the Print menu of most of 
       applications, but the priority of setting between the printer property and
       the Print menu is different depending on the application to use.
       ==>First, please set 1 for the copies on the Print menu and specify the 
          required copies by the printer property.
          If only 1 copy is printed with this setting, please specify the required
          copies on the Print menu.

  6-2. [Proof Print] and Copies
       In Microsoft Excel, even though [Proof Print] function is selected and multiple 
       copies are set for print, all copies of document will be printed without storing.
       ==>[Proof Print] function can not be specified with 1 copy.  Also, even if the 
          multiple copies are set in Excel, Proof Print function is cancelled because 
          all data are printed only 1 copy with number of set.
          This can be solved by un-checking [Print on copy unit].

 7. [Front Cover] / [Back Cover]
  7-1. Paper for [Front Cover] / [Back Cover]
       When you use Front and/or Back Cover function, it is necessary to set the correct 
       paper beforehand in the Paper Tray for Front and/or Back Cover that is specified 
       by the printer driver.

 8. [User Authentication] / [Account Track]
  8-1. [User Authentication] / [Account Track] for use
       When you use the printer that requires [User Authentication] / [Account Track] 
       before printing, print is not accepted without entering the correct [User Name], 
       [Department Name] and [Password].

  8-2. When the Limitation for printing  is exceeded at the [Account Track]
       When the Account Track mode and Limitation for printing are enabled in the printer, 
       if there is a job that stops in the middle of printing as the limit is reached, 
       any following jobs are not printed unless the stopping job is canceled.    
       Please ask your administrator to cancel the limitation to output the stopping 
       job or someone must delete the job after confirmation.  

  8-3. [Device Option] in [Account Track]
       The [Account Track] displayed on the [Device Option] displays the status of the 
       "[Account Track] of main body device". Account Track status cannot be displayed 
       on the Printer driver when using the Enhanced Server Authentication since 
       the status of the "[Account Track] of  Enhanced Server Authentication" could not 
       be acquired.

  8-4. When verifying the registered user or account information, the verification will 
       fail when [Enable Single Sign-On functionality for printing functions] is enabled.
       ==>Please do not enable [Enable Single Sign-On functionality for printing 
          functions] on [User Authentication/Account Track] dialog in the [Basic]tab of 
          the Properties, when [Settings]tab - [Verify Authentication settings before 
          printing] is enabled.
          If [Enable Single Sign-On functionality for printing functions] is enabled 
          and then printing is executed, the document cannot be printed.

 9. [Booklet] and [Center Staple and Fold]
  9-1. Blank of Paper Center Part
       When [Booklet] and [Center Staple and Fold] are specified, blank space with 
       a width of about 10mm will occur in the center of paper.
       ==>Please make more than 5mm blank space of the original, then print it.

 10. Two-way Communication
  10-1. Acquire Device Information
       When you installed the printer driver to a client computer by Point and Print,
       you can not use [Configure]-[Acquire Device Information] in the printer property.
       ==>Please set the composition of Device Options manually or acquire the option
          information on the server.

  10-2. About Two-way communication of Printer Driver and MFP
       This printer driver is able to acquire MFP's information via the network 
       communication.
       Please update more than Internet Explorer 6.0 (Service pack 1) to take full
       advantage of this printer driver.
       ==>MFP's information may not be acquired depending on the Internet Explorer version.

 11. Custom Size
  11-1. Paper Width
        If you specify  a paper wider greater than 12.248 inches  (311.1mm) when 
        you set the custom size, the printing results are not guaranteed.

 12. OS Restrictions
  12-1. Watermark in PCL driver for x64 Edition
        When printing the document with odd number of pages with specifying [Duplex] and
        [Watermark], a blank page would be added after the last page and the watermark 
        would be printed on the blank page.

  12-2. File name of Phone Book
        Fax driver could not read the Phone Book file with long file or folder name 
        because of the OS's restriction.

  12-3. PS Driver for Windows 7
        There will be a blank space in the window since the window size of 
        the Print Setting is bigger that the other drivers. This will have no effect
        on the print operation.

  12-4. Using a WSD Port Connection in Windows 7 and Windows Server 2008 R2
        The Printer Driver must be installed in order to connect to the device using 
        the WSD port in Windows 7 and Windows Server 2008 R2.

  12-5. About Watermark printing in Windows 8.1 
        In some instances, the Watermark is not printed when the print is executed
        from Microsoft Word 2010 or Microsoft Excel 2010.
        - Printer Property -> [Settings]Tab - [EMF Spool] -> ON
        - Printer Property -> [Advanced]Tab - [Enable advanced printing features] -> ON

  12-6. About Text on Tab printing in Windows 8.1
        In some instances, Text on Tab is not printed when the print is executed 
        from Microsoft Word 2010 or Microsoft Excel 2010.
        - Printer Property -> [Settings]Tab - [EMF Spool] -> ON
        - Printer Property -> [Advanced]Tab - [Enable advanced printing features] -> ON

  12-7. About [Copy Security] printing in Windows 8.1
        In some instances, [Copy Security] is not printed when the print is executed 
        from Microsoft Word 2010 or Microsoft Excel 2010.
        - Printer Property -> [Settings]Tab - [EMF Spool] -> ON
        - Printer Property -> [Advanced]Tab - [Enable advanced printing features] -> ON

  12-8. About [Excel Job Control] printing in Windows 8.1
        In some instances, [Excel Job Control] is not printed when the print is executed 
        from Microsoft Word 2010 or Microsoft Excel 2010.
        - Printer Property -> [Settings]Tab - [EMF Spool] -> ON
        - Printer Property -> [Advanced]Tab - [Enable advanced printing features] -> ON

  12-9. About [Remove White Background] printing in Windows 8.1
        In some instances, [Remove White Background] is not printed when the print is executed 
        from Microsoft Word 2010 or Microsoft Excel 2010.
        - Printer Property -> [Settings]Tab - [EMF Spool] -> ON
        - Printer Property -> [Advanced]Tab - [Enable advanced printing features] -> ON

  12-10. About [Per Page Setting] printing in Windows 8.1
         In some instances, [Per Page Setting] is not printed when the print is executed 
         from Microsoft Word 2010 or Microsoft Excel 2010.
         - Printer Property -> [Settings]Tab - [EMF Spool] -> ON
         - Printer Property -> [Advanced]Tab - [Enable advanced printing features] -> ON

  12-11. About [Create Host Image] or [Create Shared Folder Image] printing in Windows 8.1
         In some instances, [Create Host Image] or [Create Shared Folder Image] is not printed 
         when the print is executed from Microsoft Word 2010 or Microsoft Excel 2010.
         - Printer Property -> [Settings]Tab - [EMF Spool] -> ON
         - Printer Property -> [Advanced]Tab - [Enable advanced printing features] -> ON

  12-12. About [Print Host Image] or [Print Device Image] printing in Windows 8.1
         In some instances, [Print Host Image] or [Print Device Image] is not printed when the print is executed 
         from Microsoft Word 2010 or Microsoft Excel 2010.
         - Printer Property -> [Settings]Tab - [EMF Spool] -> ON
         - Printer Property -> [Advanced]Tab - [Enable advanced printing features] -> ON

  12-13. Restriction of Cover Sheet in Windows 8.1 x86
         In some instances, the Cover Sheet is not printed when the print is
         executed from Microsoft Word 2010 or Microsoft Excel 2010.

 13. Others
  13-1. Screen Font
        When printing with using screen fonts installed in your computer, some of 
        fonts or characters may not be printed correctly.

  13-2. When sending plural printing jobs to Network Port
        If multiple copies of document is sent to each port such as IPP, SMB, RAW and LPR 
        at the same time. The print out of one set of document may be separated 
        by another print job. 
        ==>In this case, select Uncollated.

  13-3. Copies Setting in Application
        Some applications may allow you to set copies more than the device's limitation,
        but the printer can not print as specified in the applications.

  13-4. Blank Page
        According to the application to use, when the data has odd number pages, 
        it may be added the blank paper if [2-Sided] function is available.
        In that case, the following phenomenon will occur.
        - The Watermark will be printed on the last blank page.
          (in case of specifying The [Watermark] function)
        - The Overlay will be printed on the last blank page.
          (in case of specifying The [Overlay] function).

  13-5. Document Name displayed on the panel
        Based on the application that indicates the printing operation of a document, 
        the document name may not be displayed correctly on the panel by the application
        problem.In this case, there is no influence in the printing result.

  13-6. Orientation and FAX Cover Sheet
        When [Orientation] in the FAX driver is not same as the one set in the application, 
        FAX Cover Sheet might not printed as the preview in the driver showed.

  13-7. Restrictions on using with Citrix XenApp and Citrix XenDesktop
        When print settings is changed to multiple on the Client Printer driver created with the 
        "Auto Created Client Printer" of Citirx XenApp and Citrix XenDesktop, Printer settings 
        are changed to default value without inheriting the Printer Driver Settings.

 14. When you perform printing using the application, 
    if you click <Printer Properties> while the print queue status is in the process of connecting, 
    an Error message is displayed.

    Workaround: Click the <Printer Properties> after the print queue status is ready.

 15. When you perform printing using the application (MSPaint.exe), 
    if you click <Printer Properties> of the print queue whose Device 
    Information has not been acquired, an Error message is displayed.

    Workaround: Perform printing using the application after acquiring the Device Information 
    from <Devices and Printers>.

 16. The Universal Print Driver does not work normally if EasyPrint setting in 
    MS Terminal Services Environment is disabled.

    Workaround: Enable EasyPrint setting.

 17. About display of favorite setting
    In case of model does not support watermark function, watermark function is displayed
    in favorite setting.

 18. In case of printing on specific model
    When printing the document that has objects drawn on the edge of paper, 
    The following models has a defect of about 2 mm in some case. 
    (PS driver)
      - BW LP470P-3/BW LP440P-3/BW LP360P-3/BW MF442-3/BW MF362-3/
        BW LP4700-1/BW LP4000-1/BW LP3300-1/BW LP330P-2/BW MF402-1/BW MF332-1
        BW 502-0i/BW 500-0i/BW 402-0i/BW 400-0i

    Workaround: Use PCL6 driver

 19. About language settings
    When you change the language setting,
    language setting of another printer created with same driver is changed.

 20. About Import/Export of favorite setting
    "favorite setting" exported with v3.5.0.0 or earlier drivers cannot imported
    by v3.6.0.0 or later drivers.

    Workaround: Export after updating to v3.6.0.0 or later.

 21. About Favorite settings when updating drivers
    When model changed after the update from the driver before v3.5.0.0,
    Favorite settings of different models are inherited.

    Workaround: Perform one of the following procedures.
      - Not change model after the update.If you want to change it,
        recreate Favorite Settings.

      - Perform the following procedure.
        1 .Open [printer property]
        2 .[General]Tab -> [Preference]
        3 .[Favorite Setting] -> [Edit...]
        4 .[Edit Favorite Setting]Dialog -> [OK]

 22. About Installer
    When "Obtain Device Information" acquire from "Configure" Tab after 
    installing the USB connection from "Network search" by installer, 
    The "Apply" button is not grayed out.

 23. About Paper Tray Information
    Hint box is not displayed in printer property/Configure/Paper Tray Information.

    Workaround: Open print settings, close OK, and reopen printer properties.

 24. About IdP authentication
  24-1. About WebView2
        WebView2 Runtime must be installed for IdP authentication.
        ==>Depending on the operating system you are using, WebView2 Runtime will be installed as standard.
        If WebView2 Runtime is not installed, it can be installed using one of the following methods:
         - Click "WebView2 installation" in the driver installer.
           (The [Install WebView2] button will become available if WebView2 is not installed.)
         - Download WebView2 Runtime during IdP authentication.
           (A message guides to the download page if WebView2 Runtime is not installed.)
        If you cannot install WebView2 Runtime, contact the system administrator.

  24-2. About browser settings
        If you do not install WebView2 Runtime, authentication will be executed with Internet Explorer.
        You then need to make the following settings:
         - Add the authentication site to the "Trusted sites" of Internet Explorer
         - Change "Let Internet Explorer open sites in Microsoft Edge" to "Never" in Microsoft Edge
         - Open "Compatibility View settings" in the Internet Explorer and disable 
           "Display internet sites in Compatibility View".
           ==>For sites that require a compatibility view, enable the setting individually.

        For details, please refer to the support manual.
 
 24-3. About WebView2 Runtime Cookies
        WebView2 Runtime cookies cannot be removed from the browser. 
        To remove the cookies, please delete the following files:
         C:\Users\<User Name>\AppData\Local\KONICA MINOLTA\IdPAuthenticate\EBWebView\Default
          Cookies
          Cookies-journal

==========================================================================================
8-2. Attentions and Restrictions when using a PCL driver
==========================================================================================

 1. Restrictions when using Citrix XenApp
    If you select 1200dpi to print a document when using the Citrix Universal Printer 
    Driver, printing will fail.
    When you select 1200dpi to print a document, please use the Native Driver.


==========================================================================================
8-3. Attentions and Restrictions when using a PS driver
==========================================================================================

 1. Quality
    When you set [Quality]tab -[Quality Adjustment]-[Detail]-[Photo]-[Pure Black] 
    to Off, the full color counter will be counted up because the device performs 
    CMYK print, but documents will be printed more beautifully.

 2. PostScript Pass through
    Depending on applications to use, some functions of printer drivers might not work
    correctly.  For example, Watermarks specified by printer drivers would be 
    printed in unexpectedly large size when printing from Adobe Photoshop.
    ==>this may be solved by setting [PostScript Pass through] to [Disable] 
       in printer drivers.
       * The following cases are the error samples.
         - Output cannot be performed normally when Adobe Application and Overlay are
           combined.
         - Watermark specified by printer driver may be printed larger than the size
           you specified when printing with Adobe Photoshop.
         - Error page may be printed when printing with the Adobe application.

 3. Banner Printing
    Please set [Length] to a value higher than 457.3mm / 18.002 inches in the 
    Banner Printing [Custom Size Settings] dialog box on the following models:
    - 50C-1/45C-1/45C-2
    - 35C-4/35C-4P/25C-4/20C-4
    - 50C-2/50C-3/45C-3
    - 36C-1/28C-1/28C-1
    - 65BW-3/60BW-3/55BW-3
    - 60C-6(e)/60C-7(e)
    - 75BW-5(e)/65BW-5(e)
    - 55C-6(e)/45C-6(e)/36C-6(e)/28C-6(e)/22C-6(e)
    - 55BW-5e/45BW-5e/36BW-5e/28BW-5e/22BW-5e
    - 65BW-9e/55BW-9e/45BW-9e/36BW-9e/30BW-9e
    - 70C-10/65C-10 
    - 55BW-9/45BW-9
    - 36BW-9/30BW-9
    - 65C-9/55C-9/45C-9
    - 36C-9/30C-9/25C-9
    - 95BW-9/80BW-9/75BW-9
    - 70C-0i
    - 65C-0i/55C-0i/45C-0i
    - 36C-0i/30C-0i/25C-0i
    - 75BW-0i
    - 65BW-0i/55BW-0i/45BW-0i/36BW-0i/30BW-0i
    - 95BW-0i/85BW-0i
    Please set [Length] to a value higher than 431.9mm / 17.002 inches in the 
    Banner Printing [Custom Size Settings] dialog box on the following models:
    - 26C-7/22C-7
    - 28C-8/22C-8
    - 28C-7i/25C-7i/22C-7i
    - 28C-6i/26C-6i/25C-6i/22C-6i
    You cannot execute Banner printing on the following models.
    - 35BW-1/25BW-1/20BW-1
    - 42BW-4/36BW-4/28BW-4/22BW-4
    - 36BW-3/28BW-3/22BW-3
    - 50BW-2/50BW-2/36BW-2
    - 75BW-2/60BW-2
    - 28C-2/22C-2/22C-3
    - C MF385-2/C MF335-2/C MF385-2FS
    - BW MF475-3/BW MF405-3
    - 36BW-8/28BW-8/22BW-8
    - C405-0i/C335-0i
    - C400-0i/C330-0i
    - C332-0i
    - 30BW-6i/26BW-6i/24BW-6i/22BW-6i
    - BW475-0i/BW405-0i
    - BW470-0i
    - C MF385-1/C MF335-1/C MF385-1FS
    - BW MF475-1/BW MF405-1
    - C MF310P-1
    - C MF311-1
    - BW LP470P-3/BW LP440P-3/BW LP360P-3
    - BW MF442-3/BW MF362-3
    - BW LP4700-1/BW LP4000-1/BW LP3300-1/BW LP330P-2
    - BW MF402-1/BW MF332-1
    - Color MF30-1/LP30-2
    - BW MF25e-1

 4. Printing Custom Size Documents
  4-1. When printing the document which length and width is the same (i.e. "square"
       shape document) in some application, the device may print the document with
       rotating its direction.
       This means for example that staple or punch may be made in the different 
       position of the document from the expected one.

  4-2. When [Paper Size] is set to [Custom Size] and a print job is sent, the [Paper Size]
       set on the MFP may be different than the what is set in the Printer Driver,
       but the printed output will be normal.

 5. Overlay Function
  5-1. About Combination with [Binding Margin]
       When [Overlay], [Booklet], and [Binding Margin] we set simultaneously, the leading 
       edge of the Overlay will exceed the [Binding Margin] at the time of printing.
       - If the [Binding Margin] is set to 10mm, the leading edge of Overlay will be mobed 
         to 15mm.

 6. Printing in the [Auto Color] Setting
    When Black and White document is printed in the [Auto Color] Setting, 
    it may be counted as color document.
    To avoid this situation, change your driver/printer setting and print again.
    (Precondition: [Simulation Profile] is enabled in the printer.)
    Setting changes:
    Printer driver setting: Select [Quality]->[Select Color]->[Gray Scale].
    Printer setting: Select [Utility]->[Printer Settings]->[PS Settings]
    ->[ICC Profile Settings]->[Simulation Profile]-[None].

==========================================================================================
8-4. Attentions and Restrictions when using a FAX driver
==========================================================================================

 1. When select different language to OS,garbled characters occur in the following dialog.
         - "Add from Address Book"
         - "Add Recipient from Phone Book"
         - "Phone Book Entry"
     Workaround: Match the language settings of the OS and driver.

==========================================================================================
8-5. Cautions and restrictions with specific applications
==========================================================================================

 1. Microsoft Office
  1-1. AutoShapes Graphics Print in Office [* PS Driver only]
       If the [Transparency] check box of [Fill] column in [Format AutoShape...]-
       [Colors and Lines]tab is ON, the paint-out part of graphics may not be
       printed correctly at the time of reduction and enlargement print.

  1-2. Entire workbook Print in Microsoft Excel
       When you print the Microsoft Excel document that has different binding direction 
       in each sheets with the [Entire workbook] checkbox ON, it may not be printed 
       as you specified.

  1-3. Duplex Print in Microsoft Word 2007 or Microsoft Word 2010
       When a document with odd number sheet is printed in duplex mode from
       Microsoft Word 2007 or Microsoft Word 2010, white paper which is not included 
       in original may be printed and counted.

  1-4. Custom Size printing in Microsoft Word
       When paper size is specified as "Custom Size", it may be printed in invert.
       In this case, it can be printed normally when paper size is specified as
       "Same as Original Size".

  1-5. Edit Phone Book file at Microsoft Excel
       Please open the Phone Book file with changing the file extension from "csv" 
       to "txt" and specify "character" for each field in order to edit the Phone 
       Book exported from the FAX driver at Microsoft Excel.
       Also please save the Phone Book file edited at Microsoft Excel with selecting 
       "csv" for file type.

 2. Adobe Acrobat
  2-1. When a printing is performed from Acrobat Reader or Acrobat, Printing may not 
       be performed normally. 
       ==>Please check the [Print as image] on the Print setting of the application.

  2-2. Depending on the PDF file, the background may be painted with white out.
       When the topside of this image is printed during overlay print, the downside 
       of the image (Original or Overlay) cannot be printed.

  2-3. When printing the PDF file with turning off the "Choose Paper Source by PDF page 
       size" checkbox in the "Print" dialog, the page with different direction from 
       the 1st page and following pages might not be printed with correct direction 
       since Acrobat Reader will not correctly notify the page direction of pages 
       after the 1st page to the printer driver.

  2-4. When printing landscape original using Acrobat Reader 9, the page will be rotated 
       first then printed.[*PCL only]
       This means for example that staple or punch may be made in the different 
       position of the document from the expected one.
       ==>In this case, it can be printed normally when [Auto-Rotate and Center] is 
          specified to OFF in the [Print Setting] of application.

  2-5. Please note that entering multiple copies in the Print Dialog menu will not 
       yield the expected results when using Adobe Reader X or Adobe Acrobat X. 
       ==>When printing a multiple number of copies using Adobe Reader X or
          Adobe Acrobat X, you need to configure the [Page Setup] setting first and 
          then configure the Printer Driver Properties menu.  

  2-6. When [Select paper by corresponding to PDF's page size] setting available
       in the Acrobat`s print dialog box is enabled, 
       ==>Please disable the [Select paper by corresponding to PDF's page size]
          setting and execute the print.

 3. Adobe PageMaker, Illustrator
  3-1. Depending on applications, such as Adobe PageMaker, Illustrator and etc, 
       if it recognizes that it is a PostScript printer driver, the application itself 
       may output PostScript commands. In this case, it may not be printed correctly.
       [* PS Driver only]

  3-2. When printing a PageMaker file containing Japanese characters, 
       the text may be garbled sometimes. [* PS driver only]
       ==> In such cases, set the download font format of the printer driver to 
           [Outline] or [Bitmap] to print normally.

  3-3. When the Illustrator file with paper size A0/A1/B1 is printed with Illustrator CS, 
       a part of the image is lost.
       With Illustrator CS2 or more, this problem doesn't occur.

 4. About Just Systems Ichitaro [*PS Driver only]
  4-1. If printing is not performed correctly, click the [Details] tab 
       in the print dialog box and set the [PostScript code] field to 
       [Output as PostScript code]. 

 5. Internet Explorer, Note Pad
  5-1. Check the selected printer when printing continuously by the Internet Explorer
       or Note Pad.
       Selected printer might differ from the previous selection if several same
       printer drivers have been installed, depending on the application limitation.
       ==>In this case, change the printer driver name with 
          which selection will be changed, to less than 29 characters.

 6. Excel
  6-1. Check the print settings before printing when you print from Excel after 
       switching the printer driver.
       Depending on the limitation of application, current printer driver setting might 
       apply to the printer driver after switching.
       ==>In that case, change the name of a printer driver used to within 29 characters. 

  6-2. When you want to print multiple Excel sheets simultaneously, printing may not be 
       successfully executed.
       This is a result of different printer driver settings for each sheet.
       ==>In this case, please enter the same print driver settings for all sheets 
          within the Excel workbook.

 7. PowerPoint
  7-1. Please do not enable the following setting when you print from PowerPoint.
       It might cause to hang PowerPoint.
       - [Settings]tab - [Popup Authentication Dialog when printing]

  7-2. The background of PowerPoint data is painted with the specified color.
       Because of this, when the topside of this image is printed during the overlay
       print with white background,the bottom of the image (Original or Overlay) cannot
       be printed by combination of the following driver.
       - PowerPoint2007 later  ->  PS/PCL driver

//////////////////////////////////////////////////////////////////////////////////////////
9. Apache License
//////////////////////////////////////////////////////////////////////////////////////////

    This product includes software developed by
    the Apache Software Foundation (http://www.apache.org/).

    Portions of this software were originally based on the following:
      - software copyright (c) 1999, IBM Corporation., http://www.ibm.com.

    KONICA MINOLTA, INC. changed xerces-c_2_7.dll.



                                 Apache License
                           Version 2.0, January 2004
                        http://www.apache.org/licenses/

   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

   1. Definitions.

      "License" shall mean the terms and conditions for use, reproduction,
      and distribution as defined by Sections 1 through 9 of this document.

      "Licensor" shall mean the copyright owner or entity authorized by
      the copyright owner that is granting the License.

      "Legal Entity" shall mean the union of the acting entity and all
      other entities that control, are controlled by, or are under common
      control with that entity. For the purposes of this definition,
      "control" means (i) the power, direct or indirect, to cause the
      direction or management of such entity, whether by contract or
      otherwise, or (ii) ownership of fifty percent (50%) or more of the
      outstanding shares, or (iii) beneficial ownership of such entity.

      "You" (or "Your") shall mean an individual or Legal Entity
      exercising permissions granted by this License.

      "Source" form shall mean the preferred form for making modifications,
      including but not limited to software source code, documentation
      source, and configuration files.

      "Object" form shall mean any form resulting from mechanical
      transformation or translation of a Source form, including but
      not limited to compiled object code, generated documentation,
      and conversions to other media types.

      "Work" shall mean the work of authorship, whether in Source or
      Object form, made available under the License, as indicated by a
      copyright notice that is included in or attached to the work
      (an example is provided in the Appendix below).

      "Derivative Works" shall mean any work, whether in Source or Object
      form, that is based on (or derived from) the Work and for which the
      editorial revisions, annotations, elaborations, or other modifications
      represent, as a whole, an original work of authorship. For the purposes
      of this License, Derivative Works shall not include works that remain
      separable from, or merely link (or bind by name) to the interfaces of,
      the Work and Derivative Works thereof.

      "Contribution" shall mean any work of authorship, including
      the original version of the Work and any modifications or additions
      to that Work or Derivative Works thereof, that is intentionally
      submitted to Licensor for inclusion in the Work by the copyright owner
      or by an individual or Legal Entity authorized to submit on behalf of
      the copyright owner. For the purposes of this definition, "submitted"
      means any form of electronic, verbal, or written communication sent
      to the Licensor or its representatives, including but not limited to
      communication on electronic mailing lists, source code control systems,
      and issue tracking systems that are managed by, or on behalf of, the
      Licensor for the purpose of discussing and improving the Work, but
      excluding communication that is conspicuously marked or otherwise
      designated in writing by the copyright owner as "Not a Contribution."

      "Contributor" shall mean Licensor and any individual or Legal Entity
      on behalf of whom a Contribution has been received by Licensor and
      subsequently incorporated within the Work.

   2. Grant of Copyright License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      copyright license to reproduce, prepare Derivative Works of,
      publicly display, publicly perform, sublicense, and distribute the
      Work and such Derivative Works in Source or Object form.

   3. Grant of Patent License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      (except as stated in this section) patent license to make, have made,
      use, offer to sell, sell, import, and otherwise transfer the Work,
      where such license applies only to those patent claims licensable
      by such Contributor that are necessarily infringed by their
      Contribution(s) alone or by combination of their Contribution(s)
      with the Work to which such Contribution(s) was submitted. If You
      institute patent litigation against any entity (including a
      cross-claim or counterclaim in a lawsuit) alleging that the Work
      or a Contribution incorporated within the Work constitutes direct
      or contributory patent infringement, then any patent licenses
      granted to You under this License for that Work shall terminate
      as of the date such litigation is filed.

   4. Redistribution. You may reproduce and distribute copies of the
      Work or Derivative Works thereof in any medium, with or without
      modifications, and in Source or Object form, provided that You
      meet the following conditions:

      (a) You must give any other recipients of the Work or
          Derivative Works a copy of this License; and

      (b) You must cause any modified files to carry prominent notices
          stating that You changed the files; and

      (c) You must retain, in the Source form of any Derivative Works
          that You distribute, all copyright, patent, trademark, and
          attribution notices from the Source form of the Work,
          excluding those notices that do not pertain to any part of
          the Derivative Works; and

      (d) If the Work includes a "NOTICE" text file as part of its
          distribution, then any Derivative Works that You distribute must
          include a readable copy of the attribution notices contained
          within such NOTICE file, excluding those notices that do not
          pertain to any part of the Derivative Works, in at least one
          of the following places: within a NOTICE text file distributed
          as part of the Derivative Works; within the Source form or
          documentation, if provided along with the Derivative Works; or,
          within a display generated by the Derivative Works, if and
          wherever such third-party notices normally appear. The contents
          of the NOTICE file are for informational purposes only and
          do not modify the License. You may add Your own attribution
          notices within Derivative Works that You distribute, alongside
          or as an addendum to the NOTICE text from the Work, provided
          that such additional attribution notices cannot be construed
          as modifying the License.

      You may add Your own copyright statement to Your modifications and
      may provide additional or different license terms and conditions
      for use, reproduction, or distribution of Your modifications, or
      for any such Derivative Works as a whole, provided Your use,
      reproduction, and distribution of the Work otherwise complies with
      the conditions stated in this License.

   5. Submission of Contributions. Unless You explicitly state otherwise,
      any Contribution intentionally submitted for inclusion in the Work
      by You to the Licensor shall be under the terms and conditions of
      this License, without any additional terms or conditions.
      Notwithstanding the above, nothing herein shall supersede or modify
      the terms of any separate license agreement you may have executed
      with Licensor regarding such Contributions.

   6. Trademarks. This License does not grant permission to use the trade
      names, trademarks, service marks, or product names of the Licensor,
      except as required for reasonable and customary use in describing the
      origin of the Work and reproducing the content of the NOTICE file.

   7. Disclaimer of Warranty. Unless required by applicable law or
      agreed to in writing, Licensor provides the Work (and each
      Contributor provides its Contributions) on an "AS IS" BASIS,
      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
      implied, including, without limitation, any warranties or conditions
      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
      PARTICULAR PURPOSE. You are solely responsible for determining the
      appropriateness of using or redistributing the Work and assume any
      risks associated with Your exercise of permissions under this License.

   8. Limitation of Liability. In no event and under no legal theory,
      whether in tort (including negligence), contract, or otherwise,
      unless required by applicable law (such as deliberate and grossly
      negligent acts) or agreed to in writing, shall any Contributor be
      liable to You for damages, including any direct, indirect, special,
      incidental, or consequential damages of any character arising as a
      result of this License or out of the use or inability to use the
      Work (including but not limited to damages for loss of goodwill,
      work stoppage, computer failure or malfunction, or any and all
      other commercial damages or losses), even if such Contributor
      has been advised of the possibility of such damages.

   9. Accepting Warranty or Additional Liability. While redistributing
      the Work or Derivative Works thereof, You may choose to offer,
      and charge a fee for, acceptance of support, warranty, indemnity,
      or other liability obligations and/or rights consistent with this
      License. However, in accepting such obligations, You may act only
      on Your own behalf and on Your sole responsibility, not on behalf
      of any other Contributor, and only if You agree to indemnify,
      defend, and hold each Contributor harmless for any liability
      incurred by, or claims asserted against, such Contributor by reason
      of your accepting any such warranty or additional liability.

//////////////////////////////////////////////////////////////////////////////////////////
10. OpenSSL License
//////////////////////////////////////////////////////////////////////////////////////////

  LICENSE ISSUES
  ==============

  The OpenSSL toolkit stays under a double license, i.e. both the conditions of
  the OpenSSL License and the original SSLeay license apply to the toolkit.
  See below for the actual license texts.

  OpenSSL License
  ---------------

/* ====================================================================
 * Copyright (c) 1998-2017 The OpenSSL Project.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer. 
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. All advertising materials mentioning features or use of this
 *    software must display the following acknowledgment:
 *    "This product includes software developed by the OpenSSL Project
 *    for use in the OpenSSL Toolkit. (http://www.openssl.org/)"
 *
 * 4. The names "OpenSSL Toolkit" and "OpenSSL Project" must not be used to
 *    endorse or promote products derived from this software without
 *    prior written permission. For written permission, please contact
 *    openssl-core@openssl.org.
 *
 * 5. Products derived from this software may not be called "OpenSSL"
 *    nor may "OpenSSL" appear in their names without prior written
 *    permission of the OpenSSL Project.
 *
 * 6. Redistributions of any form whatsoever must retain the following
 *    acknowledgment:
 *    "This product includes software developed by the OpenSSL Project
 *    for use in the OpenSSL Toolkit (http://www.openssl.org/)"
 *
 * THIS SOFTWARE IS PROVIDED BY THE OpenSSL PROJECT ``AS IS'' AND ANY
 * EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE OpenSSL PROJECT OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 * ====================================================================
 *
 * This product includes cryptographic software written by Eric Young
 * (eay@cryptsoft.com).  This product includes software written by Tim
 * Hudson (tjh@cryptsoft.com).
 *
 */

 Original SSLeay License
 -----------------------

/* Copyright (C) 1995-1998 Eric Young (eay@cryptsoft.com)
 * All rights reserved.
 *
 * This package is an SSL implementation written
 * by Eric Young (eay@cryptsoft.com).
 * The implementation was written so as to conform with Netscapes SSL.
 * 
 * This library is free for commercial and non-commercial use as long as
 * the following conditions are aheared to.  The following conditions
 * apply to all code found in this distribution, be it the RC4, RSA,
 * lhash, DES, etc., code; not just the SSL code.  The SSL documentation
 * included with this distribution is covered by the same copyright terms
 * except that the holder is Tim Hudson (tjh@cryptsoft.com).
 * 
 * Copyright remains Eric Young's, and as such any Copyright notices in
 * the code are not to be removed.
 * If this package is used in a product, Eric Young should be given attribution
 * as the author of the parts of the library used.
 * This can be in the form of a textual message at program startup or
 * in documentation (online or textual) provided with the package.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *    "This product includes cryptographic software written by
 *     Eric Young (eay@cryptsoft.com)"
 *    The word 'cryptographic' can be left out if the rouines from the library
 *    being used are not cryptographic related :-).
 * 4. If you include any Windows specific code (or a derivative thereof) from 
 *    the apps directory (application code) you must include an acknowledgement:
 *    "This product includes software written by Tim Hudson (tjh@cryptsoft.com)"
 * 
 * THIS SOFTWARE IS PROVIDED BY ERIC YOUNG ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * 
 * The licence and distribution terms for any publically available version or
 * derivative of this code cannot be changed.  i.e. this code cannot simply be
 * copied and put under another distribution licence
 * [including the GNU Public Licence.]
 */

//////////////////////////////////////////////////////////////////////////////////////////
11. NetSNMP License
//////////////////////////////////////////////////////////////////////////////////////////
Various copyrights apply to this package, listed in various separate
parts below.  Please make sure that you read all the parts.

---- Part 1: CMU/UCD copyright notice: (BSD like) -----


       Copyright 1989, 1991, 1992 by Carnegie Mellon University

		  Derivative Work - 1996, 1998-2000
Copyright 1996, 1998-2000 The Regents of the University of California

			 All Rights Reserved

Permission to use, copy, modify and distribute this software and its
documentation for any purpose and without fee is hereby granted,
provided that the above copyright notice appears in all copies and
that both that copyright notice and this permission notice appear in
supporting documentation, and that the name of CMU and The Regents of
the University of California not be used in advertising or publicity
pertaining to distribution of the software without specific written
permission.

CMU AND THE REGENTS OF THE UNIVERSITY OF CALIFORNIA DISCLAIM ALL
WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS.  IN NO EVENT SHALL CMU OR
THE REGENTS OF THE UNIVERSITY OF CALIFORNIA BE LIABLE FOR ANY SPECIAL,
INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING
FROM THE LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF
CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.


---- Part 2: Networks Associates Technology, Inc copyright notice (BSD) -----

Copyright (c) 2001-2003, Networks Associates Technology, Inc
All rights reserved.
 
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
 
*  Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.
 
*  Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
 
*  Neither the name of the Networks Associates Technology, Inc nor the
   names of its contributors may be used to endorse or promote
   products derived from this software without specific prior written
   permission.
 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS
IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

---- Part 3: Cambridge Broadband Ltd. copyright notice (BSD) -----

Portions of this code are copyright (c) 2001-2003, Cambridge Broadband Ltd.
All rights reserved.
 
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
 
*  Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.
 
*  Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
 
*  The name of Cambridge Broadband Ltd. may not be used to endorse or
   promote products derived from this software without specific prior
   written permission.
 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER ``AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


---- Part 4: Sun Microsystems, Inc. copyright notice (BSD) -----

Copyright (c) 2003 Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
California 95054, U.S.A. All rights reserved.

Use is subject to license terms below.

This distribution may include materials developed by third parties.

Sun, Sun Microsystems, the Sun logo and Solaris are trademarks or registered 
trademarks of Sun Microsystems, Inc. in the U.S. and other countries.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

*  Redistributions of source code must retain the above copyright notice,
    this list of conditions and the following disclaimer.

*  Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.

*  Neither the name of the Sun Microsystems, Inc. nor the
    names of its contributors may be used to endorse or promote
    products derived from this software without specific prior written
    permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS
IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

---- Part 5: Sparta, Inc copyright notice (BSD) -----

Copyright (c) 2003-2009, Sparta, Inc
All rights reserved.
 
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
 
*  Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.
 
*  Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
 
*  Neither the name of Sparta, Inc nor the names of its contributors may
   be used to endorse or promote products derived from this software
   without specific prior written permission.
 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS
IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

---- Part 6: Cisco/BUPTNIC copyright notice (BSD) -----

Copyright (c) 2004, Cisco, Inc and Information Network
Center of Beijing University of Posts and Telecommunications.
All rights reserved.
 
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
 
*  Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.
 
*  Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
 
*  Neither the name of Cisco, Inc, Beijing University of Posts and
   Telecommunications, nor the names of their contributors may
   be used to endorse or promote products derived from this software
   without specific prior written permission.
 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS
IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

---- Part 7: Fabasoft R&D Software GmbH & Co KG copyright notice (BSD) -----

Copyright (c) Fabasoft R&D Software GmbH & Co KG, 2003
oss@fabasoft.com
Author: Bernhard Penz 

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

*  Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.

*  Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

*  The name of Fabasoft R&D Software GmbH & Co KG or any of its subsidiaries, 
   brand or product names may not be used to endorse or promote products 
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER ``AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

---- Part 8: Apple Inc. copyright notice (BSD) -----

Copyright (c) 2007 Apple Inc. All rights reserved.

Redistribution and use in source and binary forms, with or without  
modification, are permitted provided that the following conditions  
are met:

1.  Redistributions of source code must retain the above copyright  
notice, this list of conditions and the following disclaimer.
2.  Redistributions in binary form must reproduce the above  
copyright notice, this list of conditions and the following  
disclaimer in the documentation and/or other materials provided  
with the distribution.
3.  Neither the name of Apple Inc. ("Apple") nor the names of its  
contributors may be used to endorse or promote products derived  
from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY APPLE AND ITS CONTRIBUTORS "AS IS" AND  
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,  
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A  
PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL APPLE OR ITS  
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,  
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT  
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF  
USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND  
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,  
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  
OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF  
SUCH DAMAGE.

---- Part 9: ScienceLogic, LLC copyright notice (BSD) -----

Copyright (c) 2009, ScienceLogic, LLC
All rights reserved.
 
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:
 
*  Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.
 
*  Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
 
*  Neither the name of ScienceLogic, LLC nor the names of its
   contributors may be used to endorse or promote products derived
   from this software without specific prior written permission.
 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT
HOLDERS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
DAMAGE.

* Company names and product names written in this document are the
  registered trademarks or trademarks of their respective companies.
