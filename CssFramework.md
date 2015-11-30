ASP VBScript CMS employs a modular CSS Framework based on ideas formulated by [Mike Stenhouse](http://contentwithstyle.co.uk/content/modular-css/) in 2007.

Mike's CSS Framework is a really clever thing.  His ideas applied to ASP VBScript CMS have resulted in the following:

  1. Maintain an in-built template system that generates the _same_ container HTML -- aka page template -- across all CMS installations. You may of course customize the template file ([/site/core/include/template.asp](http://asp-vbscript-cms.googlecode.com/svn/trunk/site/core/include/template.asp)) but its not necessary if you follow the Framework.
  1. Maintain a set of css layouts stylesheets akin to wireframes (eg, 2-column, 3-column, horizontal or vertical navbar).  The CMS comes with a handful of layouts in the [/site/styles/css-framework/](http://asp-vbscript-cms.googlecode.com/svn/trunk/site/styles/css-framework/) folder.
    * layout-navleft-1col.css
    * layout-navleft-2col.css
    * layout-navoff-1col.css
    * layout-navtop-1col.css
    * layout-navtop-3col.css
    * layout-navtop-localleft.css
    * layout-navtop-subright.css
  1. Override the base wireframe with a custom design that changes for every site, but holds the styles that stay the same across all different page layouts (eg, color scheme and background images). Typically the custom design css file is quite poorly named [styles/css-framework/layout.css](http://asp-vbscript-cms.googlecode.com/svn/trunk/site/styles/css-framework/layout.css); however, you're free to rename it to something more logical like project\_name.css, style.css, or design.css.
  1. Keep standard functionality and common styles that all pages use modular.
  1. Combine the wireframes, standard, and the layout.css together in new stylesheets located in the [/site/styles/](http://asp-vbscript-cms.googlecode.com/svn/trunk/site/styles/) folder.

Note that the last step is _the key_. Stylesheets with the various various layouts you've implemented in the /site/styles/ folder get exposed to the CMS admin panel.  Page layout can be changed on the fly in the admin control panel via a drop-down form select box. These styles are also enabled for quick prototyping (see below).

## Quick Prototyping ##

On any page in your site, you can test out any of the page layouts exposed by the /site/styles/ folder by adding a query string to the url. For example: ?css=main.css   or ?css=main-1col.css

If you've got the demo installed. Try this:

  * http://localhost/cms/contact.asp
  * http://localhost/cms/contact.asp?css=main-1col
  * http://localhost/cms/contact.asp?css=sub

Although its currently not implemented you could use this existing functionality to set up a "print.css" layout as well.