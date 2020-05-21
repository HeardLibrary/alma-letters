<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<xsl:template match="/">
	<html>
		<head>
		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<!-- getting order library --> 
				<xsl:variable name="mm" select="notification_data/conversation_messages/message/message_body" />
				<xsl:variable name="order_library">
					<xsl:choose> 
						<xsl:when test="contains($mm, 'Library Code: LAW')">LAW</xsl:when>
						<xsl:otherwise>AE</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>	

				<xsl:call-template name="acqSenderVendor"> <!-- SenderReceiver.xsl -->
					<xsl:with-param name="library" select="$order_library" />
				</xsl:call-template>		
				<br />

				<table cellspacing="0" cellpadding="5" border="0">
					<tr>
						<td>
							<xsl:for-each select="notification_data/conversation_messages/message">
								<h4> Subject: <xsl:value-of select="message_subject"/> </h4><br />
								<xsl:value-of select="message_body" disable-output-escaping="yes"/><br /> 
								<!-- <xsl:call-template name="processMessage">
									<xsl:with-param name="mBody" select="message_body" />
								</xsl:call-template>	--> 
							</xsl:for-each>
						</td>
					</tr>
				</table>
				<br />
				<table>
					<tr><td>@@sincerely@@</td></tr>
					<tr><td>@@department@@</td></tr>
                    <tr><td>
                    	<xsl:choose>
                    		<xsl:when test=" $order_library='LAW' ">
                    			<a><xsl:attribute name="href">mailto:joyce.mcdavid@vanderbilt.edu</xsl:attribute>joyce.mcdavid@vanderbilt.edu</a>
                    		</xsl:when>
                    		<xsl:otherwise>	
                    			<a><xsl:attribute name="href"> mailto:@@addressFrom@@ </xsl:attribute>@@addressFrom@@</a>
                    		</xsl:otherwise>
                    	</xsl:choose>		
                    </td></tr>
				</table>

				<xsl:call-template name="vendorFooter" /> <!-- footer.xsl -->
			</body>
	</html>
</xsl:template>

<!-- 
<xsl:template name="processMessage"> 
	<xsl:param name="mBody" /> 
	<line>
	<xsl:call-template name="tokenize">
    	<xsl:with-param name="text" select="mBody"/>
    	<xsl:with-param name="elemName" select="'mBody'"/>
    	<xsl:with-param name="sep" select="'&lt;br&gt;'" />
	</xsl:call-template>
    </line>
</xsl:template> -->	

<xsl:template name="tokenize">
    <xsl:param name="text"/>
    <xsl:param name="elemName"/>
    <xsl:param name="sep" select="' '"/>
    <xsl:choose>
        <xsl:when test="contains($text, $sep)">
            <xsl:element name="{$elemName}">
                <xsl:value-of select="substring-before($text, $sep)"/>
            </xsl:element>
            <!-- recursive call -->
            <xsl:call-template name="tokenize">
                <xsl:with-param name="text" select="substring-after($text, $sep)" />
                <xsl:with-param name="elemName" select="$elemName" />
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:element name="{$elemName}">
                <xsl:value-of select="$text"/>
            </xsl:element>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>
<!--  idea from https://stackoverflow.com/questions/23597058/how-to-split-string-in-xml   -->

</xsl:stylesheet>