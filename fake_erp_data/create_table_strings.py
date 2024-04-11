
str_create_table = {}

str_create_table['transactions'] = """
CREATE TABLE transactions (
    id int not null PRIMARY KEY,
    transaction_date DATE NOT NULL,
    user_id int not null references users(id),
    transaction_type_id int not null REFERENCES transaction_types(id),
    number_transaction int not null, 
    created_at datetime DEFAULT getdate()
);
"""

str_create_table['transaction_details'] = """
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
    loan_id int references loans(id),
    businessunit_id int references business_units(id),
    payment_term_id int references payment_terms(id),
    revenue_expense_category_id int references revenue_expense_categories(id)
);
"""


str_create_table['sales'] = """
-- Sales Table
CREATE TABLE sales (
    id int PRIMARY KEY,
    transaction_type_id INTEGER NOT NULL REFERENCES transaction_types(id), 
    number_transaction int,
    invoicenumber char(20), 
    branch_id INTEGER REFERENCES branches(id),        
    sale_order_id int references sale_orders(id),
    customer_id INT REFERENCES customers(id),
    sales_point_id INT REFERENCES sales_points(id),
    salesperson_id INTEGER NOT NULL REFERENCES salespersons(id),
    sales_channel_id INT REFERENCES sales_channels(id),
    sale_date DATE NOT NULL,
    sale_amount DECIMAL(10, 2) NOT NULL,
    user_id int REFERENCES users(id),
    promotion_id INT REFERENCES promotions(id),
    payment_method_id INT REFERENCES Payment_Methods(id),
    payment_term_id INT REFERENCES Payment_Terms(id)
);
"""

str_create_table['salesdetails'] = """
CREATE TABLE SalesDetails (
    id INT PRIMARY KEY,
    sale_id INT NOT NULL REFERENCES Sales(id) on delete cascade,
    product_id INT NOT NULL REFERENCES product_services(id),
    quantity INT NOT NULL,
    sale_amount DECIMAL(10, 2) NOT NULL,
    cost_amount DECIMAL(10, 2) NOT NULL,
    price DECIMAL(10,2)
);

"""

str_create_table['purchases'] = """
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
"""
str_create_table['purchasesdetails'] = """
CREATE TABLE purchasesdetails (
    id INT PRIMARY KEY,
    purchase_id INT NOT NULL REFERENCES purchases(id) on delete cascade,
    product_id INT NOT NULL REFERENCES product_services(id),
    quantity INT NOT NULL,
    value DECIMAL(10, 2) NOT NULL,
    price DECIMAL(10,2)
);

"""


str_create_table['inventory_transactions'] = """
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
"""

str_create_table['inventory_transactions_detail'] = """
-- Inventory Transactions Table
CREATE TABLE inventory_transactions_detail (
    id int PRIMARY KEY,
    transaction_id int not null REFERENCES inventory_transactions(id) on delete cascade,
    product_id INTEGER NOT NULL  REFERENCES product_services(id),
    quantity INTEGER NOT NULL,
    value numeric(12,2) NOT NULL
);
"""


str_create_table['inventory'] = """
CREATE TABLE Inventory (
    id INT PRIMARY KEY,
    product_id INT NOT NULL  REFERENCES Product_services(id),
    branch_id INT NOT NULL  REFERENCES branches(id),
    quantity INT NOT NULL,
    cost_avg numeric(12,2) NOT NULL,
    value numeric(12,2) NOT NULL
);

"""

str_create_table['purchase_orders'] = """
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
"""

str_create_table['purchase_order_details'] = """
CREATE TABLE purchase_order_details (
    id INT PRIMARY KEY,
    purchase_order_id INT NOT NULL  REFERENCES Purchase_Orders(id) on delete cascade,
    product_id INT NOT NULL  REFERENCES Product_services(id),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    pending INT NOT NULL
);
"""

str_create_table['sale_orders'] = """
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
"""

str_create_table['sale_order_details'] = """
CREATE TABLE sale_order_details (
    id INT PRIMARY KEY,
    sale_order_id INT NOT NULL  REFERENCES sale_Orders(id) on delete cascade,
    product_id INT NOT NULL  REFERENCES Product_services(id),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    pending INT NOT NULL
);
"""


str_create_table['accountsreceivable'] = """
-- Accounts Receivable Table
CREATE TABLE AccountsReceivable (
    id int PRIMARY KEY,
    party_id INTEGER REFERENCES parties(id),    
    BillDate DATE NOT NULL,
    amount_due DECIMAL(10, 2) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL,
    due_date DATE NOT NULL,
    transaction_type_id int REFERENCES transaction_types(id),  
    number_transaction int ,
    user_id int REFERENCES users(id),    
    payment_status_id INT REFERENCES payment_statuses(id), -- e.g., 'Unpaid', 'Partially Paid', 'Paid'    
    sale_id INT NOT NULL  REFERENCES sales(id)    
);
"""

str_create_table['accountspayable'] = """
-- Accounts Payable Table
CREATE TABLE AccountsPayable (
    id int PRIMARY KEY,    
    party_id INTEGER  REFERENCES parties(id),    
    BillDate DATE NOT NULL,
    amount_due DECIMAL(10,2) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL,
    due_date DATE NOT NULL,
    transaction_type_id int REFERENCES transaction_types(id),
    number_transaction int ,
    user_id int REFERENCES users(id),
    payment_status_id INT REFERENCES payment_statuses(id),
    purchase_order_id INT REFERENCES Purchase_Orders(id),
    sale_id INT  REFERENCES Sales(id),
    Payroll_id INT REFERENCES Payroll(id) 
);

"""

str_create_table['payroll'] = """
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
"""

str_create_table['contracts'] = """
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
    annual_amount DECIMAL(10,2) NOT NULL,
    interest_rate DECIMAL(5,2),
    policy_type_id int references policy_types(id), 
    created_at date DEFAULT getdate(),
    terms TEXT
);

insert into contracts(id, name, contract_type_id, party_id, location_id, branch_id, expense_category_id, business_unit_id, start_date, end_date, monthly_amount, annual_amount) values
 (1, 'Building Headquarters',      1,              2,          11,          1,          1,1, '2024-01-31', '2024-12-01', 500, 6000),
 (2, 'Blue sky',                    1,     4, 12, 1,1,1, '2024-01-01', '2024-12-31', 500, 6000) ; 


CREATE TABLE PaymentSchedule (
    id INT PRIMARY KEY,
    contract_id int references contracts(id) on delete cascade,
    due_date DATE NOT NULL,
    payment_status_id int references payment_statuses(id), 
    amount DECIMAL(10,2) NOT NULL,
    interest_paid DECIMAL(10,2) NOT NULL default 0
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
"""

str_create_table['payments'] = """
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

"""

str_create_table['accountnotes'] = """
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
"""


str_create_table['payroll'] = """
CREATE TABLE Payroll (
    id INT PRIMARY KEY,
    employee_id INT NOT NULL  REFERENCES Employees(id),
    payroll_date DATE NOT NULL,
    period_start DATE NOT NULL,
    period_end DATE NOT NULL,
    hours_worked DECIMAL(10,2),
    gross_salary DECIMAL(10, 2) NOT NULL,
    net_salary DECIMAL(10, 2) NOT NULL,
    transaction_type_id int REFERENCES transaction_types(id),
    user_id int REFERENCES users(id),
    branch_id int  not null references branches(id),
    number_transaction int 
);
"""


str_create_table['employeedeductions'] = """
CREATE TABLE EmployeeDeductions (
    id INT PRIMARY KEY,
    payroll_id INT NOT NULL REFERENCES Payroll(id) on delete cascade,
    deduction_id INT NOT NULL  REFERENCES Deductions(id),
    amount DECIMAL(10, 2) NOT NULL
);
"""