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
       <br />

<div class="messageArea">
     <div class="messageBody">
        <table cellspacing="0" cellpadding="5" border="0">
            <tr>        
                <td>
                  The due date for the following item has shortened because 

                  <xsl:choose>
                    <xsl:when test="/notification_data/item_loan/due_date_shortened_reason='RECALL'">
                      a hold was placed on the item by another library user. 
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="notification_data/item_loan/shortened_due_date_reason"/>.
                    </xsl:otherwise>
                  </xsl:choose>
                  
                  <br/> Please return this item by the new recall due date to avoid recall fines. 

                </td>  
            </tr>
        </table>    

        <br />
        <table cellpadding="5" class="listing">
            <xsl:attribute name="style">
              <xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
            </xsl:attribute>
            <tr>
              <th>@@title@@</th> <td><xsl:value-of select="notification_data/item_loan/title"/></td>
            </tr>
            <tr>  
              <th>@@due_back@@</th><td><xsl:value-of select="notification_data/item_loan/due_date"/></td>
            </tr>  
        </table>
      <br />
    <table>
      <tr><td>@@sincerely@@</td></tr>
      <tr><td>@@department@@</td></tr>
    </table>

          </div>
    </div>

      <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />
        <xsl:call-template name="contactUs" />
        <xsl:call-template name="myAccount" /><br/>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>