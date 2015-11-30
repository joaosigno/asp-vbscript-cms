![http://asp-vbscript-cms.googlecode.com/files/Logo.jpg](http://asp-vbscript-cms.googlecode.com/files/Logo.jpg)

ASP VBScript CMS is a pure [Classic ASP](http://en.wikipedia.org/wiki/Classic_ASP) web application targeted to small businesses needing a quick and easy Content Management System.  It is built with a modular approach to XHTML + CSS framework in mind.

**CMS Features:**
  * easy to use WYSIWYG editor (Dojo)
  * page version control
  * multi-lingual sites
  * XHTML standards compliant html code generation
  * Modular [CSS Framework](CssFramework.md) included (great for Designers looking for quick turnaround!)
  * Ability to upload and manage files (File Upload Manager)
  * Search engine friendly, human-readeable URLs based on actual file system page paths (ex, `domain.com/path/to/page-name.asp` instead of `domain.com/Article.asp?id=23`)
  * framework for extending functionality (aka, modules / plugins)
  * automatic generation of weighted Google xml sitemap
  * a hand full of fully integrated modules
    * simple product display and organization (no ecommerce gateways at this point)
    * rss feed aggregator
    * an extensible form creation module
    * lytebox gallery module
    * html snippets module
    * random content module
    * rotating banner module
  * ability to easily re-brand the CMS for your company complete with sitewide global variables including:
    * branded cms logo image path
    * branded cms product name
    * producer name (your company's name)
    * producer support email / contact email
    * branded cms favicon
  * seamlessly switch between localhost development configuration and production server without changing any config files.
  * quick and easy [Installation](Installation.md) and setup for new projects.

**Common CMS features that have been left out:**

  * **Blogs.** Although its quite possible for someone to contribute a module for blogging, there's already so many blog solutions out there, we haven't bothered to reinvent the wheel for this CMS. We've stuck to the concept of "pages".  You may "aggregate" your external blog entries into a page on your site via the RSS aggregation module.


**Technical Details:**

  * [Classic ASP](http://en.wikipedia.org/wiki/Classic_ASP) 3.0 VBScript + very small pieces written in server-side ASP [JScript](http://en.wikipedia.org/wiki/JScript)
  * MS Access (.mdb) database format
  * Tested on IIS 5.0 localhost (standard with Windows XP)
  * Tested on IIS 6.0 production server (standard at most Windows-based web hosting environments)


**Project Dependencies:**

  * Dojo Toolkit (via AOL CDN)
  * Tango Icon Theme (embedded)

**Documentation and Testing:**

  * code comment coverage hasn't been measured but _some_ documentation does exist for parts of the code that could easily be reused in other projects. An attempt has been made to conform and update to a doxygen format compatible with ASP syntactical comments.
  * test coverage hasn't been measured but _some_ hand-made tests were done and included in the development branch. There is no general purpose testing framework (unit or otherwise) that I know of for ASP :/

**Questions / Comments**

asp.vbscript.cms  (at) G.m.A.i.L  (lowercase without the dots)  PERIOD (com)