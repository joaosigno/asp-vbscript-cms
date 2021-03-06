<%
function contentUpdate()
	strHeader = ("Edit "& pcase(strContent))
	if myForm.wasSubmitted() = true then 
		debugInfo("admin."& strContent &".update: form was submitted, storing to the session.")
		myForm.storeFormToSession() 
		set formErrors = myForm.getFormErrors()
		if formErrors.count = 0 then 
			debugInfo("admin."& strContent &".update: form had zero errors")
			
			
			
			dim intRole: intRole = getRoleLevel(myForm.getValue("Role"))
			if len(strError)>0 then debugError("admin."& strContent &".update: getRoleLevel Error: "& strError)
			dim active : active = iif(myForm.getValue("Disabled") <> "" , "1","0")

			strError = "an error was encountered during "& strContent &" data update to database"
			debug("admin."& strContent &".update: updating database metadata content for "& strContent &"  '"& myForm.getValue(strIdField) &"'")
			
			dim SQL_UPDATE : set SQL_UPDATE = new FastString
			
			SQL_UPDATE.add " UPDATE `"& strTableName &"` SET " & vbCrLf
			SQL_UPDATE.add "  "& strTableName &".Disabled="& active & vbCrLf
			SQL_UPDATE.add ", "& strTableName &".UserID='"& replace(myForm.getValue("UserID"),"'","''") & "'" & vbCrLf
			SQL_UPDATE.add ", "& strTableName &".FirstName='"& replace(myForm.getValue("FirstName"),"'","''") & "'" & vbCrLf
			SQL_UPDATE.add ", "& strTableName &".SecondName='"& replace(myForm.getValue("SecondName"),"'","''") & "'" & vbCrLf
			SQL_UPDATE.add ", "& strTableName &".Password='"& replace(myForm.getValue("Password"),"'","''") & "'" & vbCrLf
			SQL_UPDATE.add ", "& strTableName &".Email='"& replace(myForm.getValue("Email"),"'","''") & "'" & vbCrLf
			SQL_UPDATE.add ", "& strTableName &".Description='"& replace(myForm.getValue("Description"),"'","''") & "'" & vbCrLf
			SQL_UPDATE.add ", "& strTableName &".Phone='"& replace(myForm.getValue("Phone"),"'","''") & "'" & vbCrLf
			SQL_UPDATE.add ", "& strTableName &".Address1='"& replace(myForm.getValue("Address1"),"'","''") & "'" & vbCrLf
			SQL_UPDATE.add ", "& strTableName &".Address2='"& replace(myForm.getValue("Address2"),"'","''") & "'" & vbCrLf
			SQL_UPDATE.add ", "& strTableName &".City='"& replace(myForm.getValue("City"),"'","''") & "'" & vbCrLf
			SQL_UPDATE.add ", "& strTableName &".State='"& replace(myForm.getValue("State"),"'","''") & "'" & vbCrLf
			SQL_UPDATE.add ", "& strTableName &".PostalCode='"& replace(myForm.getValue("PostalCode"),"'","''") & "'" & vbCrLf
			SQL_UPDATE.add ", "& strTableName &".Country='"& replace(myForm.getValue("Country"),"'","''") & "'" & vbCrLf
			if not isNull(intRole) then SQL_UPDATE.add ", "& strTableName &".Role="& intRole  & vbCrLf
			SQL_UPDATE.add " WHERE "& strTableName &"."& strKey &"="& myForm.getValue(strKey) &";"
			'for debug only
			'strStatus = h3("Handwritten") &p(SQL_UPDATE.value)
			'strError = h3("Autogenerated") &p(CreateSQL("update",strTableName, myForm.Form, strKey))
			'exit function
			'writeln(InfoMessage(SQL_UPDATE.value))
			db.execute(SQL_UPDATE.value)
			SQL_UPDATE.clear
			set SQL_UPDATE = nothing
		
			strSuccess = p("The database content for "& strContent &"  '"& myForm.getValue(strIdField) &"' was updated. <br/>" & vbCrLf & _
					"Would you like to") & vbCrLf & _
					"<ul>"& vbCrLf & _
					"<li><a href='?edit="& myForm.getValue(strKey) &"'>Edit "& strContent &" '"& myForm.getValue(strIdField) &"' again</a></li>" & vbCrLf & _
					"<li><a href='?view'>View list of all  "& strContentPL &" </a></li>" & vbCrLf & _
					"<li><a href='?create'>Create a new  "& strContent &" </a></li></ul>"
			strError = ""
		else 
			strError = "The "& strContent &" update form had the following error:<br/>"& strError &"<br/>"
			contentUpdate = buildFormContents(strKey)
		end if
	else
		strError = "No  "& strContent &"  content to update!  Please <a href='?view'>Select a "& strContent &" </a> to edit."
	end if
end function

function getRoleLevel(strRole)
	getRoleLevel = null
	if strRole = "" or isNull(strRole) then
		debug("admin."& strContent &".update: no role was provided, keeping original...") 
		exit function
	elseif not isNumeric(strRole) then
		strError = "The Role '"& strRole &"'  is not a valid role level. "
		debugError(strError& "(must be numeric)")
		exit function
	end if
	on error resume next
	err.clear
	dim intRole : intRole = cint(strRole)
	if err.number > 0 then 
		strError = "The Role '"& strRole &"' is not a valid role level."
		debugError(strError& "("& err.description &")")
		exit function
	end if
	'dim rs : rs = db.getRecordSet("SELECT * FROM tblUserRoles WHERE id="& intRole)
	'if rs.state > 0 then 
		'if rs.recordcount > 0 then 
			dim level : level = Cint(strRole)'CInt(rs("Level"))
			if user.getRole() < USER_MANAGER then 
				strError =  "You do not have enough priviledges to change the user role."
				exit function
			end if
			getRoleLevel=level
		'else
		'	strError = "The Role '"& strRole &"'  is not a valid role level."
		'	debugError(strError& " (database returned no result)")
		'	exit function
		'end if
	'else
	'	strError = "User Roles could not be found in the database."
	'	exit function
	'end if
	'rs.close
	'set rs = nothing
end function
%>