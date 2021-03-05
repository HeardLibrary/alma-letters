# alma-letters
Collection of VU customized Alma letter XLST templates

## Repo structure

An index of the letter templates. 

```
├── Components      
│   ├── header.xsl
│   ├── footer.xsl
|   ├── mailReason.xsl
|   ├── recordTitle.xsl
│   ├── senderReceiver.xsl
│   └── style.xsl
└── XSLT templates
    ├── Fulfillment Letters 
    │   ├── FineFeePaymentReceiptLetter.xsl     :patron letter, Library Paymnent Receipt 
    │   ├── FulBorrowingActivitiyLetter.xsl     :Patron letter, Current Loan Summary
    │   ├── FulCancalRequestLetter.xsl          :Patron letter, Request Cancellation
    │   ├── FulItemChangeDueDateLetter.xsl      :Patron letter, Loan Status Update Notice, when item is being recalled, due date changed...
    │   ├── FulLoanReceiptLetter.xsl          
    │   ├── FulLostLoanNotificationLetter.xsl   :Patron letter, Lost Items Bill 
    │   ├── FulOverDueAndLostLoanNotificationLetter.xsl  :Patron letter, Overdue Notice 1, 2, 3, send out when item pass due 7, 15, 23 days
    │   ├── FulOverDueAndLostLoanLetter.xsl     :Patron letter, Lost Item Bill, when item pass due 30 days
    │   ├── FulLostLoanLetter.xsl               :Patron letter, Lost Item Bill, when item is marked as lost 
    │   ├── FulPlaceOnHoldShelfLetter.xsl       :Patron letter, Library item available notice
    │   ├── FulShortenedDueDateLetter.xsl          
    │   ├── FulUserLoansCourtesyLetter.xsl         
    │   └── FulUserOverdueNotices.xsl             :Patron letter, Due Today Letter
    ├── Acquisition Letters 
        ├── ConversationLetter.xsl              :Vendor letter, Acqusition converstation with vendors 
        ├── InterestedInLetter.xsl              :Patron letter, Library item of interest has arrived
        ├── OrderList.xsl         
        ├── OrderNowLetter.xsl         
        └── POLineClaimLetter.xsl               :Vendor letter, Order Claim

