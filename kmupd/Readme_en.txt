==========================================================================================
KONICA MINOLTA Universal Printer Driver PCL/PS/PCL5
Printer Software Document
02/20/2020

PCL  Version 3.7.0.0
PS   Version 3.7.0.0
PCL5 Version 3.7.0.0
Printer Installer Version 3.2.6.0
PCL  Setup Package Version 3.7.0.0
PS   Setup Package Version 3.7.0.0
PCL5 Setup Package Version 3.7.0.0

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
This printer driver is a software that controls KONICA MINOLTA Multi Function Printer.
This is required to print with KONICA MINOLTA Multi Function Printer from your PC.

Supported devices :
    Baseline
    KONICA MINOLTA A3 common
    KONICA MINOLTA A4 common
    KONICA MINOLTA 501/421/361
    KONICA MINOLTA 751/601
    KONICA MINOLTA 362/282/222
    KONICA MINOLTA C652(DS)/C552(DS)/C452
    KONICA MINOLTA C360/C280/C220
    KONICA MINOLTA C35/C25/C35P/mc4750
    KONICA MINOLTA 751/601(Sol-ROM)
    KONICA MINOLTA 423/363/283/223
    KONICA MINOLTA 652/602/552/502
    KONICA MINOLTA 20
    KONICA MINOLTA 20P
    KONICA MINOLTA 42/36(EU/JP)
    KONICA MINOLTA 42/36
    KONICA MINOLTA C754(e)/C654(e)
    KONICA MINOLTA 195/215/235
    KONICA MINOLTA C554(e)/C454(e)/C364(e)/C284(e)/C224(e)
    KONICA MINOLTA 754(e)/654(e)
    KONICA MINOLTA 4700P/4000P/3300P/3301P
    KONICA MINOLTA 554e/454e/364e/284e/224e
    KONICA MINOLTA C3850/C3350/C3850FS
    KONICA MINOLTA 4020/3320
    KONICA MINOLTA 4750/4050
    KONICA MINOLTA 25e
    KONICA MINOLTA C3100P
    KONICA MINOLTA C3110
    KONICA MINOLTA C281/C221/C221s
    KONICA MINOLTA 367/287/227
    KONICA MINOLTA C368/C308/C258
    KONICA MINOLTA C287/C227
    KONICA MINOLTA 958/808/758
    KONICA MINOLTA C658/C558/C458
    KONICA MINOLTA 350/250/200
    KONICA MINOLTA C650/C550/C451
    KONICA MINOLTA C353/C353P/C253/C203
    KONICA MINOLTA 368/308
    KONICA MINOLTA 558/458
    KONICA MINOLTA C266/C226
    KONICA MINOLTA C3851/C3351/C3851FS
    KONICA MINOLTA 658e/558e/458e/368e/308e
    KONICA MINOLTA C759/C659
    KONICA MINOLTA 4702P/4402P/3602P
    KONICA MINOLTA 4422/3622
    KONICA MINOLTA 4752/4052
    KONICA MINOLTA WPH
    KONICA MINOLTA PullPrinting
    KONICA MINOLTA C360i
    KONICA MINOLTA C300i
    KONICA MINOLTA C250i
    KONICA MINOLTA C4050i
    KONICA MINOLTA C3350i
    KONICA MINOLTA C3320i
    KONICA MINOLTA C4000i
    KONICA MINOLTA C3300i
    KONICA MINOLTA 306i
    KONICA MINOLTA 266i
    KONICA MINOLTA 246i
    KONICA MINOLTA 226i
    KONICA MINOLTA 5020i
    KONICA MINOLTA 5000i
    KONICA MINOLTA 4020i
    KONICA MINOLTA 4000i
    KONICA MINOLTA C650i
    KONICA MINOLTA C550i
    KONICA MINOLTA C450i
    KONICA MINOLTA 650i
    KONICA MINOLTA 550i
    KONICA MINOLTA 450i
    KONICA MINOLTA 360i
    KONICA MINOLTA 300i
    KONICA MINOLTA C750i
    KONICA MINOLTA 750i
    KONICA MINOLTA 4750i
    KONICA MINOLTA 4050i
    KONICA MINOLTA 4700i
    KONICA MINOLTA C287i
    KONICA MINOLTA C257i
    KONICA MINOLTA C227i
    KONICA MINOLTA C286i
    KONICA MINOLTA C266i
    KONICA MINOLTA C226i

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
    Windows 10 *
    Windows 10 Pro *
    Windows 10 Enterprise *
    Windows 10 Education *
    Windows Server 2016 Standard
    Windows Server 2016 Datacenter
    Windows Server 2016 Essentials
    Windows Server 2019 Standard
    Windows Server 2019 Datacenter
    Windows Server 2019 Essentials

    * 32-bit (x86) and 64-bit (x64) editions of Windows are supported.

//////////////////////////////////////////////////////////////////////////////////////////
4. Changes to this printer driver from an earlier version
//////////////////////////////////////////////////////////////////////////////////////////

  PCL/PS/PCL5 Version 3.7.0.0

==========================================================================================
4-1. Support the following models.
==========================================================================================
  KONICA MINOLTA 650i
  KONICA MINOLTA 550i
  KONICA MINOLTA 450i
  KONICA MINOLTA 360i
  KONICA MINOLTA 300i
  KONICA MINOLTA C750i
  KONICA MINOLTA 750i
  KONICA MINOLTA 4750i
  KONICA MINOLTA 4050i
  KONICA MINOLTA 4700i
  KONICA MINOLTA C287i
  KONICA MINOLTA C257i
  KONICA MINOLTA C227i
  KONICA MINOLTA C286i
  KONICA MINOLTA C266i
  KONICA MINOLTA C226i

==========================================================================================
4-2. Update the following models.
==========================================================================================
  KONICA MINOLTA C360i
  KONICA MINOLTA C300i
  KONICA MINOLTA C250i
  KONICA MINOLTA C4050i
  KONICA MINOLTA C3350i
  KONICA MINOLTA C3320i
  KONICA MINOLTA C4000i
  KONICA MINOLTA C3300i
  KONICA MINOLTA 306i
  KONICA MINOLTA 266i
  KONICA MINOLTA 246i
  KONICA MINOLTA 226i
  KONICA MINOLTA C650i
  KONICA MINOLTA C550i
  KONICA MINOLTA C450i

==========================================================================================
4-3. The following issue is solved in this driver.
==========================================================================================
 1 .When printing in grayscale,
    printing speed is slower than color.
    (PCLXL)

 2 .Event 1000 error occurs in Citrix environment.
    (PCL5)

 3. Suppress automatic generation of "snmpapp.conf".
@@(PCLXL/PS/PCL5)

//////////////////////////////////////////////////////////////////////////////////////////
5. How to install/uninstall
//////////////////////////////////////////////////////////////////////////////////////////
There are two methods for installing this printer driver: automatic installation 
using an installer or manual installation using Add Printer. These two methods 
are described in the following sections.
The following is a description for Windows 7. See Installation guide or Reference 
guide for details and for other OS.

==========================================================================================
5-1. Cautions when installing
==========================================================================================
Please read the following notes before use.

 1. When you start the installer and install the printer, it is necessary to log 
    in by the user who has the administrator power to the installing computer.

 2. When you selected a printer which belongs to one of computers in "WORKGROUP"
    of "My Network" and installed the printer driver, you may not open the printer 
    property of the installed printer.
    ==>In this case, please install the printer driver by its installer.

 3. When you installed the network printer by using [Browse for Printer] in 
    [Printers and Faxes] folder, you may not open the printer property of 
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

 1. If your PC is 32-bit environment, please use "UPDSetup.exe". If your PC is 64-bit environment, 
    please use "UPDSetup64.exe". And follow the onscreen wizard to do installation.

 2. Read the contents of the displayed [Installer license agreement] screen.
    Click [AGREE] button, and then follow the instructions that appear on the 
    screen to complete the installation. 
    If you click [DISAGREE], the screen returns to the main menu screen and the 
    installation is cancelled.

==========================================================================================
5-3. Manual installation using Add Printer
==========================================================================================

Try the following manual installation steps if you cannot install from install program.

 1. Open Devices and Printers by clicking the [Start] button , and then, 
    on the Start menu, clicking Devices and Printers.

 2. Click [Add a printer].

 3. Set the printer port based on printer connections.

   3-1. When you create a port on a network connection (LPR/Port9100)
    3-1-1. Click [Add a local printer]
    3-1-2. Select [Create a new port] and choose [Standard TCP/IP Port] for 
           the [Type of port]. Click [Next].
    3-1-3. Change [Device type] to [TCP/IP Device] and type the IP address 
           of the printer into the [Hostname or IPaddress] field.Click [Next].
    3-1-4. Select [Custom] from [Device type] and click [Settings].
    3-1-5. Change settings to suit the port and click [OK].
           For LPR connection, click [LPR], and then enter [lp] in the [Queue Name] box.
           For Port9100, click [RAW], and then enter the RAW port number (the default 
           setting is "9100") in the [Port Number] box.
    3-1-6. Click [Next].

   Skip to step 4.

   3-2. When you search for printers on network connection (LPR/Port9100)
    3-2-1. Turn on the power of the machine while it is connected to the network.
    3-2-2. Click [Add a network, wireless or Bluetooth printer].
           Connected printers are detected. It may take a long time to find all printers.
    3-2-3. In the list of available printers, select the one you want to use, 
           and then click [Next].
           If more than one printer is detected, select the printer with IP address of 
           this machine.
    3-2-4. Select [Custom] from [Device type] and click [Settings].
    3-2-5. Change settings to suit the port and click [OK].
           For LPR connection, click [LPR], and then enter [lp] in the [Queue Name] box.
           For Port9100, click "RAW", and then enter the RAW port number (the default 
           setting is "9100") in the [Port Number] box.
    3-2-6. Click [Next].

   Skip to step 4.

   3-3. When you search for printers on network connection (IPP)
    3-3-1. Turn on the power of the machine while it is connected to the network.
    3-3-2. Click [Add a network, wireless or Bluetooth printer].
    3-3-3. In the dialog box, click [The printer that I want isn't listed].
    3-3-4. In the URL field in the next dialog box enter the printer's 
           network pathname in one of the following formats and then choose [Next]:
           http://<IP_address_for_this_machine>/ipp

 4. Click [Have Disk].

 5. Click [Browse].

 6. Locate the directory where the printer driver files are located 
    and then click "Open". Select the directory depending on using printer driver, 
    OS, and language.

 7. Click [OK].

 8. Click [OK] or [Next].

 9. Follow the on-screen instructions.

 10. Click [Finish].

This completes the printer driver installation.

 11. When installation is complete, make sure that the icon of the installed printer 
     appears in the [Printers] window.

==========================================================================================
5-4. How to automatically uninstall the print driver from the [Start] menu
==========================================================================================
If you installed the printer driver using an installer program, the printer driver 
delete function is included.
- You must have administrative rights on the computer to uninstall the printer driver.

 1. Click Start and then click All Programs.

 2. Click [KONICA MINOLTA] from the displayed menu.

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

 1. If your PC is 32-bit environment, please use "UPDSetup.exe". If your PC is 64-bit environment, 
    please use "UPDSetup64.exe". And follow the onscreen wizard to do installation.

 2. The [Installer license agreement] screen will apperar.  Click the [Agree] button 
    to proceed.

 3. Select [Delete] and click next.

 4. Select the printer driver to be deleted from [Uninstall Printer Driver], and then 
    click [Uninstall].
    To complete the uninstall printer driver procedure, follow the directions provided 
    by the Wizard.

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

 4. Click one of the printer icons displayed in [Printers and Faxes], 
    and click [Print server property] on the toolbar.

 5. Click the [Driver] tab.

 6. Click [Changing print driver settings].

 7. Select the printer driver to be deleted from the Installed Printer Drivers list, 
    and then click [Delete].

 8. Select [Remove driver and driver package] on [Remove Driver And Package] screen 
    and click [OK].

 9. When you are prompted to confirm the deletion, click [Yes].

 10. When you are prompted to confirm the deletion again, click [Delete].

 11. Close the [Print Server Properties] dialog box, and then restart the computer.

This completes the uninstallation procedure.

//////////////////////////////////////////////////////////////////////////////////////////
6. File Composition
//////////////////////////////////////////////////////////////////////////////////////////

[UPDSetup_Own_PCL_3.7.0.0]Folder
 |- [Drivers]
  |- [Win_x64]
  |- [Win_x86]
 |- [Sub]                        MulitLangageFile/HelpFile
  |- [Lang]                      MulitLangageFile
 |- [UPDSetup64.exe]             Installer(64-bit)
 |- [UPDSetup.exe]               Installer(32-bit)
[UPDSetup_Own_PS_3.7.0.0]Folder
 |- [Drivers]
  |- [Win_x64]
  |- [Win_x86]
 |- [Sub]                        MulitLangageFile/HelpFile
  |- [Lang]                      MulitLangageFile
 |- [UPDSetup64.exe]             Installer(64-bit)
 |- [UPDSetup.exe]               Installer(32-bit)
[UPDSetup_Own_PCL5_3.7.0.0]Folder
 |- [Drivers]
  |- [Win_x64]
  |- [Win_x86]
 |- [Sub]                        MulitLangageFile/HelpFile
  |- [Lang]                      MulitLangageFile
 |- [UPDSetup64.exe]             Installer(64-bit)
 |- [UPDSetup.exe]               Installer(32-bit)

//////////////////////////////////////////////////////////////////////////////////////////
7. How to check the version in a printer driver
//////////////////////////////////////////////////////////////////////////////////////////
The version information appears by selecting the following from the print settings of 
the driver in the printer folder after installing the printer driver.

  - PCL/PS/PCL5
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

 1. When you perform printing using the application, 
    if you click <Printer Properties> while the print queue status is in the process of connecting, 
    an Error message is displayed.

    Workaround: Click the <Printer Properties> after the print queue status is ready.

 2. When you perform printing using the application (MSPaint.exe), 
    if you click <Printer Properties> of the print queue whose Device 
    Information has not been acquired, an Error message is displayed.

    Workaround: Perform printing using the application after acquiring the Device Information 
    from <Devices and Printers>.

 3. The Universal Print Driver does not work normally if EasyPrint setting in 
    MS Terminal Services Environment is disabled.

    Workaround: Enable EasyPrint setting.

 4 .About display of favorite setting
    In case of model does not support watermark function, watermark function is displayed
    in favorite setting.

 5 .In case of printing on specific model
    When printing the document that has objects drawn on the edge of paper, 
    The following models has a defect of about 2 mm in some case. 
    (PS/PCL5 driver)
      - KONICA MINOLTA bizhub 4700P/4000P/3300P/3301P/4020/3320/
                              4702P/4402P/3602P/4422/3622/
                              5020i/5000i/4020i/4000i

    Workaround: Use PCL6 driver

 6 .About language settings
    When you change the language setting,
    language setting of another printer created with same driver is changed.

 7 .About Import/Export of favorite setting
    "favorite setting" exported with v3.5.0.0 or earlier drivers cannot imported
    by v3.6.0.0 or later drivers.

    Workaround: Export after updating to v3.6.0.0 or later.

 8 .About Favorite settings when updating drivers
    When model changed after the update from the driver before v3.5.0.0,
    Favorite settings of different models are inherited.

    Workaround: Perform one of the following procedures.
      - Not change model after the update.If you want to change it,
        recreate Favorite Settings.

      - Perform the following procedure.
        1 .Open [printer property]
        2 .[General]Tab -> [Preferrence]
        3 .[Favorite Setting] -> [Edit...]
        4 .[Edit Favorite Setting]Dialog -> [OK]

==========================================================================================
8-2. Attentions and Restrictions when using a PCL5 driver
==========================================================================================

 1. If "Enable advanced printing features" is enabled, 
    Poster setting is not reflected on the printed result because Poster function is 
    disabled internally.

 2. If Overlay is used in Point and Print environment, 
    the following functions are not able to be used at the same time. 
      (The following functions become disabled.)
      N-up, Poster Printing, Booklet, Zoom, Binding Margin Shift, Image Shift, Watermark

 3. If N-up and Booklet are configured at the same time, 
    a part of the printed image is cut (the image is printed on a slant).

 4. If poster print and following functions is set same time, print result is not correct. 
      - front cover / back cover, watermark, overlay, long paper

 5. In point and print environment, following function is not printed correctly. 
         - per page setting, user authentication, security print
     Workaround: Disable the group policy of "Always render print jobs on the server".

 6. If print on long paper with long side exceeding 1155.9 mm, 
    a part of the printed image is cut.

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
