<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="senderReceiver">
<table cellspacing="0" cellpadding="5" border="0" width="100%">
	<tr>
		<!-- display user or receiver --> 
		<td width="50%">
		<xsl:choose>
			<xsl:when test="notification_data/user_for_printing">
				<table cellspacing="0" cellpadding="5" border="0">
					<xsl:attribute name="style">
						<xsl:call-template name="listStyleCss" /> <!-- style.xsl -->
					</xsl:attribute>
					<tr><td><b><xsl:value-of select="notification_data/user_for_printing/name"/></b></td></tr>
					<tr><td><xsl:value-of select="notification_data/user_for_printing/address1"/></td></tr>
					<tr><td><xsl:value-of select="notification_data/user_for_printing/address2"/></td></tr>
					<tr><td><xsl:value-of select="notification_data/user_for_printing/address3"/></td></tr>
					<tr><td><xsl:value-of select="notification_data/user_for_printing/address4"/></td></tr>
					<tr><td><xsl:value-of select="notification_data/user_for_printing/address5"/></td></tr>
					<tr><td><xsl:value-of select="notification_data/user_for_printing/city"/> &#160;<xsl:value-of select="notification_data/user_for_printing/state_province"/>&#160;<xsl:value-of select="notification_data/user_for_printing/postal_code"/></td></tr>
					<tr><td>&#160;<xsl:value-of select="notification_data/user_for_printing/country"/></td></tr>
				</table>
			</xsl:when>
 			<xsl:when test="notification_data/receivers/receiver/user">
				<xsl:for-each select="notification_data/receivers/receiver/user">
					<table>
						<xsl:attribute name="style">
							<xsl:call-template name="listStyleCss" /> 
						</xsl:attribute>

						<tr><td><b><xsl:value-of select="last_name"/>&#160;<xsl:value-of select="first_name"/></b></td></tr>
						<tr><td><xsl:value-of select="user_address_list/user_address/line1"/></td></tr>
						<tr><td><xsl:value-of select="user_address_list/user_address/line2"/></td></tr>
						<tr><td><xsl:value-of select="user_address_list/user_address/city"/>&#160;<xsl:value-of select="user_address_list/user_address/state_province"/>&#160; <xsl:value-of select="user_address_list/user_address/postal_code"/></td></tr>
						<tr><td><xsl:value-of select="user_address_list/user_address/country"/></td></tr>
					</table>
				</xsl:for-each>
			</xsl:when>  
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
		</td>		<!-- display sender --> 
		<td width="50%" align="right">
			<xsl:for-each select="notification_data/organization_unit">
			<table>
				<xsl:attribute name="style">
					<xsl:call-template name="listStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>

				<tr><td><xsl:value-of select="name"/></td></tr>
				<tr><td><xsl:value-of select="address/line1"/></td></tr>
				<tr><td><xsl:value-of select="address/line2"/></td></tr>
	            
	            <xsl:if test="address/line3" >
	        		<tr><td><xsl:value-of select="address/line3" /></td></tr>
	            </xsl:if> 
				
				<tr><td><xsl:value-of select="address/city"/>,  <xsl:value-of select="address/state_province"/>&#160; <xsl:value-of select="address/postal_code"/></td></tr>
				 <tr><td><xsl:value-of select="address/country"/></td></tr>   
			</table>
			</xsl:for-each>
		</td>
	</tr>
</table>
</xsl:template>

<!-- a new template for Acqusition vendor related emails --> 
<xsl:template name="acqSenderVendor"> 
	<table cellspacing="0" cellpadding="5" border="0" width="100%">
	<tr>
		<!-- display vendor info --> 
		<td width="50%">
		<xsl:if test="notification_data/receivers/receiver/vendor">
			<table>
				<xsl:attribute name="style">
					<xsl:call-template name="listStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
				<tr><td><b><xsl:value-of select="notification_data/receivers/receiver/vendor/name"/></b></td></tr>
			</table>
		</xsl:if>	
		</td>		

		<!-- display sender, Acqusition Department  --> 
		<td width="50%" align="right">
			<table>
				<xsl:attribute name="style">
					<xsl:call-template name="listStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>

				<tr><td><xsl:text>Acqusitions &amp; Eresources</xsl:text></td></tr>
				<tr><td><xsl:text>Suite 700 Baker Building</xsl:text></td></tr>
				<tr><td><xsl:text>110 21st Ave. South</xsl:text></td></tr>
				<tr><td><xsl:text>Vanderbilt Univerisity Library</xsl:text></td></tr>
				<tr><td><xsl:text>Nashville, TN 37027</xsl:text></td></tr>
				<tr><td><xsl:text>USA</xsl:text></td></tr>
			</table>	
		</td>
	</tr>
	</table>
</xsl:template>

</xsl:stylesheet>