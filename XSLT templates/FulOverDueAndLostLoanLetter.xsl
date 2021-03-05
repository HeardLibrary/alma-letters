<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl"/>
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
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

				<br />
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->          
                                <br/>

				<table cellspacing="0" cellpadding="5" border="0">
				<tr>
				<td>
					<h>@@inform_you_item_below@@ </h>
					<h><!--  @@borrowed_by_you@@ --> @@decalred_as_lost@@</h>
				</td>
				</tr>
				</table>

				<p><b>@@additional_info_2@@</b></p>
					

				<table cellpadding="5" class="listing">
					<xsl:attribute name="style">
						<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
					</xsl:attribute>

					<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
						<tr>
							<td>
								<table cellpadding="5" class="listing">
									<xsl:attribute name="style">
										<xsl:call-template name="mainTableStyleCss" />
									</xsl:attribute>
									<tr align="center" bgcolor="#f5f5f5">
										<td colspan="8">
											<h3><xsl:value-of select="organization_unit/name" /></h3>
										</td>
									</tr>
									<tr>
										<th>@@call_number@@</th>  
										<th>@@lost_item@@</th>
										<th>@@loan_date@@</th>
										<th>@@due_date@@</th>
									<!--	<th>@@library@@</th> -->
									<!-- 	<th>@@barcode@@</th>  -->
										<th>@@charged_with_fines_fees@@</th>
									</tr>

									<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display">
										<tr>
                                            <td>
                                            	<!-- <xsl:value-of select="physical_item_display_for_printing/call_number"/>  -->
                                                <xsl:variable name="altcallnum" select="physical_item_display_for_printing/alternative_call_number" />    
                                                <xsl:choose>
                                                    <xsl:when test="string($altcallnum)">
                                                         <xsl:value-of select="physical_item_display_for_printing/alternative_call_number" />
                                                    </xsl:when>
                                                    <xsl:otherwise>  
                                                	    <xsl:value-of select="physical_item_display_for_printing/call_number"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>  
                                           </td>  

                                        	<td><xsl:value-of select="item_loan/title"/> 
                                                <br/><xsl:value-of select="item_loan/barcode"/></td>
											<td><xsl:value-of select="item_loan/loan_date"/></td>
											<td><xsl:value-of select="item_loan/due_date"/></td>
										<!-- 	<td><xsl:value-of select="physical_item_display_for_printing/library_name"/></td> -->
										<!-- 	<td><xsl:value-of select="item_loan/barcode"/></td>  -->
                                                                                        <td>
												<xsl:for-each select="fines_fees_list/user_fines_fees">
													<b><xsl:value-of select="fine_fee_type_display"/>: </b><xsl:value-of select="fine_fee_ammount/sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/>&#160;<xsl:value-of select="ff"/>
													<br />
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</table>
							</td>
						</tr>
					<br/>
					</xsl:for-each>
					<xsl:if test="notification_data/overdue_notification_fee_amount/sum !=''">
						<tr>
							<td>
								<b>@@overdue_notification_fee@@</b>
								<xsl:value-of select="notification_data/overdue_notification_fee_amount/sum"/>&#160;<xsl:value-of select="notification_data/overdue_notification_fee_amount/currency"/>&#160;<xsl:value-of select="ff"/>
							</td>
						</tr>
					</xsl:if>
                    </table>

                    <p>@@additional_info_1@@</p>
					
					<table>
						<tr><td>@@sincerely@@</td></tr>
						<tr><td>@@department@@</td></tr>
					</table>
				<br />

				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->

			</body>
	</html>
</xsl:template>

</xsl:stylesheet>