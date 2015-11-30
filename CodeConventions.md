# Coding Standards #

Coding standards are Language-level standards, and to be honest, ASP VBScript doesnt have many.  The VBScript language itself is case-insensitive. Newlines are important, indentation is not, and there is only one form of comments.  We have to instate some code-level conventions to follow to improve code readability and sanity, which will be a major contributing factor to long-term maintainability. As this project is not under continual development, easy-to-read code will be of huge importance to be able to come back to pick up on after leaving the code sitting for years on end :)

**Options Explicit**

VBScript is a lazy language, its of extreme importance for code maintainability to force all variables to be declared before instantiation.

If you're working on the codebase, you don't need to worry about this, as options explicit is set during application loading. (See `core/include/bootstrap.asp` for details.)

# Coding Conventions #


**Indentation**

Use tabs to indent your code. You should configure your code editor to set the tabstop to 4 spaces.

**Case**

VBScript is case-insensitive.  This tends to result in sloppy inconsistencies, and less readable / maintainable code. Here are our suggested conventions for a consistent use of case throughout the application:

Use lowercase for global and local variables.
```vb

' Intialize the global filesystem object.
dim fs : set fs = Server.CreateObject("Scripting.FileSystemObject")
```

Use uppercase for constants.
```vb

' Default page encoding.
const DEFAULT_ENCODING = "utf8"
```

Prefix class variables with `m_`.
```vb

class HappyNewYear

private m_message

private m_date

public sub class_initialize()
m_date = "01-01-" & year()
m_message = "Happy New Year"
end sub

public function celebrate()
celebrate = m_message
end function

end class
```

Use lowercase for [VBScript statements](http://msdn.microsoft.com/en-us/library/7aw9cadb.aspx):
```vb

if..then..else...end if
while...wend
for each...next
do...while
class public private
function sub
get let set
```

Use lowercase for [VBScript functions](http://msdn.microsoft.com/en-us/library/3ca8tfek.aspx)
```vb

x = cstr(abs(y + 1000))
```

Use suggested mixed-case for language-specific VBScript Constants,  eg vbCrLf.
```vb

Response.Write("Hello world, followed by a newline." & vbCrLf)
```

Use uppercase for [VBScript keywords](http://msdn.microsoft.com/en-us/library/f8tbc79x.aspx):
```vb

x = TRUE
x = FALSE
x = NULL
x = EMPTY
set x = NOTHING
```

Use capitalization for [VBScript Global System Objects](http://msdn.microsoft.com/en-us/library/22h7a6k8.aspx) and their [Properties](http://msdn.microsoft.com/en-us/library/31y4b91d.aspx) and **Methods**,  but use lowercase for instantiations and local objects.
```vb

' Example 1: VBScript Err object.
if Err.Number <> "" then
Response.Write Err.Description
Err.Clear
end if
' Example 2: VBScript Server object used to instantiate a file_system object.
dim file_system : set file_system = Server.CreateObject("Scripting.FileSystemObject")
' Example 3:  Custom Logger class.
dim log : set log = new CmsLogger
log.error("this is an error message")
```

### Whitespace ###

Remove all trailing whitespace when saving your code.

Separate commands with a newline.  The one exception is for declaring variables.  Since we use `Options Explicit` it is possible to chain the definition and the variable assignment on a single line, using a **colon** to separate the two commands.

```vb

dim products : set products = Server.CreateObject("Scripting.Dictionary")
```

Use a single whitespace to separate [VBScript Operators](http://msdn.microsoft.com/en-us/library/1cbft50a.aspx) in:
```vb

'*Assignments* need appropriate whitespace.
'incorrect:
x=y
'correct:
x = y

'*Logical operands* (required by language)
'correct:
if x and y or z then

'*String Concatenation* need appropriate whitespace.
'incorrect:
x = x&y&z&"<br/>"
'correct
x = x & y & z & "<br/>"

'*Expressions* need appropriate whitespace.
'incorrect:
if x<>"" then
if x=5 then
'correct:
if x <> "" then
if x = 5 then

'*Math calculations* need appropriate whitespace.
'incorrect:
y=y+1
'correct:
y = y + 1
```


### Parentheses ###

Do not use whitespace inside parentheses:

```vb

'*Order of Operation* need appropriate whitespace.
'incorrect:
if ( x and y ) or z then
'correct:
if (x and y) or z then

'*Nested parentheses* need appropriate whitespace.
'incorrect:
if ( cstr( x ) <> cstr ( y ) ) or z then
'correct:
if (cstr(x) <> cstr(y)) or z then
```

If using parentheses to group expressions in conditional statements, use a single whitespace after the if.