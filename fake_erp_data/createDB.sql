----------------------------------------------------------------------------------------------------------------
--------------------------------------- Accounting 
-- Accounts Table
create table ledger_accounts(
id int not null primary key,
name varchar(50) not null,
description text not null,
category varchar(50),
debit_credit char(1)
);

INSERT INTO ledger_accounts (id, name, description, category, debit_credit) VALUES
(1, 'Cash', 'Physical currency and coins, as well as balances in checking and savings accounts.', 'Assets', 'D'),
(2, 'Accounts Receivable', 'Amounts owed to the company by customers for goods or services provided on credit.', 'Assets', 'D'),
(3, 'Inventory', 'Goods available for sale, including raw materials, work-in-progress, and finished goods.', 'Assets', 'D'),
(4, 'Fixed Assets', 'Long-term tangible assets used in the operation of the business, such as land, buildings, and machinery.', 'Assets', 'D'),
(5, 'Investments', 'Financial Investments', 'Assets', 'D'),
(6, 'Accounts Payable', 'Amounts owed by the company to suppliers or vendors for goods or services purchased on credit.', 'Liabilities', 'C'),
(7, 'Loans Payable', 'Amounts borrowed by the company from financial institutions or other lenders.', 'Liabilities', 'C'),
(8, 'Taxes Payable', 'Taxes owed by the company to government authorities, such as income taxes and sales taxes.', 'Liabilities', 'C'),
(9, 'Common Stock', 'Ownership equity representing the amount invested by shareholders in the company.', 'Equity', 'C'),
(10, 'Additional Paid-in Capital', '' , 'Equity', 'C'),
(11, 'Retained Earnings', 'Accumulated earnings or losses of the company that have not been distributed to shareholders as dividends.', 'Equity', 'C'),
(12, 'Sales Revenue', 'Revenue generated from the sale of goods or services to customers.', 'Revenue', 'C'),
(13, 'Interest Income', 'Income earned from interest on loans, investments, or other interest-bearing assets.', 'Revenue', 'C'),
(14, 'Cost of Goods Sold', 'Expenses incurred to obtained goods sold','Expenses','D'),
(15, 'Operating Expenses', 'Expenses incurred in the normal course of business operations, such as rent, utilities, and wages.', 'Expenses', 'D'),
(16, 'Interest Expenses' , 'Expenses incurred by loans','Expenses', 'D' ),
(17, 'Tax expenses', 'Expenses incurred by taxes', 'Expenses', 'D' ),
(18, 'Prepaid Insurance Expense', 'Prepaid Insurance Expense', 'Expenses', 'D' ) ,
(19, 'Insurance Reimbursement Income', 'Insurance Reimbursement Income', 'Revenue', 'D' ),
(18, 'Prepaid Insurance Expense', 'Prepaid Insurance Expense', 'Expenses', 'D' ) ,
(19, 'Insurance Reimbursement Income', 'Insurance Reimbursement Income', 'Revenue', 'C' ) ,
(20, 'Insurance Expense', 'Insurance Expense', 'Expense', 'D' ) ;


create table dimensions(
id int not null primary key,
name varchar(50), 
main_account_id int references main_accounts(id) on delete cascade,
table_name char(50),
column_name char(50),
filter char(50)
);

INSERT INTO dimensions (id, name, main_account, table_name, column_name, filter, ) VALUES
(1,'Party', 2, 'parties', 'name', ''), 
(2,'Product', 3, 'product_services', 'name', 'product_services=''P'' '), 
(3,'Branch', 3, 'branches', 'name', ''), 
(4,'Location', 4, 'locations', 'name', ''), 
(6,'Party', 6, 'parties', 'name', ''),
(7, 'Loan', 7, 'loans', 'loan_purpose', ''),
(8, 'Tax Autority', 8, 'TaxAuthorities', 'name', ''),
(9, 'Tax Type', 8, 'TaxTypes', 'name', ''),
(10, 'Customer' , 12, 'Customers', 'name' , '' ),
(11, 'Branch' , 12, 'Branches', 'name' , '' ), 
(12, 'Product' , 14, 'product_services', 'name' , 'product_services=''P'' ' ),
(13, 'Branch' , 14, 'Branches', 'name' , '' ), 
(13, 'Business units' , 15, 'BusinessUnit', 'name' , '' ) ; 




create table entry_type( 
id int,
Transaction_name char(50),
account_name char(50),
debit_credit char(1)
 ) ;
INSERT INTO entry_type (Transaction_name, Account_name, debit_credit) VALUES
('Purchase of Inventory on Credit', 'Inventory', 'D'),
('Purchase of Inventory on Credit', 'Accounts Payable', 'C'),
('Purchase of Inventory on Cash', 'Inventory', 'D'),
('Purchase of Inventory on Cash', 'Cash', 'C'),

('Sale of Products on Cash', 'Sales Revenue', 'C'),
('Sale of Products on Cash', 'Cash', 'D'),
('Sale of Products on Cash', 'Cost of Goods Sold', 'D'),
('Sale of Products on Cash', 'Inventory', 'C'),
('Sale of Products on Credit', 'Sales Revenue', 'C'),
('Sale of Products on Credit', 'Accounts Receivable', 'D'),
('Sale of Products on Credit', 'Cost of Goods Sold', 'D'),
('Sale of Products on Credit', 'Inventory', 'C'),

('Return of Products on Cash', 'Sales Revenue', 'D'),
('Return of Products on Cash', 'Cash', 'C'),
('Return of Products on Cash', 'Cost of Goods Sold', 'C'),
('Return of Products on Cash', 'Inventory', 'D'),

('Return of Products on Credit', 'Sales Revenue', 'D'),
('Return of Products on Credit', 'Accounts Receivable', 'C'),
('Return of Products on Credit', 'Cost of Goods Sold', 'C'),
('Return of Products on Credit', 'Inventory', 'D'),

('Receipt of Payment from Customer', 'Cash', 'D'),
('Receipt of Payment from Customer', 'Accounts Receivable', 'C'),

('Payroll generation', 'Accounts Payable', 'C'),
('Payroll generation'', 'Operating Expense', 'D'),

('Purchase products', 'Accounts Payable', 'C'),
('Purchase products', 'Inventory', 'D'),

('Purchase services', 'Accounts Payable', 'C'),
('Purchase services', 'Operating Expense', 'D'),

('Payment to Supplier', 'Accounts Payable', 'D'),
('Payment to Supplier', 'Cash', 'C'),

('Payment of Salaries', 'Accounts Payable', 'D'),
('Payment of Salaries', 'Cash', 'C'),

('Payment of Rent Expense', 'Operating Expense', 'D'),
('Payment of Rent Expense', 'Cash', 'C'),

('Payment of Utilities Expense', 'Operating Expense', 'D'),
('Payment of Salaries', 'Cash', 'C'),

('Payment of Insurance', 'Insurance Expense', 'D'),
('Payment of Salaries', 'Cash', 'C'),

('Payment from Customers', 'Accounts Receivable', 'D'),
('Payment from Customers', 'Cash', 'D'),

('Payment of Interest on Loan', 'Interest Expense', 'D'),
('Payment of Interest on Loan', 'Cash', 'C'),

('Payment of Loan Installment to Bank', 'Loan Payable', 'D'),
('Payment of Loan Installment to Bank', 'Cash', 'C'),

('Payment of Sales Taxes', 'Taxes Payable', 'D'),
('Payment of Sales Taxes', 'Cash', 'C'),

('Payment of Income Taxes', 'Taxes Payable', 'D'),
('Payment of Income Taxes', 'Cash', 'C'),

('Obtaining a Loan from Bank', 'Cash', 'D'),
('Obtaining a Loan from Bank', 'Loan Payable', 'C'),

('Purchase of Machinery for Production', 'Machinery', 'D'),
('Purchase of Machinery for Production', 'Accounts Payable', 'C'),
('Purchase of Office Furniture', 'Office Furniture', 'D'),
('Purchase of Office Furniture', 'Accounts Payable', 'C'),
('Sale of Old Machinery', 'Cash', 'D'),
('Sale of Old Machinery', 'Accumulated Depreciation - Machinery', 'D'),
('Sale of Old Machinery', 'Machinery', 'C'),
('Depreciation Expense for the Period', 'Depreciation Expense', 'D'),
('Depreciation Expense for the Period', 'Accumulated Depreciation - Machinery', 'C'),
('Purchase of Stocks of companies', 'Fixed Investments', 'D'),
('Purchase of Stocks of Companies', 'Cash', 'C'),
('Sale of Bonds', 'Cash', 'D'),
('Sale of Bonds', 'Fixed Investments', 'C'),
('Receipt of Dividends from Investments', 'Cash', 'D'),
('Receipt of Dividends from Investments', 'Dividend Income', 'C'),
('Issuance of Common Stock for Cash', 'Cash', 'D'),
('Issuance of Common Stock for Cash', 'Common Stock', 'C'),
('Issuance of Common Stock for Non-cash Assets', 'Non-cash Assets', 'D'),
('Issuance of Common Stock for Non-cash Assets', 'Common Stock', 'C'),
('Retirement of Common Stock', 'Common Stock', 'D'),
('Retirement of Common Stock', 'Retained Earnings', 'C'),
('Issuance of Common Stock at a Premium', 'Cash', 'D'),
('Issuance of Common Stock at a Premium', 'Common Stock', 'C'),
('Issuance of Common Stock at a Premium', 'Additional Paid-in Capital', 'C'),
('Issuance of Preferred Stock at a Premium', 'Cash', 'D'),
('Issuance of Preferred Stock at a Premium', 'Preferred Stock', 'C'),
('Issuance of Preferred Stock at a Premium', 'Additional Paid-in Capital', 'C') ; 


Create table business_processes(
    id int PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    count_number int not null
) ; 
insert into  business_processes(id, name, description, count_number) values
(1,'sales', 'sales', 0),
(2,'purchases', 'purchases', 0),
(3,'payroll', 'payroll', 0),
(4,'production', 'production', 0) ;


-- Table for Transaction Type
CREATE TABLE transaction_types (
    id int PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    business_process_id int,   
    count_number int
);
INSERT INTO transaction_types (id, name, description, count_number) VALUES
(1,'Depreciation Expense for the Period','Depreciation Expense for the Period',0),
(2,'Issuance of Common Stock at a Premium','Issuance of Common Stock at a Premium',0),
(3,'Issuance of Common Stock for Cash','Issuance of Common Stock for Cash',0),
(4,'Issuance of Common Stock for Non-cash Assets','Issuance of Common Stock for Non-cash Assets',0),
(5,'Issuance of Preferred Stock at a Premium','Issuance of Preferred Stock at a Premium',0),
(6,'Obtaining a Loan from Bank','Obtaining a Loan from Bank',0),
(7,'Payment from Customers','Payment from Customers',92),
(8,'Payment of Income Taxes','Payment of Income Taxes',0),
(9,'Payment of Insurance','Payment of Insurance',0),
(10,'Payment of Interest on Loan','Payment of Interest on Loan',0),
(11,'Payment of Loan Installment to Bank','Payment of Loan Installment to Bank',0),
(12,'Payment of Rent Expense','Payment of Rent Expense',0),
(13,'Payment of Salaries','Payment of Salaries',0),
(14,'Payment of Sales Taxes','Payment of Sales Taxes',0),
(15,'Payment of Utilities Expense','Payment of Utilities Expense',0),
(16,'Payment to Supplier','Payment to Supplier',148),
(17,'Payroll generation','Payroll generation',0),
(18,'Purchase of Inventory on Cash','Purchase of Inventory on Cash',55),
(19,'Purchase of Inventory on Credit','Purchase of Inventory on Credit',93),
(21,'Purchase of Machinery for Production','Purchase of Machinery for Production',0),
(22,'Purchase of Office Furniture','Purchase of Office Furniture',0),
(23,'Purchase of Stocks of companies','Purchase of Stocks of companies',0),
(24,'Purchase products','Purchase products',0),
(25,'Purchase services','Purchase services',0),
(26,'Receipt of Dividends from Investments','Receipt of Dividends from Investments',0),
(27,'Receipt of Payment from Customer','Receipt of Payment from Customer',0),
(28,'Retirement of Common Stock','Retirement of Common Stock',0),
(29,'Return of Products on Cash','Return of Products on Cash',0),
(30,'Return of Products on Credit','Return of Products on Credit',0),
(31,'Sale of Bonds','Sale of Bonds',0),
(32,'Sale of Old Machinery','Sale of Old Machinery',0),
(33,'Sale of Products on Cash','Sale of Products on Cash',90),
(34,'Sale of Products on Credit','Sale of Products on Credit',97),
(35,'Return products on credit notes','Return products on credit notes',0),
(36,'Layaway Sales','Revenue from goods sold that are put on layaway for the customer.',0),
(37,'Gift Card Sales','Revenue received from selling gift cards.',0),
(38,'Service Revenue','Revenue from services provided, such as delivery or product customization.',0),
(39,'Customer Returns and Refunds','Transactions where customers return goods for a refund.',0),
(40,'Discounts Given','Discounts applied to sales.',0),
(41,'Inventory Purchases','Purchases of goods intended for resale.',0),
(42,'Freight-In','Costs associated with shipping inventory to the store.',0),
(43,'Purchase Returns','Transactions related to returning goods to suppliers.',0),
(44,'Payment Mortgage Expense','Payment of mortgages',0),
(45,'Utilities','Expenses for utilities like electricity, water, and internet.',0),
(46,'Salaries and Wages','Compensation for employees.',0),
(47,'Insurance reimbursement','Insurance reimbursements for the business',0),
(48,'Advertising','Costs of promotional activities.',0),
(49,'Supplies','Purchase of supplies necessary for operation.',0),
(50,'Depreciation','Depreciation on long-term assets like fixtures and equipment.',0),
(51,'Maintenance and Repairs','Costs for maintaining and repairing equipment and premises.',0),
(52,'Interest Income','Income from investments.',0),
(53,'Interest Expense','Interest paid on loans.',0),
(54,'Loan Proceeds','Receipt of loan funds.',0),
(55,'Loan Repayments','Repayment of loan principal.',0),
(57,'Bank Fees','Fees charged by banks for account maintenance and transactions.',0),
(58,'Penalties and Fines','Costs associated with penalties or fines incurred by the business.',0),
(59,'Donations','Charitable contributions made by the business.',0),
(60,'Insurance amortization', 'Insurance amortization' , 0 ),
(61,'Payment Lease Agreement', 'Payment Lease Agreement' , 0 ) ;





CREATE TABLE accounts (
    id int PRIMARY KEY,
    account_code VARCHAR(20) NOT NULL UNIQUE,
    account_name VARCHAR(100) NOT NULL,
    main_account_id int REFERENCES main_accounts(id),
    field1_id int, 
    field2_id int, 
    field3_id int, 
    field4_id int, 
    field5_id int, 
    debit_credit char(1) NOT NULL
);

CREATE TABLE chart_of_accounts (
    id int PRIMARY KEY,
    parent_id INT REFERENCES chart_of_accounts(id),
    account_id INT REFERENCES accounts(id),
    level INT NOT NULL,
    description TEXT
);


CREATE TABLE  transactions (
    id int not null PRIMARY KEY,
    transaction_date DATE NOT NULL,
    user_id int not null references users(id), 
    transaction_type_id int not null REFERENCES transaction_types(id),
    number_transaction int not null, 
    created_at datetime DEFAULT getdate());


CREATE TABLE transaction_details (
    transaction_id INT not null REFERENCES transactions(id) on delete cascade,
    ledger_account_id int not null REFERENCES ledger_accounts(id),
    value DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    quantity DECIMAL(10, 2),
    debit_credit char(1) not null,
    description TEXT,
    party_id int references parties(id),
    user_id  int references users(id),
    branch_id int references branches(id),
    product_service_id int references product_services(id),
    location_id int references locations(id),
    contract_type_id int references contract_types(id),
    contract_id int references contracts(id),
    businessunit_id int references business_units(id),
    payment_term_id int references payment_terms(id),
    revenue_expense_category_id int references revenue_expense_categories(id)
);



--------------------------------------------------------------



-- Table for entity_types
CREATE TABLE entity_types (
    id int PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    table_name VARCHAR(25) NOT NULL
);

insert into entity_types(id,name, table_name) values
(1,'users','users'), 
(2, 'employees','employees'), 
(3, 'suppliers','suppliers'), 
(4, 'customers','customers'),
(5, 'salespersons','salespersons'), 
(6, 'landlordss','landlordss'),
(7, 'service_provider','service_provider');


-- Table for countries
CREATE TABLE countries (
    id int PRIMARY KEY,
    code char(3) not null, 
    name VARCHAR(50) NOT NULL
);

INSERT INTO countries (id, code, name) VALUES
(1, 'USA', 'United States'),
(2, 'CAN', 'Canada'),
(3, 'MEX', 'Mexico'),
(4, 'BRA', 'Brazil'),
(5, 'ARG', 'Argentina'),
(6, 'GBR', 'United Kingdom'),
(7, 'FRA', 'France'),
(8, 'DEU', 'Germany'),
(9, 'ITA', 'Italy'),
(10, 'ESP', 'Spain'),
(11, 'RUS', 'Russia'),
(12, 'CHN', 'China'),
(13, 'IND', 'India'),
(14, 'JPN', 'Japan'),
(15, 'AUS', 'Australia'),
(16, 'NZL', 'New Zealand'),
(17, 'ZAF', 'South Africa'),
(18, 'EGY', 'Egypt'),
(19, 'KEN', 'Kenya'),
(20, 'NGA', 'Nigeria'),
(21, 'TUR', 'Turkey'),
(22, 'SAU', 'Saudi Arabia'),
(23, 'IRN', 'Iran'),
(24, 'IRQ', 'Iraq'),
(25, 'ISR', 'Israel'),
(26, 'THA', 'Thailand'),
(27, 'VNM', 'Vietnam'),
(28, 'MYS', 'Malaysia'),
(29, 'IDN', 'Indonesia'),
(30, 'PHL', 'Philippines'),
(31, 'PAK', 'Pakistan'),
(32, 'BGD', 'Bangladesh'),
(33, 'AFG', 'Afghanistan'),
(34, 'LKA', 'Sri Lanka'),
(35, 'MMR', 'Myanmar'),
(36, 'NPL', 'Nepal'),
(37, 'KAZ', 'Kazakhstan'),
(38, 'UZB', 'Uzbekistan'),
(39, 'TKM', 'Turkmenistan'),
(40, 'KOR', 'South Korea'),
(41, 'PRK', 'North Korea'),
(42, 'SWE', 'Sweden'),
(43, 'NOR', 'Norway'),
(44, 'FIN', 'Finland'),
(45, 'DNK', 'Denmark'),
(46, 'ISL', 'Iceland'),
(47, 'CHE', 'Switzerland'),
(48, 'AUT', 'Austria'),
(49, 'BEL', 'Belgium'),
(50, 'NLD', 'Netherlands'),
(51, 'PRT', 'Portugal'),
(52, 'GRC', 'Greece'),
(53, 'POL', 'Poland'),
(54, 'HUN', 'Hungary'),
(55, 'CZE', 'Czech Republic'),
(56, 'SVK', 'Slovakia'),
(57, 'ROU', 'Romania'),
(58, 'BGR', 'Bulgaria'),
(59, 'UKR', 'Ukraine'),
(60, 'BLR', 'Belarus'),
(61, 'ARE', 'United Arab Emirates'),
(62, 'QAT', 'Qatar'),
(63, 'OMN', 'Oman'),
(64, 'YEM', 'Yemen'),
(65, 'SYR', 'Syria'),
(66, 'JOR', 'Jordan'),
(67, 'LBN', 'Lebanon'),
(68, 'CYP', 'Cyprus'),
(69, 'MAR', 'Morocco'),
(70, 'DZA', 'Algeria'),
(71, 'TUN', 'Tunisia'),
(72, 'LBY', 'Libya'),
(73, 'SDN', 'Sudan'),
(74, 'ETH', 'Ethiopia'),
(75, 'SOM', 'Somalia'),
(76, 'DJI', 'Djibouti'),
(77, 'UGA', 'Uganda'),
(78, 'TZA', 'Tanzania'),
(79, 'RWA', 'Rwanda'),
(80, 'BDI', 'Burundi'),
(81, 'SEN', 'Senegal'),
(82, 'GMB', 'The Gambia'),
(83, 'MLI', 'Mali'),
(84, 'BFA', 'Burkina Faso'),
(85, 'GHA', 'Ghana'),
(86, 'CIV', 'Ivory Coast'),
(87, 'NGR', 'Niger'),
(88, 'CMR', 'Cameroon'),
(89, 'TCD', 'Chad'),
(90, 'COG', 'Republic of the Congo'),
(91, 'COD', 'Democratic Republic of the Congo'),
(92, 'GAB', 'Gabon'),
(93, 'GNQ', 'Equatorial Guinea'),
(94, 'ZMB', 'Zambia'),
(95, 'MWI', 'Malawi'),
(96, 'MOZ', 'Mozambique'),
(97, 'ZWE', 'Zimbabwe'),
(98, 'BWA', 'Botswana'),
(99, 'NAM', 'Namibia'),
(100, 'SWZ', 'Eswatini'),
(101, 'LSO', 'Lesotho'),
(102, 'MDG', 'Madagascar'),
(103, 'COM', 'Comoros'),
(104, 'MUS', 'Mauritius'),
(105, 'SYC', 'Seychelles'),
(106, 'PER', 'Peru'),
(107, 'COL', 'Colombia'),
(108, 'VEN', 'Venezuela'),
(109, 'GUY', 'Guyana'),
(110, 'SUR', 'Suriname'),
(111, 'ECU', 'Ecuador'),
(112, 'BOL', 'Bolivia'),
(113, 'CHL', 'Chile'),
(114, 'PRY', 'Paraguay'),
(115, 'URY', 'Uruguay'),
(116, 'CRI', 'Costa Rica'),
(117, 'PAN', 'Panama'),
(118, 'NIC', 'Nicaragua'),
(119, 'HND', 'Honduras'),
(120, 'SLV', 'El Salvador'),
(121, 'GTM', 'Guatemala'),
(122, 'BLZ', 'Belize'),
(123, 'CUB', 'Cuba'),
(124, 'JAM', 'Jamaica'),
(125, 'HTI', 'Haiti'),
(126, 'DOM', 'Dominican Republic'),
(127, 'PRI', 'Puerto Rico'),
(128, 'BHS', 'Bahamas'),
(129, 'TTO', 'Trinidad and Tobago'),
(130, 'BRB', 'Barbados'),
(131, 'LCA', 'Saint Lucia'),
(132, 'VCT', 'Saint Vincent and the Grenadines'),
(133, 'GRD', 'Grenada'),
(134, 'DMA', 'Dominica'),
(135, 'ATG', 'Antigua and Barbuda'),
(136, 'KNA', 'Saint Kitts and Nevis'),
(137, 'MNG', 'Mongolia'),
(138, 'NPL', 'Nepal'),
(139, 'IRN', 'Iran'),
(140, 'SYR', 'Syria'),
(141, 'JOR', 'Jordan'),
(142, 'LBY', 'Libya'),
(143, 'ISL', 'Iceland'),
(144, 'GNB', 'Guinea-Bissau'),
(145, 'SLE', 'Sierra Leone'),
(146, 'LBR', 'Liberia'),
(147, 'GHA', 'Ghana'),
(148, 'TGO', 'Togo'),
(149, 'BEN', 'Benin'),
(150, 'MRT', 'Mauritania'),
(151, 'NER', 'Niger'),
(152, 'CIV', 'Ivory Coast'),
(153, 'GIN', 'Guinea'),
(154, 'BFA', 'Burkina Faso'),
(155, 'MLI', 'Mali'),
(156, 'SEN', 'Senegal'),
(157, 'GMB', 'The Gambia'),
(158, 'GNQ', 'Equatorial Guinea'),
(159, 'STP', 'Sao Tome and Principe'),
(160, 'CPV', 'Cape Verde'),
(161, 'MDV', 'Maldives'),
(162, 'BRN', 'Brunei'),
(163, 'SGP', 'Singapore'),
(164, 'PHL', 'Philippines'),
(165, 'COM', 'Comoros'),
(166, 'MDG', 'Madagascar'),
(167, 'MUS', 'Mauritius'),
(168, 'SYC', 'Seychelles'),
(169, 'MMR', 'Myanmar'),
(170, 'LAO', 'Laos'),
(171, 'KHM', 'Cambodia'),
(172, 'BHR', 'Bahrain'),
(173, 'QAT', 'Qatar'),
(174, 'KWT', 'Kuwait'),
(175, 'ARE', 'United Arab Emirates'),
(176, 'OMN', 'Oman'),
(177, 'YEM', 'Yemen'),
(178, 'PSE', 'Palestine'),
(179, 'LBN', 'Lebanon'),
(180, 'CYP', 'Cyprus');




-- Table for locations
CREATE TABLE locations (
    id int PRIMARY KEY,
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country_id int  REFERENCES countries(id)
);
INSERT INTO locations (id, city, state, postal_code, country_id) VALUES
(1, 'New York', 'New York', '10001', 1),
(2, 'Los Angeles', 'California', '90001', 1),
(3, 'Toronto', 'Ontario', 'M5H 2N2', 2),
(4, 'Vancouver', 'British Columbia', 'V5K 0A1', 2),
(5, 'Mexico City', 'Mexico City', '01000', 3),
(6, 'Monterrey', 'Nuevo León', '64000', 3),
(7, 'São Paulo', 'São Paulo', '01000-000', 4),
(8, 'Rio de Janeiro', 'Rio de Janeiro', '20000-000', 4),
(9, 'London', 'London', 'EC1A 1BB', 6),
(10, 'Manchester', 'Manchester', 'M1 1AA', 6),
(11, 'Paris', 'Île-de-France', '75001', 7),
(12, 'Marseille', 'Provence-Alpes-Côte d''Azur', '13001', 7),
(13, 'Berlin', 'Berlin', '10115', 8),
(14, 'Munich', 'Bavaria', '80331', 8),
(15, 'Rome', 'Lazio', '00100', 9),
(16, 'Milan', 'Lombardy', '20100', 9),
(17, 'Madrid', 'Madrid', '28001', 10),
(18, 'Barcelona', 'Catalonia', '08001', 10),
(19, 'Moscow', 'Moscow', '101000', 11),
(20, 'Saint Petersburg', 'Saint Petersburg', '190000', 11),
(21, 'Beijing', 'Beijing', '100000', 12),
(22, 'Shanghai', 'Shanghai', '200000', 12),
(23, 'Mumbai', 'Maharashtra', '400001', 13),
(24, 'Delhi', 'Delhi', '110001', 13),
(25, 'Tokyo', 'Tokyo', '100-0001', 14),
(26, 'Osaka', 'Osaka', '530-0001', 14),
(27, 'Sydney', 'New South Wales', '2000', 15),
(28, 'Melbourne', 'Victoria', '3000', 15),
(29, 'Cairo', 'Cairo', '11511', 18),
(30, 'Alexandria', 'Alexandria', '21500', 18),
(31, 'Nairobi', 'Nairobi County', '00100', 19),
(32, 'Mombasa', 'Mombasa County', '80100', 19),
(33, 'Lagos', 'Lagos', '100001', 20),
(34, 'Abuja', 'FCT', '900001', 20),
(35, 'Istanbul', 'Istanbul', '34000', 21),
(36, 'Ankara', 'Ankara', '06000', 21),
(37, 'Riyadh', 'Riyadh', '11564', 22),
(38, 'Jeddah', 'Makkah', '21577', 22),
(39, 'Tehran', 'Tehran', '11369', 23),
(40, 'Mashhad', 'Razavi Khorasan', '91871', 23),
(41, 'Bangkok', 'Bangkok', '10100', 26),
(42, 'Chiang Mai', 'Chiang Mai', '50000', 26),
(43, 'Kuala Lumpur', 'Federal Territory of Kuala Lumpur', '50000', 28),
(44, 'George Town', 'Penang', '10000', 28),
(45, 'Jakarta', 'Jakarta', '10110', 29),
(46, 'Surabaya', 'East Java', '60241', 29),
(47, 'Manila', 'Metro Manila', '1000', 30),
(48, 'Quezon City', 'Metro Manila', '1100', 30),
(49, 'Karachi', 'Sindh', '74000', 31),
(50, 'Lahore', 'Punjab', '54000', 31),
(51, 'Dhaka', 'Dhaka', '1000', 32),
(52, 'Chittagong', 'Chittagong', '4000', 32),
(53, 'Kabul', 'Kabul', '1001', 33),
(54, 'Herat', 'Herat', '3001', 33),
(55, 'Colombo', 'Western Province', '00100', 34),
(56, 'Kandy', 'Central Province', '20000', 34),
(57, 'Yangon', 'Yangon Region', '11001', 35),
(58, 'Edinburgh', 'Scotland', 'EH1 1BB', 6),
(59, 'Birmingham', 'England', 'B1 1AA', 6),
(60, 'Berlin', 'Berlin', '10115', 8),
(61, 'Munich', 'Bavaria', '80331', 8),
(62, 'Paris', 'Île-de-France', '75001', 7),
(63, 'Lyon', 'Auvergne-Rhône-Alpes', '69001', 7),
(64, 'Madrid', 'Madrid', '28001', 10),
(65, 'Barcelona', 'Catalonia', '08001', 10),
(66, 'Rome', 'Lazio', '00100', 9),
(67, 'Milan', 'Lombardy', '20121', 9),
(68, 'Florence', 'Tuscany', '50123', 9),
(69, 'Venice', 'Veneto', '30100', 9),
(70, 'Madrid', 'Community of Madrid', '28001', 10),
(71, 'Seville', 'Andalusia', '41001', 10),
(72, 'Athens', 'Attica', '105 57', 52),
(73, 'Thessaloniki', 'Central Macedonia', '546 36', 52),
(74, 'Vienna', 'Vienna', '1010', 48),
(75, 'Salzburg', 'Salzburg', '5020', 48),
(76, 'Brussels', 'Brussels', '1000', 49),
(77, 'Antwerp', 'Flanders', '2000', 49),
(78, 'Lisbon', 'Lisbon', '1100-388', 51),
(79, 'Porto', 'Porto', '4000-286', 51),
(80, 'Cairo', 'Cairo Governorate', '11511', 18),
(81, 'Alexandria', 'Alexandria Governorate', '21500', 18),
(82, 'Cape Town', 'Western Cape', '8001', 17),
(83, 'Johannesburg', 'Gauteng', '2000', 17),
(84, 'Nairobi', 'Nairobi County', '00100', 19),
(85, 'Mombasa', 'Mombasa County', '80100', 19),
(86, 'Lagos', 'Lagos', '100242', 20),
(87, 'Abuja', 'FCT', '900001', 20),
(88, 'Tokyo', 'Tokyo', '100-0001', 14),
(89, 'Osaka', 'Osaka', '530-0001', 14),
(90, 'Delhi', 'Delhi', '110001', 13),
(91, 'Mumbai', 'Maharashtra', '400001', 13),
(92, 'Beijing', 'Beijing', '100000', 12),
(93, 'Shanghai', 'Shanghai', '200000', 12),
(94, 'Moscow', 'Moscow', '101000', 11),
(95, 'Saint Petersburg', 'Saint Petersburg', '190000', 11),
(96, 'Sydney', 'New South Wales', '2000', 15),
(97, 'Melbourne', 'Victoria', '3000', 15),
(98, 'Brisbane', 'Queensland', '4000', 15),
(99, 'Perth', 'Western Australia', '6000', 15),
(100, 'Kuala Lumpur', 'Federal Territory of Kuala Lumpur', '50000', 28),
(101, 'George Town', 'Penang', '10000', 28),
(102, 'Bangkok', 'Bangkok', '10100', 26),
(103, 'Chiang Mai', 'Chiang Mai', '50000', 26),
(104, 'Jakarta', 'Jakarta', '10110', 29),
(105, 'Surabaya', 'East Java', '60281', 29),
(106, 'Manila', 'Metro Manila', '1000', 30),
(107, 'Quezon City', 'Metro Manila', '1100', 30),
(108, 'Calgary', 'Alberta', 'T2P', 2),
(109, 'Ottawa', 'Ontario', 'K1P', 2),
(110, 'Sao Paulo', 'Sao Paulo', '01000-000', 4),
(111, 'Rio de Janeiro', 'Rio de Janeiro', '20000-000', 4),
(112, 'Buenos Aires', 'Buenos Aires', 'C1001', 5),
(113, 'Cordoba', 'Cordoba', 'X5000', 5),
(114, 'Santiago', 'Santiago Metropolitan', '8320000', 113),
(115, 'Valparaiso', 'Valparaiso', '2340000', 113),
(116, 'Montevideo', 'Montevideo', '11000', 115),
(117, 'Punta del Este', 'Maldonado', '20100', 115),
(118, 'Lima', 'Lima', '15001', 106),
(119, 'Cusco', 'Cusco', '08002', 106),
(120, 'Bogota', 'Bogota', '110111', 107),
(121, 'Medellin', 'Antioquia', '050001', 107),
(122, 'Kingston', 'Kingston', '00001', 124),
(123, 'Montego Bay', 'St. James Parish', '00002', 124),
(124, 'Havana', 'La Habana', '10100', 123),
(125, 'Santiago de Cuba', 'Santiago de Cuba', '90100', 123),
(126, 'Montevideo', 'Montevideo', '11000', 115),
(127, 'Punta del Este', 'Maldonado', '20100', 115),
(128, 'Lima', 'Lima Province', '15001', 106),
(129, 'Cusco', 'Cusco', '08002', 106),
(130, 'Bogota', 'Bogotá', '110111', 107),
(131, 'Medellin', 'Antioquia', '05001', 107),
(132, 'Caracas', 'Capital District', '1010', 108),
(133, 'Maracaibo', 'Zulia', '4001', 108),
(134, 'Quito', 'Pichincha', '170102', 111),
(135, 'Guayaquil', 'Guayas', '090101', 111),
(136, 'Miami', 'Florida', '33133', 1) ;

-- Branches table
CREATE TABLE branches (
    id int PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    locations_id int NOT NULL references locations(id)
);

INSERT INTO branches (id, name, locations_id) VALUES
(1, 'Central Square', 1),
(2, 'Downtown Crossing', 2),
(3, 'The Waterfront', 3),
(4, 'Cherry Creek', 4),
(5, 'The Grove', 5),
(6, 'Union Square', 6),
(7, 'Magnificent Mile', 7),
(8, 'South Beach', 8),
(9, 'North Park', 9),
(10, 'Capitol Hill', 10),
(11, 'Old Town', 11),
(12, 'Georgetown', 12),
(13, 'Harbor East', 13),
(14, 'Midtown', 14),
(15, 'The Strip', 15),
(16, 'Pearl District', 16),
(17, 'SoHo', 17),
(18, 'Liberty Place', 18),
(19, 'Bricktown', 19),
(20, 'Warehouse District', 20);

-- Sales Points table
CREATE TABLE sales_points (
    id int PRIMARY KEY,
    branch_id INT REFERENCES branches(id),
    name VARCHAR(255) NOT NULL
);
-- Inserting sale points for branch with ID 1
INSERT INTO sales_points (id, branch_id, name) VALUES
(1,1,'Sale Point 1'),
(2,1,'Sale Point 2'),
(3,1,'Sale Point 3'),
(4,1,'Sale Point 4'),
(5,1,'Sale Point 5'),
(6,1,'Sale Point 6'),
(7,1,'Sale Point 7'),
(8,1,'Sale Point 8'),
(9,1,'Sale Point 9'),
(10,1,'Sale Point 10'),
(11,1,'Sale Point 11'),
(12,1,'Sale Point 12'),
(13,1,'Sale Point 13'),
(14,1,'Sale Point 14'),
(15,1,'Sale Point 15'),
(16,1,'Sale Point 16'),
(17,1,'Sale Point 17'),
(18,1,'Sale Point 18'),
(19,1,'Sale Point 19'),
(20,1,'Sale Point 20'),
(21,2,'Sale Point 1'),
(22,2,'Sale Point 2'),
(23,2,'Sale Point 3'),
(24,2,'Sale Point 4'),
(25,2,'Sale Point 5'),
(26,2,'Sale Point 6'),
(27,2,'Sale Point 7'),
(28,2,'Sale Point 8'),
(29,2,'Sale Point 9'),
(30,2,'Sale Point 10'),
(31,2,'Sale Point 11'),
(32,2,'Sale Point 12'),
(33,2,'Sale Point 13'),
(34,2,'Sale Point 14'),
(35,2,'Sale Point 15'),
(36,2,'Sale Point 16'),
(37,2,'Sale Point 17'),
(38,2,'Sale Point 18'),
(39,2,'Sale Point 19'),
(40,2,'Sale Point 20'),
(41,3,'Sale Point 1'),
(42,3,'Sale Point 2'),
(43,3,'Sale Point 3'),
(44,3,'Sale Point 4'),
(45,3,'Sale Point 5'),
(46,3,'Sale Point 6'),
(47,3,'Sale Point 7'),
(48,3,'Sale Point 8'),
(49,3,'Sale Point 9'),
(50,3,'Sale Point 10'),
(51,3,'Sale Point 11'),
(52,3,'Sale Point 12'),
(53,3,'Sale Point 13'),
(54,3,'Sale Point 14'),
(55,3,'Sale Point 15'),
(56,3,'Sale Point 16'),
(57,3,'Sale Point 17'),
(58,3,'Sale Point 18'),
(59,3,'Sale Point 19'),
(60,3,'Sale Point 20'),
(61,4,'Sale Point 1'),
(62,4,'Sale Point 2'),
(63,4,'Sale Point 3'),
(64,4,'Sale Point 4'),
(65,4,'Sale Point 5'),
(66,4,'Sale Point 6'),
(67,4,'Sale Point 7'),
(68,4,'Sale Point 8'),
(69,4,'Sale Point 9'),
(70,4,'Sale Point 10'),
(71,4,'Sale Point 11'),
(72,4,'Sale Point 12'),
(73,4,'Sale Point 13'),
(74,4,'Sale Point 14'),
(75,4,'Sale Point 15'),
(76,4,'Sale Point 16'),
(77,4,'Sale Point 17'),
(78,4,'Sale Point 18'),
(79,4,'Sale Point 19'),
(80,4,'Sale Point 20'),
(81,5,'Sale Point 1'),
(82,5,'Sale Point 2'),
(83,5,'Sale Point 3'),
(84,5,'Sale Point 4'),
(85,5,'Sale Point 5'),
(86,5,'Sale Point 6'),
(87,5,'Sale Point 7'),
(88,5,'Sale Point 8'),
(89,5,'Sale Point 9'),
(90,5,'Sale Point 10'),
(91,5,'Sale Point 11'),
(92,5,'Sale Point 12'),
(93,5,'Sale Point 13'),
(94,5,'Sale Point 14'),
(95,5,'Sale Point 15'),
(96,5,'Sale Point 16'),
(97,5,'Sale Point 17'),
(98,5,'Sale Point 18'),
(99,5,'Sale Point 19'),
(100,5,'Sale Point 20'),
(101,6,'Sale Point 1'),
(102,6,'Sale Point 2'),
(103,6,'Sale Point 3'),
(104,6,'Sale Point 4'),
(105,6,'Sale Point 5'),
(106,6,'Sale Point 6'),
(107,6,'Sale Point 7'),
(108,6,'Sale Point 8'),
(109,6,'Sale Point 9'),
(110,6,'Sale Point 10'),
(111,6,'Sale Point 11'),
(112,6,'Sale Point 12'),
(113,6,'Sale Point 13'),
(114,6,'Sale Point 14'),
(115,6,'Sale Point 15'),
(116,6,'Sale Point 16'),
(117,6,'Sale Point 17'),
(118,6,'Sale Point 18'),
(119,6,'Sale Point 19'),
(120,6,'Sale Point 20'),
(121,7,'Sale Point 1'),
(122,7,'Sale Point 2'),
(123,7,'Sale Point 3'),
(124,7,'Sale Point 4'),
(125,7,'Sale Point 5'),
(126,7,'Sale Point 6'),
(127,7,'Sale Point 7'),
(128,7,'Sale Point 8'),
(129,7,'Sale Point 9'),
(130,7,'Sale Point 10'),
(131,7,'Sale Point 11'),
(132,7,'Sale Point 12'),
(133,7,'Sale Point 13'),
(134,7,'Sale Point 14'),
(135,7,'Sale Point 15'),
(136,7,'Sale Point 16'),
(137,7,'Sale Point 17'),
(138,7,'Sale Point 18'),
(139,7,'Sale Point 19'),
(140,7,'Sale Point 20'),
(141,8,'Sale Point 1'),
(142,8,'Sale Point 2'),
(143,8,'Sale Point 3'),
(144,8,'Sale Point 4'),
(145,8,'Sale Point 5'),
(146,8,'Sale Point 6'),
(147,8,'Sale Point 7'),
(148,8,'Sale Point 8'),
(149,8,'Sale Point 9'),
(150,8,'Sale Point 10'),
(151,8,'Sale Point 11'),
(152,8,'Sale Point 12'),
(153,8,'Sale Point 13'),
(154,8,'Sale Point 14'),
(155,8,'Sale Point 15'),
(156,8,'Sale Point 16'),
(157,8,'Sale Point 17'),
(158,8,'Sale Point 18'),
(159,8,'Sale Point 19'),
(160,8,'Sale Point 20'),
(161,9,'Sale Point 1'),
(162,9,'Sale Point 2'),
(163,9,'Sale Point 3'),
(164,9,'Sale Point 4'),
(165,9,'Sale Point 5'),
(166,9,'Sale Point 6'),
(167,9,'Sale Point 7'),
(168,9,'Sale Point 8'),
(169,9,'Sale Point 9'),
(170,9,'Sale Point 10'),
(171,9,'Sale Point 11'),
(172,9,'Sale Point 12'),
(173,9,'Sale Point 13'),
(174,9,'Sale Point 14'),
(175,9,'Sale Point 15'),
(176,9,'Sale Point 16'),
(177,9,'Sale Point 17'),
(178,9,'Sale Point 18'),
(179,9,'Sale Point 19'),
(180,9,'Sale Point 20'),
(181,10,'Sale Point 1'),
(182,10,'Sale Point 2'),
(183,10,'Sale Point 3'),
(184,10,'Sale Point 4'),
(185,10,'Sale Point 5'),
(186,10,'Sale Point 6'),
(187,10,'Sale Point 7'),
(188,10,'Sale Point 8'),
(189,10,'Sale Point 9'),
(190,10,'Sale Point 10'),
(191,10,'Sale Point 11'),
(192,10,'Sale Point 12'),
(193,10,'Sale Point 13'),
(194,10,'Sale Point 14'),
(195,10,'Sale Point 15'),
(196,10,'Sale Point 16'),
(197,10,'Sale Point 17'),
(198,10,'Sale Point 18'),
(199,10,'Sale Point 19'),
(200,10,'Sale Point 20'),
(201,11,'Sale Point 1'),
(202,11,'Sale Point 2'),
(203,11,'Sale Point 3'),
(204,11,'Sale Point 4'),
(205,11,'Sale Point 5'),
(206,11,'Sale Point 6'),
(207,11,'Sale Point 7'),
(208,11,'Sale Point 8'),
(209,11,'Sale Point 9'),
(210,11,'Sale Point 10'),
(211,11,'Sale Point 11'),
(212,11,'Sale Point 12'),
(213,11,'Sale Point 13'),
(214,11,'Sale Point 14'),
(215,11,'Sale Point 15'),
(216,11,'Sale Point 16'),
(217,11,'Sale Point 17'),
(218,11,'Sale Point 18'),
(219,11,'Sale Point 19'),
(220,11,'Sale Point 20'),
(221,12,'Sale Point 1'),
(222,12,'Sale Point 2'),
(223,12,'Sale Point 3'),
(224,12,'Sale Point 4'),
(225,12,'Sale Point 5'),
(226,12,'Sale Point 6'),
(227,12,'Sale Point 7'),
(228,12,'Sale Point 8'),
(229,12,'Sale Point 9'),
(230,12,'Sale Point 10'),
(231,12,'Sale Point 11'),
(232,12,'Sale Point 12'),
(233,12,'Sale Point 13'),
(234,12,'Sale Point 14'),
(235,12,'Sale Point 15'),
(236,12,'Sale Point 16'),
(237,12,'Sale Point 17'),
(238,12,'Sale Point 18'),
(239,12,'Sale Point 19'),
(240,12,'Sale Point 20'),
(241,13,'Sale Point 1'),
(242,13,'Sale Point 2'),
(243,13,'Sale Point 3'),
(244,13,'Sale Point 4'),
(245,13,'Sale Point 5'),
(246,13,'Sale Point 6'),
(247,13,'Sale Point 7'),
(248,13,'Sale Point 8'),
(249,13,'Sale Point 9'),
(250,13,'Sale Point 10'),
(251,13,'Sale Point 11'),
(252,13,'Sale Point 12'),
(253,13,'Sale Point 13'),
(254,13,'Sale Point 14'),
(255,13,'Sale Point 15'),
(256,13,'Sale Point 16'),
(257,13,'Sale Point 17'),
(258,13,'Sale Point 18'),
(259,13,'Sale Point 19'),
(260,13,'Sale Point 20'),
(261,14,'Sale Point 1'),
(262,14,'Sale Point 2'),
(263,14,'Sale Point 3'),
(264,14,'Sale Point 4'),
(265,14,'Sale Point 5'),
(266,14,'Sale Point 6'),
(267,14,'Sale Point 7'),
(268,14,'Sale Point 8'),
(269,14,'Sale Point 9'),
(270,14,'Sale Point 10'),
(271,14,'Sale Point 11'),
(272,14,'Sale Point 12'),
(273,14,'Sale Point 13'),
(274,14,'Sale Point 14'),
(275,14,'Sale Point 15'),
(276,14,'Sale Point 16'),
(277,14,'Sale Point 17'),
(278,14,'Sale Point 18'),
(279,14,'Sale Point 19'),
(280,14,'Sale Point 20'),
(281,15,'Sale Point 1'),
(282,15,'Sale Point 2'),
(283,15,'Sale Point 3'),
(284,15,'Sale Point 4'),
(285,15,'Sale Point 5'),
(286,15,'Sale Point 6'),
(287,15,'Sale Point 7'),
(288,15,'Sale Point 8'),
(289,15,'Sale Point 9'),
(290,15,'Sale Point 10'),
(291,15,'Sale Point 11'),
(292,15,'Sale Point 12'),
(293,15,'Sale Point 13'),
(294,15,'Sale Point 14'),
(295,15,'Sale Point 15'),
(296,15,'Sale Point 16'),
(297,15,'Sale Point 17'),
(298,15,'Sale Point 18'),
(299,15,'Sale Point 19'),
(300,15,'Sale Point 20'),
(301,16,'Sale Point 1'),
(302,16,'Sale Point 2'),
(303,16,'Sale Point 3'),
(304,16,'Sale Point 4'),
(305,16,'Sale Point 5'),
(306,16,'Sale Point 6'),
(307,16,'Sale Point 7'),
(308,16,'Sale Point 8'),
(309,16,'Sale Point 9'),
(310,16,'Sale Point 10'),
(311,16,'Sale Point 11'),
(312,16,'Sale Point 12'),
(313,16,'Sale Point 13'),
(314,16,'Sale Point 14'),
(315,16,'Sale Point 15'),
(316,16,'Sale Point 16'),
(317,16,'Sale Point 17'),
(318,16,'Sale Point 18'),
(319,16,'Sale Point 19'),
(320,16,'Sale Point 20'),
(321,17,'Sale Point 1'),
(322,17,'Sale Point 2'),
(323,17,'Sale Point 3'),
(324,17,'Sale Point 4'),
(325,17,'Sale Point 5'),
(326,17,'Sale Point 6'),
(327,17,'Sale Point 7'),
(328,17,'Sale Point 8'),
(329,17,'Sale Point 9'),
(330,17,'Sale Point 10'),
(331,17,'Sale Point 11'),
(332,17,'Sale Point 12'),
(333,17,'Sale Point 13'),
(334,17,'Sale Point 14'),
(335,17,'Sale Point 15'),
(336,17,'Sale Point 16'),
(337,17,'Sale Point 17'),
(338,17,'Sale Point 18'),
(339,17,'Sale Point 19'),
(340,17,'Sale Point 20'),
(341,18,'Sale Point 1'),
(342,18,'Sale Point 2'),
(343,18,'Sale Point 3'),
(344,18,'Sale Point 4'),
(345,18,'Sale Point 5'),
(346,18,'Sale Point 6'),
(347,18,'Sale Point 7'),
(348,18,'Sale Point 8'),
(349,18,'Sale Point 9'),
(350,18,'Sale Point 10'),
(351,18,'Sale Point 11'),
(352,18,'Sale Point 12'),
(353,18,'Sale Point 13'),
(354,18,'Sale Point 14'),
(355,18,'Sale Point 15'),
(356,18,'Sale Point 16'),
(357,18,'Sale Point 17'),
(358,18,'Sale Point 18'),
(359,18,'Sale Point 19'),
(360,18,'Sale Point 20'),
(361,19,'Sale Point 1'),
(362,19,'Sale Point 2'),
(363,19,'Sale Point 3'),
(364,19,'Sale Point 4'),
(365,19,'Sale Point 5'),
(366,19,'Sale Point 6'),
(367,19,'Sale Point 7'),
(368,19,'Sale Point 8'),
(369,19,'Sale Point 9'),
(370,19,'Sale Point 10'),
(371,19,'Sale Point 11'),
(372,19,'Sale Point 12'),
(373,19,'Sale Point 13'),
(374,19,'Sale Point 14'),
(375,19,'Sale Point 15'),
(376,19,'Sale Point 16'),
(377,19,'Sale Point 17'),
(378,19,'Sale Point 18'),
(379,19,'Sale Point 19'),
(380,19,'Sale Point 20'),
(381,20,'Sale Point 1'),
(382,20,'Sale Point 2'),
(383,20,'Sale Point 3'),
(384,20,'Sale Point 4'),
(385,20,'Sale Point 5'),
(386,20,'Sale Point 6'),
(387,20,'Sale Point 7'),
(388,20,'Sale Point 8'),
(389,20,'Sale Point 9'),
(390,20,'Sale Point 10'),
(391,20,'Sale Point 11'),
(392,20,'Sale Point 12'),
(393,20,'Sale Point 13'),
(394,20,'Sale Point 14'),
(395,20,'Sale Point 15'),
(396,20,'Sale Point 16'),
(397,20,'Sale Point 17'),
(398,20,'Sale Point 18'),
(399,20,'Sale Point 19'),
(400,20,'Sale Point 20');






CREATE TABLE Deductions (
    id INT PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL
);

INSERT INTO Deductions (id, description, amount) VALUES
(1, 'Federal Income Tax', 200.00),
(2, 'State Income Tax', 100.00),
(3, 'Social Security Tax', 150.00),
(4, 'Medicare Tax', 75.00),
(5, 'Health Insurance Premiums', 250.00),
(6, 'Retirement Plan Contributions', 300.00),
(7, 'Dental Insurance', 30.00),
(8, 'Vision Insurance', 20.00),
(9, 'Life Insurance', 25.00),
(10, 'Disability Insurance', 40.00),
(11, 'Union Dues', 50.00),
(12, 'Charitable Contributions', 60.00);



-- Table for Unit Measures
CREATE TABLE unit_measures (
    id int PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

INSERT INTO unit_measures (id, name, description) VALUES
(1, 'Piece', 'Single item or unit'),
(2, 'Kilogram', 'Unit of weight equal to 1000 grams'),
(3, 'Gram', 'Unit of weight'),
(4, 'Ton', 'Unit of weight equal to 1,000 kilograms'),
(5, 'Liter', 'Unit of volume'),
(6, 'Milliliter', 'Unit of volume equal to 1/1000 of a liter'),
(7, 'Gallon', 'Unit of volume, used primarily for liquid substances'),
(8, 'Quart', 'Unit of volume equal to a quarter gallon'),
(9, 'Pound', 'Unit of weight'),
(10, 'Ounce', 'Unit of weight equal to 1/16 of a pound'),
(11, 'Square Meter', 'Unit of area'),
(12, 'Cubic Meter', 'Unit of volume in metric system'),
(13, 'Inch', 'Unit of length'),
(14, 'Foot', 'Unit of length equal to 12 inches'),
(15, 'Yard', 'Unit of length equal to 3 feet'),
(16, 'Meter', 'Basic unit of length in the metric system'),
(17, 'Centimeter', 'Unit of length equal to 1/100 of a meter'),
(18, 'Box', 'Unit for goods sold in boxes'),
(19, 'Package', 'Unit for goods sold in packages'),
(20, 'Case', 'Unit for goods sold in cases or crates');

CREATE TABLE Roles (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    base_salary DECIMAL(10,2)
);

INSERT INTO Roles (id, title, base_salary) VALUES
(1, 'Cashier', 25000.00),
(2, 'Sales Associate', 27000.00),
(3, 'Store Manager', 55000.00),
(4, 'Assistant Manager', 40000.00),
(5, 'Inventory Specialist', 30000.00),
(6, 'Customer Service Representative', 28000.00),
(7, 'Security Officer', 32000.00),
(8, 'Maintenance Worker', 29000.00),
(9, 'Visual Merchandiser', 35000.00),
(10, 'Loss Prevention Specialist', 34000.00),
(11, 'Product Buyer', 50000.00),
(12, 'Human Resources Coordinator', 45000.00),
(13, 'Marketing Coordinator', 47000.00),
(14, 'IT Support Specialist', 52000.00),
(15, 'Operations Manager', 60000.00);



-- Table for Business Unit
CREATE TABLE business_units (
    id int PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);
INSERT INTO business_units (id, name, description) VALUES
(1, 'Clothing', 'Handles the sale and stocking of men''s, women''s, and children''s clothing.'),
(2, 'Electronics', 'Focuses on consumer electronics, including smartphones, tablets, and personal computers.'),
(3, 'Home Appliances', 'Offers a range of home appliances from major and minor brands, including kitchen appliances and laundry machines.'),
(4, 'Groceries', 'Provides a variety of food items, including fresh produce, bakery, dairy, and canned goods.'),
(5, 'Beauty and Personal Care', 'Covers beauty products and personal care items such as cosmetics, skincare, and haircare products.'),
(6, 'Toys and Games', 'Offers a range of toys and games for children of all ages, including educational toys and electronic games.'),
(7, 'Sports and Fitness', 'Specializes in sports equipment, outdoor gear, and fitness products.'),
(8, 'Books and Stationery', 'Deals with the sale of books, magazines, and stationery items for personal, educational, and professional use.'),
(9, 'Furniture and Home Decor', 'Focuses on furniture, home decor items, and interior design solutions for various living spaces.'),
(10, 'Pharmacy and Health Products', 'Provides pharmaceutical products, health supplements, and medical devices.'),
(11, 'Jewelry and Accessories', 'Deals in jewelry, watches, and a variety of fashion accessories.'),
(12, 'Footwear', 'Specializes in a wide range of footwear for men, women, and children.'),
(13, 'Gardening and Outdoor', 'Offers gardening supplies, outdoor furniture, and equipment for outdoor activities.'),
(14, 'Automotive', 'Provides automotive parts, accessories, and car care products.'),
(15, 'Pet Supplies', 'Offers a range of products for pets, including food, toys, and health care items.'),
(16, 'Electrical and Lighting', 'Focuses on electrical supplies, lighting fixtures, and related accessories.'),
(17, 'DIY and Hardware', 'Deals with do-it-yourself tools, building materials, and hardware.'),
(18, 'Music and Video', 'Sells music CDs, vinyl records, DVDs, and other media formats.'),
(19, 'Travel and Luggage', 'Specializes in travel accessories, luggage, and travel-related products.'),
(20, 'Seasonal', 'Focuses on products related to specific seasons or holidays, including decorations and seasonal foods.');



-- Expense Category Table
CREATE TABLE revenue_expense_categories (
    id int PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    revenue_expense char(1)
);

INSERT INTO revenue_expense_categories (id, name, description, revenue_expense) VALUES
(1, 'Inventory Purchases', 'Costs associated with buying goods for resale, including bulk purchases and restocking fees.','E'),
(2, 'Rent or Lease', 'Expenses for leasing or renting space for the retail operations, including stores and warehouses.','E'),
(3, 'Utilities', 'Monthly costs for utilities such as electricity, water, gas, and internet services.','E'),
(4, 'Salaries and Wages', 'Payments to employees, including salaries, wages, overtime, and bonuses.','E'),
(5, 'Benefits and Taxes', 'Costs related to employee benefits like health insurance and taxes.','E'),
(6, 'Marketing and Advertising', 'Expenses for marketing campaigns, advertising, promotional materials, and events.','E'),
(7, 'Maintenance and Repairs', 'Costs for maintaining and repairing equipment, facilities, and vehicles.','E'),
(8, 'Supplies', 'Purchasing operational supplies, office supplies, and cleaning materials.','E'),
(9, 'Insurance', 'Premiums paid for various types of insurance, including property, liability, and workers'' compensation.','E'),
(10, 'Technology and Software', 'Investments in technology, software subscriptions, and IT support.','E'),
(11, 'Professional Services', 'Fees for services provided by lawyers, accountants, consultants, and other professionals.','E'),
(12, 'Travel and Entertainment', 'Costs associated with business travel and entertainment expenses for employees.','E'),
(13, 'Shipping and Freight', 'Expenses for shipping goods to customers and transferring inventory between locationss.','E'),
(14, 'Utilities and Communication', 'Monthly costs for essential services such as water, electricity, and telecommunications.','E'),
(15, 'Depreciation and Amortization', 'Accounting expenses related to the depreciation of assets and amortization of intangible assets.','E'),
(16, 'Rent and Leasehold Improvements', 'Expenses related to the improvement and customization of leased retail spaces.','E'),
(17, 'Taxes and Licenses', 'Government-imposed taxes and fees for licenses required to operate the retail business.','E'),
(18, 'Bank Fees and Interest', 'Fees charged by banks and interest on loans or credit lines.','E'),
(19, 'Losses from Theft or Damage', 'Financial impact of inventory loss due to theft, damage, or other unforeseen events.','E'),
(20, 'Miscellaneous', 'Other expenses that do not fit neatly into the above categories.','E')
(21, 'Sales of Goods', 'Direct income from the sale of products in store.','R'),
(22, 'Online Sales', 'Income from products sold through the retailer''s online platform.','R'),
(23, 'Service Fees', 'Revenue generated from services offered, such as custom fittings or personal shopping.','R'),
(24, 'Extended Warranties', 'Income from selling extended warranty services for products.','R'),
(25, 'Delivery Charges', 'Fees collected for delivering goods to the customer''s location.','R'),
(26, 'Membership Fees', 'Revenue from customers subscribing to a membership program for benefits.','R'),
(27, 'Rental Income', 'Income from renting out part of the retail space to other businesses.','R'),
(28, 'Franchise Fees', 'Fees collected from franchised outlets.','R'),
(29, 'Sponsorship Income', 'Revenue from brands paying for product placement or endorsement within the store.','R'),
(30, 'Returns and Handling Fees', 'Fees associated with processing returns or exchanges.','R');



-- Table for Customer Segment
CREATE TABLE customer_segments (
    id int PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

INSERT INTO customer_segments (id, name, description) VALUES
(1, 'Value Shoppers', 'Customers focused on finding the best deals and discounts, prioritizing price over brand or quality.'),
(2, 'Brand Loyalists', 'Consumers who are loyal to specific brands and often make repeat purchases from them.'),
(3, 'Impulse Buyers', 'Shoppers who make spontaneous purchases without prior planning, often influenced by in-store displays and promotions.'),
(4, 'Luxury Shoppers', 'High-income consumers focused on purchasing premium and luxury products.'),
(5, 'Ethical Consumers', 'Customers who prioritize products that are ethically sourced, environmentally friendly, or socially responsible.'),
(6, 'Technology Enthusiasts', 'Shoppers with a keen interest in the latest technological gadgets and innovations.'),
(7, 'Convenience Shoppers', 'Consumers looking for quick and easy shopping experiences, often valuing time over price or selection.'),
(8, 'Health and Wellness Focused', 'Customers interested in health and wellness products, including organic foods, supplements, and fitness gear.'),
(9, 'Parents and Families', 'Shoppers purchasing on behalf of their families, often looking for kid-friendly products and family-sized packs.'),
(10, 'DIY and Hobbyists', 'Individuals interested in do-it-yourself projects, crafting, and hobbies, purchasing tools and materials for personal projects.'),
(11, 'Fashion Forward', 'Customers who follow the latest fashion trends and are always on the lookout for new and stylish apparel and accessories.'),
(12, 'Home Decorators', 'Shoppers interested in home decor and furnishing products to enhance their living spaces.'),
(13, 'Outdoor and Sports Enthusiasts', 'Individuals focused on outdoor activities and sports, purchasing gear and equipment for their adventures.'),
(14, 'Professional and Business Customers', 'Business customers purchasing products for office use or professional services.'),
(15, 'Students', 'Young consumers with a focus on affordability, purchasing educational materials and products for their lifestyle.'),
(16, 'Seniors', 'Older customers with specific needs, often looking for products that improve quality of life and accessibility.'),
(17, 'Global Shoppers', 'Consumers interested in international brands and products not readily available in their home country.'),
(18, 'Seasonal Shoppers', 'Customers who shop during specific times of the year, such as holidays or back-to-school season.'),
(19, 'Online Shoppers', 'Consumers who prefer shopping online for the convenience of home delivery and a wider product selection.'),
(20, 'In-store Experience Seekers', 'Shoppers who prefer visiting physical stores for the tactile shopping experience and immediate product access.');


-- Table for Vendor Category
CREATE TABLE vendor_categories (
    id int PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

INSERT INTO vendor_categories (id, name, description) VALUES
(1, 'Apparel and Footwear', 'Suppliers specializing in clothing, shoes, and fashion accessories for men, women, and children.'),
(2, 'Electronics and Gadgets', 'Vendors providing consumer electronics, including smartphones, tablets, computers, and electronic accessories.'),
(3, 'Home and Kitchen Appliances', 'Manufacturers and suppliers of large and small home appliances, kitchen gadgets, and utensils.'),
(4, 'Grocery and Food Products', 'Wholesalers of food items, including fresh produce, packaged foods, beverages, and specialty food products.'),
(5, 'Beauty and Personal Care', 'Suppliers of cosmetics, skincare products, haircare products, and other personal care items.'),
(6, 'Toys and Children''s Products', 'Vendors offering toys, games, educational products, and accessories for children.'),
(7, 'Sports and Outdoor Equipment', 'Suppliers of sports goods, outdoor recreation products, and fitness equipment.'),
(8, 'Books and Stationery', 'Distributors of books, magazines, office supplies, and stationery items.'),
(9, 'Furniture and Home Decor', 'Manufacturers and wholesalers of furniture, home decor items, and interior decorating solutions.'),
(10, 'Pharmaceuticals and Health Products', 'Suppliers of pharmaceutical products, health supplements, and wellness goods.'),
(11, 'Jewelry and Accessories', 'Wholesalers of jewelry, watches, and various fashion accessories.'),
(12, 'Automotive Parts and Accessories', 'Vendors specializing in automotive parts, accessories, and car care products.'),
(13, 'Building Materials and Hardware', 'Suppliers of DIY tools, building materials, and hardware products.'),
(14, 'Electrical and Lighting', 'Wholesalers of electrical supplies, lighting fixtures, and related products.'),
(15, 'Music, Movies, and Entertainment', 'Distributors of music CDs, vinyl records, DVDs, and other entertainment media.'),
(16, 'Computer Software and Video Games', 'Suppliers of computer software, video games, and digital content.'),
(17, 'Pet Supplies', 'Vendors offering products for pets, including food, toys, and health care items.'),
(18, 'Gardening and Landscaping', 'Suppliers of gardening tools, plants, outdoor furniture, and landscaping products.'),
(19, 'Travel and Luggage', 'Wholesalers of travel accessories, luggage, and related products for travelers.'),
(20, 'Cleaning and Janitorial Supplies', 'Suppliers of cleaning products, janitorial equipment, and sanitary supplies.');



-- Table for Department
CREATE TABLE departments (
    id int PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO departments (id, name) VALUES
(1, 'Sales'),
(2, 'Customer Service'),
(3, 'Marketing'),
(4, 'Human Resources'),
(5, 'Finance'),
(6, 'Purchasing'),
(7, 'Inventory Management'),
(8, 'Shipping and Receiving'),
(9, 'Information Technology'),
(10, 'Security'),
(11, 'Maintenance'),
(12, 'Visual Merchandising'),
(13, 'E-Commerce'),
(14, 'Research and Development'),
(15, 'Compliance'),
(16, 'Quality Control'),
(17, 'Training and Development'),
(18, 'Sustainability'),
(19, 'Legal'),
(20, 'Corporate Communications');


-- Product Categories Table
CREATE TABLE ProductCategories (
    id int PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100)
);

INSERT INTO ProductCategories (id, name, description) VALUES
(1, 'Apparel', 'Clothing items for men, women, and children, including outerwear and underwear.'),
(2, 'Footwear', 'Shoes, boots, sandals, and other types of footwear for all ages.'),
(3, 'Electronics', 'Consumer electronics such as smartphones, tablets, laptops, and accessories.'),
(4, 'Home Appliances', 'Large and small appliances for household use, from refrigerators to microwaves.'),
(5, 'Groceries', 'Food items including fresh produce, dairy, meat, canned goods, and snacks.'),
(6, 'Beauty Products', 'Cosmetics, skincare, haircare, and other personal care items.'),
(7, 'Health and Wellness', 'Health supplements, vitamins, fitness equipment, and wellness products.'),
(8, 'Toys and Games', 'Toys, board games, video games, and recreational products for children and adults.'),
(9, 'Sports Goods', 'Sporting equipment, apparel, and accessories for various physical activities.'),
(10, 'Books and Stationery', 'Books, magazines, office supplies, and stationery items.'),
(11, 'Home Decor', 'Decorative items, furniture, and textiles for home improvement.'),
(12, 'Garden and Outdoor', 'Gardening tools, plants, outdoor furniture, and barbecue equipment.'),
(13, 'Automotive Accessories', 'Car parts, accessories, and maintenance tools for vehicle upkeep.'),
(14, 'Pet Supplies', 'Food, toys, health care products, and accessories for pets.'),
(15, 'Jewelry and Watches', 'Decorative and functional accessories including necklaces, earrings, and watches.'),
(16, 'Music and Movies', 'CDs, vinyl records, DVDs, and other physical media formats.'),
(17, 'Computer and Software', 'Computers, peripherals, software, and IT accessories.'),
(18, 'Office Supplies', 'Products for office organization, stationery, and equipment.'),
(19, 'Travel Accessories', 'Luggage, travel bags, and accessories for travelers.'),
(20, 'Seasonal Items', 'Products related to or intended for use in specific seasons or holidays.');


-- Table for Payment Status
CREATE TABLE payment_statuses (
    id int PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

insert into payment_statuses(id, name, description) values (1, 'Unpaid', 'The payment is unpaid') ;
insert into payment_statuses(id, name, description) values (2, 'Partial', 'The payment is partially completed') ;
insert into payment_statuses(id, name, description) values (3, 'Paid', 'The payment is complete') ;

-- Table for Sales Purchase Order Status
CREATE TABLE SP_order_statuses (
    id int PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

insert into SP_order_statuses(id, name, description) values 
(1, 'Pending', 'The order has been created but not yet processed or sent to the supplier.'),
(2, 'Sent', 'The order has been sent to the supplier but goods have not been received yet.'),
(3, 'Received Partial', 'Some of the items in the order have been received, but the order is not yet complete.'),
(4, 'Received Full', 'All items in the purchase order have been received.'),
(5, 'Cancelled', 'The order has been cancelled and will not be fulfilled.'),
(6, 'Closed', 'The order has been fully processed, received, and any post-receipt actions (like payment) have been completed.') ;




-- Table for Payment Method
CREATE TABLE payment_methods (
    id int PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

INSERT INTO payment_methods (id, name, description) VALUES
(1, 'Cash', 'Physical currency used to pay for purchases.'),
(2, 'Debit Card', 'A bank card that deducts money directly from a checking account to pay for purchases.'),
(3, 'Credit Card', 'A card issued by a bank allowing the holder to purchase goods and services on credit.'),
(4, 'Mobile Payments', 'Payment services operated under financial regulation and performed from or via a mobile device.'),
(5, 'Online Payments', 'Payments made using online platforms or e-commerce payment systems.'),
(6, 'Bank Transfer', 'Direct transfer of money from one bank account to another.'),
(7, 'Check', 'A written, dated, and signed instrument that directs a bank to pay a specific sum of money to the bearer.'),
(8, 'Gift Cards', 'Preloaded debit cards that provide the cardholder with funds to make purchases.'),
(9, 'Loyalty Points', 'Points earned by customers that can be used as payment for purchases.'),
(10, 'Cryptocurrency', 'Digital or virtual currencies that use cryptography for security, used as a medium of exchange.'),
(11, 'Pay Later', 'Payment services that allow consumers to purchase and receive items immediately but pay for them over time.'),
(12, 'Direct Debit', 'A financial transaction in which one person withdraws funds from another person''s bank account.'),
(13, 'E-Wallets', 'Electronic devices or online services that allow individuals to make electronic transactions.'),
(14, 'Contactless Payments', 'Payments made using technology that allows customers to pay by tapping a card or device.'),
(15, 'Vouchers', 'Certificates that act as a substitute for cash for purchases within a particular store or business.');



-- Table for Payment Terms
CREATE TABLE payment_terms (
    id int PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    net_due_days INTEGER NOT NULL,
    description TEXT
);

INSERT INTO payment_terms (id, name, net_due_days, description) VALUES
(1, 'Net 30', 30, 'Payment due in full 30 days after the invoice date.'),
(2, 'Net 60', 60, 'Payment due in full 60 days after the invoice date.'),
(3, 'Cash on Delivery', 0, 'Payment made at the time of delivery rather than in advance.'),
(4, 'Prepaid', -1, 'Payment made in advance before goods or services are delivered.'),
(5, 'Net 15', 15, 'Payment due in full 15 days after the invoice date.'),
(6, '2/10 Net 30', 30, '2% discount if payment is made within 10 days, otherwise net amount due in 30 days.'),
(7, 'Immediate Payment', 0, 'Payment is required immediately upon receipt of invoice or at point of sale.'),
(8, 'Consignment', 0, 'Payment made only after the goods are sold by the reselling party.'),
(9, '30 Days EOM', 30, 'Payment due 30 days after the end of the month in which the invoice was received.'),
(10, '60 Days EOM', 60, 'Payment due 60 days after the end of the month in which the invoice was received.'),
(11, 'COD', 0, 'Cash on Delivery - payment made at the time goods are received.'),
(12, 'CIA', 0, 'Cash in Advance - payment made before any goods are shipped.'),
(13, 'Stage Payment', 0, 'Payment made in stages as agreed milestones are reached.'),
(14, 'End of Quarter', 90, 'Payment due at the end of the quarter in which the invoice was issued.'),
(15, 'Annual Billing', 365, 'Payment due once per year on the invoice date.');


-- Utility Type Table
CREATE TABLE utility_type (
    id int PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

INSERT INTO utility_type (id, name, description) VALUES
(1, 'Electricity', 'Power supply for lighting, heating, cooling, and operating equipment.'),
(2, 'Water', 'Supply of water for sanitary, cleaning, and operational needs.'),
(3, 'Natural Gas', 'Gas supply used for heating, cooking, and in some cases, powering equipment.'),
(4, 'Internet', 'Broadband internet services for business operations, transactions, and communication.'),
(5, 'Telephone', 'Landline telephone services for communication with customers and suppliers.'),
(6, 'Waste Removal', 'Regular removal of waste and recycling materials generated by the business.'),
(7, 'Security System', 'Monitoring and alarm systems for theft prevention and property protection.'),
(8, 'Sewer', 'Sewage services for waste disposal and sanitation.'),
(9, 'Heating, Ventilation, and Air Conditioning (HVAC)', 'Systems for regulating indoor temperature and air quality.'),
(10, 'Cloud Services', 'Online services for data storage, software use, and other computing needs.'),
(11, 'POS System', 'Point of Sale system services for processing customer transactions.'),
(12, 'E-commerce Platform', 'Online platform services for selling goods and services over the internet.'),
(13, 'Digital Marketing', 'Online advertising and marketing services to promote the business.'),
(14, 'Software Subscriptions', 'Subscriptions for business management software, including CRM and ERP systems.'),
(15, 'Pest Control', 'Regular pest extermination and control services to maintain a clean and safe environment.');




CREATE TABLE ExpenseCategory (
    id int PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Description VARCHAR(100)
);

INSERT INTO ExpenseCategory (id, Name, Description) VALUES
(1, 'Inventory', 'Costs related to purchasing goods for resale, including wholesale purchases.'),
(2, 'Rent', 'Monthly or annual cost of leasing retail and storage space.'),
(3, 'Utilities', 'Expenses for electricity, water, gas, and other utilities.'),
(4, 'Salaries', 'Payments to employees, including wages, salaries, bonuses, and overtime.'),
(5, 'Marketing', 'Costs associated with advertising and promotional activities.'),
(6, 'Supplies', 'Purchasing office and operational supplies.'),
(7, 'Insurance', 'Premiums for business insurance policies, including liability and property.'),
(8, 'Taxes', 'Federal, state, and local taxes.'),
(9, 'Maintenance', 'Expenses for the upkeep and repair of equipment and premises.'),
(10, 'Technology', 'Investments in hardware, software, and tech support services.'),
(11, 'Shipping', 'Costs for shipping goods to customers or between locationss.'),
(12, 'Professional Fees', 'Payments for legal, accounting, and consulting services.'),
(13, 'Bank Charges', 'Fees and interest payments on business bank accounts and loans.'),
(14, 'Depreciation', 'Accounting for the reduction in value of assets over time.'),
(15, 'Miscellaneous', 'Other expenses that don''t fit into the above categories.');


-- Sales Channel Table
CREATE TABLE sales_channels (
    id int PRIMARY KEY,
    channel_name VARCHAR(100) NOT NULL,
    description TEXT
);

INSERT INTO sales_channels (id, channel_name, description) VALUES
(1, 'Physical Store', 'Sales through brick-and-mortar locationss where customers can physically select and purchase goods.'),
(2, 'Online Store', 'E-commerce platform allowing customers to purchase goods over the internet.'),
(3, 'Mobile App', 'A dedicated mobile application through which sales are made, offering convenience and mobility.'),
(4, 'Social Media', 'Utilizing social media platforms to sell products directly to consumers.'),
(5, 'Marketplace Platforms', 'Selling products on third-party e-commerce platforms like Amazon, eBay, and Etsy.'),
(6, 'Catalog Sales', 'Sales made through printed or online catalogs where customers order by phone or mail.'),
(7, 'Pop-up Shops', 'Temporary retail spaces that sell merchandise of any kind for a short period.'),
(8, 'Direct Sales', 'Selling directly to the consumer in a non-retail environment, often through personal interactions.'),
(9, 'Wholesale', 'Selling goods in bulk to other businesses, such as retailers, for resale to the final consumer.'),
(10, 'Events and Fairs', 'Sales conducted at events, trade shows, and fairs, directly to consumers or businesses.'),
(11, 'Telemarketing', 'Sales made over the phone, often through cold calling or responding to inquiries.'),
(12, 'Affiliate Marketing', 'Partnering with individuals or companies to promote and sell products in exchange for a commission.'),
(13, 'Email Marketing', 'Using email communications to directly market and sell products to consumers.'),
(14, 'Subscription Service', 'Offering products on a subscription basis, providing recurring revenue.'),
(15, 'Dropshipping', 'Selling products that are shipped to the customer directly from the supplier or manufacturer, without being held in stock by the retailer.');


-- Promotion Table
CREATE TABLE promotions (
    id int PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    productcategory_id INT REFERENCES ProductCategories(id),
    discount_rate DECIMAL(5, 2)
);


INSERT INTO promotion (id, name, description, start_date, end_date, productcategory_id, discount_rate) VALUES
(1, 'Summer Apparel Sale', 'Discounts on summer apparel including shorts, t-shirts, and sandals.', '2023-06-01', '2023-06-30', 1, 15.00),
(2, 'Tech Gadgets', 'Special offers on the latest tech gadgets and accessories.', '2023-09-01', '2023-09-30', 3, 10.00),
(3, 'Home Makeover', 'Spring deals on furniture and home decor for a fresh look.', '2023-04-01', '2023-04-30', 11, 20.00),
(4, 'Back to School Tech', 'Back to school discounts on laptops, tablets, and smartphones.', '2023-08-01', '2023-08-31', 3, 12.00),
(5, 'Fitness Gear', 'Promotion on sports goods and fitness equipment to kickstart your routine.', '2023-01-01', '2023-01-31', 9, 15.00),
(6, 'Kitchen Essentials', 'Sale on kitchen appliances and cookware essentials.', '2023-10-01', '2023-10-31', 4, 10.00),
(7, 'Winter Wonderland', 'Great deals on winter clothing and outdoor gear.', '2023-11-01', '2023-11-30', 1, 20.00),
(8, 'Beauty Must-Haves', 'Discounts on top beauty and skincare brands.', '2023-05-01', '2023-05-15', 6, 10.00),
(9, 'Outdoor Adventure', 'Sale on camping, hiking, and outdoor equipment.', '2023-07-01', '2023-07-31', 13, 15.00),
(10, 'Pet Care', 'Special offers on pet food, toys, and accessories.', '2023-03-01', '2023-03-30', 14, 10.00),
(11, 'Jewelry Spring Fling', 'Elegant discounts on our spring collection of jewelry.', '2023-04-10', '2023-04-30', 15, 5.00),
(12, 'Gaming Marathon', 'Deals on video games and gaming accessories for the avid gamer.', '2023-08-15', '2023-09-05', 8, 15.00),
(13, 'Backyard Essentials', 'Upgrade your outdoor space with our gardening and outdoor furniture sale.', '2023-03-15', '2023-04-15', 12, 20.00),
(14, 'Office Makeover', 'Promotions on office furniture and supplies to refresh your workspace.', '2023-11-01', '2023-11-30', 18, 10.00),
(15, 'Luxury Bed Linens', 'Luxurious discounts on high-quality bed linens and bedding.', '2023-07-20', '2023-08-10', 11, 15.00),
(16, 'Athletic Wear', 'Get moving with deals on our latest athletic wear and sportswear.', '2023-01-10', '2023-02-05', 1, 20.00),
(17, 'Eco-Friendly Finds', 'Special offers on environmentally friendly and sustainable products.', '2023-04-22', '2023-05-22', 5, 10.00),
(18, 'Travel in Style', 'Travel essentials sale, from luggage to travel accessories.', '2023-05-15', '2023-06-15', 19, 15.00),
(19, 'Smart Home Gadgets', 'Upgrade your home with the latest in smart home technology.', '2023-09-10', '2023-10-05', 3, 20.00),
(20, 'Winter Sports Gear', 'Hit the slopes with deals on winter sports equipment and apparel.', '2023-11-10', '2023-12-10', 9, 15.00),
(21, 'Classic Reads', 'Discounts on classic literature and popular novels.', '2023-04-01', '2023-04-30', 10, 10.00),
(22, 'Stationery Stock-Up', 'Sale on all stationery items, perfect for artists and writers.', '2023-08-01', '2023-08-31', 10, 5.00),
(23, 'Pet Health Month', 'Promotions on pet health products, including supplements and grooming items.', '2023-10-01', '2023-10-31', 14, 10.00),
(24, 'Car Care Kit', 'Deals on automotive care products to keep your car looking new.', '2023-06-01', '2023-06-30', 13, 15.00),
(25, 'Subscription Services Sale', 'Special offers on subscription services, including food and wellness boxes.', '2023-03-01', '2023-03-20', 14, 20.00);


INSERT INTO promotion (id, name, description, start_date, end_date, productcategory_id, discount_rate) VALUES
(26, 'DIY Tools & Hardware', 'Discounts on tools and hardware for your next DIY project.', '2023-05-01', '2023-05-31', 13, 15.00),
(27, 'Early Bird Holiday Decor', 'Get ready for the holidays with early bird discounts on decorations.', '2023-09-15', '2023-10-15', 20, 10.00),
(28, 'Summer Beauty Essentials', 'Stay radiant this summer with deals on beauty and skincare products.', '2023-06-15', '2023-07-15', 6, 5.00),
(29, 'Home Office Tech', 'Upgrade your home office with the latest tech gadgets.', '2023-07-01', '2023-07-31', 3, 10.00),
(30, 'Kids’ Corner', 'Deals on toys, games, and educational materials for kids.', '2023-08-20', '2023-09-10', 8, 20.00);



-- Table for Product/Service
--------------------- Persons/Parties

-- Table for parties
CREATE TABLE parties (
 id int PRIMARY KEY,
 company_or_person char(1),
 name VARCHAR(100) NOT NULL,
 birth_date DATE,
 locations_id INT REFERENCES locations(id)  
);


 
CREATE TABLE parties_types (
party_id int not null REFERENCES parties(id),
partytype_id int not null  REFERENCES entity_types(id)
) ; 


CREATE TABLE users (
 id int PRIMARY KEY REFERENCES parties(id) on delete cascade,
 name VARCHAR(100) NOT NULL
);


-- Table for Employee
CREATE TABLE employees (
    id int PRIMARY KEY REFERENCES parties(id) on delete cascade,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    department_id INTEGER  REFERENCES departments(id), 
    email VARCHAR(100),
    phone_number VARCHAR(40),
    hire_date DATE,
    branch_id INT REFERENCES Branches(id),
    Salary NUMERIC(10,2),
    position VARCHAR(40)
);


CREATE TABLE EmployeeRoles (
    id INT PRIMARY KEY REFERENCES parties(id) on delete cascade,
    employee_id INT NOT NULL  REFERENCES Employees(id),
    role_id INT NOT NULL REFERENCES Roles(id)
    start_date DATE,
    end_date DATE
);



-- Table for Supplier
CREATE TABLE suppliers (
    id int PRIMARY KEY REFERENCES parties(id) on delete cascade,
    name VARCHAR(80) NOT NULL,
    address_line VARCHAR(100),
    city VARCHAR(40),
    country VARCHAR(40),
    state VARCHAR(40),
    postal_code VARCHAR(40),
    locations_id INT REFERENCES locations(id),
    contact_name VARCHAR(80),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(40)
);




-- Table for Customer
CREATE TABLE customers (
    id int PRIMARY KEY REFERENCES parties(id) on delete cascade,
    company_name VARCHAR(80) NOT NULL,
    contact_name VARCHAR(80),
    contact_title VARCHAR(10),
    address VARCHAR(100),
    country VARCHAR(40),
    state VARCHAR(40),
    city VARCHAR(40),
    country_id int REFERENCES countries(id),
    customer_segment_id int references customer_segments(id), 
    phone VARCHAR(40),
    email VARCHAR(100),
    locations_id INT REFERENCES locations(id),
);




-- Table for Salesperson
CREATE TABLE salespersons (
    id int PRIMARY KEY REFERENCES parties(id) on delete cascade,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(40),
    locations_id INTEGER  REFERENCES locations(id),
);



-- landlords Table
CREATE TABLE landlords (
    id int PRIMARY KEY REFERENCES parties(id) on delete cascade,
    name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(80),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(40)
);

-- banks Table
CREATE TABLE banks (
    id int not null PRIMARY KEY REFERENCES parties(id) on delete cascade,
    name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(80),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(40)
);


CREATE TABLE TaxAuthorities (
    id INT not null PRIMARY KEY  REFERENCES parties(id) on delete cascade,
    name VARCHAR(255) NOT NULL,
    contact_info VARCHAR(255)
);


-- Service Provider Table
CREATE TABLE service_provider (
    id int PRIMARY KEY REFERENCES parties(id) on delete cascade,
    name VARCHAR(80) NOT NULL,
    contact_name VARCHAR(80),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(40),
    utility_type_id INT REFERENCES utility_type(id)
);



   
------------------------------

-- Table for product_services
CREATE TABLE product_services (
    id int PRIMARY KEY,
    code varchar(20) not null, 
    name VARCHAR(100) NOT NULL,
    product_service varchar(1),
    description TEXT,
    cost DECIMAL(15, 2) NOT NULL,
    supplier_id INTEGER  REFERENCES suppliers(id),
    unitmeasure_id INTEGER  REFERENCES unit_measures(id),
    selling_price DECIMAL(10, 2),
    quantity_in_stock INT,
    ReorderLevel INTEGER NOT NULL,
    category_id INTEGER  REFERENCES ProductCategories(id)
);



-- Table for Project
CREATE TABLE projects (
    id int PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(15, 2),
    business_unit_id INTEGER  REFERENCES business_units(id)
);






------------------- Transactions 

-- Sales Table
CREATE TABLE sales (
    id int PRIMARY KEY,
    transaction_type_id INTEGER NOT NULL REFERENCES transaction_types(id), 
    number_transaction int,
    invoicenumber char(20), 
    sale_order_id int references sale_orders(id),
    customer_id INT REFERENCES customers(id),
    sales_point_id INT REFERENCES sales_points(id),
    salesperson_id INTEGER NOT NULL REFERENCES salespersons(id),
    sales_channel_id INT REFERENCES sales_channel(id),
    sale_date DATE NOT NULL,
    sale_amount DECIMAL(10, 2) NOT NULL,
    user_id int REFERENCES users(id),
    promotion_id INT REFERENCES promotions(id),
    payment_method_id INT REFERENCES Payment_Methods(id),
    payment_term_id INT REFERENCES Payment_Terms(id)
);


CREATE TABLE SalesDetails (
    id INT PRIMARY KEY,
    sale_id INT NOT NULL REFERENCES Sales(id) on delete cascade,
    product_id INT NOT NULL REFERENCES product_services(id),
    quantity INT NOT NULL,
    sale_amount DECIMAL(10, 2) NOT NULL,
    cost_amount DECIMAL(10, 2) NOT NULL,
    price DECIMAL(10,2)
);



CREATE TABLE purchases (
    id int PRIMARY KEY,
    number_transaction int ,
    purchase_order_id int references purchase_orders(id),
    branch_id INTEGER REFERENCES branches(id),    
    invoicenumber char(20), 
    transaction_type_id INTEGER NOT NULL REFERENCES transaction_types(id), 
    supplier_id INT REFERENCES suppliers(id),
    reception_invoice_date DATE NOT NULL,
    purchase_amount DECIMAL(10, 2) NOT NULL,
    user_id int REFERENCES users(id),
    payment_method_id INT REFERENCES Payment_Methods(id),
    payment_term_id INT REFERENCES Payment_Terms(id)
);


CREATE TABLE purchasesdetails (
    id INT PRIMARY KEY,
    purchase_id INT NOT NULL REFERENCES purchases(id) on delete cascade,
    product_id INT NOT NULL REFERENCES product_services(id),
    quantity INT NOT NULL,
    value DECIMAL(10, 2) NOT NULL,
    price DECIMAL(10,2)
);

-- Table for Inventory Transactions
CREATE TABLE inventory_transactions (
    id int PRIMARY KEY,
    transaction_type_id INTEGER NOT NULL REFERENCES transaction_types(id),
    number_transaction int ,
    transaction_date date,
    user_id int REFERENCES users(id),
    branch_id INTEGER REFERENCES branches(id),
    customer_id INTEGER REFERENCES customers(id),
    supplier_id INTEGER REFERENCES suppliers(id),
    sale_id int REFERENCES sales(id),
    purchase_order_id int REFERENCES purchase_orders(id)
);


-- Inventory Transactions Table
CREATE TABLE inventory_transactions_detail (
    id int PRIMARY KEY,
    transaction_id int not null REFERENCES inventory_transactions(id) on delete cascade,
    product_id INTEGER NOT NULL  REFERENCES product_services(id),
    quantity INTEGER NOT NULL,
    value numeric(12,2) NOT NULL
);


CREATE TABLE Inventory (
    id INT PRIMARY KEY,
    product_id INT NOT NULL  REFERENCES Product_services(id),
    branch_id INT NOT NULL  REFERENCES branches(id),
    quantity INT NOT NULL,
    value numeric(12,2) NOT NULL
);



-- Table for Purchase Order
CREATE TABLE purchase_orders (
    id int PRIMARY KEY,
    number_transaction int ,
    order_date DATE NOT NULL,
    expected_delivery_date DATE,
    supplier_id INTEGER NOT NULL  REFERENCES suppliers(id),
    branch_id INTEGER NOT NULL  REFERENCES branches(id),
    user_id int REFERENCES users(id),
    total_amount DECIMAL(15,2) NOT NULL,
    order_status_id INT REFERENCES sp_order_statuses(id), 
    transaction_type_id int REFERENCES transaction_types(id), 
    payment_term_id INTEGER  REFERENCES payment_terms(id)
);

CREATE TABLE purchase_order_details (
    id INT PRIMARY KEY,
    purchase_order_id INT NOT NULL  REFERENCES Purchase_Orders(id),
    product_id INT NOT NULL  REFERENCES Product_services(id),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    pending INT NOT NULL
);


-- Table for Sales Order
CREATE TABLE sale_orders (
    id int PRIMARY KEY,
    number_transaction int ,
    order_date DATE NOT NULL,
    expected_delivery_date DATE,
    customer_id INTEGER NOT NULL  REFERENCES suppliers(id),
    branch_id INTEGER NOT NULL  REFERENCES branches(id),
    user_id int REFERENCES users(id),
    total_amount DECIMAL(15,2) NOT NULL,
    order_status_id INT REFERENCES sp_order_statuses(id), 
    transaction_type_id int REFERENCES transaction_types(id), 
    payment_term_id INTEGER  REFERENCES payment_terms(id)
);



CREATE TABLE sale_order_details (
    id INT PRIMARY KEY,
    sale_order_id INT NOT NULL  REFERENCES sale_Orders(id),
    product_id INT NOT NULL  REFERENCES Product_services(id),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    pending INT NOT NULL
);



-- Accounts Receivable Table
CREATE TABLE AccountsReceivable (
    id int PRIMARY KEY,
    BillDate DATE NOT NULL,
    amount_due DECIMAL(10, 2) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL,
    due_date DATE NOT NULL,
    transaction_type_id int REFERENCES transaction_types(id),  
    number_transaction int ,
    user_id int REFERENCES users(id),
    party_id INTEGER REFERENCES parties(id),
    payment_status_id INT REFERENCES payment_statuses(id), -- e.g., 'Unpaid', 'Partially Paid', 'Paid'    
    sale_id INT NOT NULL  REFERENCES sales(id)    
);



-- Accounts Payable Table
CREATE TABLE AccountsPayable (
    id int PRIMARY KEY,    
    BillDate DATE NOT NULL,
    amount_due DECIMAL(10,2) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL,
    due_date DATE NOT NULL,
    transaction_type_id int REFERENCES transaction_types(id),
    number_transaction int ,
    user_id int REFERENCES users(id),
    supplier_id INTEGER  REFERENCES Suppliers(id),
    customer_id INTEGER REFERENCES Customers(id),
    payment_status_id INT REFERENCES payment_statuses(id),
    purchase_order_id INT REFERENCES Purchase_Orders(id),
    sale_id INT  REFERENCES Sales(id),
    Payroll_id INT REFERENCES Payroll(id) 
);





CREATE TABLE Payroll (
    id INT PRIMARY KEY,
    employee_id INT NOT NULL  REFERENCES Employees(id),
    payroll_date DATE NOT NULL,
    period_start DATE NOT NULL,
    period_end DATE NOT NULL,
    hours_worked DECIMAL(10,2),
    gross_salary DECIMAL(10, 2) NOT NULL,
    net_salary DECIMAL(10, 2) NOT NULL
    transaction_type_id int REFERENCES transaction_types(id),
    user_id int REFERENCES users(id),
    branch_id int  not null references branches(id),
    number_transaction int ,
);




-- Auxiliary tables for accounting transactions 
-- ==========================================================================================
CREATE TABLE EmployeeDeductions (
    id INT PRIMARY KEY,
    payroll_id INT NOT NULL REFERENCES Payroll(id) on delete cascade,
    deduction_id INT NOT NULL  REFERENCES Deductions(id),
    amount DECIMAL(10, 2) NOT NULL
);



CREATE TABLE TaxTypes (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL, 
    description TEXT
);


CREATE TABLE TaxLiabilities (
    id INT PRIMARY KEY,
    branch_id INT NOT NULL REFERENCES Branches(id),
    tax_authority_id INT NOT NULL  REFERENCES TaxAuthorities(id),
    tax_type_id INT NOT NULL  REFERENCES TaxTypes(id),
    liability_period DATE NOT NULL,
    amount_due DECIMAL(10,2) NOT NULL
);




CREATE TABLE Properties (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    branch_id INT NOT NULL REFERENCES Branches(id),
    expense_category_id INT not null REFERENCES revenue_expense_categories(id),
    business_unit_id int REFERENCES business_units(id),
    landlord_id int not null references landlords(id),
    location_id int not null references locations(id),
    rent_mortgage CHAR(1) NOT NULL -- 'Rent' or 'Mortgage'
);



Create table policy_types(
    id INT not null PRIMARY KEY,
    name VARCHAR(255) not null,
    description text
);
insert into policy_types(id, name, description) values
(1, 'Liability', 'Liability'),
(2, 'Property', 'Property'),
(3, 'WorkersComp', 'WorkersComp') ;







Create table contract_types(
    id INT not null PRIMARY KEY,
    name VARCHAR(50) not null,
    description text,
    payment_type_id int not null references transaction_types(id),
    party_type_id int not null references entity_types(id)
);
insert into contract_types(id, name, payment_type_id, party_type_id) values
(1, 'Property Rent',  12, 6), 
(2, 'Mortgage', 44, 8),
(3, 'Insurance Policy', 9, 8),
(4, 'Lease agreement', 61, 3),
(5, 'Utility contract', 15, 7),


-- Loan Table
CREATE TABLE loans (
    id int PRIMARY KEY,
    name char(50) not null,
    bank_id INT not null REFERENCES banks(id),
    user_id INT not null REFERENCES users(id),
    expense_category_id INT not null REFERENCES revenue_expense_categories(id),
    business_unit_id int not null REFERENCES business_units(id),
    loan_date DATE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    monthly_amount DECIMAL(10, 2) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    interest_rate DECIMAL(5,2),
    terms TEXT,
    created_at date DEFAULT getdate()    
);


-- Contract Table
CREATE TABLE contracts (
    id int PRIMARY KEY,
    contract_type_id int not null references contract_types(id), 
    name char(50) not null,
    party_id INT REFERENCES parties(id),
    location_id INT REFERENCES locations(id),
    branch_id INT NOT NULL REFERENCES Branches(id),
    expense_category_id INT not null REFERENCES revenue_expense_categories(id),
    business_unit_id int not null REFERENCES business_units(id),
    contract_date DATE NOT NULL default getdate(), 
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    monthly_amount DECIMAL(10, 2) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    interest_rate DECIMAL(5,2),
    policy_type_id int references policy_types(id), 
    terms TEXT,
    created_at date DEFAULT getdate()    
);

insert into contracts(id, name, contract_type_id, party_id, location_id, branch_id, expense_category_id, business_unit_id, start_date, end_date, monthly_amount, annual_amount) values
 (1, 'Building Headquarters',      1,              2,          11,          1,          1,1, '2024-01-31', '2024-12-01', 500, 6000),
 (2, 'Blue sky',                    1,     4, 12, 1,1,1, '2024-01-01', '2024-12-31', 500, 6000) ; 


CREATE TABLE PaymentSchedule (
    id INT PRIMARY KEY,
    contract_id int references contracts(id),
    loan_id int references loans(id),
    due_date DATE NOT NULL,
    payment_status_id int references payment_statuses(id), 
    amount DECIMAL(10,2) NOT NULL,
    interest_paid DECIMAL(10,2) NOT NULL default 0,
    principal_paid DECIMAL(10,2) NOT NULL default 0,
    remaning_balance DECIMAL(10,2) NOT NULL default 0
  );

 
insert into PaymentSchedule(id, contract_id, due_date, payment_status_id, amount)
values 
(1, 1, '2024-01-01', 1, 1000), 
(2, 1, '2024-02-01', 1, 1000), 
(3, 1, '2024-03-01', 1, 1000), 
(4, 1, '2024-04-01', 1, 1000), 
(5, 1, '2024-05-01', 1, 1000), 
(6, 1, '2024-06-01', 1, 1000), 
(7, 1, '2024-07-01', 1, 1000), 
(8, 1, '2024-08-01', 1, 1000), 
(9, 1, '2024-09-01', 1, 1000), 
(10, 1, '2024-10-01', 1, 1000), 
(11, 1, '2024-12-01', 1, 1000), 
(12, 1, '2024-12-01', 1, 1000), 
(13, 2, '2024-01-01', 1, 1100), 
(14, 2, '2024-02-01', 1, 1100), 
(15, 2, '2024-03-01', 1, 1100), 
(16, 2, '2024-04-01', 1, 1100), 
(17, 2, '2024-05-01', 1, 1100), 
(18, 2, '2024-06-01', 1, 1100), 
(19, 2, '2024-07-01', 1, 1100), 
(20, 2, '2024-08-01', 1, 1100), 
(21, 2, '2024-09-01', 1, 1100), 
(22, 2, '2024-10-01', 1, 1100), 
(23, 2, '2024-12-01', 1, 1100), 
(24, 2, '2024-12-01', 1, 1100) ;




-- Table for Payments
CREATE TABLE payments (
    id int PRIMARY KEY,
    amount DECIMAL(15,2) NOT NULL,
    party_id int not null REFERENCES parties(id), 
    payment_date DATE NOT NULL,
    principal_paid DECIMAL(15,2), 
    interest_paid DECIMAL(15,2),
    transaction_fee DECIMAL(15,2),
    description VARCHAR(100),
    user_id int not null references users(id),
    payment_method_id INTEGER NOT NULL REFERENCES payment_methods(id),
    transaction_type_id INTEGER NOT NULL REFERENCES transaction_types(id),    
    number_transaction int ,
    accountspayable_id int  REFERENCES AccountsPayable(id),
    accountsreceivable_id int REFERENCES AccountsReceivable(id),     
    schedule_id int REFERENCES PaymentSchedule(id),
    business_unit_id int REFERENCES business_units(id),
    sale_id  int REFERENCES sales(id),  
    payroll_id  int REFERENCES payroll(id),  
    contract_type_id int references contract_types(id), 
    contract_id int REFERENCES Contracts(id), 
    taxliability_id int REFERENCES TaxLiabilities(id)
);



CREATE TABLE AccountNotes (
    id INT PRIMARY KEY,
    debit_credit char(1) not null, 
    party_id INT REFERENCES Customers(id),
    sale_id INT REFERENCES sales(id),
    transaction_type_id INTEGER NOT NULL REFERENCES transaction_types(id),    
    number_transaction int not null,
    approver_id int not null references users(id),
    date_issued DATE not null,
    user_id int not null references users(id),
    Amount DECIMAL(10, 2) not null,
    Reason VARCHAR(255) not null
);






-----------------------------------------------------------------------------






CREATE TABLE Assets (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    purchase_date DATE NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    life_expectancy_years INT, -- For depreciation calculation
    asset_type VARCHAR(50) -- e.g., 'Tangible', 'Intangible'
);

CREATE TABLE DepreciationSchedule (
    id INT PRIMARY KEY,
    asset_id INT NOT NULL  REFERENCES Assets(id),
    depreciation_date DATE NOT NULL,
    annual_depreciation_amount DECIMAL(10, 2) NOT NULL,
    accumulated_depreciation DECIMAL(10, 2) NOT NULL
);

CREATE TABLE AmortizationSchedule (
    id INT PRIMARY KEY,
    asset_id INT NOT NULL  REFERENCES Assets(id),
    amortization_date DATE NOT NULL,
    annual_amortization_amount DECIMAL(10, 2) NOT NULL,
    accumulated_amortization DECIMAL(10, 2) NOT NULL
);


CREATE TABLE FinancialAccounts (
    id INT PRIMARY KEY,
    account_name VARCHAR(255) NOT NULL,
    account_type VARCHAR(50), -- e.g., 'Loan', 'Investment'
    branch_id INT  REFERENCES Branches(id)
    balance DECIMAL(10,2) NOT NULL,
    interest_rate DECIMAL(5,2) -- Stored as a percentage
);

CREATE TABLE InterestTransactions (
    id INT PRIMARY KEY,
    financial_account_id INT NOT NULL  REFERENCES FinancialAccounts(id),
    transaction_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    transaction_type VARCHAR(50) -- 'Income' or 'Expense'
);




