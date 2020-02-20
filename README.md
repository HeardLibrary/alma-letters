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
    ├── FineFeePaymentReceiptLetter.xsl     :Patron letter, fine/fee payment receipt letter
    ├── FulBorrowingActivitiyLetter.xsl     :Patron letter, A list of user loans, requests, fines  
    ├── FulCancalRequestLetter.xsl          :Patron letter, Request cancel notification 
    └── POLineClaimLetter.xsl               :Vendor letter, claim letter for not received items 

