If you installed the application on localhost and all you get is the following error:

```
Microsoft VBScript runtime (0x800A01A8)
Object required: 'rs'
/cms/site/core/src/classes/class.page.asp, line 545
```

If you downloaded and installed the software to c:\Inetpub\wwwroot\,  then you did not follow the [Installation](Installation.md) instructions properly.

**You must use a Virtual Directory** for this CMS to work.

If this is not the case then please let me know otherwise how you came across this error.