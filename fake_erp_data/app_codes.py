import decimal

# Type of accounting transactions
#=================================================================================
SALES_CASH=33 # Sale of Products on Cash
SALES_CREDIT=34 # Sale of Products on Credit
PAYROLL_GENERATION=17 # Payroll generation
PURCHASE_INVENTORY_CASH=18 # Purchase of Inventory on Cash
PURCHASE_INVENTORY_CREDIT=19 # Purchase of Inventory on Credit
PURCHASE_PRODUCTS = 24 # Purchase products
PURCHASE_SERVICES = 25 # Purchase services
PAYMENT_FROM_CUSTOMERS=7 # Payment from Customers
PAYMENT_SUPPLIER=16 # Payment to Supplier
RETURN_PRODUCTS_ON_CASH=29 # Return of Products on Cash
RETURN_PRODUCTS_ON_CREDIT=30 # Return of Products on Credit
PAYMENT_RENT_EXPENSES=12 # Payment of Rent Expense
RETURN_PRODUCTS_ON_CREDIT_NOTES=35 # Return of Products on Credit Notes
PAYMENT_MORTGAGE_EXPENSES = 44 # Payment of mortgages
OBTAINING_LOAN_FROM_BANK = 6 # Obtaining a Loan from Bank
PAYMENT_INSURANCE = 9 # Payment of Insurance
INSURANCE_REIMBURSEMET = 47 # Insurance reimbursements for the business.
INSURANCE_AMORTIZATION  = 60 # Insurance amortization
PAYMENT_LEASE_AGREEMENT = 61 # Payment Lease Agreement



DEPRECIATION_EXPENSE_FOR_THE_PERIOD = 1 # Depreciation Expense for the Period
ISSUANCE_COMMON_STOCK_AT_A_PREMIUM = 2 # Issuance of Common Stock at a Premium
ISSUANCE_COMMON_STOCK_FOR_CASH = 3 # Issuance of Common Stock for Cash
ISSUANCE_COMMON_STOCK_FOR_NON_CASH_ASSETS = 4 # Issuance of Common Stock for Non-cash Assets
ISSUANCE_PREFERRED_STOCK_AT_A_PREMIUM = 5 # Issuance of Preferred Stock at a Premium

PAYMENT_INCOME_TAXES = 8 # Payment of Income Taxes
PAYMENT_INTEREST_ON_LOAN = 10 # Payment of Interest on Loan
PAYMENT_LOAN_INSTALLMENT_TO_BANK = 11 # Payment of Loan Installment to Bank
PAYMENT_SALARIES = 13 # Payment of Salaries
PAYMENT_SALES_TAXES = 14 # Payment of Sales Taxes
PAYMENT_UTILITIES_EXPENSES = 15 # Payment of Utilities Expenses
PURCHASE_MACHINERY_FOR_PRODUCTION = 21 # Purchase of Machinery for Production
PURCHASE_OFFICE_FURNITURE = 22 # Purchase of Office Furniture
PURCHASE_STOCKS_OF_COMPANIES = 23 # Purchase of Stocks of companies
RECEIPT_DIVIDENDS_FROM_INVESTMENTS = 26 # Receipt of Dividends from Investments
RECEIPT_PAYMENT_FROM_CUSTOMER = 27 # Receipt of Payment from Customer
RETIREMENT_COMMON_STOCK = 28 # Retirement of Common Stock
SALE_BONDS = 31 # Sale of Bonds
SALE_OLD_MACHINERY = 32 # Sale of Old Machinery
LAYAWAY_SALES = 36 # Revenue from goods sold that are put on layaway for the customer.
GIFT_CARD_SALES = 37 # Revenue received from selling gift cards.
SERVICE_REVENUE = 38 # Revenue from services provided, such as delivery or product customization.
CUSTOMER_RETURNS_AND_REFUNDS = 39 # Transactions where customers return goods for a refund.
DISCOUNTS_GIVEN = 40 # Discounts applied to sales.
INVENTORY_PURCHASES = 41 # Purchases of goods intended for resale.
FREIGHT_IN = 42 # Costs associated with shipping inventory to the store.
PURCHASE_RETURNS = 43 # Transactions related to returning goods to suppliers.
UTILITIES = 45 # Expenses for utilities like electricity, water, and internet.
SALARIES_AND_WAGES = 46 # Compensation for employees.

DEPRECIATION = 50 # Depreciation on long-term assets like fixtures and equipment.
MAINTENANCE_AND_REPAIRS = 51 # Costs for maintaining and repairing equipment and premises.
INTEREST_INCOME = 52 # Income from investments.
INTEREST_EXPENSES = 53 # Interest paid on loans.
LOAN_PROCEEDS = 54 # Receipt of loan funds.
LOAN_REPAYMENTS = 55 # Repayment of loan principal.
BANK_FEES = 57 # Fees charged by banks for account maintenance and transactions.
PENALTIES_AND_FINES = 58 # Costs associated with penalties or fines incurred by the business.
DONATIONS = 59 # Charitable contributions made by the business.


# LEDGERS
# =========================================

LEDGER_CASH = 1 # Physical currency and coins, as well as balances in checking and savings accounts.
LEDGER_ACCOUNTS_RECEIVABLE = 2 # Amounts owed to the company by customers for goods or services provided on credit.
LEDGER_INVENTORY = 3 # Goods available for sale, including raw materials, work-in-progress, and finished goods.
LEDGER_FIXED_ASSETS = 4 # Long-term tangible assets used in the operation of the business, such as land, buildings, and machinery.
LEDGER_INVESTMENTS = 5 # Financial Investments
LEDGER_ACCOUNTS_PAYABLE = 6 # Amounts owed by the company to suppliers or vendors for goods or services purchased on credit.
LEDGER_LOANS_PAYABLE = 7 # Amounts borrowed by the company from financial institutions or other lenders.
LEDGER_TAXES_PAYABLE = 8 # Taxes owed by the company to government authorities, such as income taxes and sales taxes.
LEDGER_COMMON_STOCK = 9 # Ownership equity representing the amount invested by shareholders in the company.
LEDGER_ADDITIONAL_PAIDIN_CAPITAL = 10 # 
LEDGER_RETAINED_EARNINGS = 11 # Accumulated earnings or losses of the company that have not been distributed to shareholders as dividends.
LEDGER_SALES_REVENUE = 12 # Revenue generated from the sale of goods or services to customers.
LEDGER_INTEREST_INCOME = 13 # Income earned from interest on loans, investments, or other interest-bearing assets.
LEDGER_COST_OF_GOODS_SOLD = 14 # Expenses incurred to obtained goods sold
LEDGER_OPERATING_EXPENSES = 15 # Expenses incurred in the normal course of business operations, such as rent, utilities, and wages.
LEDGER_INTEREST_EXPENSES = 16 # Expenses incurred by loans
LEDGER_TAX_EXPENSES = 17 # Expenses incurred by taxes
LEDGER_PREPAID_INSURANCE_EXPENSES = 18 # Prepaid Insurance Expense
LEDGER_INSURANCE_REIMBURSEMENT_INCOME = 19 # Insurance Reimbursement Income
LEDGER_INSURANCE_EXPENSES = 20 # Insurance Expense

# Purchase order codes
PO_PENDIND =1 # The purchase order has been created but not yet processed or sent to the supplier
PO_SENT=2  # The order has been sent to the supplier but goods have not been received yet.') ;
PO_RECEIVEDPARTIAL=3  # Received Partial', 'Some of the items in the purchase order have been received, but the order is not yet complete.') ;
PO_RECEIVEDFULL=4   # Received Full', 'All items in the purchase order have been received.') ;
PO_CANCELLED=5 # Cancelled', 'The order has been cancelled and will not be fulfilled.') ;
PO_CLOSED=6  # Closed', 'The order has been fully processed, received, and any post-receipt actions (like payment) have been completed.') ;

PS_UNPAID = 1  #The payment is unpaid
PS_PARTIAL = 2  # The payment is partially completed
PS_PAID = 3  # The payment is complete

CREDITCARD_COMISSION = 0.06
CREDITCARD_COMISSION = decimal.Decimal(str(CREDITCARD_COMISSION))
VAT_TAX = 0.12
VAT_TAX = decimal.Decimal(str(VAT_TAX))