# alma-letters
Collection of VU customized Alma letter XLST templates

## Repo structure

The repository structure is described below. 

```
├── README.md                  : Description of this repository
├── Components      
│   ├── header.xsl
│   ├── footer.xsl
|   ├── mailReason.xsl
|   ├── recordTitle.xsl
│   ├── senderReceiver.xsl
│   └── style.xsl
└── XSLT templates
    ├── ConversationLetter.xsl              :Vendor letter, Acqusition converstation with vendors 
    ├── FineFeePaymentReceiptLetter.xsl     :Patron letter, Library Paymnent Receipt 
    ├── FulBorrowingActivitiyLetter.xsl     :Patron letter, Current Loan Summary
    ├── FulCancalRequestLetter.xsl          :Patron letter, Request Cancellation
    ├── FulItemChangeDueDateLetter.xsl      :Patron letter, Loan status update letter 
    ├── FulLoanReceiptLetter.xsl          
    ├── FulLostLoanNotificationLetter.xsl    :Patron letter, Lost Items Bill 
    ├── FulOverDueAndLostLoanNotificationLetter.xsl  :Patron letter, Overdue Notice
    ├── FulPlaceOnHoldShelfLetter.xsl         :Patron letter, Library item available notice
    ├── FulShortenedDueDateLetter.xsl          
    ├── FulUserLoansCourtesyLetter.xsl         
    ├── InterestedInLetter.xsl                :Patron letter, Library item of interest has arrived
    ├── OrderList.xsl         
    ├── OrderNowLetter.xsl         
    └── POLineClaimLetter.xsl               :Vendor letter, Order Claim

