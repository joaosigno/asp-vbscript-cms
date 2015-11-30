Open **Windows Explorer** to the parent folder where asp-vbscript-cms folder resides.

  1. Ensure that the **Advanced Security** tab exists on the Properties menu. If not, then:
    * From the Explorer Menubar, select:  Tools > Folder Options...
    * Then select the "View" tab.
    * Disable "Use simple file sharing (recommended)".
    * Click Apply, then OK, to close the Folder Options dialog window.
  1. **Right click** the asp-vbscript-cms folder, select **Properties**.
  1. Open the **Security** tab.
  1. Click the **Add..** button to open the "Select Users or Groups" window.
  1. Click the **Advanced** button.
  1. Click the **Find Now** button.
  1. Find the user whose name starts with **IUSR** (the complete name should be "IUSR\_YOUR-MACHINE-NAME").
  1. Select the IUSR and click the **OK** button to return to the "Select Users or Groups" window.
  1. Click again the **OK** button to close the "Select Users or Groups" window.
  1. Back again in the **Security** tab, select the IUSR account we just added from the listing of Groups and users.
  1. In the permissions table, enable the **Full Control** checkbox for the IUSR.
  1. Click **Apply**, then Ok, to close the Properties dialog window.

Refresh your browser to see if the changes took effect.