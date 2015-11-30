ASP VBScript CMS is built for rapid configuration AND deployment to enable you to get your client sites up as quickly as possible. There are as little as 3 steps to getting setup on localhost.

_NOTE:_ We tend towards the lemma of _convention over configuration_, so if you're cool with that, things will be much quicker to setup.  Of course, however, if your dev or production environment is more customized, the cms facilitates easy changes to fit your needs.




# Fast Install #

  1. Download and unzip a [FeaturedRelease](http://code.google.com/p/asp-vbscript-cms/downloads/list?q=label:Featured) (eg, asp-vbscript-cms\_x.x.zip) in your My Documents folder.
  1. Add `IUSR_` permissions to the folder you just created `My Documents\asp-vbscript-cms` (See [HowTo](PermissionsError.md) for instructions.)
  1. Add a Virtual Host in IIS administrator with:
    1. Alias:  `cms`
    1. Directory:  `C:\Documents and Settings\USER NAME\My Documents\asp-vbscript-cms\site\`
  1. Open your favorite webbrowser to `http://localhost/cms/`

# Detailed Customization Instructions #

This section shows you how easy it is to create multiple instantiations of the cms, to get you off the ground running with various projects quickly.

  1. Setup a projects directory
  1. Download, Unzip, and create a new project.
  1. Rename the database file.
  1. Update the SOURCEID in the configuration file.
  1. Create the virtual directory in IIS.

## 1) Setup your projects directory. ##

Suppose you're going to be turning out various web projects quickly. I would setup a specific project directory to keep everything organized. It can can be anywhere you like. I recommend either creating a project folder in the root folder of your local disk, or in your personal user's folder.

  * `C:\Projects\`
  * `C:\Documents and Settings\username\My Documents\Projects\`

_NOTE: Its not recommended to put projects directly in the wwwroot (`C:\Inetpub\wwwroot\`) because the db/ and collateral/ folders are exposed. It is preferred to use external folders + virtual directories always._

## 2) Download, Unzip, and create a new project. ##

Download and unzip a [FeaturedRelease](http://code.google.com/p/asp-vbscript-cms/downloads/list?q=label:Featured) (eg, asp-vbscript-cms\_x.x.zip) to your projects directory.

Rename the unzipped folder `asp-vbscript-cms` to the name of the project you are creating. For our purposes, we'll be creating a project "new\_project", thus we get:

  * `C:\path\to\new_project\`  to mean the project path
  * `C:\path\to\new_project\site\`  to mean the site root

_TIP_: Creating a Project name, also referred to as the SOURCEID in the code, is best to keep it short and no funny characters.  Please use lowercase letters, and employ underscores and dashes only if absolutely necessary.

The standard project folder structure looks like this:

```
project_name\
.\db\   <-- database file sits outside the site root
.\site\ <-- site web root
.\site\core\  <-- all CMS core files
.\site\admin\ <-- CMS Administration interface 
.\site\modules\ <-- the modules folder
.\site\ 
.\collateral\  <-- any project collateral (information architecture doc, pdfs, psds, etc)
```


## 3) Rename the database file. ##

The system loader demands that the database must be named the same as the project name.

Rename `.\db\cms.mdb`  to: `.\db\project_name.mdb`

_At this time only Microsoft Access MDB files are supported by ASP VBScript CMS._


## 4) Update the project config file's SOURCEID. ##

Open the file `.\site\core\configuration.asp` and change the `SOURCEID` string to match db name and project name.

## 5) Create the virtual directory. ##

In IIS Administrator, add a new virtual directory using the SITE folder (ex, `C:\path\to\project_name\site\` folder.  **You must name the virtual directory the same name as the project name, database file name, and SOURCEID in the previous steps.**

Now your done setting up the CMS on localhost you will be able to access your new site's front end here:

  * http://localhost/project_name/
  * http://localhost/project_name/admin/
    * user: `admin`
    * pass: `password`


# Installing to Production Server #

If you're not installing ASP VBScript CMS on your local machine (a.k.a localhost), it requires a little bit different configuration to work correctly. Initially the CMS was designed with a dual configuration in mind, so that we could deploy code/files to a production server without the need to maintain different configuration files. The bootstrap knows how to detect if the server is a testing/development server or a live site by looking at the url.

There was also the issue of maintaining a legacy folder structure on the production server that doesn't follow the typical development project folder structure.  This has yet to be cleaned out of the code. For now suffice it to say that it works like this:

```
c:\Path\To\My Webhost\wwwroot\
c:\Path\To\My Webhost\wwwroot\new_project\  <-- configure this folder to be the site root for a specific domain in the web hosting admin panel. 
c:\Path\To\My Webhost\wwwroot\db\new_project\new_project.mdb
```

Effectively the development folder called 'site' gets uploaded and renamed to the project name, and the database for that project gets added to the db folder (outside the project folder).

Have a look in `.\site\core\configuration.asp` and `.\site\core\config\globals.asp` to get an idea of what kind of variables can be easily manipulated to customize your configuration.

# Troubleshooting on Localhost #

**500 Server Error upon installation?**

Check out [ErrorObjectRequiredRS](ErrorObjectRequiredRS.md)  you probably installed the software incorrectly.

**Getting strange errors creating new pages in the admin?**

In order to create pages, IIS must be given permission to create files in your project folder.  The `IUSR_` must have write permissions on the `.\site\` folder. For more info see PermissionsError.

This was my solution to getting around not having a url rewrite module available on the production server (1and1.com).

The file created can be placed in subfolders and its contents are simply an include of `404.asp`. This script "drives" everything on the site with respect to url interpretation and grabbing the appropriate content from the database.