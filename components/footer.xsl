xml version=1.0 encoding=utf-8

xslstylesheet version=1.0
xmlnsxsl=httpwww.w3.org1999XSLTransform


xsltemplate name=salutation

xsltemplate

xsltemplate name=contactUs
	table align=left
	tr
		td align=left
			axslattribute name=href@@email_contact_us@@xslattribute@@contact_us@@a
		td
	tr
	table
xsltemplate
xsltemplate name=myAccount
	table align=right
	tr
		td align=right
			axslattribute name=href@@email_my_account@@xslattribute@@my_account@@a
		td
	tr
	table
xsltemplate

xsltemplate name=lastFooter
	table
	xslattribute name=style
		xslcall-template name=footerTableStyleCss  !-- style.xsl --
	xslattribute
	tr
	xslfor-each select=notification_dataorganization_unit
		xslattribute name=style
			xslcall-template name=listStyleCss  !-- style.xsl --
		xslattribute
			td align=centerxslvalue-of select=name&#160;xslvalue-of select=line1&#160;xslvalue-of select=line2&#160;xslvalue-of select=city&#160;xslvalue-of select=postal_code&#160;xslvalue-of select=countrytd
	xslfor-each
	tr
	table
       br
	
	xslcall-template name=contactUs 
	xslcall-template name=myAccount 
       br
	
xsltemplate





xslstylesheet