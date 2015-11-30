# Introduction #

There are various aspects of the CMS that are incomplete, or where the implementation could be improved. Feel free to contribute ideas in the comments.

## Improvements ##

  * Improve global variable and token support.
  * Better error handling and messaging.
  * Standardize and improve ModuleAPI (currently only one hook: getContents() )
  * Distinguish between modules and blocks.
  * Re-define 'module locations'  as 'block regions'.
  * Improve template system and add multiple/customized theme support.
  * Move database schema to code, allowing for easy installation, migrations, and updates.
  * Support for installation and upgrade scripts to build the database from code-based schema info in the code.

## General and ongoing code cleanup ##
  * Instate and follow [CodeConventions](CodeConventions.md)
  * Improve code readability.
  * Improve code / comment ratio.
  * Remove trailing whitespace.
  * Remove variant-type elements from variable names. (eg strProductName --> product\_name)
  * Remove 'tbl' prefixes from database tables.