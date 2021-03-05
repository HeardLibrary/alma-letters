<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:include href="header.xsl" />
	<xsl:include href="senderReceiver.xsl" />
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl" />
	<xsl:include href="style.xsl" />
	<xsl:include href="recordTitle.xsl" />
	
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
				<br/>                                
				<xsl:call-template name="toWhomIsConcerned" ></xsl:call-template> <!-- mailReason.xsl -->
				
				<br />
				
				<!-- display different message based on overdue_lost_profile --> 
				<xsl:for-each select="notification_data">
					<table cellspacing="0" cellpadding="5" border="0">
						<tr>
							<td>
								<xsl:if test="/notification_data/notification_type='OverdueNotificationType1'">
									<p>@@inform_you_item_below_type1@@ 
										@@decalred_as_lost_type1@@
										<a><xsl:attribute name="href">@@email_my_account@@</xsl:attribute>@@borrowed_by_you@@</a>. </p>
								</xsl:if>
								<xsl:if test="/notification_data/notification_type='OverdueNotificationType2'">
									<p>@@inform_you_item_below_type2@@ 
										@@decalred_as_lost_type2@@
										<a><xsl:attribute name="href">@@email_my_account@@</xsl:attribute>@@borrowed_by_you@@</a>. </p>
								</xsl:if>
								<xsl:if test="/notification_data/notification_type='OverdueNotificationType3'">
									<p>@@inform_you_item_below_type3@@ 
										@@decalred_as_lost_type3@@</p>
									<p>@@additional_info_1_type3@@ 
										<a><xsl:attribute name="href">@@email_my_account@@</xsl:attribute>@@borrowed_by_you@@</a>. 
										@@additional_info_2_type3@@</p>
								</xsl:if>
							</td>
						</tr>
					</table>
				</xsl:for-each>
				
				<!-- COVID quarantien message --> 
				<p><b>@@additional_info_1@@</b></p>

				<!--  display library loan information table --> 
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
										<xsl:if test="/notification_data/notification_type='OverdueNotificationType3'">
											<th>@@charged_with_fines_fees@@</th>
										</xsl:if>
										<th>Notes</th>
									</tr>
									
									<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display">
										<tr>
											<td><xsl:variable name="altcallnum" 
												select="physical_item_display_for_printing/alternative_call_number" />
												<xsl:choose>
													<xsl:when test="string($altcallnum)">
														<xsl:value-of select="physical_item_display_for_printing/alternative_call_number"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="physical_item_display_for_printing/call_number"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td><xsl:value-of select="item_loan/title"/>
												<br/> <xsl:value-of select="item_loan/barcode" /> </td>
											<td><xsl:value-of select="item_loan/loan_date"/></td>
											<td><xsl:value-of select="item_loan/due_date"/></td>
											<xsl:if test="/notification_data/notification_type='OverdueNotificationType3'">											
												<td>
													<xsl:for-each select="fines_fees_list/user_fines_fees">
														<b><xsl:value-of select="fine_fee_type_display"/>: </b><xsl:value-of select="fine_fee_ammount/sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/>&#160;<xsl:value-of select="ff"/>
														<br />
													</xsl:for-each>
												</td>
											</xsl:if>
											<!-- add a note column in the table --> 
											<td><xsl:call-template name="hathiNotes"> 
												<xsl:with-param name="location" select="item_loan/physical_item/location_code" />
											</xsl:call-template>  
											</td>
										</tr>
									</xsl:for-each>
								</table>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:if test="notification_data/overdue_notification_fee_amount/sum !=''">
						<tr>
							<td>
								<b>@@overdue_notification_fee@@ </b>
								<xsl:value-of select="notification_data/overdue_notification_fee_amount/sum"/>&#160;<xsl:value-of select="notification_data/overdue_notification_fee_amount/currency"/>&#160;<xsl:value-of select="ff"/>
							</td>
						</tr>
					</xsl:if>
				</table>
				
				<p>@@additional_info_2@@</p>
				
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