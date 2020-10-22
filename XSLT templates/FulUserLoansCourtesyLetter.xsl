<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
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
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>
        
        <xsl:call-template name="head" /><!-- header.xsl -->
        <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->
        
        <br />
        <xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
        <br/>
        
        
        <div class="messageArea">
          <div class="messageBody">
            
            <table cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <p><xsl:if test="notification_data/short_loans='true'">
                    @@short_loans_message@@
                  </xsl:if>
                    <xsl:if test="notification_data/short_loans='false'">
                      @@message@@
                      <a><xsl:attribute name="href">@@email_my_account@@</xsl:attribute>My Account</a>.
                    </xsl:if>
                  </p>
                  <p>@@additional_info_2@@ @@additional_info_1@@</p>
                </td>
              </tr>
              <tr>
                <td>
                  <b>@@loans@@</b>
                </td>
              </tr>
              
              <tr>
                <td>
                  <table cellpadding="5" class="listing">
                    <xsl:attribute name="style">
                      <xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
                    </xsl:attribute>
                    <tr>
                      <th>@@description@@</th> <!-- call number --> 
                      <th>@@title@@</th>
                      <th>@@due_date@@</th>
                      <th>@@library@@</th>
                      <th>Notes</th>
                    </tr>
                    
                    <xsl:for-each select="notification_data/item_loans/item_loan">
                      <tr>
                        <td><!-- call formatCallnumber template --> 
                          <xsl:call-template name="formatCallnumber">
                            <xsl:with-param name="callnumber" select="call_number" />
                            <xsl:with-param name="altcallnum" select="alternative_call_number" />
                            <xsl:with-param name="description" select="description" />
                          </xsl:call-template>
                        </td>
                        
                        <!-- added title process: Shorten long titles -->               
                        <td><xsl:call-template name="formatTitle">
                                <xsl:with-param name="title" select="title" />                  
                            </xsl:call-template>
                            <br/>
                            <xsl:value-of select="barcode" />
                        </td>
                        <td><xsl:value-of select="due_date"/></td>  
                        <td><xsl:value-of select="library_name"/></td>
                        
                        <!-- add a note column in the table --> 
                        <td><xsl:call-template name="hathiNotes"> 
                            <xsl:with-param name="location" select="physical_item/location_code" />
                        </xsl:call-template>  
                        </td>
                        
                      </tr>
                    </xsl:for-each>
                    
                  </table>
                </td>
              </tr>
            </table>
            
            <!-- <br />@@additional_info_2@@<br />  --> 
            <table>
              <tr><td>@@sincerely@@</td></tr>
              <tr><td>@@department@@</td></tr>
            </table>
            
          </div>
        </div>
        
        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />
        
        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
