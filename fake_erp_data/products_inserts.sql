
CREATE TABLE IF NOT EXISTS product_services (
    id int PRIMARY KEY,
    code varchar(20) not null, 
    name VARCHAR(100) NOT NULL,
    product_service varchar(1),
    description TEXT,
    cost DECIMAL(15, 2) NOT NULL,
    supplier_id INTEGER,
    unitmeasure_id INTEGER,
    selling_price DECIMAL(10, 2),
    quantity_in_stock INT,
    ReorderLevel INTEGER NOT NULL,
    category_id INTEGER,
    FOREIGN KEY (unitmeasure_id) REFERENCES unit_measures(id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id),
    FOREIGN KEY (category_id) REFERENCES ProductCategories(id)
);

INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1,'00001','Men''s Cotton T-Shirt - White, Medium', 'P', 'Stay notice successful accept bank line sound.', 148.52, 681, 13, 
            219.67, 265, 21, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (2,'00002','Women''s High-Waist Jeans - Blue Denim, Size 8', 'P', 'Management eight bit as structure always bring.', 165.26, 196, 14, 
            192.0, 342, 25, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (3,'00003','Children''s Rain Jacket - Yellow, Size M', 'P', 'Well company note.', 467.8, 15, 8, 
            565.35, 14, 62, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (4,'00004','Unisex Woolen Beanie - Black, One Size', 'P', 'Will throughout instead reach.', 111.23, 674, 18, 
            150.86, 634, 22, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (5,'00005','Men''s Formal Blazer - Navy Blue, Size 40R', 'P', 'Fear dream key anyone election public.', 218.6, 453, 6, 
            281.13, 559, 45, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (6,'00006','Women''s Summer Dress - Floral Pattern, Size M', 'P', 'Appear institution his him move.', 335.76, 1034, 2, 
            387.67, 899, 28, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (7,'00007','Boys'' Cargo Shorts - Khaki, Age 10', 'P', 'Different next community.', 53.74, 777, 9, 
            64.36, 945, 67, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (8,'00008','Girls'' Leggings - Stretchable Cotton, Pink, Size S', 'P', 'Through media social year executive nice.', 217.52, 617, 18, 
            286.02, 272, 79, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (9,'00009','Men''s Boxer Briefs - Pack of 3, Multicolor, Size L', 'P', 'Compare pass west easy technology method democratic.', 183.1, 193, 17, 
            229.68, 919, 12, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (10,'00010','Women''s Sports Bra - High Support, Black, Size 34B', 'P', 'Free old most table.', 312.37, 2423, 6, 
            417.48, 937, 15, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (11,'00011','Baby Onesies - Pack of 5, Assorted Colors, 6-12 Months', 'P', 'Often far power thank close.', 343.78, 315, 19, 
            476.31, 550, 57, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (12,'00012','Men''s Leather Belt - Brown, Size 34', 'P', 'Director face surface.', 138.91, 2378, 17, 
            195.92, 437, 90, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (13,'00013','Women''s Scarf - Silk, Printed Pattern', 'P', 'Image perform then.', 362.66, 39, 18, 
            441.68, 170, 13, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (14,'00014','Children''s Winter Gloves - Waterproof, Size XS', 'P', 'Network girl scene child political.', 389.33, 624, 20, 
            471.4, 582, 69, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (15,'00015','Men''s Running Shoes - Breathable Mesh, Size 10', 'P', 'Instead themselves economy Mr up speak adult.', 21.1, 1329, 5, 
            30.45, 995, 26, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (16,'00016','Women''s High Heels - Red, Size 7', 'P', 'Side lose step bar measure care Mr.', 208.21, 2282, 17, 
            275.13, 263, 35, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (17,'00017','Boys'' Baseball Cap - Adjustable, Blue', 'P', 'Case early this market consumer.', 338.9, 1127, 12, 
            484.15, 634, 52, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (18,'00018','Girls'' Sundress - Sleeveless, White, Size 8', 'P', 'Because deep focus accept feeling Mr me.', 384.56, 2281, 18, 
            542.78, 779, 96, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (19,'00019','Men''s Swim Trunks - Quick Dry, Blue, Size M', 'P', 'Prevent agree term easy.', 378.4, 1048, 13, 
            507.62, 124, 28, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (20,'00020','Women''s Pajama Set - Cotton, Striped, Size L', 'P', 'Anyone cup himself southern account hour.', 158.85, 162, 2, 
            237.48, 823, 32, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (21,'00021','Yoga Pants - Stretchable Fabric, Black, Size S, M, L', 'P', 'Raise those author perform what from.', 24.4, 829, 3, 
            35.8, 217, 44, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (22,'00022','Men''s Denim Jacket - Vintage Wash, Medium', 'P', 'Author we apply season offer type nation.', 448.84, 2759, 11, 
            576.06, 522, 66, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (23,'00023','Women''s Maxi Skirt - Chiffon, Floral Print, Size M', 'P', 'Subject life almost member.', 63.28, 768, 17, 
            70.2, 703, 10, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (24,'00024','Children''s Swimwear - UV Protective, Neon Green, Size 6', 'P', 'Bit method director Mrs peace.', 221.63, 526, 5, 
            326.32, 756, 38, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (25,'00025','Athletic Socks - Moisture-Wicking, Pack of 6, Size L', 'P', 'Generation small manage individual every.', 208.07, 2963, 17, 
            292.96, 1000, 60, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (26,'00026','Men''s Silk Tie - Solid Color, Navy Blue', 'P', 'Price decision believe young whom hundred.', 356.5, 2151, 10, 
            499.08, 719, 90, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (27,'00027','Women''s Leather Handbag - Tan, Medium Size', 'P', 'Type professional serve example together theory.', 226.92, 464, 18, 
            272.15, 804, 33, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (28,'00028','Boys'' Basketball Shorts - Breathable, Red, Size M', 'P', 'Professional heavy everything road of down.', 338.43, 470, 14, 
            492.88, 347, 37, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (29,'00029','Girls'' Ballet Flats - Patent Leather, Pink, Size 2', 'P', 'Skill trial series take early.', 59.41, 2344, 9, 
            78.4, 452, 80, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (30,'00030','Unisex Sunglasses - Polarized, Black Frame', 'P', 'System along final memory how charge.', 60.55, 314, 10, 
            89.65, 872, 88, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (31,'00031','Men''s Wool Sweater - Cable Knit, Grey, Size L', 'P', 'Force daughter defense amount tend choice push.', 197.44, 1586, 13, 
            251.68, 78, 16, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (32,'00032','Women''s Velvet Dress - Deep Red, Long Sleeve, Size 8', 'P', 'Particular include son general low defense prepare almost.', 50.56, 390, 15, 
            69.44, 159, 14, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (33,'00033','Kids'' Halloween Costume - Superhero Theme, Size S', 'P', 'Floor prepare drive trouble put still.', 214.45, 2295, 3, 
            277.2, 971, 39, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (34,'00034','Men''s Hiking Boots - Waterproof, Brown, Size 11', 'P', 'Leg cup top least.', 264.19, 2983, 19, 
            332.94, 575, 51, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (35,'00035','Women''s Leg Warmers - Acrylic, Neon Colors', 'P', 'Thousand lose put table car method.', 150.45, 886, 4, 
            177.71, 298, 51, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (36,'00036','Children''s Hoodie - Fleece, Cartoon Print, Size M', 'P', 'Drive impact act song.', 324.6, 1348, 4, 
            393.04, 993, 11, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (37,'00037','Sports Bra - Medium Impact, Neon Yellow, Size M', 'P', 'Face sell prevent lose evidence.', 192.32, 761, 20, 
            248.36, 119, 44, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (38,'00038','Men''s Cycling Jersey - Reflective, Bright Blue, Size L', 'P', 'Enough director position news race serve campaign.', 198.65, 2243, 17, 
            297.86, 143, 53, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (39,'00039','Women''s Fedora Hat - Wool, Black', 'P', 'Style whatever none education suffer kind.', 154.27, 411, 11, 
            212.65, 940, 17, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (40,'00040','Boys'' Football Cleats - Black and White, Size 4', 'P', 'Early Republican last customer tend young.', 455.27, 620, 10, 
            531.78, 603, 87, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (41,'00041','Girls'' Tunic Top - Cotton, Striped, Size 10', 'P', 'From firm owner understand baby personal cold.', 181.45, 297, 15, 
            217.84, 841, 64, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (42,'00042','Men''s Cufflinks - Stainless Steel, Classic Design', 'P', 'Tree system range project third place tree.', 92.56, 905, 20, 
            135.08, 183, 25, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (43,'00043','Women''s Fishnet Tights - Black, One Size', 'P', 'To help hear scientist everyone chair.', 262.53, 300, 18, 
            326.41, 759, 80, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (44,'00044','Children''s Puffer Vest - Reversible, Blue/Red, Size S', 'P', 'Class style cell adult.', 139.67, 383, 17, 
            172.17, 484, 77, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (45,'00045','Athletic Tank Top - Mesh, White, Size M', 'P', 'Customer write make energy unit.', 212.52, 656, 18, 
            296.48, 688, 25, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (46,'00046','Men''s Dress Socks - Argyle Pattern, Pack of 3', 'P', 'National brother scene issue subject guy.', 229.3, 106, 9, 
            286.81, 192, 16, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (47,'00047','Women''s Ankle Boots - Suede, Olive Green, Size 7', 'P', 'Water summer attack good light research.', 108.65, 1570, 14, 
            160.0, 813, 14, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (48,'00048','Boys'' Hooded Raincoat - Reflective Strips, Yellow, Size 8', 'P', 'System eat admit.', 298.8, 493, 14, 
            416.6, 453, 90, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (49,'00049','Girls'' Sparkly Leggings - Silver, Size 6', 'P', 'Court nor place movement conference.', 450.94, 666, 12, 
            549.71, 464, 55, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (50,'00050','Men''s Running Cap - Lightweight, White', 'P', 'Good industry audience newspaper difficult experience staff be.', 470.56, 1743, 3, 
            696.66, 206, 71, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (51,'00051','Women''s Workout Tank - Quick Dry, Bright Pink, Size S', 'P', 'Four bad thought partner have.', 218.71, 808, 10, 
            270.64, 931, 96, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (52,'00052','Kids'' Thermal Underwear Set - Wool Blend, Grey, Size 4', 'P', 'Out drive only institution more newspaper.', 496.2, 1549, 19, 
            632.06, 56, 94, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (53,'00053','Men''s Leather Wallet - Slim, Black', 'P', 'Write enter fund environmental source street.', 295.5, 1942, 18, 
            379.5, 359, 84, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (54,'00054','Women''s Kimono Robe - Satin, Floral Pattern', 'P', 'Man police term general behavior maybe.', 489.99, 1455, 16, 
            724.93, 668, 88, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (55,'00055','Boys'' Skateboarding Shoes - Durable, Black/Green, Size 5', 'P', 'Whatever father either keep.', 269.73, 977, 7, 
            347.56, 568, 81, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (56,'00056','Girls'' Fuzzy Socks - Pack of 5, Pastel Colors', 'P', 'Fear evening machine sit expert.', 361.24, 2368, 6, 
            508.43, 299, 91, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (57,'00057','Men''s Board Shorts - Tropical Print, Size 32', 'P', 'Same baby dog create foreign.', 57.24, 2214, 13, 
            79.46, 942, 30, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (58,'00058','Women''s Trench Coat - Water-Resistant, Beige, Size M', 'P', 'Movie other research walk.', 87.36, 835, 4, 
            98.08, 796, 87, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (59,'00059','Children''s Snow Boots - Insulated, Pink, Size 3', 'P', 'Deal small which truth scene national.', 381.59, 899, 12, 
            466.76, 229, 43, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (60,'00060','Men''s Compression Shirt - For Workouts, Black, Size M', 'P', 'Poor leave tonight job service today.', 80.13, 629, 16, 
            109.37, 675, 60, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (61,'00061','Women''s Knit Beanie - Wool, Ivory Color', 'P', 'Along matter in car difficult.', 100.7, 271, 8, 
            127.01, 715, 14, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (62,'00062','Boys'' Baseball Jersey - Team Logo, Red, Size M', 'P', 'Tell able piece table air mean tell.', 43.15, 985, 5, 
            54.57, 302, 42, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (63,'00063','Girls'' Floral Headband - Fabric Flowers, Multi-Color', 'P', 'Daughter management foreign draw.', 460.0, 627, 17, 
            657.65, 637, 100, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (64,'00064','Men''s Linen Shirt - Long Sleeve, White, Size L', 'P', 'Worry they job head serve ok.', 322.96, 726, 17, 
            466.3, 701, 83, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (65,'00065','Women''s Bikini Set - High Waisted, Tropical Print, Size S', 'P', 'Present fire those.', 315.29, 2779, 13, 
            347.77, 206, 91, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (66,'00066','Children''s Mittens - Knit, Animal Faces, Size S', 'P', 'Gas office make.', 16.74, 2091, 10, 
            23.84, 876, 14, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (67,'00067','Men''s Leather Gloves - Touchscreen Compatible, Black', 'P', 'Those collection rate direction rich change.', 422.95, 2135, 15, 
            601.09, 688, 51, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (68,'00068','Women''s Oversized Scarf - Plaid, Soft Wool Blend', 'P', 'Than professional later.', 160.32, 580, 16, 
            180.3, 482, 41, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (69,'00069','Boys'' Long Sleeve Polo - Cotton, Navy, Size 10', 'P', 'Color oil blood finish great ok.', 140.42, 669, 4, 
            185.3, 565, 43, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (70,'00070','Girls'' Chunky Sneakers - White, Size 3', 'P', 'Foot teacher boy week.', 479.27, 629, 20, 
            641.43, 889, 97, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (71,'00071','Men''s Cargo Pants - Rugged, Olive, Size 34W 32L', 'P', 'Left conference fill exist.', 213.21, 2151, 8, 
            300.34, 383, 69, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (72,'00072','Women''s Quilted Jacket - Lightweight, Powder Blue, Size M', 'P', 'Job fight popular attorney.', 198.86, 1616, 4, 
            272.07, 705, 74, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (73,'00073','Kids'' Beanie with Pom-Pom - Bright Yellow, One Size', 'P', 'Tree institution whether present use myself response next.', 292.75, 811, 5, 
            327.98, 677, 24, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (74,'00074','Men''s Electric Razor - Rechargeable, Waterproof', 'P', 'Compare indicate activity marriage education seem.', 454.51, 695, 2, 
            546.2, 729, 96, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (75,'00075','Women''s Crossbody Bag - Faux Leather, Burgundy', 'P', 'Hotel network sport artist save write.', 170.09, 1843, 9, 
            244.63, 126, 29, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (76,'00076','Boys'' Rash Guard - UPF 50+, Blue, Size M', 'P', 'Yourself particular task statement country far wife sort.', 415.71, 457, 3, 
            538.7, 605, 21, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (77,'00077','Girls'' Jump Rope - Adjustable, Rainbow Colors', 'P', 'Finish result five government she list page.', 146.83, 349, 8, 
            172.31, 373, 16, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (78,'00078','Men''s Yoga Mat - Non-Slip, Extra Thick', 'P', 'Build southern hold entire attention political relate.', 130.89, 2331, 5, 
            178.38, 854, 22, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (79,'00079','Women''s Sunglass Case - Hard Shell, Floral Print', 'P', 'Full seven pass over.', 442.99, 663, 10, 
            645.66, 198, 64, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (80,'00080','Kids'' Backpack - Water-Resistant, With Pencil Case, Blue', 'P', 'Stop court practice life official along represent.', 159.43, 312, 7, 
            231.07, 2, 25, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (81,'00081','Men''s Watch - Stainless Steel, Water-Resistant', 'P', 'All girl suddenly might daughter.', 63.09, 918, 16, 
            75.39, 984, 51, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (82,'00082','Women''s Nightgown - Silk, Light Blue,', 'P', 'Interest hear nor nearly fine huge.', 301.21, 1613, 19, 
            352.99, 1000, 85, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (83,'00083','UltraConnect Smartphone Pro', 'P', 'Too friend price.', 281.92, 1129, 20, 
            354.67, 945, 26, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (84,'00084','SlateTouch Next-Gen Tablet', 'P', 'Avoid stuff very director discuss finish.', 182.44, 829, 12, 
            214.51, 731, 19, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (85,'00085','SwiftBook AirLite Laptop', 'P', 'Model later short sense.', 344.25, 659, 15, 
            448.29, 584, 52, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (86,'00086','PowerPort Go Charger', 'P', 'Watch area let continue series.', 3.53, 2282, 14, 
            4.32, 577, 59, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (87,'00087','EchoBuds Noise-Canceling Earphones', 'P', 'After senior focus job space him first.', 497.74, 56, 7, 
            728.93, 864, 11, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (88,'00088','VisionCast Streaming Stick', 'P', 'Cost truth consumer side society someone kitchen.', 196.45, 140, 5, 
            260.55, 415, 14, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (89,'00089','FlexFold Bluetooth Keyboard', 'P', 'Because mouth out history smile hundred state.', 370.01, 2983, 13, 
            536.59, 585, 42, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (90,'00090','PulsePlay Smart Watch', 'P', 'Maintain young color catch least technology.', 52.58, 883, 20, 
            64.03, 164, 13, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (91,'00091','GripGear Phone Holder', 'P', 'Issue our stop issue mean whom.', 432.11, 575, 18, 
            579.0, 764, 93, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (92,'00092','InfinityView Monitor Extender', 'P', 'Fine moment condition read case cold side.', 475.62, 99, 17, 
            594.71, 740, 41, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (93,'00093','QuantumDrive External SSD', 'P', 'Since check speak sell interview evening stay.', 174.36, 335, 2, 
            219.16, 378, 16, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (94,'00094','SkySync GPS Drone', 'P', 'Hold let one almost key teach put.', 318.38, 213, 7, 
            363.09, 193, 50, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (95,'00095','ZenScreen Portable Monitor', 'P', 'Approach bar type clear hold much force.', 268.32, 2180, 16, 
            310.82, 98, 56, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (96,'00096','RapidCharge Solar Power Bank', 'P', 'Perform source with particularly travel difficult.', 419.71, 1339, 14, 
            568.38, 971, 96, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (97,'00097','ShieldCase Waterproof Phone Protector', 'P', 'Young discussion color him news.', 172.41, 2921, 15, 
            218.66, 485, 54, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (98,'00098','HarmonyHub Smart Home Controller', 'P', 'Investment run trial task keep space recognize.', 201.22, 1229, 18, 
            289.97, 738, 60, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (99,'00099','VirtualLens 360 Camera', 'P', 'Rest perform society course end safe.', 486.48, 140, 20, 
            705.85, 345, 58, 1);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (100,'00100','Urban Trekker Men''s Hiking Boots', 'P', 'Plant idea science play care industry.', 74.55, 546, 20, 
            93.91, 784, 46, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (101,'00101','Little Paddlers Toddler Rain Boots', 'P', 'Would process less skin people daughter street.', 286.12, 262, 3, 
            380.24, 625, 32, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (102,'00102','Beachcomber Women''s Strappy Sandals', 'P', 'Perform whose thing three particular me room.', 444.1, 2328, 20, 
            542.58, 895, 77, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (103,'00103','Marathon Elite Running Shoes', 'P', 'Itself base front not.', 285.46, 1545, 6, 
            349.8, 332, 86, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (104,'00104','Summer Breeze Woven Flats', 'P', 'Fill trouble major position evening artist style.', 255.6, 1024, 9, 
            366.37, 534, 24, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (105,'00105','CozyToes Fuzzy Slipper Boots', 'P', 'Measure tax race Mr college policy.', 42.23, 209, 7, 
            47.19, 145, 47, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (106,'00106','HighStep Leather Ankle Boots', 'P', 'Their high wall south.', 12.16, 2169, 20, 
            16.85, 321, 30, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (107,'00107','Kids'' Kicks Light-Up Sneakers', 'P', 'Summer bad find not short sea tax.', 198.29, 699, 5, 
            228.16, 618, 23, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (108,'00108','FlexiSole Yoga Mat Flip-Flops', 'P', 'All indicate treatment opportunity strong.', 24.07, 125, 12, 
            30.34, 534, 45, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (109,'00109','Trailblazer Waterproof Walking Shoes', 'P', 'Yet state course oil matter.', 303.13, 1197, 3, 
            342.8, 305, 79, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (110,'00110','Ballerina''s Dream Girls'' Ballet Flats', 'P', 'Book sea might since carry five.', 132.73, 383, 13, 
            192.05, 585, 64, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (111,'00111','Men''s Classic Oxford Dress Shoes', 'P', 'Chance affect late on about.', 61.93, 130, 6, 
            79.36, 666, 28, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (112,'00112','Winter Wonderland Snow Boots', 'P', 'Serious over science floor public condition kid.', 463.1, 202, 14, 
            510.95, 358, 72, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (113,'00113','Sunday Stroll Loafers', 'P', 'Collection similar future board include wait language.', 303.06, 113, 4, 
            373.51, 106, 74, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (114,'00114','Gladiator Strength Leather Sandals', 'P', 'Summer candidate effect.', 17.76, 293, 13, 
            26.43, 148, 97, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (115,'00115','Teen Spirit High-Top Sneakers', 'P', 'Room difficult enjoy draw life particular task.', 388.12, 1925, 6, 
            549.48, 41, 84, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (116,'00116','Princess Sparkle Girls'' Dress Shoes', 'P', 'Five eight situation cut.', 448.97, 2589, 10, 
            663.42, 629, 57, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (117,'00117','Comfort Walkers Cushioned Insoles', 'P', 'Amount water effect population model weight left.', 156.89, 258, 9, 
            188.75, 906, 86, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (118,'00118','Men''s Rugged Outdoors Slip-Ons', 'P', 'Here result but surface child.', 135.68, 1580, 9, 
            202.05, 165, 92, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (119,'00119','Swift Sprinter Women''s Athletic Shoes', 'P', 'Understand him east phone thank owner conference society.', 415.46, 1758, 4, 
            520.35, 969, 26, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (120,'00120','Sunset Slip-On Espadrilles', 'P', 'Quality much director cell successful.', 145.31, 213, 18, 
            212.47, 518, 68, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (121,'00121','AllStar Basketball High Tops', 'P', 'Bed whatever between similar down.', 67.86, 819, 15, 
            81.4, 701, 47, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (122,'00122','Little Gentlemen Boys'' Wingtips', 'P', 'News example suffer investment certainly tough.', 337.18, 443, 15, 
            467.67, 65, 27, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (123,'00123','Starlight Dance Women''s Heels', 'P', 'Notice sit ago tell water shoulder believe.', 29.46, 460, 3, 
            43.81, 565, 70, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (124,'00124','Everyday Comfort Men''s Casual Shoes', 'P', 'Candidate theory responsibility there become.', 457.72, 1037, 12, 
            590.66, 341, 11, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (125,'00125','Adventure Seeker Kids'' Trail Shoes', 'P', 'Meeting question plan body.', 365.78, 762, 5, 
            475.34, 139, 77, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (126,'00126','SleekStride Work Shoes', 'P', 'Dream same buy claim likely go either.', 101.52, 732, 9, 
            131.78, 23, 72, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (127,'00127','QuickDry River Sandals', 'P', 'Month score yeah town sister pretty.', 230.84, 564, 4, 
            260.88, 913, 57, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (128,'00128','FancyFeet Stiletto Heels', 'P', 'Democratic security responsibility state trial.', 214.9, 2841, 14, 
            322.13, 816, 42, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (129,'00129','Infant''s First Walkers Soft Sole Shoes', 'P', 'Feeling partner piece another.', 296.62, 25, 15, 
            341.08, 933, 44, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (130,'00130','Youth Soccer Cleats', 'P', 'Social situation world soldier couple anything day.', 402.94, 407, 13, 
            516.72, 941, 49, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (131,'00131','Puddle Jump Kids'' Waterproof Booties', 'P', 'Enjoy real miss over explain ago without entire.', 285.28, 166, 2, 
            399.62, 321, 79, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (132,'00132','SoftStep Ballet Slip-Ons', 'P', 'Which road whatever environment song shoulder seem.', 183.76, 1437, 11, 
            241.56, 654, 52, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (133,'00133','Mountain Peak Climbing Shoes', 'P', 'Yeah whatever focus.', 301.46, 661, 20, 
            418.81, 686, 76, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (134,'00134','Retro Revival Penny Loafers', 'P', 'Four sure somebody school hotel society.', 48.07, 1001, 7, 
            66.53, 405, 89, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (135,'00135','Elite Equestrian Riding Boots', 'P', 'Summer discuss tax return.', 286.18, 1750, 7, 
            350.48, 879, 97, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (136,'00136','AquaSurf Water Shoes', 'P', 'Among particular as debate sound.', 105.48, 985, 14, 
            133.97, 592, 89, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (137,'00137','Luxe Leather Men''s Loafers', 'P', 'However information nor back prevent evidence build.', 461.2, 125, 16, 
            609.18, 564, 74, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (138,'00138','Diamond Shine Women''s Party Pumps', 'P', 'Us chance side force less new.', 15.58, 799, 7, 
            17.19, 876, 93, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (139,'00139','Men''s Dockside Boat Shoes', 'P', 'Agent station me black miss lot happy.', 449.38, 761, 15, 
            496.43, 102, 38, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (140,'00140','CrossFit Power Training Sneakers', 'P', 'Itself upon activity couple pretty future property agency.', 449.06, 737, 18, 
            636.64, 920, 12, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (141,'00141','Teen''s Skateboard Sneakers', 'P', 'Once enjoy already school purpose.', 165.25, 2106, 13, 
            235.38, 267, 32, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (142,'00142','Lace Grace', 'P', 'Maybe upon hair.', 458.93, 1528, 8, 
            607.44, 28, 12, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (143,'00143','Victorian Lace-Up Boots 44. Gymnast Flexibility Trainers', 'P', 'Trial risk now especially he body tough.', 393.65, 588, 12, 
            565.61, 987, 99, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (144,'00144','Teen Fashion Canvas Sneakers', 'P', 'Tree see several fine else plant.', 1.29, 209, 4, 
            1.71, 590, 89, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (145,'00145','Toddler''s Bumper-Toe Play Shoes', 'P', 'Between tough magazine establish speech hundred side.', 195.13, 827, 8, 
            225.08, 881, 53, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (146,'00146','Men''s Executive Wingtip Dress Shoes', 'P', 'Kind order environment customer.', 249.64, 545, 12, 
            349.5, 453, 84, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (147,'00147','Women''s Tango Dance Heels', 'P', 'Media whole compare each number imagine language.', 40.08, 1417, 18, 
            57.86, 393, 77, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (148,'00148','CitySlicker Men''s Chelsea Boots', 'P', 'Wish appear surface test.', 422.16, 750, 20, 
            554.44, 116, 76, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (149,'00149','Floral Fiesta Women''s Slip-Ons', 'P', 'Go area realize society must smile sure discover.', 200.05, 2376, 6, 
            247.25, 726, 82, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (150,'00150','KidZone Playful Pumps', 'P', 'Past discussion represent to.', 24.82, 972, 16, 
            33.08, 439, 52, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (151,'00151','Ladies'' Day Out Mary Janes', 'P', 'Explain reality national public news.', 58.65, 133, 5, 
            66.33, 376, 65, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (152,'00152','Men''s Durable Work Boots', 'P', 'Owner anyone personal reveal approach day.', 491.59, 2214, 14, 
            701.67, 527, 26, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (153,'00153','Tropicana Open-Toe Sandals', 'P', 'Include focus young blood.', 425.11, 2461, 17, 
            626.64, 783, 51, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (154,'00154','EverGreen Eco-Friendly Sneakers', 'P', 'Again power book year.', 495.19, 2398, 5, 
            550.42, 413, 23, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (155,'00155','Tykes'' All-Terrain Sandals', 'P', 'Despite word begin surface wish arm class add.', 467.76, 1540, 13, 
            605.71, 114, 63, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (156,'00156','Women''s Winter Fashion Boots', 'P', 'Job nothing maybe lose impact try economy.', 142.14, 1707, 3, 
            204.83, 51, 38, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (157,'00157','Classic Schoolyard Kids'' Oxfords', 'P', 'Morning down professional young but imagine.', 206.95, 462, 15, 
            297.07, 568, 84, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (158,'00158','Weekend Warrior Men''s Sneakers', 'P', 'Part when follow before option stuff them.', 60.26, 726, 11, 
            87.65, 495, 41, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (159,'00159','Fashionista''s Choice Pointed Heels', 'P', 'Term exist car many water show miss wait.', 425.69, 293, 20, 
            518.51, 228, 13, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (160,'00160','Vintage Velvet Evening Shoes', 'P', 'Ready father realize support worker.', 83.17, 2248, 5, 
            109.77, 522, 10, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (161,'00161','Men''s All-Leather Moccasins', 'P', 'Experience factor choose believe of.', 423.56, 2841, 16, 
            538.84, 829, 17, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (162,'00162','Kids'' Cartoon Character Rain Boots', 'P', 'End full manager out law against.', 31.55, 2661, 7, 
            39.59, 837, 90, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (163,'00163','Trail Runners Advanced Sneakers', 'P', 'Identify career eye explain visit compare.', 379.56, 645, 12, 
            448.96, 70, 84, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (164,'00164','Baby''s Soft Knit Booties', 'P', 'Participant then we task.', 464.73, 312, 9, 
            677.3, 129, 93, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (165,'00165','Silver Streak Reflective Joggers', 'P', 'Check question my always create seem at experience.', 147.74, 201, 17, 
            177.7, 25, 67, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (166,'00166','Teen''s All-Day Comfort Flats', 'P', 'Charge new occur thus story effort.', 228.27, 249, 12, 
            253.03, 706, 41, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (167,'00167','Men''s Classic Brogue Shoes', 'P', 'Brother building detail world half probably store indicate.', 51.25, 293, 4, 
            73.05, 51, 89, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (168,'00168','Ladies'' Elegant Kitten Heels', 'P', 'Or newspaper choose with.', 66.88, 651, 6, 
            83.56, 93, 43, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (169,'00169','ActiveLife Orthopedic Sandals', 'P', 'Play shake myself green soldier administration.', 67.08, 2293, 11, 
            83.25, 174, 76, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (170,'00170','Men''s Pro Golf Shoes', 'P', 'Adult per suddenly never use why which turn.', 492.69, 1801, 2, 
            617.1, 980, 13, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (171,'00171','Kids'' Summer Camp Hikers', 'P', 'Remember fund decision far easy instead consumer.', 52.58, 403, 10, 
            73.36, 658, 38, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (172,'00172','Women''s Waterproof Walking Shoes', 'P', 'This step any.', 225.49, 932, 18, 
            248.87, 716, 94, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (173,'00173','Star Performer Ballet Pointe Shoes', 'P', 'Amount house resource recognize now ever current.', 57.66, 1620, 16, 
            66.33, 947, 27, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (174,'00174','Luxury Velvet Slip-Ons', 'P', 'Wind yourself ago represent federal month.', 475.89, 2577, 8, 
            710.3, 111, 41, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (175,'00175','Men''s Rugged Cowboy Boots', 'P', 'Bill they western lose.', 136.11, 699, 19, 
            190.96, 579, 84, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (176,'00176','Little Runners Children''s Trainers', 'P', 'Reflect will because theory attention for notice wife.', 313.36, 803, 8, 
            385.12, 931, 76, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (177,'00177','Women''s Vintage Lace-up Boots', 'P', 'Reflect door establish hot church agency seek pull.', 66.63, 523, 9, 
            98.46, 997, 43, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (178,'00178','Men''s Luxury Velvet Loafers', 'P', 'Reduce lot modern artist movie.', 489.72, 1192, 13, 
            612.15, 835, 27, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (179,'00179','Contempo Casual Sneakers', 'P', 'Tv measure region wife itself view network.', 258.5, 2145, 20, 
            333.57, 433, 50, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (180,'00180','Bride-to-Be Wedding Heels', 'P', 'Expect suffer discuss right bring choose.', 126.6, 2293, 15, 
            166.24, 618, 24, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (181,'00181','Infants'' Rainbow Soft Sole Shoes', 'P', 'Development executive college much police happy.', 357.03, 699, 16, 
            514.58, 37, 26, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (182,'00182','Men''s Steel-Toe Safety Boots', 'P', 'Choice base art.', 183.45, 841, 16, 
            260.2, 274, 82, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (183,'00183','Sun-Kissed Summer Wedges', 'P', 'Whatever glass bar field price sign movement.', 350.34, 827, 12, 
            429.56, 652, 90, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (184,'00184','Evening Elegance Women''s Sandals', 'P', 'About growth put firm nearly.', 22.59, 1058, 20, 
            31.62, 447, 66, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (185,'00185','Kids'' Safari Adventure Boots', 'P', 'Stock not conference determine audience operation training.', 90.71, 592, 15, 
            101.58, 702, 85, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (186,'00186','Sports Enthusiast Cycling Shoes', 'P', 'First study trade great.', 123.92, 346, 20, 
            152.58, 268, 66, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (187,'00187','Teen''s Trendy Trainers', 'P', 'Majority training message wide war reality.', 173.81, 767, 5, 
            192.12, 343, 87, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (188,'00188','Men''s Nautical Deck Shoes', 'P', 'Town edge room sell enter nice.', 492.0, 213, 15, 
            698.76, 745, 12, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (189,'00189','Women''s Professional Ballet Flats', 'P', 'Well agent receive record.', 152.22, 596, 3, 
            221.5, 444, 97, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (190,'00190','GrandSlam Tennis Shoes', 'P', 'Once player include energy few next fact.', 357.54, 437, 5, 
            413.7, 844, 72, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (191,'00191','Junior''s School Formal Shoes', 'P', 'Perhaps standard mother performance.', 94.35, 899, 7, 
            124.08, 294, 37, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (192,'00192','Ladies'' Soft Bedroom Slippers', 'P', 'Site call trip officer over.', 145.31, 736, 4, 
            172.77, 506, 59, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (193,'00193','FlexiFit Gymnastics Shoes', 'P', 'Too director ball tell.', 141.43, 99, 19, 
            192.42, 550, 26, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (194,'00194','Men''s All-Season Hikers', 'P', 'Follow next region result.', 417.13, 248, 14, 
            592.38, 722, 36, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (195,'00195','Bohemian Rhapsody Sandals', 'P', 'Recognize play common art rock inside art.', 214.02, 2084, 17, 
            244.83, 431, 92, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (196,'00196','Kids'' Color-Pop Athletic Shoes', 'P', 'Sometimes end receive wish thank parent interesting.', 265.79, 104, 12, 
            345.11, 413, 34, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (197,'00197','Women''s Breezy Linen Loafers', 'P', 'Mr drive although statement.', 23.14, 981, 6, 
            30.44, 149, 43, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (198,'00198','Baby''s Breathable Mesh Sandals', 'P', 'Look grow guess past vote.', 454.52, 773, 11, 
            616.76, 545, 71, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (199,'00199','Men''s Traditional Kung Fu Flats', 'P', 'Product night word all population.', 11.42, 289, 14, 
            13.22, 998, 91, 2);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (200,'00200','TechTrendz 5G Smartphone ElitePro', 'P', 'Offer heavy education experience radio audience which.', 151.64, 222, 13, 
            214.62, 334, 49, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (201,'00201','SmartTab 10-inch Quad-Core Tablet', 'P', 'Open institution miss speak dinner entire writer while.', 82.24, 2563, 16, 
            93.44, 833, 15, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (202,'00202','OfficePro 15.6" Core i7 Business Laptop', 'P', 'Member discuss action interview tree.', 210.91, 37, 2, 
            269.07, 575, 73, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (203,'00203','PocketPad 8-inch Android Tablet', 'P', 'Charge ok name whom.', 440.32, 2971, 7, 
            573.14, 423, 47, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (204,'00204','GamerMax Predator Gaming Laptop 17"', 'P', 'Account blood serve they threat check cut.', 18.09, 106, 18, 
            23.8, 600, 58, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (205,'00205','CrystalClear Smartphone Screen Protector', 'P', 'Almost decide imagine current stuff.', 163.73, 1614, 15, 
            222.55, 267, 57, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (206,'00206','PowerPlus 20,000mAh Portable Charger', 'P', 'Day seem later change tend rich.', 495.03, 899, 14, 
            588.25, 516, 23, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (207,'00207','Harmony 5G Smartphone - 256GB', 'P', 'Somebody billion parent sound though.', 146.41, 602, 6, 
            192.76, 855, 63, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (208,'00208','FlexiFold Tri-Fold Wireless Keyboard', 'P', 'Media safe woman foreign.', 123.77, 510, 7, 
            181.98, 113, 69, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (209,'00209','ProDesign Stylus Pen for Touch Screens', 'P', 'Gas school would every century accept society.', 412.17, 743, 2, 
            496.39, 669, 99, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (210,'00210','SecureShell Waterproof Phone Case', 'P', 'Mean term bad Mrs fight according able.', 339.88, 99, 9, 
            428.98, 438, 52, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (211,'00211','UltraSlim Pocket Powerbank 5000mAh', 'P', 'Time stock agree watch man many ever get.', 299.64, 1035, 16, 
            365.06, 564, 98, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (212,'00212','MovieMagic Mini Portable Projector', 'P', 'North often wish eight within.', 443.58, 2743, 7, 
            577.55, 991, 56, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (213,'00213','TuneTrek Noise-Canceling Headphones', 'P', 'Card after institution end knowledge no rise.', 469.59, 454, 4, 
            561.89, 184, 14, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (214,'00214','RapidRoute Car GPS Navigation System', 'P', 'Four table building call produce.', 189.23, 937, 11, 
            265.14, 481, 60, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (215,'00215','StudioSound Over-Ear DJ Headphones', 'P', 'Suffer car fall interesting thank former yeah.', 50.67, 2759, 8, 
            73.96, 89, 75, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (216,'00216','KidTab Education-First Children''s Tablet', 'P', 'Because item pressure find could.', 243.93, 2877, 2, 
            351.25, 69, 68, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (217,'00217','InfinityEdge 4K Touchscreen Monitor 27"', 'P', 'Spend myself news tend fall score religious.', 275.26, 359, 4, 
            377.54, 344, 59, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (218,'00218','MightyMesh Wi-Fi Range Extender', 'P', 'Personal push two which person decision reality law.', 16.54, 423, 13, 
            23.32, 587, 70, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (219,'00219','SwiftStream 4K Streaming Stick', 'P', 'Fund if letter computer.', 377.26, 470, 11, 
            477.35, 479, 38, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (220,'00220','TravelTech Universal Adaptor Kit', 'P', 'Probably himself they something especially business.', 394.79, 1033, 15, 
            533.82, 126, 31, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (221,'00221','MobileMemo Digital Voice Recorder', 'P', 'Effect international treat physical.', 271.1, 954, 3, 
            328.92, 95, 83, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (222,'00222','ClickClever Ergonomic Wireless Mouse', 'P', 'Wind score party rule against live city easy.', 182.26, 235, 3, 
            228.8, 550, 96, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (223,'00223','BrightView LED Monitor Light Bar', 'P', 'Fall by road direction.', 275.59, 886, 20, 
            364.72, 320, 11, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (224,'00224','PocketPrint Portable Photo Printer', 'P', 'Around yard growth prove agreement concern nation.', 86.86, 2924, 17, 
            123.8, 407, 51, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (225,'00225','CloudConnect Home Network Storage - 2TB', 'P', 'Something party again hold.', 348.98, 2721, 11, 
            419.07, 862, 13, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (226,'00226','VirtualPro VR Headset with Controllers', 'P', 'Employee bring serious future democratic kitchen sort.', 17.37, 838, 3, 
            23.71, 558, 32, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (227,'00227','ThunderCharge 3-in-1 Charging Station', 'P', 'Decide him from.', 136.17, 934, 13, 
            191.52, 937, 78, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (228,'00228','SleekCase Leather Laptop Sleeve 13"', 'P', 'Make social whole sense important.', 87.19, 173, 11, 
            121.66, 249, 94, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (229,'00229','Wanderlust Water-Resistant Backpack with USB', 'P', 'List edge many.', 213.25, 1216, 15, 
            312.1, 615, 41, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (230,'00230','EnergyBand Fitness Tracker Watch', 'P', 'South policy opportunity quite.', 253.19, 927, 10, 
            333.85, 402, 97, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (231,'00231','PicoProject Pocket-Sized HD Projector', 'P', 'Wind enter trip represent top discuss beat.', 331.55, 402, 6, 
            473.36, 521, 67, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (232,'00232','NightOwl Car Dash Cam with Night Vision', 'P', 'Local individual political center huge down.', 190.99, 195, 16, 
            219.06, 962, 53, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (233,'00233','SoundSphere 360° Bluetooth Speaker', 'P', 'Environment magazine ready meet wrong moment career.', 303.47, 130, 18, 
            364.96, 750, 41, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (234,'00234','QuantumCore Desktop Processor - 8-core', 'P', 'Admit their plant.', 49.74, 152, 20, 
            61.9, 82, 32, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (235,'00235','GraphiTab Digital Drawing Tablet', 'P', 'Get west return scene.', 23.29, 2422, 3, 
            27.59, 532, 68, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (236,'00236','ProGamer Mechanical Keyboard with RGB', 'P', 'Attorney forward way side line test.', 369.37, 147, 9, 
            496.8, 711, 49, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (237,'00237','ActionCam 4K Sports Camera with Mount', 'P', 'Work tonight ready likely.', 10.65, 83, 3, 
            13.6, 769, 90, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (238,'00238','KeyFinder Bluetooth Tracking Device', 'P', 'Major relationship total down focus mouth.', 357.54, 18, 18, 
            498.03, 208, 18, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (239,'00239','ZoomLens Smartphone Telephoto Lens Kit', 'P', 'Low for pretty suddenly paper.', 255.93, 2169, 4, 
            366.42, 49, 95, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (240,'00240','AirSynch Wireless Earbuds with Charging Case', 'P', 'Seven parent quality task movie nature.', 312.86, 2226, 11, 
            423.94, 557, 33, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (241,'00241','NanoDrone Quadcopter with Camera', 'P', 'Share dog somebody trip.', 133.48, 486, 17, 
            177.92, 324, 51, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (242,'00242','SafeGuard Laptop Privacy Screen', 'P', 'Military center will forget return purpose though.', 438.64, 654, 14, 
            507.09, 593, 75, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (243,'00243','PocketScan Wireless Document Scanner', 'P', 'Behind reason else imagine.', 206.24, 1276, 19, 
            246.18, 275, 23, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (244,'00244','ActiveLife Waterproof Smartwatch', 'P', 'Physical goal explain myself Republican.', 151.48, 618, 17, 
            179.89, 662, 91, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (245,'00245','GrooveBox Mini Party Speaker', 'P', 'Apply central white ok wrong or.', 38.44, 760, 7, 
            53.22, 814, 37, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (246,'00246','EchoVoice Smart Home Assistant', 'P', 'Grow heavy fear would far seek.', 125.2, 1916, 9, 
            165.44, 69, 36, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (247,'00247','DiamondShield Scratch-Resistant Phone Skin', 'P', 'Put toward think you someone good.', 259.77, 989, 19, 
            333.86, 847, 65, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (248,'00248','SwiftCharge Solar-Powered Backpack', 'P', 'Rise rule rock represent.', 374.47, 83, 17, 
            491.28, 472, 27, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (249,'00249','UltraDrive USB-C Multiport Hub', 'P', 'Economy place bring second list Republican success.', 393.0, 1165, 14, 
            476.37, 95, 20, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (250,'00250','SkyView HD Antenna with Amplifier', 'P', 'Bar month six little play.', 2.87, 2329, 12, 
            4.3, 738, 56, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (251,'00251','PhotoPro DSLR Camera Cleaning Kit', 'P', 'Identify bill owner mention analysis doctor its.', 363.24, 803, 15, 
            480.19, 988, 44, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (252,'00252','NightTouch Smart Wall Switch', 'P', 'Per somebody amount state offer.', 382.97, 119, 12, 
            529.7, 836, 88, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (253,'00253','MultiMount Flexible Tripod for Smartphones', 'P', 'Watch by education growth.', 332.89, 883, 17, 
            482.51, 21, 64, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (254,'00254','PowerPulse Quick Charge Wall Charger', 'P', 'When by foreign individual source body ability.', 176.05, 209, 7, 
            235.57, 469, 21, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (255,'00255','SolarBeam Outdoor Security Light with Sensor', 'P', 'Recent around under rise.', 451.15, 24, 20, 
            513.28, 772, 98, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (256,'00256','FlexFit Smart Yoga Mat with App', 'P', 'Only meet state though marriage position hold.', 273.25, 2898, 15, 
            339.28, 76, 58, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (257,'00257','DuoLink Tangle-Free Magnetic Charging Cables', 'P', 'Hotel director quite purpose tough.', 341.69, 39, 3, 
            468.33, 268, 26, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (258,'00258','RetroBox Handheld Game Console', 'P', 'Yes begin that.', 324.35, 879, 11, 
            418.64, 941, 43, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (259,'00259','FitFrame Home Workout System with Virtual Trainer', 'P', 'Everything floor affect listen structure hit.', 155.16, 2553, 7, 
            192.12, 614, 46, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (260,'00260','CosmicVR Virtual Reality Headset', 'P', 'Upon prevent air public indeed partner.', 276.27, 2008, 20, 
            341.54, 920, 66, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (261,'00261','PocketCinema Miniature LED Projector', 'P', 'Area popular on director boy matter south.', 339.85, 1377, 13, 
            474.81, 107, 43, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (262,'00262','StudioPro Webcam with Built-In Ring Light', 'P', 'Agency reduce model already voice.', 147.94, 72, 20, 
            220.49, 17, 13, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (263,'00263','TravelTunes Wireless Travel Speaker', 'P', 'True win instead cup start.', 191.78, 1577, 18, 
            248.21, 761, 21, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (264,'00264','ClearCom Noise-Reducing Microphone', 'P', 'Similar argue better around city race.', 321.77, 2698, 4, 
            480.81, 810, 30, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (265,'00265','QuickFix Smartphone Repair Kit', 'P', 'News learn wind campaign table attack.', 261.55, 1024, 20, 
            380.95, 492, 58, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (266,'00266','SpaceSave Foldable Bluetooth Keyboard', 'P', 'Effort shoulder hair give your today.', 448.88, 2559, 2, 
            544.2, 414, 32, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (267,'00267','SoundWave Smart Bathroom Speaker', 'P', 'Us team hard attack interest rock traditional.', 481.17, 980, 17, 
            604.88, 583, 66, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (268,'00268','PetWatch Wi-Fi Enabled Pet Monitoring Camera', 'P', 'Price page soon prevent.', 412.36, 103, 7, 
            523.32, 139, 42, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (269,'00269','BlastBoom Portable Waterproof Speaker', 'P', 'Example bar fly game team let.', 68.0, 879, 20, 
            98.64, 192, 88, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (270,'00270','SuperSync Universal Media Remote', 'P', 'Report than magazine you wide ok fall.', 350.75, 195, 19, 
            451.33, 507, 17, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (271,'00271','EasyStream Bluetooth Audio Receiver', 'P', 'Reduce agency actually state hear beat.', 263.2, 869, 4, 
            368.84, 495, 94, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (272,'00272','WorkoutEar Sport Earhooks', 'P', 'Worry start green catch popular if issue.', 276.34, 567, 2, 
            352.09, 999, 97, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (273,'00273','SwiftShift Laptop Cooling Pad', 'P', 'Often event so available.', 434.47, 2938, 16, 
            570.15, 469, 69, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (274,'00274','BabyMonitor 3G Wi-Fi Baby Cam', 'P', 'Opportunity management professional matter certainly important.', 8.86, 491, 15, 
            10.62, 322, 43, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (275,'00275','NightGuide HD Driving Glasses', 'P', 'Region song two mission loss process morning.', 203.14, 1331, 14, 
            288.1, 849, 31, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (276,'00276','HarmonyHub Smart Home Controller', 'P', 'Professor live above discover sometimes writer board.', 452.97, 869, 8, 
            526.14, 63, 26, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (277,'00277','LiteBuds Compact Wireless Earphones', 'P', 'Station you we section.', 474.62, 359, 4, 
            621.54, 380, 64, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (278,'00278','MotionTrack Wireless Game Controller', 'P', 'Spring nor especially prevent already Democrat develop.', 201.01, 54, 7, 
            287.32, 681, 46, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (279,'00279','TitanPower Desktop UPS - 1000VA', 'P', 'Operation reduce could nor ability different.', 299.99, 2863, 16, 
            412.17, 449, 92, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (280,'00280','AdventureCam Waterproof Action Camera', 'P', 'Including others sit past weight.', 351.83, 1364, 20, 
            431.18, 868, 37, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (281,'00281','LaserTouch Mini Wireless Touchpad', 'P', 'Certainly born no the in.', 42.38, 1811, 11, 
            57.86, 882, 54, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (282,'00282','MultiMedia Mini Keyboard with Touchpad', 'P', 'Include end plant word improve.', 262.3, 758, 13, 
            343.43, 160, 66, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (283,'00283','AuraLight Smart LED Mood Lamp', 'P', 'Current thousand watch whether history fall finish.', 439.92, 974, 8, 
            568.19, 903, 67, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (284,'00284','SnapFit Modular Smartphone Case', 'P', 'Dog impact second when human point radio think.', 119.75, 407, 14, 
            145.18, 120, 17, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (285,'00285','IronDrive Military-Grade USB Flash Drive - 128GB', 'P', 'Method little certain ok gun lot avoid.', 294.37, 353, 6, 
            348.04, 215, 14, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (286,'00286','OmniReader USB Multi-Card Reader', 'P', 'Into painting maybe third color suddenly she.', 240.15, 596, 9, 
            360.18, 507, 71, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (287,'00287','CompactClean UV-C Smartphone Sanitizer', 'P', 'Message song around interview oil.', 69.81, 37, 16, 
            101.52, 240, 59, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (288,'00288','DualStream Audio Transmitter/Receiver', 'P', 'International week direction huge should bill artist walk.', 476.76, 802, 14, 
            561.57, 745, 27, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (289,'00289','PrismCam 4K Webcam with Autofocus', 'P', 'Investment soldier return goal sing.', 418.58, 500, 6, 
            587.17, 683, 16, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (290,'00290','TrekPod Mini GPS Tracker', 'P', 'Remain could government would other.', 193.79, 457, 14, 
            228.57, 358, 50, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (291,'00291','CoolBreeze USB Desk Fan', 'P', 'Trial me agreement economic cause partner spring.', 138.52, 2122, 9, 
            170.33, 242, 80, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (292,'00292','LiftOff Drone with GPS and Camera', 'P', 'Paper knowledge sport partner car so anything.', 480.53, 612, 17, 
            582.23, 655, 68, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (293,'00293','FlexCharge 3-Coil Wireless Charger', 'P', 'Garden my least onto ok provide can.', 32.2, 236, 9, 
            36.03, 32, 86, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (294,'00294','HyperSound Surround Sound Gaming Headset', 'P', 'Product establish structure financial always election.', 348.17, 15, 18, 
            415.78, 986, 18, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (295,'00295','SmartSocket Wi-Fi Enabled Power Socket', 'P', 'Happen speak behind poor.', 8.39, 270, 12, 
            11.04, 625, 23, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (296,'00296','PrismDisplay Portable Second Monitor - 15.6"', 'P', 'Nation letter add method movie girl.', 220.84, 706, 20, 
            268.62, 454, 45, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (297,'00297','DataVault Portable Hard Drive - 4TB', 'P', 'Use a material benefit.', 498.03, 956, 6, 
            566.99, 128, 24, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (298,'00298','CircuitPro Electronic DIY Starter', 'P', 'Less single as pull cold dinner.', 34.73, 402, 16, 
            43.08, 83, 57, 3);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (299,'00299','FrostFree 500 - Double Door Refrigerator', 'P', 'Member source all method reason free body sort.', 38.83, 2797, 6, 
            49.87, 631, 47, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (300,'00300','QuickCook Pro - 1100W Microwave Oven', 'P', 'Fact establish age establish report.', 451.21, 289, 16, 
            664.06, 545, 17, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (301,'00301','LaundryMaster 3000 - Front Load Washing Machine', 'P', 'Short suddenly everyone over over exist whom.', 176.29, 1846, 2, 
            256.96, 696, 98, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (302,'00302','DineEasy - Compact Countertop Dishwasher', 'P', 'Citizen history expect myself mind sea.', 111.0, 2048, 8, 
            127.97, 944, 65, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (303,'00303','BakeGenius - Convection Toaster Oven', 'P', 'Situation hotel me course people night whom eat.', 244.03, 1382, 7, 
            353.78, 162, 63, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (304,'00304','SmoothBlend 800 - High-Speed Blender', 'P', 'Movie local grow rich.', 191.87, 2423, 17, 
            244.25, 737, 68, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (305,'00305','CrispAir - 36" Multi-Mode Range Hood', 'P', 'However special fact save would can.', 32.96, 876, 2, 
            36.26, 800, 85, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (306,'00306','CafeBrew - 12-Cup Programmable Coffee Maker', 'P', 'Situation help practice popular through system.', 445.2, 2415, 15, 
            513.05, 675, 81, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (307,'00307','ChillZone - Portable Air Conditioner', 'P', 'Seem hospital case painting music figure huge.', 63.32, 1307, 19, 
            76.94, 207, 12, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (308,'00308','PureFlow - HEPA Air Purifier', 'P', 'Oil point career need describe.', 43.68, 1570, 4, 
            51.18, 797, 50, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (309,'00309','HeatWave - 1500W Ceramic Space Heater', 'P', 'Kitchen involve phone of place natural edge.', 139.75, 602, 16, 
            166.34, 358, 99, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (310,'00310','IronSwift - 1800W Steam Iron', 'P', 'Message above piece unit also.', 193.04, 661, 19, 
            273.65, 505, 91, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (311,'00311','ToastEase - 2-Slice Toaster with Bagel Function', 'P', 'Offer property business trade.', 53.51, 1469, 10, 
            69.47, 644, 66, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (312,'00312','ProMix - Stand Mixer with Attachments', 'P', 'Her finish free long.', 275.93, 346, 19, 
            411.05, 685, 77, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (313,'00313','GrindPro - Burr Coffee Grinder', 'P', 'Page carry protect treat red industry close.', 208.8, 1687, 12, 
            241.02, 563, 41, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (314,'00314','CoolTech - Energy Efficient Chest Freezer', 'P', 'Off situation decision big time can city stage.', 46.69, 35, 3, 
            54.59, 285, 88, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (315,'00315','SwiftDry - Compact Hair Dryer with Ionic Technology', 'P', 'Present five performance onto score.', 342.29, 2784, 6, 
            422.65, 795, 13, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (316,'00316','PowerJuice - Cold Press Juicer Machine', 'P', 'Pay middle bag member who.', 242.64, 2599, 6, 
            354.79, 319, 43, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (317,'00317','FreshPlus - Food Dehydrator', 'P', 'Determine box write number.', 286.04, 2446, 6, 
            421.56, 58, 84, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (318,'00318','SearSmart - Indoor Electric Grill', 'P', 'Present situation seven attention.', 165.72, 946, 9, 
            241.47, 846, 93, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (319,'00319','BreezyFan - Oscillating Tower Fan', 'P', 'Myself no its chance.', 273.75, 314, 16, 
            355.7, 467, 94, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (320,'00320','QuickSweep - Robot Vacuum Cleaner', 'P', 'Most become require general.', 248.91, 312, 19, 
            295.74, 932, 34, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (321,'00321','DrySoft - Electric Towel Warmer', 'P', 'Arm image enough positive mouth.', 323.54, 777, 8, 
            441.81, 627, 35, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (322,'00322','EcoWash Mini - Portable Washing Machine', 'P', 'Establish including class argue threat usually.', 170.51, 838, 10, 
            206.47, 950, 57, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (323,'00323','SteamPure - Clothes Steamer', 'P', 'Mouth safe admit great political something.', 262.9, 1870, 19, 
            300.67, 982, 98, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (324,'00324','RiceReady - Digital Rice Cooker', 'P', 'Look picture visit bill.', 354.77, 2134, 9, 
            447.38, 795, 46, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (325,'00325','ThermoPot - Electric Kettle with Variable Temperature', 'P', 'Door service case audience sort field cup.', 175.8, 947, 18, 
            198.11, 214, 77, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (326,'00326','MealPrep Pro - 7-in-1 Slow Cooker', 'P', 'Company include local against need drive.', 259.63, 2805, 17, 
            320.35, 277, 19, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (327,'00327','FrothMax - Automatic Milk Frother', 'P', 'Ask look expect fear improve rate.', 6.92, 1925, 10, 
            7.62, 984, 100, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (328,'00328','GrillKing - Outdoor Electric BBQ Grill', 'P', 'Least can boy clear necessary sign.', 342.67, 460, 11, 
            396.5, 767, 96, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (329,'00329','EasyClean 360 - Cyclonic Vacuum Cleaner', 'P', 'Trip up including.', 413.04, 2695, 8, 
            553.67, 214, 65, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (330,'00330','PowerFreeze - Ice Maker Machine', 'P', 'His base word next gas apply ago.', 239.77, 2858, 17, 
            295.17, 814, 24, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (331,'00331','ComfyHeat - Wall-Mounted Electric Fireplace', 'P', 'Card section trip really form space body middle.', 437.25, 1942, 12, 
            640.71, 107, 59, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (332,'00332','SpinPro - Salad Spinner', 'P', 'Fear popular decade continue center player serve.', 123.51, 2461, 16, 
            166.11, 900, 55, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (333,'00333','ProWaffle - Belgian Waffle Maker', 'P', 'Prevent risk doctor marriage.', 288.97, 917, 13, 
            423.88, 168, 11, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (334,'00334','PowerBake - Electric Bread Maker', 'P', 'Whether professor season born.', 440.1, 1151, 3, 
            547.78, 598, 70, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (335,'00335','RapidEgg - Electric Egg Cooker', 'P', 'Check price laugh.', 13.81, 458, 9, 
            17.44, 418, 57, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (336,'00336','SoupChef - Electric Soup Maker', 'P', 'Understand both city move true school.', 448.93, 716, 2, 
            606.68, 599, 75, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (337,'00337','MaxPower - High Torque Hand Blender', 'P', 'Any available guess case ever someone else minute.', 487.75, 470, 9, 
            703.11, 809, 26, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (338,'00338','BakeMaster - 24" Built-In Single Wall Oven', 'P', 'Night summer population sing blue at wear art.', 168.23, 2134, 9, 
            237.35, 646, 32, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (339,'00339','FreshLock - Vacuum Sealing System', 'P', 'Fall material trade ready establish around third involve.', 1.36, 1964, 16, 
            2.0, 82, 77, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (340,'00340','HomeHub - Smart Home Controller Panel', 'P', 'None article indicate position door garden entire.', 127.52, 1900, 13, 
            179.54, 65, 45, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (341,'00341','StirPro - Automatic Pot Stirrer', 'P', 'Last risk material quality music color.', 236.31, 667, 2, 
            264.13, 498, 49, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (342,'00342','PureDrink - Water Filter Pitcher', 'P', 'Him would town.', 58.37, 199, 7, 
            69.28, 717, 33, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (343,'00343','MultiSlice - Electric Food Slicer', 'P', 'Reality sense effect size.', 236.78, 705, 8, 
            353.0, 959, 33, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (344,'00344','ToastWave - 4-Slice Toaster Oven', 'P', 'Condition kid pass three off place.', 255.04, 958, 17, 
            339.76, 777, 23, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (345,'00345','SmartRoast - Digital Rotisserie Oven', 'P', 'Light to wife.', 90.36, 623, 16, 
            106.12, 377, 72, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (346,'00346','GrillEase - Non-Stick Panini Press', 'P', 'Need form describe ask huge.', 342.04, 363, 9, 
            383.57, 912, 33, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (347,'00347','BlendQuick - Personal Smoothie Maker', 'P', 'Really collection edge rock into.', 76.85, 2329, 10, 
            94.43, 808, 95, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (348,'00348','SteamPro - Multi-Level Food Steamer', 'P', 'Of service sort PM.', 160.11, 2045, 19, 
            210.76, 994, 73, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (349,'00349','AirFry Genius - Digital Air Fryer', 'P', 'True employee rather wife when field heavy design.', 432.04, 1540, 13, 
            580.67, 263, 14, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (350,'00350','SparkleWash - Ultrasonic Jewelry Cleaner', 'P', 'Material behind air company state like performance.', 343.74, 166, 3, 
            469.23, 909, 98, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (351,'00351','YogurtNow - Automatic Yogurt Maker', 'P', 'Military religious direction song necessary.', 178.35, 288, 3, 
            241.08, 309, 22, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (352,'00352','EcoBoil - Energy-Saving Electric Stovetop', 'P', 'Wait modern enough activity.', 354.76, 2924, 9, 
            509.19, 246, 83, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (353,'00353','CookSmart - Induction Cooktop', 'P', 'Card white most argue one memory issue.', 243.35, 523, 3, 
            345.37, 350, 69, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (354,'00354','DishGenie - Countertop Dishwasher', 'P', 'Whether impact interest item family.', 445.48, 2368, 12, 
            655.33, 199, 72, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (355,'00355','CrispBake - Dual Basket Deep Fryer', 'P', 'This its ask pull effort chance activity.', 89.3, 677, 20, 
            122.69, 144, 24, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (356,'00356','HotBrew - Single Serve Coffee Pod Machine', 'P', 'Article near similar live magazine.', 296.59, 2169, 11, 
            426.4, 523, 67, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (357,'00357','CoolCarafe - Electric Wine Cooler', 'P', 'Window majority behavior by herself.', 39.9, 1596, 7, 
            50.28, 456, 67, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (358,'00358','SnackMaker - Mini Pie and Quiche Maker', 'P', 'Get news side across.', 444.94, 535, 6, 
            503.81, 816, 78, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (359,'00359','MiniBake - Compact Electric Baker for Pastries', 'P', 'Suggest current these provide.', 239.36, 2726, 20, 
            286.88, 454, 98, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (360,'00360','SmoothDough - Automatic Dough Kneader', 'P', 'Husband they myself art maybe material medical.', 319.89, 402, 4, 
            410.94, 705, 39, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (361,'00361','PowerGrind - Meat Grinder and Sausage Stuffer', 'P', 'Me whose bank measure issue use positive.', 175.4, 382, 20, 
            198.24, 787, 66, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (362,'00362','ComfortHeat - Oil-Filled Radiator Heater', 'P', 'Specific right series.', 433.03, 533, 7, 
            478.76, 364, 19, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (363,'00363','EasySteam - Handheld Garment Steamer', 'P', 'Late offer blood story event require.', 61.99, 2581, 20, 
            83.85, 10, 23, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (364,'00364','PureChill - Mini Fridge with Freezer Compartment', 'P', 'Method deal local she start cultural old with.', 387.37, 2398, 9, 
            483.71, 73, 99, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (365,'00365','QuickChop - Electric Vegetable Chopper', 'P', 'However born bag century agency education.', 230.16, 2613, 6, 
            329.8, 598, 14, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (366,'00366','MealMaster - Multi-Cooker with Programmable Settings', 'P', 'Evening kid better memory speak.', 484.87, 670, 7, 
            603.95, 428, 59, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (367,'00367','PopQuick - Hot Air Popcorn Maker', 'P', 'Visit receive usually over positive know nothing must.', 166.2, 1038, 9, 
            185.53, 154, 71, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (368,'00368','BrewElite - Stainless Steel Espresso Machine', 'P', 'Partner young word seem pressure rock up represent.', 157.92, 439, 8, 
            211.62, 74, 25, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (369,'00369','MixPro - High Performance Blender', 'P', 'Work happy each themselves.', 48.03, 2264, 3, 
            53.11, 590, 54, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (370,'00370','ToastElite - Wide Slot Toaster with LCD Display', 'P', 'Table approach research service fact meet.', 491.91, 879, 16, 
            711.98, 713, 41, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (371,'00371','RapidBoil - Glass Tea Kettle with Infuser', 'P', 'People practice executive society air away.', 206.02, 2080, 8, 
            298.49, 267, 62, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (372,'00372','WineMaster - Dual Zone Wine Refrigerator', 'P', 'Item walk forget discover.', 437.1, 603, 12, 
            574.41, 178, 94, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (373,'00373','EasySweep - Cordless Stick Vacuum', 'P', 'Five value half machine.', 81.38, 456, 16, 
            97.46, 869, 13, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (374,'00374','SteamFresh - Vegetable and Fish Steamer', 'P', 'Thousand information class newspaper family.', 382.95, 452, 3, 
            461.9, 594, 24, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (375,'00375','PowerCook - Electric Pressure Cooker', 'P', 'Space customer interview them brother probably.', 79.26, 408, 11, 
            98.49, 522, 48, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (376,'00376','GourmetBake - Countertop Convection Oven', 'P', 'Some alone machine once miss.', 100.36, 249, 15, 
            129.51, 741, 74, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (377,'00377','HomeFry - Electric Deep Fryer with Oil Filtration', 'P', 'Defense general thought cut age.', 5.93, 141, 4, 
            8.59, 157, 36, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (378,'00378','CitrusPress - Electric Citrus Juicer', 'P', 'Bad develop service on eat occur.', 3.41, 996, 8, 
            4.2, 925, 41, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (379,'00379','FlavorSeal - Sous Vide Precision Cooker', 'P', 'Network whatever decision every little listen.', 284.8, 897, 4, 
            365.98, 205, 27, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (380,'00380','QuickServe - Hot Water Dispenser', 'P', 'Past see realize himself identify difference alone research.', 158.05, 1991, 18, 
            214.36, 450, 95, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (381,'00381','ProGrill - Contact Grill with', 'P', 'Paper focus you measure pick.', 218.88, 808, 16, 
            321.78, 59, 30, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (382,'00382','FrostGuardian Smart Fridge', 'P', 'Leader artist tell store.', 227.77, 71, 7, 
            338.06, 878, 66, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (383,'00383','HeatWave Precision Cooktop', 'P', 'Message nation future partner Democrat hot resource.', 248.16, 2590, 17, 
            322.7, 809, 81, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (384,'00384','BreezePure Air Purifier', 'P', 'Create wish pressure executive ahead sometimes.', 52.7, 637, 7, 
            75.22, 348, 37, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (385,'00385','QuietWash Dishwasher Elite', 'P', 'Them rest share none after well.', 277.23, 2722, 16, 
            329.21, 574, 48, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (386,'00386','SteamPro Garment Steamer', 'P', 'Life movement option.', 205.51, 1964, 4, 
            278.4, 961, 48, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (387,'00387','FreshBrew Advanced Coffee Maker', 'P', 'Simply watch any hundred knowledge.', 485.7, 391, 17, 
            542.7, 73, 35, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (388,'00388','SwiftClean Robot Vacuum', 'P', 'Past wall sell war yet once.', 98.63, 797, 5, 
            117.1, 474, 67, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (389,'00389','CompactChill Mini Fridge', 'P', 'Put direction plan decide suddenly.', 422.45, 1870, 17, 
            513.27, 604, 33, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (390,'00390','BakeMaster Convection Oven', 'P', 'Look list clear writer.', 497.55, 2288, 3, 
            647.99, 639, 68, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (391,'00391','AquaFilter High-Efficiency Water Purifier', 'P', 'Set sometimes take ahead question culture.', 390.1, 596, 5, 
            488.07, 844, 49, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (392,'00392','PowerGrind Food Processor', 'P', 'Direction side ahead suggest simple third bring.', 334.21, 2858, 17, 
            471.9, 942, 82, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (393,'00393','EcoDry Heat Pump Dryer', 'P', 'Upon assume mention PM pattern.', 233.06, 229, 10, 
            327.59, 307, 69, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (394,'00394','QuickToast 4-Slice Toaster', 'P', 'Get here knowledge however.', 155.85, 956, 2, 
            221.97, 561, 21, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (395,'00395','FreezeTech Upright Freezer', 'P', 'Home deal less star.', 398.04, 476, 15, 
            520.04, 28, 85, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (396,'00396','RapidHeat Microwave Oven', 'P', 'Cause gun serious give if.', 202.59, 2430, 16, 
            271.23, 799, 94, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (397,'00397','SmoothieBlend Personal Blender', 'P', 'And thousand long coach always season between.', 473.57, 661, 10, 
            579.1, 864, 92, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (398,'00398','IronGlide Steam Iron', 'P', 'International lawyer drop laugh region worker between major.', 115.01, 1990, 7, 
            170.94, 208, 48, 4);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (399,'00399','Morning Dew Fresh Strawberries', 'P', 'Have will what hotel.', 220.07, 2971, 2, 
            254.92, 507, 68, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (400,'00400','Alpine Breeze Organic Milk', 'P', 'Effect plan say middle success maybe.', 257.87, 587, 2, 
            366.66, 811, 76, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (401,'00401','Grassland Grazed Ribeye Steak', 'P', 'Less whose know win vote.', 489.57, 1603, 10, 
            732.42, 731, 66, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (402,'00402','Ocean’s Bounty Tuna Chunks in Brine', 'P', 'Large mother grow certain special firm industry after.', 33.71, 2164, 11, 
            37.47, 107, 52, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (403,'00403','CrunchTime Honey Roasted Almonds', 'P', 'Never foreign plant strong human until remember speak.', 127.68, 1713, 7, 
            146.98, 554, 92, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (404,'00404','GoldenLoaf Whole Wheat Bread', 'P', 'Offer few mouth.', 377.93, 2669, 10, 
            428.88, 86, 15, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (405,'00405','FarmFresh Brown Eggs - Dozen', 'P', 'Face nature sign right together major system.', 445.4, 2211, 14, 
            663.13, 533, 93, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (406,'00406','GreenValley Organic Spinach', 'P', 'Dog huge develop off.', 438.11, 627, 4, 
            573.77, 531, 38, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (407,'00407','PurePeak Spring Water - 500ml', 'P', 'Watch method student dream recently.', 62.06, 1625, 15, 
            72.73, 594, 42, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (408,'00408','EverCrunch Cornflakes', 'P', 'Feel never operation send economy sign.', 397.46, 1929, 10, 
            504.29, 384, 48, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (409,'00409','Orchard’s Gift Red Delicious Apples', 'P', 'All resource day third four.', 45.65, 239, 10, 
            51.11, 144, 95, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (410,'00410','SilkySmooth Chocolate Ice Cream', 'P', 'Seek maybe return reveal model.', 46.03, 1278, 9, 
            68.02, 82, 92, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (411,'00411','SunnyFields Butter - Unsalted', 'P', 'Scientist term effort hand see structure.', 323.59, 264, 19, 
            404.78, 637, 16, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (412,'00412','Highland Hills Cheddar Cheese', 'P', 'Place move field by.', 451.15, 188, 19, 
            634.49, 217, 92, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (413,'00413','Old Factory Traditional Tomato Soup', 'P', 'Economic increase walk produce up wife century.', 377.72, 2076, 6, 
            495.72, 70, 23, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (414,'00414','SweetHive Natural Honey - 250g', 'P', 'Trial two indeed.', 363.95, 797, 13, 
            531.06, 733, 97, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (415,'00415','CrispPick Gherkins in Vinegar', 'P', 'Live choose agreement you little toward.', 119.97, 456, 17, 
            163.88, 1, 15, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (416,'00416','DailyCatch Wild Salmon Fillets', 'P', 'Morning team impact test final.', 109.97, 2785, 3, 
            147.32, 175, 17, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (417,'00417','Prairie Sun Mixed Nuts', 'P', 'Example surface behind human health audience.', 49.45, 1784, 18, 
            69.02, 644, 36, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (418,'00418','Rustic Pantry Chicken Broth', 'P', 'Trial contain well pass.', 20.09, 1964, 12, 
            22.64, 186, 77, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (419,'00419','ZestyBite Lime Pickle', 'P', 'Help present candidate life.', 323.32, 46, 17, 
            417.79, 390, 48, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (420,'00420','Nature’s Slice Avocado - Ready to Eat', 'P', 'Quite serve military change.', 393.08, 2722, 4, 
            555.53, 757, 54, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (421,'00421','OakBarrel Aged Balsamic Vinegar', 'P', 'What rule food war letter drug concern.', 181.74, 550, 16, 
            236.54, 371, 48, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (422,'00422','GoldenHarvest Quinoa - 500g', 'P', 'Enough various television at bring.', 317.75, 1443, 14, 
            397.86, 592, 89, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (423,'00423','PureBerry Frozen Blueberries', 'P', 'Through organization recently child investment.', 318.53, 1669, 3, 
            473.96, 706, 78, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (424,'00424','VelvetTouch Greek Yogurt', 'P', 'According your onto least it.', 449.09, 474, 10, 
            547.52, 283, 17, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (425,'00425','BigBite Beef Jerky - Original', 'P', 'Various important outside bad bit war.', 421.27, 510, 2, 
            543.51, 280, 61, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (426,'00426','MeadowSweet Cream Cheese', 'P', 'Improve leader prevent trouble test however quickly involve.', 429.97, 2657, 10, 
            620.58, 525, 70, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (427,'00427','OceanWave Sardines in Olive Oil', 'P', 'Daughter media page.', 286.08, 1603, 4, 
            347.71, 851, 88, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (428,'00428','HappyBee Granola Bars - Mixed Berry', 'P', 'Body half day president prove war seven.', 44.49, 995, 5, 
            63.43, 712, 90, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (429,'00429','Fiesta Mix Spicy Party Snack Mix', 'P', 'Truth area risk book.', 10.71, 2378, 11, 
            15.81, 297, 82, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (430,'00430','Tropical Sun Dried Mango Slices', 'P', 'Question unit by man.', 76.16, 71, 20, 
            114.17, 336, 60, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (431,'00431','BakersDream All-Purpose Flour - 1kg', 'P', 'Interesting world truth data pick.', 16.99, 216, 5, 
            23.86, 968, 37, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (432,'00432','Farmer’s Market Fresh Carrots - Bag', 'P', 'Seven board of activity.', 364.8, 718, 7, 
            523.59, 807, 91, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (433,'00433','NutriBoost Protein Shake - Vanilla', 'P', 'Agreement reveal watch itself serve.', 394.75, 2178, 3, 
            465.82, 761, 34, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (434,'00434','SweetRoot Organic Carrot Juice', 'P', 'Third trip word choice recently attention eat.', 199.78, 201, 14, 
            279.41, 762, 55, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (435,'00435','GreenSprout Lentils - 500g Bag', 'P', 'Key head ago together sea military cell.', 372.76, 829, 20, 
            422.44, 602, 15, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (436,'00436','EarthBorn Vegan Cheese Spread', 'P', 'Prove strategy compare next glass game contain.', 258.33, 575, 2, 
            370.31, 654, 20, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (437,'00437','Sunset Orchard Orange Juice - Pulp Free', 'P', 'Knowledge nation suffer call.', 156.41, 415, 19, 
            231.63, 413, 57, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (438,'00438','CoolCrunch Frozen Peas', 'P', 'Here sign against through bag.', 455.04, 2805, 14, 
            561.66, 716, 58, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (439,'00439','HeartyWheat Whole Grain Pasta', 'P', 'Per run girl modern first as capital.', 255.45, 834, 16, 
            298.24, 701, 27, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (440,'00440','Daily Harvest Mixed Berries', 'P', 'Reason candidate war treat away fast.', 390.53, 190, 7, 
            519.96, 41, 31, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (441,'00441','Farmer Joe’s Baby Potatoes', 'P', 'Actually bit run image onto much.', 492.52, 1761, 9, 
            708.19, 123, 15, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (442,'00442','Rolling Fields Butter - Salted', 'P', 'Leg behavior firm.', 267.7, 649, 5, 
            382.41, 990, 38, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (443,'00443','Pure Prairie Buttermilk', 'P', 'Above table pass.', 8.38, 852, 10, 
            9.39, 727, 22, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (444,'00444','SweetHarvest Peaches in Syrup', 'P', 'Watch mention door finish entire set task.', 191.37, 726, 8, 
            212.76, 268, 49, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (445,'00445','PrimeCut Filet Mignon Steak', 'P', 'Form great raise people personal available factor there.', 176.31, 866, 10, 
            253.16, 736, 72, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (446,'00446','SunBaked Potato Chips - Sea Salt', 'P', 'Art heavy could especially foreign ready.', 38.45, 1528, 15, 
            46.36, 362, 59, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (447,'00447','HomeStyle Apple Pie Filling', 'P', 'Itself player hour outside.', 7.95, 2178, 14, 
            9.33, 616, 96, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (448,'00448','Pure Grain Brown Rice - 1kg', 'P', 'Itself manager statement character firm.', 92.95, 2295, 3, 
            137.61, 229, 70, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (449,'00449','VineRipe Diced Tomatoes', 'P', 'Condition back democratic.', 362.0, 1743, 17, 
            425.65, 328, 12, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (450,'00450','SavoryChoice Chicken Nuggets', 'P', 'Very claim great rock from charge ok.', 237.26, 976, 18, 
            345.59, 254, 32, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (451,'00451','PeakFresh Green Bell Peppers', 'P', 'Miss whole black organization many.', 102.78, 2441, 12, 
            117.9, 388, 69, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (452,'00452','TropicalTreat Pineapple Slices', 'P', 'Security today born admit pass.', 385.17, 1540, 20, 
            487.98, 786, 25, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (453,'00453','Artisan’s Choice Wheat Bread Loaf', 'P', 'Bit under through so good.', 171.53, 1549, 3, 
            239.84, 210, 14, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (454,'00454','NatureFresh Cucumber - Organic', 'P', 'Paper it drop save address short.', 371.33, 1900, 6, 
            485.95, 321, 59, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (455,'00455','Silken Tofu - Firm', 'P', 'Person some there year foreign.', 371.15, 1743, 11, 
            477.55, 841, 33, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (456,'00456','Fiesta Taco Seasoning Mix', 'P', 'Outside affect conference technology without war process.', 177.94, 2449, 19, 
            248.08, 361, 26, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (457,'00457','SnackPop Buttered Popcorn', 'P', 'Here heart we hour use top.', 238.21, 210, 12, 
            275.22, 933, 42, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (458,'00458','Daily Deli Roast Beef Slices', 'P', 'Effect rate read friend small fight rock avoid.', 309.29, 797, 7, 
            456.94, 720, 38, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (459,'00459','Vineyard’s Best Grape Jelly', 'P', 'Smile likely today yeah home whole parent.', 140.49, 2446, 3, 
            160.26, 84, 46, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (460,'00460','CrispHarvest Apple Cider Vinegar', 'P', 'When term themselves threat thing fall way.', 97.03, 2632, 8, 
            115.04, 997, 48, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (461,'00461','ChocoDelight Dark Chocolate Bar', 'P', 'Side fly care before.', 228.07, 228, 3, 
            338.26, 180, 83, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (462,'00462','NutriYogurt Probiotic Drink', 'P', 'Answer actually sister own shoulder.', 484.38, 2080, 4, 
            585.9, 506, 79, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (463,'00463','Savory Selects Cheddar Cheese Slices', 'P', 'Section car defense herself street on indicate.', 443.78, 1150, 13, 
            642.51, 927, 20, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (464,'00464','Gourmet Grains Jasmine Rice', 'P', 'Especially we range build.', 387.18, 290, 3, 
            510.33, 193, 93, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (465,'00465','TropicJuice Coconut Water', 'P', 'Later upon hit whole.', 127.08, 879, 18, 
            163.39, 24, 81, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (466,'00466','PureLeaf Organic Green Tea', 'P', 'Democratic great control nation.', 55.99, 2687, 12, 
            83.44, 70, 55, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (467,'00467','MightyMeat Pork Sausages', 'P', 'Recognize blood film which.', 381.02, 2844, 7, 
            420.64, 565, 70, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (468,'00468','Health Harvest Almond Milk', 'P', 'Cell send past.', 499.91, 924, 13, 
            663.02, 991, 47, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (469,'00469','Sweet Delights Frosted Donuts', 'P', 'Work happen material so.', 380.8, 2105, 19, 
            549.56, 95, 27, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (470,'00470','SeaSpray Canned Mackerel', 'P', 'Might bit financial offer assume else put.', 407.32, 708, 5, 
            560.6, 95, 60, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (471,'00471','PerfectPasta Fusilli', 'P', 'Manager scene rest talk about eye.', 354.42, 417, 9, 
            402.38, 457, 72, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (472,'00472','Earth’s Essence Coconut Oil', 'P', 'Tree meeting product college find space.', 348.58, 1747, 6, 
            450.5, 6, 90, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (473,'00473','SpringTime Mineral Water', 'P', 'Five unit form fill question change hotel.', 112.19, 2590, 9, 
            134.59, 644, 70, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (474,'00474','OvenFresh Bagels - Cinnamon Raisin', 'P', 'Together fly ground toward region.', 279.85, 762, 3, 
            382.63, 272, 72, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (475,'00475','FreshFields Caesar Salad Kit', 'P', 'Everybody next east security sell meeting bring.', 430.74, 699, 20, 
            574.91, 677, 19, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (476,'00476','SunDried Organic Tomatoes', 'P', 'Create forward read play officer program value.', 267.31, 1165, 6, 
            387.34, 596, 64, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (477,'00477','Farmstand Fresh Squeezed Lemonade', 'P', 'At doctor recent leader take pass.', 211.81, 2657, 13, 
            258.21, 95, 99, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (478,'00478','BistroStyle Cream of Mushroom Soup', 'P', 'Send star tough only project.', 97.05, 566, 13, 
            110.49, 406, 57, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (479,'00479','Homestead Maple Syrup', 'P', 'The strong black near statement direction raise.', 183.0, 502, 13, 
            261.39, 891, 47, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (480,'00480','MorningGlory Breakfast Sausage Links', 'P', 'Choose one factor fund next better color.', 456.32, 2990, 3, 
            555.69, 437, 50, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (481,'00481','PureProtein Whey Powder', 'P', 'Start bag establish such.', 209.01, 637, 18, 
            281.71, 841, 53, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (482,'00482','SweetTooth Chocolate Chip Cookies', 'P', 'East yourself possible be left.', 171.75, 2430, 15, 
            250.14, 941, 93, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (483,'00483','Freshness Guaranteed Watermelon Chunks', 'P', 'Effort system be treat can.', 217.36, 526, 20, 
            240.44, 810, 79, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (484,'00484','Nature’s Nectar Orange Marmalade', 'P', 'Tree collection image identify while social.', 143.43, 2107, 3, 
            184.08, 167, 49, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (485,'00485','SpiceWorld Ground Cumin', 'P', 'Down front almost matter show someone.', 207.46, 2987, 14, 
            241.63, 784, 70, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (486,'00486','Herbal Haven Organic Green Tea', 'P', 'Type main general health think government begin.', 491.83, 271, 10, 
            548.27, 180, 86, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (487,'00487','PowerBeans Canned Black Beans', 'P', 'Enter message available family wind.', 375.32, 264, 17, 
            443.14, 579, 66, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (488,'00488','SnackHaven Pretzel Twists', 'P', 'Born understand customer.', 181.96, 651, 7, 
            245.31, 500, 78, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (489,'00489','Organic Origins Soy Milk', 'P', 'Decide green identify.', 381.47, 802, 4, 
            502.07, 889, 51, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (490,'00490','QuickSnack Microwave Popcorn - Butter Flavor', 'P', 'Physical bed probably record explain tax.', 336.15, 769, 11, 
            474.0, 911, 71, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (491,'00491','DairyDelish Skim Milk', 'P', 'Person great sell arm.', 38.34, 2293, 5, 
            51.65, 308, 34, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (492,'00492','Sunset Farms Cherry Tomatoes', 'P', 'Popular last glass almost road control.', 34.65, 879, 2, 
            43.71, 584, 51, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (493,'00493','Sweet ''n'' Savory Mixed Fruit Jam', 'P', 'Career story for education data serious.', 192.51, 1763, 7, 
            217.58, 222, 53, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (494,'00494','CrispCrunch Carrot Sticks', 'P', 'Study production change buy series.', 65.46, 790, 14, 
            80.74, 109, 25, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (495,'00495','OceanFresh Cod Fillets', 'P', 'Leader authority better determine experience ask.', 121.2, 1941, 7, 
            146.97, 984, 56, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (496,'00496','SavoryStock Beef Broth', 'P', 'Effort would truth site image forward issue figure.', 140.87, 802, 6, 
            178.25, 952, 47, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (497,'00497','OrchardBloom Pear Nectar', 'P', 'Tell dream product my.', 385.9, 669, 8, 
            553.91, 33, 51, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (498,'00498','DeliSelect Roasted Turkey Breast', 'P', 'Dog site never language.', 388.93, 2921, 3, 
            556.54, 599, 17, 5);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (499,'00499','LuxeLash Volumizing Mascara', 'P', 'Kitchen study later probably night design agent ask.', 243.68, 1401, 4, 
            312.21, 775, 65, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (500,'00500','SilkTouch Foundation Fluid', 'P', 'Look common air report bag company meeting.', 434.97, 849, 19, 
            647.76, 339, 19, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (501,'00501','EternalYouth Anti-Aging Serum', 'P', 'Source focus forward glass mind issue actually.', 372.93, 390, 9, 
            419.72, 986, 83, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (502,'00502','HydrateGlow Daily Moisturizer', 'P', 'Not this last affect down defense choice.', 252.7, 2034, 18, 
            317.89, 537, 97, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (503,'00503','CharcoalPure Detox Face Mask', 'P', 'Air former travel despite modern.', 114.21, 2135, 17, 
            158.85, 212, 16, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (504,'00504','PerfectPout Lip Stain in Ruby Red', 'P', 'Your mouth middle.', 412.26, 1603, 7, 
            595.19, 115, 69, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (505,'00505','SunShield SPF 50 Sunblock Cream', 'P', 'Exist that data travel like show.', 241.51, 883, 8, 
            313.03, 41, 100, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (506,'00506','GentleWave Sensitive Skin Cleanser', 'P', 'Civil success likely economy project church safe.', 278.97, 100, 19, 
            407.39, 260, 14, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (507,'00507','RegalRose Creamy Blush in Petal Pink', 'P', 'Use mission son game front poor.', 279.39, 2901, 17, 
            368.1, 1000, 97, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (508,'00508','BrowArchitect Precision Pencil', 'P', 'That commercial budget girl land subject.', 238.56, 670, 9, 
            262.56, 518, 73, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (509,'00509','OceanBreeze Refreshing Toner', 'P', 'Good laugh likely carry factor cup.', 275.81, 1164, 17, 
            320.48, 730, 10, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (510,'00510','HairNourish Argan Oil Treatment', 'P', 'Ten bad prepare summer end develop power involve.', 114.36, 88, 16, 
            135.96, 204, 21, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (511,'00511','DreamCurls Enhancing Mousse', 'P', 'Reduce the require if.', 384.69, 363, 3, 
            568.58, 772, 71, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (512,'00512','FlawlessFinish Translucent Powder', 'P', 'Deep could prove discover decide hear report.', 218.35, 150, 12, 
            244.71, 432, 17, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (513,'00513','NightRepair Retinol Complex', 'P', 'Hope everyone talk trade time way join.', 297.32, 1929, 11, 
            432.33, 117, 99, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (514,'00514','RadiantSkin Exfoliating Scrub', 'P', 'Time person claim as investment alone.', 38.71, 165, 18, 
            43.0, 885, 59, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (515,'00515','VelvetMatte Lipstick in Coral Crush', 'P', 'Build season painting none.', 302.02, 2076, 3, 
            413.08, 285, 100, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (516,'00516','LuminEye Brightening Eye Cream', 'P', 'Place into its security few general.', 166.34, 557, 5, 
            221.14, 225, 30, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (517,'00517','PureGentle Soothing Hand Cream', 'P', 'These family study skill.', 300.3, 811, 16, 
            441.37, 996, 73, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (518,'00518','Eclipse Waterproof Eyeliner in Jet Black', 'P', 'Ground tree make strong also off wear.', 88.56, 229, 6, 
            124.87, 974, 74, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (519,'00519','Vibrance Intensive Hair Mask', 'P', 'House maintain likely table east thing report.', 313.35, 1958, 7, 
            426.21, 665, 40, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (520,'00520','SmoothSilk Hair Straightening Elixir', 'P', 'Green whether provide TV.', 185.31, 2695, 17, 
            261.88, 230, 73, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (521,'00521','CitrusSplash Revitalizing Body Wash', 'P', 'Consider send rather way.', 46.93, 730, 4, 
            59.94, 793, 99, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (522,'00522','UltimateLengths Lash Growth Serum', 'P', 'Five effect draw seem parent professor across military.', 436.44, 2962, 18, 
            612.37, 934, 34, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (523,'00523','MysticShade Eye Shadow Palette', 'P', 'Ready start painting or do field oil official.', 12.68, 677, 9, 
            15.61, 829, 66, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (524,'00524','GoldenGlow Highlighting Powder', 'P', 'Article serious war sit.', 472.47, 2398, 11, 
            583.84, 646, 55, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (525,'00525','ClearComplex Acne Spot Treatment', 'P', 'Account record operation side exist chance month movie.', 131.33, 272, 7, 
            149.16, 987, 92, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (526,'00526','StrongHold Sculpting Hair Gel', 'P', 'Also foreign agree free with.', 369.97, 732, 5, 
            408.87, 752, 27, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (527,'00527','FrostedGlaze Nail Polish in Glitter Blue', 'P', 'Draw voice near fight available trade one.', 362.13, 932, 16, 
            404.08, 83, 79, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (528,'00528','FeatherSoft Makeup Remover Wipes', 'P', 'Event make peace have miss.', 145.73, 1826, 8, 
            182.55, 353, 83, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (529,'00529','ManicureMagic Cuticle Oil', 'P', 'Teach decide grow else late goal decide quite.', 175.65, 2706, 17, 
            219.63, 630, 38, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (530,'00530','PorePerfect Primer', 'P', 'But I discuss Mr.', 90.72, 557, 18, 
            109.11, 492, 25, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (531,'00531','BronzeBabe Self-Tanning Lotion', 'P', 'School pretty financial education.', 293.98, 905, 2, 
            334.88, 408, 96, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (532,'00532','CrystalClear Micellar Water', 'P', 'Condition newspaper beyond technology partner seven yourself coach.', 182.83, 996, 18, 
            222.15, 620, 37, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (533,'00533','BlushBerry Lip and Cheek Tint', 'P', 'Size prevent tax say ahead statement represent morning.', 348.33, 417, 13, 
            386.51, 335, 79, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (534,'00534','SculptFX Contour Stick', 'P', 'Of mean woman include radio along hair.', 218.81, 758, 10, 
            263.99, 974, 65, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (535,'00535','ZenScent Aromatherapy Rollerball', 'P', 'Rest my series.', 318.07, 1964, 11, 
            397.98, 147, 29, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (536,'00536','PrimeShine Glossing Hair Spray', 'P', 'Fish little shoulder street.', 209.83, 2076, 11, 
            255.8, 116, 32, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (537,'00537','SootheCalm Aftershave Balm', 'P', 'Summer up field short general trouble rather.', 174.91, 121, 18, 
            249.87, 478, 45, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (538,'00538','PearlEssence Whitening Toothpaste', 'P', 'Do help summer simply specific own others.', 160.49, 368, 8, 
            180.04, 189, 31, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (539,'00539','MintFresh Breath Spray', 'P', 'Result image during most plant.', 289.8, 259, 19, 
            337.96, 78, 47, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (540,'00540','DivineLips Hydrating Lip Balm', 'P', 'Charge sound statement car finish drop easy feeling.', 380.99, 2931, 11, 
            426.75, 983, 99, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (541,'00541','CaffeineCharge Eye Roller', 'P', 'Step two institution.', 430.89, 507, 8, 
            572.72, 862, 26, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (542,'00542','AquaLock Hydration Spray', 'P', 'Increase personal sell plant run heavy control finally.', 280.78, 92, 12, 
            345.72, 113, 43, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (543,'00543','BounceBack Curl Definer', 'P', 'Difficult medical hundred onto.', 336.46, 667, 12, 
            437.53, 146, 81, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (544,'00544','SilkVeil Face Powder in Beige', 'P', 'Son approach phone.', 364.5, 261, 17, 
            527.7, 212, 43, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (545,'00545','EnchantMist Perfumed Body Mist', 'P', 'Church after line reveal.', 120.81, 363, 7, 
            150.78, 377, 98, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (546,'00546','NoFrizz Smoothing Serum', 'P', 'Different hand cut meeting.', 44.24, 11, 11, 
            63.86, 310, 66, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (547,'00547','DazzleBright Teeth Whitening Strips', 'P', 'Offer benefit pretty heart film.', 478.15, 315, 18, 
            650.04, 937, 50, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (548,'00548','PlumpIt Up Lip Plumper', 'P', 'Hope feel smile.', 456.41, 1904, 3, 
            532.65, 663, 54, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (549,'00549','GlowRevive Highlighter Stick', 'P', 'Old actually scientist remain.', 237.94, 1139, 7, 
            271.95, 600, 67, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (550,'00550','ShadeShift Color Changing Nail Lacquer', 'P', 'Skill personal determine arm nothing look oil.', 324.78, 272, 18, 
            382.55, 473, 89, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (551,'00551','SkinFirm Cellulite Reduction Cream', 'P', 'Instead fall rock.', 413.19, 1580, 12, 
            589.8, 129, 30, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (552,'00552','WildCurl Mascara with Fibers', 'P', 'Serve create threat summer.', 148.41, 2952, 15, 
            163.67, 885, 99, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (553,'00553','SheerDelight BB Cream', 'P', 'Word suddenly Mrs ability skill.', 150.45, 2448, 4, 
            167.73, 960, 61, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (554,'00554','SpiceBloom Natural Deodorant', 'P', 'Player road of yard so four note.', 356.44, 233, 17, 
            518.98, 274, 44, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (555,'00555','GentleClean Makeup Brush Cleanser', 'P', 'Leave image human time set to.', 167.1, 280, 17, 
            208.89, 338, 67, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (556,'00556','PureBliss Organic Lip Scrub', 'P', 'Never court radio move six remember crime.', 267.92, 2281, 5, 
            354.85, 691, 10, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (557,'00557','ExoticOil Moroccan Hair Oil', 'P', 'Whom firm before for woman sort green budget.', 439.77, 2514, 8, 
            559.19, 820, 74, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (558,'00558','SculptingClay High Definition Hair Pomade', 'P', 'Interesting hospital miss.', 106.2, 2759, 3, 
            150.65, 106, 43, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (559,'00559','CleanPores Blackhead Removal Strips', 'P', 'Activity member eye crime.', 228.56, 808, 5, 
            326.36, 366, 71, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (560,'00560','LuxeLengths Hair Extensions', 'P', 'Success significant trade wife.', 307.19, 233, 18, 
            423.39, 218, 27, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (561,'00561','AllDayFresh Feminine Wipes', 'P', 'Wide model hand focus check.', 121.13, 231, 3, 
            135.86, 619, 91, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (562,'00562','NatureNourish Handmade Soap Bar', 'P', 'Pattern smile travel maybe.', 430.26, 1477, 14, 
            541.96, 365, 33, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (563,'00563','BeachWave Sea Salt Hair Spray', 'P', 'Positive reveal history card girl consumer compare.', 197.76, 124, 7, 
            292.74, 85, 57, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (564,'00564','CoolingAloe After Sun Gel', 'P', 'Line blue nothing action after.', 23.82, 2484, 10, 
            35.72, 398, 90, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (565,'00565','AquaMarine Refreshing Shampoo', 'P', 'Relationship history protect teach laugh.', 251.01, 453, 11, 
            364.5, 869, 70, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (566,'00566','GlitterGlow Liquid Eyeshadow', 'P', 'Modern order buy prepare care tree.', 470.06, 1801, 18, 
            653.34, 525, 65, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (567,'00567','SatinSheen Body Lotion', 'P', 'See wait policy skin across enjoy then they.', 211.91, 272, 8, 
            245.99, 910, 66, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (568,'00568','NailStrong Treatment and Growth Formula', 'P', 'Truth allow kind all occur management.', 401.92, 582, 20, 
            583.7, 152, 81, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (569,'00569','DewyDream Hyaluronic Face Mist', 'P', 'War drug Congress over make.', 12.61, 2121, 2, 
            14.73, 978, 17, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (570,'00570','SmoothEase Depilatory Cream', 'P', 'But speech cut me way cup.', 283.3, 1958, 4, 
            398.7, 155, 81, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (571,'00571','GlossLock Longwear Lip Gloss', 'P', 'Current director baby art item marriage future.', 183.28, 665, 13, 
            264.44, 647, 75, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (572,'00572','CalmBalm Shaving Cream', 'P', 'Order front change others.', 272.32, 767, 6, 
            342.28, 526, 22, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (573,'00573','SparkleShine Dental Floss Picks', 'P', 'Program conference theory already hear man rest.', 208.11, 2806, 16, 
            282.02, 678, 44, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (574,'00574','LavishLather Shaving Soap', 'P', 'New teach stock.', 331.32, 1906, 20, 
            376.07, 897, 47, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (575,'00575','EcoPure Natural Conditioner 78. BlushBeauty Baked Powder Blush', 'P', 'Street live relationship.', 213.33, 866, 17, 
            238.58, 289, 84, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (576,'00576','EarthTones Organic Foundation Stick', 'P', 'Drive last continue time move better.', 86.96, 1550, 16, 
            103.36, 205, 76, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (577,'00577','ManeMagic Split End Therapy', 'P', 'Reveal hand let management down.', 427.02, 797, 10, 
            584.59, 866, 98, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (578,'00578','BerryBlast Tinted Lip Oil', 'P', 'Past we themselves way.', 194.98, 1906, 11, 
            251.36, 706, 26, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (579,'00579','SleekContour Face Sculpting Kit', 'P', 'We say late who.', 167.94, 402, 3, 
            191.09, 572, 43, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (580,'00580','BrightEyes Concealer in Porcelain', 'P', 'Human letter military contain.', 410.25, 810, 16, 
            571.14, 561, 14, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (581,'00581','Rejuvenate Night Face Oil', 'P', 'House mother amount team.', 392.73, 196, 10, 
            471.01, 703, 97, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (582,'00582','VelvetSkin Body Butter in Warm Vanilla', 'P', 'Model represent into.', 203.45, 2211, 15, 
            301.31, 781, 40, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (583,'00583','InstaLift Eye Gel Patches', 'P', 'Fish professional improve seem amount.', 353.63, 2415, 3, 
            393.4, 806, 84, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (584,'00584','OasisHydrate Intense Hydration Serum', 'P', 'Wrong others service check.', 91.39, 294, 12, 
            106.74, 916, 40, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (585,'00585','PerfectBrows Shaping Wax', 'P', 'Kitchen six effect member.', 116.2, 400, 15, 
            166.86, 736, 80, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (586,'00586','CrystalNail Hardening Strengthener', 'P', 'Necessary suggest instead control.', 460.33, 1229, 8, 
            668.74, 32, 80, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (587,'00587','ExoticEscape Body Scrub with Coconut', 'P', 'Job single environment suffer walk instead change.', 472.07, 1520, 3, 
            651.2, 321, 58, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (588,'00588','RenewDerm Face Mask with Green Tea', 'P', 'Future democratic strong deal.', 57.17, 306, 13, 
            81.16, 607, 66, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (589,'00589','LushLashes Eyelash Enhancing Serum', 'P', 'Article area herself however all.', 337.04, 2722, 20, 
            463.11, 710, 66, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (590,'00590','ClearZen Acne Treatment Gel', 'P', 'Measure north lay option station cell property.', 445.03, 271, 5, 
            565.67, 682, 24, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (591,'00591','SculptedAbs Workout Enhancing Cream', 'P', 'Garden always maybe let.', 108.85, 113, 2, 
            122.54, 734, 83, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (592,'00592','SleekShadow Smudge-Proof Cream Eyeshadow', 'P', 'Professional than institution him street.', 331.73, 815, 15, 
            494.87, 756, 18, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (593,'00593','KissableLips Sugar Lip Polish', 'P', 'Couple between all try.', 110.53, 46, 3, 
            125.5, 952, 32, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (594,'00594','CalmingLavender Bath Salts', 'P', 'Thought result full election ground full move get.', 443.15, 37, 4, 
            607.62, 874, 53, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (595,'00595','SilkWrap Leave-In Hair Treatment', 'P', 'Agent onto black himself far company head.', 303.09, 2449, 3, 
            338.86, 454, 49, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (596,'00596','AngelGlow Illuminating Face Primer', 'P', 'Use keep law job.', 378.17, 814, 4, 
            435.29, 66, 47, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (597,'00597','PureMint Natural Mouthwash', 'P', 'Hit address family item authority.', 480.78, 1570, 7, 
            595.25, 240, 44, 6);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (598,'00598','VitalityBoost Multivitamin Complex', 'P', 'History water very model road defense TV.', 90.09, 237, 3, 
            104.1, 916, 59, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (599,'00599','OmegaWave Fish Oil Softgels', 'P', 'We room happen fast house fear.', 331.54, 602, 4, 
            435.67, 69, 73, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (600,'00600','ZenMind Stress Relief Formula', 'P', 'Employee mind Mrs senior order visit.', 100.29, 752, 8, 
            113.2, 652, 68, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (601,'00601','IronPulse Pre-Workout Powder', 'P', 'Range technology security ground particular single.', 419.56, 1032, 15, 
            524.31, 410, 37, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (602,'00602','HerbalEssence Echinacea Capsules', 'P', 'Last new board onto under democratic week.', 360.58, 119, 14, 
            436.43, 27, 91, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (603,'00603','GreenFuel Spirulina Tablets', 'P', 'Fish computer all plan show rise upon lawyer.', 68.07, 963, 8, 
            80.85, 870, 42, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (604,'00604','BodyFlex Adjustable Dumbbells', 'P', 'Health start they once shoulder.', 219.32, 222, 11, 
            307.71, 82, 99, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (605,'00605','CardioRush Jump Rope with Counter', 'P', 'Staff because effort right case health test.', 455.79, 2367, 6, 
            659.2, 290, 34, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (606,'00606','ProGainer Whey Protein Blend', 'P', 'Tonight edge within find me.', 61.31, 735, 6, 
            87.57, 181, 87, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (607,'00607','YogaHarmony Eco-Friendly Mat', 'P', 'Response choose less us exactly.', 27.72, 869, 19, 
            32.23, 237, 72, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (608,'00608','JointFlex Glucosamine Supplement', 'P', 'Its television talk could history sometimes and.', 86.4, 748, 10, 
            117.09, 856, 82, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (609,'00609','PowerShred Kettlebell Set', 'P', 'Pass far be wall.', 374.47, 2946, 8, 
            550.01, 337, 65, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (610,'00610','ActiveCore Stability Ball', 'P', 'Gas us ago now others office.', 342.05, 526, 20, 
            419.15, 65, 48, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (611,'00611','DigestWell Probiotic Blend', 'P', 'Knowledge heavy medical history.', 117.07, 2328, 16, 
            135.42, 476, 45, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (612,'00612','ZenSleep Melatonin Gummies', 'P', 'Little big action item budget.', 138.74, 974, 7, 
            177.26, 190, 12, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (613,'00613','BrainCharge Cognitive Support Pills', 'P', 'Mission table under born school enjoy building simply.', 438.47, 985, 2, 
            611.87, 809, 34, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (614,'00614','HeartRhythm CoQ10 Softgels', 'P', 'Mrs foot successful tell let save.', 256.43, 682, 12, 
            294.93, 286, 14, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (615,'00615','MightyMunch Flaxseed Snack Bars', 'P', 'New animal shoulder continue prepare.', 478.89, 626, 11, 
            613.96, 227, 17, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (616,'00616','EnergyBurst B12 Lozenges', 'P', 'Detail population pressure time team.', 476.92, 1217, 12, 
            690.26, 862, 83, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (617,'00617','SkinGlow Collagen Peptides Powder', 'P', 'Apply either worry hot design.', 485.66, 674, 20, 
            562.62, 346, 16, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (618,'00618','PurePlant Vegan Protein Shake', 'P', 'Would perhaps style poor.', 342.1, 2632, 3, 
            434.08, 609, 47, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (619,'00619','ImmunoShield Vitamin C + Zinc', 'P', 'Skin job prove father beat again agreement attention.', 263.42, 638, 5, 
            308.05, 95, 12, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (620,'00620','FiberFix Psyllium Husk Capsules', 'P', 'Responsibility bit develop top.', 234.25, 201, 18, 
            259.49, 304, 40, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (621,'00621','SerenityAid Natural Sleep Formula', 'P', 'Answer last certain or movement improve.', 241.01, 445, 20, 
            280.49, 445, 21, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (622,'00622','FitnessPro Treadmill with Heart Monitor', 'P', 'Make couple piece.', 6.06, 1066, 17, 
            8.11, 666, 68, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (623,'00623','BalanceBoard Wooden Wobble Trainer', 'P', 'Feeling actually pattern war recently day figure.', 291.78, 2866, 14, 
            385.45, 453, 31, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (624,'00624','AntioxidantAdept Acai Berry Extract', 'P', 'Leg who push save authority.', 118.39, 975, 15, 
            168.97, 692, 26, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (625,'00625','SteelPulse Adjustable Barbell', 'P', 'Mention behavior behind simple.', 272.55, 2669, 12, 
            399.1, 634, 27, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (626,'00626','KetoKickstart MCT Oil', 'P', 'Something choose care easy.', 255.76, 359, 7, 
            340.44, 493, 89, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (627,'00627','DetoxPure Activated Charcoal Pills', 'P', 'Up reflect conference business contain receive suddenly.', 282.74, 2631, 20, 
            396.84, 46, 37, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (628,'00628','ResilienceRx Turmeric Curcumin', 'P', 'Environment build fire.', 472.31, 1325, 17, 
            705.81, 478, 70, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (629,'00629','VitaminD3 Sunshine Gels', 'P', 'Before century career lawyer write character series help.', 430.28, 1216, 8, 
            524.73, 193, 39, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (630,'00630','CalmFlow Aromatherapy Diffuser', 'P', 'Purpose think design yes.', 145.32, 2364, 16, 
            217.53, 105, 26, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (631,'00631','SculptTone Weighted Vest', 'P', 'Serious price short treatment charge watch that.', 380.57, 2281, 11, 
            514.95, 877, 25, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (632,'00632','RecoveryPlus Epsom Salt Soak', 'P', 'Sell question know quite group heart.', 415.57, 2345, 16, 
            474.39, 802, 32, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (633,'00633','BerryBlast Superfood Powder', 'P', 'Catch try boy treat long.', 259.54, 2165, 2, 
            307.79, 422, 64, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (634,'00634','FlexBand Resistance Loop Set', 'P', 'Subject president low value picture election.', 314.5, 385, 5, 
            433.09, 775, 64, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (635,'00635','GymGrip Weightlifting Gloves', 'P', 'Everybody new service tough seat large city.', 376.15, 806, 9, 
            482.38, 695, 75, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (636,'00636','HydrateElixir Electrolyte Drink Mix', 'P', 'Determine budget south environment agreement include animal.', 156.69, 2248, 7, 
            179.41, 619, 10, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (637,'00637','ToneRope Speed Skipping Rope', 'P', 'Event official sign coach.', 250.73, 814, 9, 
            322.7, 285, 52, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (638,'00638','EnduranceEdge Creatine Monohydrate', 'P', 'Example small describe list hold boy.', 203.88, 2455, 16, 
            287.22, 584, 82, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (639,'00639','LeanLife CLA Softgels', 'P', 'International above foot apply challenge visit single economy.', 335.02, 2250, 15, 
            492.7, 933, 93, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (640,'00640','PowerLift Squat Rack', 'P', 'Side less over real.', 425.9, 969, 14, 
            475.53, 317, 41, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (641,'00641','MindBoost Ginkgo Biloba Tablets', 'P', 'Born perform likely real watch fear.', 124.65, 183, 3, 
            149.17, 562, 18, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (642,'00642','BloodPressure Support Herbal Tea', 'P', 'Decide material thank those.', 97.49, 217, 2, 
            122.74, 162, 17, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (643,'00643','VisionClear Lutein and Zeaxanthin', 'P', 'Budget music no identify smile local result.', 244.54, 974, 13, 
            282.15, 142, 17, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (644,'00644','AgileAgility Agility Ladder', 'P', 'No reality forget before.', 186.06, 2048, 10, 
            263.5, 486, 89, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (645,'00645','TotalTone Pilates Ring', 'P', 'Material range cell.', 210.89, 1051, 12, 
            271.16, 897, 75, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (646,'00646','MuscleMend Massage Gun', 'P', 'And green might child opportunity end candidate.', 348.55, 899, 18, 
            419.56, 104, 44, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (647,'00647','IronGrip Pull Up Bar', 'P', 'Program theory walk beat put.', 338.94, 834, 19, 
            476.22, 634, 23, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (648,'00648','EssentialOmega Krill Oil Softgels', 'P', 'Remain arrive help tough do.', 9.85, 1127, 11, 
            14.07, 952, 36, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (649,'00649','PureHydration Water Filtration Bottle', 'P', 'Provide physical throw down avoid game.', 383.44, 24, 18, 
            475.3, 591, 44, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (650,'00650','FitnessTracker Advanced Activity Wristband', 'P', 'Modern particular else accept front enough follow.', 32.81, 278, 6, 
            39.72, 505, 76, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (651,'00651','HealthyHeart Garlic Extract Capsules', 'P', 'Manage customer should them whatever.', 268.92, 736, 7, 
            373.74, 906, 47, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (652,'00652','BodySculpt Yoga Wheel', 'P', 'Watch moment protect popular those.', 173.2, 2214, 10, 
            195.18, 369, 75, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (653,'00653','RecoveryWhey Isolate Protein', 'P', 'Middle yes pick some play toward.', 56.93, 645, 6, 
            64.03, 656, 88, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (654,'00654','SunriseAlarm Wake-Up Light Therapy', 'P', 'Almost minute trip own save reason skill.', 238.74, 196, 5, 
            353.58, 506, 70, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (655,'00655','DailyDetox Apple Cider Vinegar', 'P', 'Role race water stage beautiful especially enough.', 437.39, 72, 15, 
            603.82, 166, 96, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (656,'00656','CalciumComplete Chewable Tablets', 'P', 'Fact live edge I marriage figure reality.', 56.18, 1681, 8, 
            63.8, 170, 86, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (657,'00657','SlimShape Waist Trainer Belt', 'P', 'Specific want pick either.', 229.41, 1032, 15, 
            274.1, 19, 77, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (658,'00658','PureStrength Grip Strengthener', 'P', 'Forward summer rock international.', 463.9, 673, 7, 
            654.97, 876, 24, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (659,'00659','BreatheEase Nasal Strips', 'P', 'Of sort image finally traditional clear region.', 289.79, 631, 8, 
            431.72, 377, 87, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (660,'00660','NaturalEase Milk Thistle Capsules', 'P', 'Six floor boy remain music about speech.', 307.65, 1324, 8, 
            383.88, 259, 87, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (661,'00661','ElectroBoost Cycling Stationary Bike', 'P', 'Work kind even huge plant.', 224.83, 2703, 16, 
            280.75, 468, 99, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (662,'00662','TranquilTouch Massage Oil', 'P', 'Bag ability international security right push.', 82.93, 2371, 10, 
            103.04, 103, 72, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (663,'00663','FlexFit Home Gym System', 'P', 'Determine American student again cup notice again notice.', 282.89, 216, 14, 
            409.14, 981, 55, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (664,'00664','ImmuneDefense Elderberry Syrup', 'P', 'Line between list push.', 317.69, 352, 10, 
            416.24, 508, 58, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (665,'00665','ZestfulEnergy Caffeine Pills', 'P', 'Three approach record describe thank during many.', 270.6, 464, 8, 
            392.66, 925, 55, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (666,'00666','IronCore Cast Iron Kettlebell', 'P', 'Mother nearly sell answer among relationship more much.', 249.61, 1477, 20, 
            373.83, 979, 59, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (667,'00667','RadiantHair Biotin Formula', 'P', 'Week article go organization western despite open author.', 358.06, 2631, 10, 
            439.47, 509, 61, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (668,'00668','EaseFlex Foam Roller', 'P', 'Character nearly system ahead anyone.', 104.46, 2202, 5, 
            123.66, 857, 34, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (669,'00669','StrongStride Treadmill Lubricant', 'P', 'Including eye factor effort quickly art.', 423.85, 2164, 16, 
            610.87, 857, 72, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (670,'00670','NutriJuice Cold Press Juicer', 'P', 'Watch effort experience camera sell.', 114.89, 645, 18, 
            165.25, 471, 49, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (671,'00671','VitalMinerals Magnesium Complex', 'P', 'Matter great chance film.', 399.41, 732, 6, 
            489.14, 208, 75, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (672,'00672','FitnessMat Non-Slip Exercise Mat', 'P', 'Few former like to.', 498.48, 1608, 2, 
            592.3, 906, 77, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (673,'00673','CleanAir HEPA Air Purifier', 'P', 'Deal program best police Mrs institution.', 287.74, 1549, 8, 
            331.34, 339, 51, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (674,'00674','WellBeing Digital Blood Pressure Monitor', 'P', 'Couple notice this cost well ask board.', 487.37, 2805, 2, 
            577.65, 26, 29, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (675,'00675','NaturalSoothe Aloe Vera Gel', 'P', 'Laugh control practice always consumer.', 306.81, 462, 4, 
            364.88, 611, 100, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (676,'00676','CrunchCore Ab Roller', 'P', 'Generation month out suffer.', 468.9, 458, 7, 
            591.1, 510, 73, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (677,'00677','PowerSnack High-Protein Bars', 'P', 'Fast my much wind wife.', 88.74, 592, 7, 
            126.66, 889, 90, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (678,'00678','RefreshMint Breath Freshener Spray', 'P', 'Room candidate stop war which statement.', 354.41, 183, 12, 
            415.51, 42, 49, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (679,'00679','CardioFit Heart Rate Monitor', 'P', 'Within two guy long goal.', 173.71, 601, 9, 
            233.94, 840, 35, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (680,'00680','JointEase Yoga Block', 'P', 'Pay morning stock understand think identify professional.', 315.32, 1811, 10, 
            463.64, 589, 75, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (681,'00681','SunSynth Vitamin D Lamp', 'P', 'World check political study.', 278.08, 670, 4, 
            349.95, 685, 81, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (682,'00682','StrengthStack 50 lb Adjustable Dumbbell', 'P', 'Sort suddenly cold try eye.', 462.45, 701, 17, 
            532.97, 477, 63, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (683,'00683','PlantPower Green Tea Extract', 'P', 'Firm at wind.', 485.59, 1164, 15, 
            653.78, 287, 83, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (684,'00684','EssentialStretch Stretching Strap', 'P', 'Class understand result.', 52.36, 1324, 19, 
            60.4, 195, 29, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (685,'00685','WheyPlus Grass-Fed Protein', 'P', 'Cause Republican pressure occur bill sign.', 141.08, 623, 11, 
            175.4, 903, 56, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (686,'00686','HerbalZen Ashwagandha Root', 'P', 'Military successful kid song director charge add.', 436.75, 1761, 15, 
            580.47, 145, 56, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (687,'00687','GripMaster Hand Exerciser', 'P', 'Put hundred protect.', 311.59, 178, 6, 
            343.37, 515, 50, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (688,'00688','EyeBright Vision Support Formula', 'P', 'Piece management final.', 357.84, 1216, 18, 
            446.84, 646, 15, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (689,'00689','PerformancePump Nitric Oxide Booster', 'P', 'Newspaper ahead official she marriage dark to.', 119.51, 426, 20, 
            176.76, 197, 37, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (690,'00690','KetoBurn Exogenous Ketone Capsules', 'P', 'Technology political feel.', 359.56, 624, 18, 
            469.06, 960, 39, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (691,'00691','TrueTaste Alkaline Water Pitcher', 'P', 'Edge mouth group hot western raise.', 259.07, 932, 7, 
            357.96, 396, 21, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (692,'00692','SmartScale Bluetooth Body Analyzer', 'P', 'Range present land line pass thought.', 59.74, 539, 14, 
            85.99, 402, 50, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (693,'00693','ZenGarden Meditation Cushion', 'P', 'Opportunity surface rest give candidate position plan.', 15.24, 403, 6, 
            17.14, 865, 37, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (694,'00694','ProteinPacked Peanut Butter Powder', 'P', 'Out morning around put make section social.', 161.7, 264, 9, 
            231.91, 323, 77, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (695,'00695','CoreControl Balance Trainer', 'P', 'Sport account build discussion.', 219.15, 302, 7, 
            314.4, 147, 77, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (696,'00696','FlexMotion Doorway Gym Bar', 'P', 'Television various he painting.', 366.17, 600, 19, 
            462.14, 527, 14, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (697,'00697','SoothingScent Lavender Essential Oil', 'P', 'Air economic wind condition teach.', 384.04, 701, 4, 
            501.71, 728, 81, 7);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (698,'00698','AstroBlaster Foam Dart Gun', 'P', 'In prove daughter quality especially image both station.', 41.29, 2084, 19, 
            61.72, 504, 46, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (699,'00699','Pirates'' Cove Adventure Board Game', 'P', 'Energy mouth ago in lawyer.', 481.28, 781, 17, 
            627.3, 994, 44, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (700,'00700','RainbowQuest Unicorn Puzzle', 'P', 'Put city face prevent.', 494.99, 249, 19, 
            726.11, 765, 47, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (701,'00701','MasterChef Junior Cooking Kit', 'P', 'Trip decide school goal history strategy data.', 56.73, 2371, 7, 
            66.45, 842, 24, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (702,'00702','BrickBuilder Space Station Set', 'P', 'Discuss those project order.', 437.43, 214, 3, 
            588.15, 141, 83, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (703,'00703','ActionArena Soccer Table', 'P', 'Receive yourself thousand ahead now.', 310.17, 937, 15, 
            358.03, 360, 59, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (704,'00704','CastleSiege Medieval Chess Set', 'P', 'Industry everything sound audience citizen.', 399.57, 1228, 12, 
            522.33, 744, 39, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (705,'00705','SpeedRacers Remote Control Cars', 'P', 'Say executive become when her quite white.', 131.48, 2151, 15, 
            182.39, 127, 51, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (706,'00706','AquaSplash Water Balloon Set', 'P', 'Wall side better single you.', 308.05, 439, 7, 
            349.44, 171, 22, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (707,'00707','GalaxyGuardians Action Figure Pack', 'P', 'Treatment exactly understand your market exactly.', 121.56, 793, 17, 
            144.16, 652, 82, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (708,'00708','EcoExplorers Recycling Truck Toy', 'P', 'Action effort laugh fill memory line blood.', 316.56, 587, 3, 
            414.16, 98, 28, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (709,'00709','DinoDig Fossil Excavation Kit', 'P', 'Who knowledge whether task.', 109.12, 1872, 6, 
            160.76, 621, 40, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (710,'00710','LaserTag Pro Battle Set', 'P', 'Century operation eye beyond happen.', 355.49, 1485, 17, 
            514.27, 921, 72, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (711,'00711','CyberStrike Video Game for Console', 'P', 'Sign case without good.', 98.18, 210, 19, 
            143.41, 700, 88, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (712,'00712','DronePilot Virtual Flight Simulator', 'P', 'Positive tax foreign.', 422.5, 1520, 10, 
            565.79, 350, 11, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (713,'00713','WhizKid Science Lab Set', 'P', 'Sometimes still individual guess imagine fight.', 229.63, 2262, 13, 
            287.2, 886, 93, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (714,'00714','StoryLand Enchanted Princess Castle', 'P', 'I industry reason story collection once.', 28.14, 1846, 4, 
            38.19, 404, 17, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (715,'00715','MindMaze Escape Room Challenge', 'P', 'Have way each author easy business list.', 44.62, 1603, 4, 
            59.05, 214, 60, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (716,'00716','DeepSea Treasure Diving Game', 'P', 'Shake pull song camera deep rate such.', 398.34, 552, 5, 
            530.25, 83, 22, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (717,'00717','RiddleMaster Logic Puzzle Collection', 'P', 'Make appear exactly consider.', 191.9, 481, 8, 
            237.44, 713, 97, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (718,'00718','QuickDraw Cowboy Shootout Set', 'P', 'Six for how long who.', 325.15, 1538, 4, 
            407.59, 376, 88, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (719,'00719','FashionRunway Designer Dress-Up Kit', 'P', 'With sure something model official.', 412.94, 507, 18, 
            610.76, 177, 96, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (720,'00720','HoverBoard VR Racing Game', 'P', 'Note walk late fill order huge and.', 90.05, 39, 6, 
            118.86, 176, 79, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (721,'00721','RoboTech Interactive Learning Robot', 'P', 'Fear play hit administration often.', 77.11, 251, 8, 
            107.16, 978, 27, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (722,'00722','NinjaWarriors Action Figures', 'P', 'Better resource wish serve.', 51.17, 762, 14, 
            58.82, 775, 55, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (723,'00723','Quest for Atlantis Underwater Drone', 'P', 'Red more beyond.', 311.58, 525, 7, 
            426.9, 391, 10, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (724,'00724','RetroArcade Classic Games Console', 'P', 'Air so answer deep most language feeling traditional.', 221.7, 1037, 5, 
            247.21, 286, 12, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (725,'00725','LittleBaker Cupcake Decorating Set', 'P', 'Wonder wife industry piece drop since.', 340.75, 1991, 7, 
            395.75, 218, 41, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (726,'00726','Mythical Beasts Collectible Card Game', 'P', 'Book evidence try join.', 220.16, 588, 16, 
            299.12, 14, 23, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (727,'00727','SkyHigh Kite Kit', 'P', 'Color sister rule.', 350.15, 687, 8, 
            495.0, 388, 55, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (728,'00728','JungleGym Backyard Playset', 'P', 'Ahead within why cultural education recently key child.', 21.86, 334, 3, 
            32.15, 284, 34, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (729,'00729','FantasyFlight Dragon Glider', 'P', 'Serve open movie boy story shoulder PM.', 300.08, 1594, 10, 
            396.19, 455, 58, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (730,'00730','DanceMania Interactive Dance Mat', 'P', 'Law drug radio herself long.', 288.07, 2858, 4, 
            372.41, 320, 11, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (731,'00731','PocketPets Electronic Virtual Pet', 'P', 'Last care method modern bill.', 15.06, 917, 3, 
            17.36, 255, 71, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (732,'00732','StarTracker Telescope and Astronomy Kit', 'P', 'Let green spring report expert five significant food.', 353.41, 500, 8, 
            502.58, 694, 40, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (733,'00733','Spellbound Magical Wand Set', 'P', 'Already his value need structure.', 247.03, 2323, 8, 
            286.58, 663, 73, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (734,'00734','CodeCracker Programming Game', 'P', 'Report college conference sit yourself.', 157.35, 1550, 8, 
            178.74, 619, 39, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (735,'00735','RailRiders Deluxe Train Set', 'P', 'Arm store vote.', 11.03, 854, 18, 
            12.75, 466, 15, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (736,'00736','BattleBots Remote Control Fighting Robots', 'P', 'Administration speak city marriage start.', 279.1, 2936, 10, 
            404.44, 98, 18, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (737,'00737','SafariSnap Animal Photography Game', 'P', 'Get role visit must everyone clearly window.', 492.55, 1793, 19, 
            637.34, 121, 86, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (738,'00738','MonsterMaker 3D Printing Pen', 'P', 'Stuff out less.', 221.42, 905, 12, 
            308.21, 663, 97, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (739,'00739','MusicMaestro Keyboard and Learning System', 'P', 'Sister though or.', 420.98, 120, 17, 
            627.84, 693, 50, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (740,'00740','FitnessFun Trampoline with Safety Net', 'P', 'Chance challenge mean drop.', 487.5, 1613, 18, 
            628.25, 755, 94, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (741,'00741','SuperSleuth Detective Kit', 'P', 'Usually change thus in face everybody series.', 456.43, 557, 20, 
            642.22, 785, 80, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (742,'00742','WorldTraveler Interactive Globe', 'P', 'Impact traditional feel perhaps owner.', 15.47, 939, 20, 
            17.33, 548, 54, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (743,'00743','FutureCity Building Blocks', 'P', 'Start draw where.', 281.13, 2577, 17, 
            383.07, 947, 44, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (744,'00744','OceanOdyssey Submarine Exploration Game', 'P', 'Much note actually approach yes executive take.', 260.92, 732, 15, 
            386.93, 368, 88, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (745,'00745','RaceCar Rally Slot Car Track', 'P', 'High accept from method.', 113.0, 732, 18, 
            130.86, 563, 90, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (746,'00746','SkyQuest Drone with Camera', 'P', 'Draw democratic blue south community.', 416.12, 2269, 3, 
            611.08, 368, 50, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (747,'00747','PuppetPlay Theater Set', 'P', 'Story drug church significant example.', 404.59, 972, 19, 
            489.29, 508, 49, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (748,'00748','TimeTravelers Historical Board Game', 'P', 'Firm item might since keep.', 411.13, 2264, 10, 
            572.66, 768, 45, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (749,'00749','MasterMind Chess Trainer', 'P', 'Kid only his tend myself style.', 121.73, 539, 2, 
            164.46, 300, 87, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (750,'00750','SecretAgent Spy Gear Set', 'P', 'Think set move above.', 365.73, 655, 3, 
            480.1, 336, 29, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (751,'00751','LaserPuzzle 3D Jigsaw Challenge', 'P', 'Direction population population cover box.', 388.86, 954, 3, 
            580.04, 11, 72, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (752,'00752','AnimalAdventures Interactive Zoo Set', 'P', 'Activity back condition be individual.', 496.98, 325, 2, 
            646.0, 504, 57, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (753,'00753','UltimateUniverse Space Exploration Video Game', 'P', 'Pretty hour rule employee.', 40.65, 2669, 17, 
            50.72, 370, 38, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (754,'00754','EscapeQuest Virtual Reality Game', 'P', 'Claim adult spend seek have middle throw.', 268.56, 1469, 3, 
            346.2, 447, 52, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (755,'00755','PocketPainter Watercolor Set', 'P', 'Focus safe house weight current build determine.', 2.91, 2344, 12, 
            3.64, 51, 76, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (756,'00756','CombatCommanders Military Strategy Game', 'P', 'Side late account pick might.', 233.38, 2367, 9, 
            346.74, 144, 90, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (757,'00757','Fashionista Barbie Playset', 'P', 'Bit word political growth writer individual.', 420.95, 720, 4, 
            465.3, 211, 36, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (758,'00758','TimeTrials Track & Field Sports Set', 'P', 'Outside than how detail.', 103.47, 1801, 18, 
            146.82, 337, 21, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (759,'00759','CraftyKids Pottery Wheel', 'P', 'Successful above decide measure.', 104.94, 603, 15, 
            134.2, 355, 79, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (760,'00760','DragonSlayer Fantasy Role-Playing Game', 'P', 'Parent material program doctor speech community why.', 360.54, 18, 20, 
            431.35, 200, 74, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (761,'00761','BeachBum Volleyball and Badminton Set', 'P', 'Already behind instead step.', 126.02, 617, 3, 
            165.96, 39, 29, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (762,'00762','ArcadeShooter Laser Tag Game', 'P', 'I front laugh hair either.', 116.41, 2165, 13, 
            142.66, 599, 100, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (763,'00763','StrategyKingdom Conquest Board Game', 'P', 'Community series my practice.', 497.84, 1265, 15, 
            644.65, 557, 27, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (764,'00764','BouncePalooza Inflatable Bounce House', 'P', 'Social report he cold effect.', 179.11, 272, 16, 
            236.66, 109, 58, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (765,'00765','WizardWorld Magical Creatures Collection', 'P', 'Rock chance improve.', 323.0, 2669, 16, 
            403.35, 699, 94, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (766,'00766','PuzzleParadise Exotic Locations Jigsaw Set', 'P', 'Process sister suggest how.', 159.74, 2048, 7, 
            226.64, 71, 43, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (767,'00767','SuperHeroes Action Figure Lineup', 'P', 'Practice rich blood happy yes.', 474.4, 1034, 15, 
            618.85, 363, 97, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (768,'00768','SweetShoppe Ice Cream Making Kit', 'P', 'Choice west PM rest glass measure provide.', 115.02, 2398, 10, 
            131.83, 148, 84, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (769,'00769','MiniatureGolf Home Edition', 'P', 'Strong data challenge response sit.', 95.76, 811, 12, 
            130.02, 994, 69, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (770,'00770','SpyQuest Digital Treasure Hunt Game', 'P', 'Moment practice candidate remember.', 499.58, 106, 12, 
            550.67, 83, 14, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (771,'00771','AnimalRescue Vet Clinic Toy Set', 'P', 'Live first what author tax size.', 37.07, 631, 11, 
            43.24, 322, 74, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (772,'00772','ElectriCity Circuit Building Game', 'P', 'Discover quickly model realize experience drive offer.', 278.79, 2898, 13, 
            361.11, 471, 93, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (773,'00773','DanceOff Dance Competition Video Game', 'P', 'Line per compare others between forget threat.', 411.32, 2693, 2, 
            527.09, 985, 86, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (774,'00774','SmartBlox Robotics Construction Set', 'P', 'Address such campaign student.', 295.48, 264, 10, 
            433.67, 609, 15, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (775,'00775','StrikeForce Bowling Alley Set', 'P', 'Little goal general.', 417.65, 2687, 19, 
            605.67, 581, 25, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (776,'00776','FitnessChallenge Family Exercise Game', 'P', 'Police statement compare.', 252.03, 314, 5, 
            369.19, 345, 76, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (777,'00777','PinballWizard Arcade Machine', 'P', 'Whom role star degree fast issue assume dog.', 380.6, 2866, 4, 
            492.6, 714, 47, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (778,'00778','DeepDive Submersible Toy Set', 'P', 'Politics research from top ever.', 23.81, 946, 5, 
            26.89, 769, 10, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (779,'00779','Knight’s Castle Popup Playhouse', 'P', 'Television really population professional political.', 394.91, 2161, 11, 
            441.08, 124, 16, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (780,'00780','SoccerStar Football Training Kit', 'P', 'Choice voice fund standard easy hot.', 365.75, 1669, 17, 
            524.82, 271, 61, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (781,'00781','RockStar Guitar and Amp Set', 'P', 'Director both garden how five.', 455.12, 706, 6, 
            509.75, 818, 79, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (782,'00782','StuntScooter Pro Edition', 'P', 'Wrong foot address building option.', 81.75, 1793, 2, 
            106.03, 68, 37, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (783,'00783','YogaBuddies Interactive Exercise Mat', 'P', 'Do field by imagine six tell.', 142.74, 2323, 3, 
            202.43, 25, 53, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (784,'00784','TopChef Cooking Challenge Game', 'P', 'Land concern part adult heavy.', 253.98, 169, 6, 
            355.95, 621, 37, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (785,'00785','PeacefulGarden Zen Gardening Kit', 'P', 'Risk in ready choice.', 345.72, 152, 14, 
            447.28, 25, 29, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (786,'00786','DazzleDress Designer Fashion Kit', 'P', 'Interview magazine take because health partner that bed.', 253.8, 269, 14, 
            308.88, 427, 59, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (787,'00787','MythosQuest Board Game of Legends', 'P', 'Read feeling range both officer food already.', 39.84, 198, 6, 
            48.84, 27, 31, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (788,'00788','IQBuilder Brain Teaser Puzzle Set', 'P', 'Majority class really couple daughter north war reflect.', 319.9, 46, 12, 
            396.66, 560, 80, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (789,'00789','StarCommander Space Station Toy', 'P', 'Open town gas thing cause hit.', 222.71, 1991, 9, 
            290.59, 522, 38, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (790,'00790','BeatTheClock Time Management Game', 'P', 'Western million people.', 9.29, 1382, 12, 
            11.13, 25, 32, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (791,'00791','AquaFun Pool and Water Toys', 'P', 'Pay whose operation would morning.', 92.37, 227, 10, 
            127.02, 780, 72, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (792,'00792','MysteryMansion Clue-Finding Board Game', 'P', 'However fall learn argue discussion.', 41.68, 346, 18, 
            53.97, 359, 56, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (793,'00793','JewelQuest Gem Mining Kit', 'P', 'Finally month kind end list worry man.', 21.77, 665, 2, 
            26.51, 856, 73, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (794,'00794','CircuitRacer Electric Go-Kart', 'P', 'Develop contain you that stuff want.', 34.99, 2936, 4, 
            46.49, 545, 11, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (795,'00795','DroneLeague Competitive Racing Set', 'P', 'Significant line one finish though along human.', 473.15, 30, 12, 
            577.78, 89, 62, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (796,'00796','TinyTown Miniature Village Builder', 'P', 'Matter material concern stand report participant rich.', 34.97, 278, 20, 
            42.06, 282, 51, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (797,'00797','MindBenders Advanced Riddle Game', 'P', 'Could stock perform summer such wall.', 138.64, 1669, 20, 
            171.93, 803, 39, 8);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (798,'00798','AeroSwift Soccer Cleats', 'P', 'Fact apply act citizen opportunity.', 243.58, 2723, 9, 
            342.76, 516, 14, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (799,'00799','StrikeZone Baseball Mitt', 'P', 'Usually career fly street anyone.', 213.36, 1046, 13, 
            243.58, 340, 89, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (800,'00800','Marathon Elite Running Shoes', 'P', 'Western part degree daughter international.', 42.89, 2975, 20, 
            59.73, 842, 25, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (801,'00801','TriAthlete Waterproof Smartwatch', 'P', 'Various animal fish onto big.', 361.97, 1602, 6, 
            494.55, 217, 13, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (802,'00802','PeakPerformance Hiking Backpack', 'P', 'Gun surface expect kitchen.', 227.92, 2270, 5, 
            288.26, 401, 93, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (803,'00803','PowerDrive Golf Clubs Set', 'P', 'Baby organization detail decide run discover opportunity.', 131.87, 391, 15, 
            169.09, 124, 54, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (804,'00804','Cyclone Carbon Road Bike', 'P', 'Third development staff teach piece trip raise.', 185.07, 43, 10, 
            263.22, 119, 18, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (805,'00805','WaveMaster Surfboard', 'P', 'Already high court site maybe.', 308.11, 2164, 11, 
            395.44, 526, 43, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (806,'00806','MountainRanger Climbing Harness', 'P', 'Where these wall.', 180.55, 2446, 16, 
            231.38, 467, 48, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (807,'00807','Gladiator Gymnastics Leotard', 'P', 'Population figure game realize.', 415.13, 2962, 8, 
            523.08, 460, 46, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (808,'00808','SpeedRacer Cycling Jersey', 'P', 'Impact stand relate go spring student enough.', 150.11, 1512, 20, 
            171.08, 786, 71, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (809,'00809','Endurance Pro Trekking Poles', 'P', 'Little enough start employee suffer despite measure.', 153.64, 80, 17, 
            211.56, 9, 64, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (810,'00810','IronGrip Weightlifting Gloves', 'P', 'Kitchen national cell responsibility.', 20.12, 2272, 2, 
            25.07, 73, 33, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (811,'00811','SwiftDive Scuba Gear Set', 'P', 'Source I think interest respond.', 189.08, 2226, 6, 
            232.56, 49, 73, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (812,'00812','ProBaller Basketball Jersey', 'P', 'His structure impact walk response.', 80.24, 39, 9, 
            93.69, 473, 87, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (813,'00813','ThunderBolt Racing Swimsuit', 'P', 'Suggest father account positive its single.', 358.84, 2398, 17, 
            514.91, 770, 63, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (814,'00814','WinterWarrior Ski Goggles', 'P', 'With son none modern age attorney attorney study.', 145.66, 2455, 2, 
            209.17, 671, 28, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (815,'00815','AceServe Tennis Racket', 'P', 'Could method learn campaign baby feel.', 404.34, 688, 14, 
            518.37, 521, 41, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (816,'00816','RhythmicGymnast Ribbon and Stick Set', 'P', 'Meet career reflect watch.', 389.36, 219, 14, 
            545.56, 484, 76, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (817,'00817','VelocityTrack Spikes', 'P', 'Son natural good firm reason customer.', 51.37, 314, 2, 
            63.37, 561, 20, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (818,'00818','FlexBalance Yoga Mat', 'P', 'Knowledge soldier team work factor fire.', 76.36, 2844, 19, 
            85.36, 166, 40, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (819,'00819','OceanWave Kayak', 'P', 'Thank woman join however operation want.', 474.56, 2376, 20, 
            692.2, 133, 84, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (820,'00820','SprintMaster Stopwatch', 'P', 'Left blue travel federal beat.', 186.28, 864, 10, 
            262.63, 990, 68, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (821,'00821','AlpineExplorer Snowshoes', 'P', 'Kid five style task.', 312.32, 277, 18, 
            450.96, 214, 77, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (822,'00822','AquaHydro Swim Cap', 'P', 'Civil forward describe night person two already.', 260.91, 981, 7, 
            332.04, 670, 68, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (823,'00823','EagleEye Archery Bow', 'P', 'American travel relationship church ten policy respond.', 187.83, 216, 9, 
            229.75, 0, 61, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (824,'00824','PrecisionPutt Golfing Laser Guide', 'P', 'Class like school speech treat color image.', 189.23, 673, 14, 
            249.4, 66, 72, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (825,'00825','CombatFit MMA Training Gloves', 'P', 'Create usually dark there fine effort.', 106.97, 1635, 5, 
            136.57, 611, 91, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (826,'00826','CardioPulse Heart Rate Monitor', 'P', 'Action understand report democratic majority fight interest other.', 389.96, 2522, 3, 
            511.43, 382, 78, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (827,'00827','ProPitch Baseball Bat', 'P', 'Turn price reflect improve pay.', 374.33, 781, 10, 
            416.71, 372, 88, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (828,'00828','DiamondCut Softball Cleats', 'P', 'Pass value worry smile Mr.', 329.56, 749, 14, 
            455.56, 922, 87, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (829,'00829','SportEssentials Athletic Socks', 'P', 'Look type lot.', 207.03, 179, 18, 
            251.78, 839, 99, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (830,'00830','SkyJump Parachute Pack', 'P', 'Money why reason.', 270.08, 103, 17, 
            391.49, 9, 62, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (831,'00831','EasyRide Unicycle', 'P', 'Myself foot stock.', 177.84, 1139, 11, 
            228.81, 696, 90, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (832,'00832','CoolVent Breathable Running Cap', 'P', 'Voice long fact strong mind election.', 470.29, 812, 5, 
            583.23, 984, 33, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (833,'00833','WaveRider Bodyboard', 'P', 'Little anyone teacher lot present page discussion.', 322.7, 774, 18, 
            442.9, 208, 51, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (834,'00834','SwiftKick Football Boots', 'P', 'Special student conference discuss include drive already.', 494.28, 1779, 6, 
            619.71, 927, 100, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (835,'00835','Vortex Disc Golf Set', 'P', 'Adult state step relate leg give low reach.', 418.14, 869, 14, 
            519.71, 889, 17, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (836,'00836','UltraMesh Vented Fishing Vest', 'P', 'Career most decision teach.', 303.02, 2400, 20, 
            342.96, 642, 45, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (837,'00837','FreeClimb Carabiner Set', 'P', 'Option feel nature memory hold but.', 13.33, 56, 14, 
            16.82, 224, 18, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (838,'00838','GymnastFlex Stretching Strap', 'P', 'Early idea feeling happy floor behavior smile.', 337.31, 1256, 4, 
            504.36, 233, 95, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (839,'00839','PowerPunch Boxing Bag', 'P', 'Fund religious relationship phone occur.', 292.71, 2963, 7, 
            353.89, 562, 70, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (840,'00840','SwiftFlow Rower Machine', 'P', 'Once interview candidate success while difficult book.', 318.33, 2080, 10, 
            439.49, 838, 21, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (841,'00841','ToughTrail Camouflage Hunting Apparel', 'P', 'Rule camera avoid house body eight performance.', 61.67, 2722, 18, 
            80.08, 285, 37, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (842,'00842','AeroDynamic Frisbee', 'P', 'Agency push change claim education kid account democratic.', 68.2, 1779, 2, 
            96.69, 584, 22, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (843,'00843','LuckyStrike Bowling Ball', 'P', 'Season throw guy major.', 239.86, 113, 2, 
            302.92, 822, 21, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (844,'00844','IceBlade Figure Skates', 'P', 'Deal general ahead TV own whole relationship customer.', 370.34, 2368, 8, 
            502.36, 728, 62, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (845,'00845','StealthMode Hunting Blind', 'P', 'Type city mind.', 226.66, 121, 5, 
            338.13, 127, 60, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (846,'00846','Barricade Shin Guards', 'P', 'Money whose sure success against if Mr.', 81.31, 761, 14, 
            91.37, 901, 79, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (847,'00847','ThriveFit Multi-Grip Pull-up Bar', 'P', 'Environmental science know.', 63.09, 2226, 16, 
            79.46, 482, 90, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (848,'00848','FitnessGuard Compression Sleeve', 'P', 'Pass hair question return ever high magazine.', 414.35, 745, 14, 
            531.55, 653, 78, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (849,'00849','ProCast Fishing Rod', 'P', 'Speech else firm around case run rule.', 163.81, 921, 6, 
            218.01, 96, 75, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (850,'00850','TopSpin Ping Pong Paddle Set', 'P', 'Time collection marriage vote at political while.', 47.02, 793, 7, 
            58.89, 960, 40, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (851,'00851','ClearPath Golf Cart GPS Holder', 'P', 'Significant yet fall list.', 420.05, 666, 13, 
            499.7, 975, 72, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (852,'00852','SmoothSailor Wind Surf Sail', 'P', 'Lawyer traditional herself home field professional.', 458.61, 1895, 3, 
            597.01, 545, 55, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (853,'00853','StrikeForce Krav Maga Belt', 'P', 'Short rich traditional court almost local.', 185.98, 1329, 10, 
            275.04, 824, 50, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (854,'00854','QuantumQuiver Archery Quiver', 'P', 'Five fire later analysis.', 206.36, 1942, 17, 
            231.37, 881, 69, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (855,'00855','Zenith Hockey Stick', 'P', 'Else everything through resource.', 54.84, 1437, 7, 
            80.33, 76, 62, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (856,'00856','GripLock Dumbbells', 'P', 'Bag size year attention.', 125.13, 2479, 4, 
            149.33, 513, 55, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (857,'00857','FastLane Swimmer’s Snorkel', 'P', 'Task Mrs support grow article maybe assume.', 131.35, 1540, 11, 
            191.34, 868, 36, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (858,'00858','EliteTackle Fishing Tackle Box', 'P', 'Improve government easy.', 489.09, 933, 10, 
            544.75, 96, 10, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (859,'00859','SportySpice Cheerleading Pom Poms', 'P', 'Tend federal animal.', 239.48, 235, 19, 
            278.3, 895, 68, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (860,'00860','TrailBlazer Mountain Biking Shorts', 'P', 'Though around east throw common without.', 459.02, 1298, 7, 
            604.98, 566, 59, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (861,'00861','PivotDance Ballet Shoes', 'P', 'Cell girl perhaps focus trial.', 225.13, 1228, 12, 
            270.62, 478, 14, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (862,'00862','SkySoar Paraglider', 'P', 'Media offer anyone available nature test management.', 167.57, 2759, 8, 
            241.51, 503, 40, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (863,'00863','RapidFire Softball Pitching Machine', 'P', 'Travel item sing.', 140.94, 1027, 11, 
            172.46, 585, 99, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (864,'00864','EdgeGuard Fencing Foil', 'P', 'Mouth although American of.', 16.23, 2743, 9, 
            23.59, 13, 82, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (865,'00865','GripMaster Climbing Chalk Bag', 'P', 'Success plan red rise maintain.', 82.33, 443, 3, 
            115.22, 173, 87, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (866,'00866','PowerLift Squat Rack', 'P', 'Rise set financial new.', 121.88, 2135, 15, 
            154.97, 0, 13, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (867,'00867','SwiftMove Dance Tights', 'P', 'Establish idea start financial bed bag tell.', 244.56, 22, 13, 
            362.89, 706, 83, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (868,'00868','StrikeKing Muay Thai Pads', 'P', 'Conference region single benefit.', 385.92, 977, 19, 
            490.24, 213, 48, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (869,'00869','TurboTwist Jump Rope', 'P', 'Could structure child move assume young can.', 113.11, 1925, 8, 
            154.62, 979, 83, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (870,'00870','DiamondDazzle Gymnastics Mats', 'P', 'Base card Republican subject public role.', 213.55, 2748, 14, 
            299.92, 625, 16, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (871,'00871','SilentStrike Hunting Boots', 'P', 'Off good probably several over old.', 340.73, 1763, 3, 
            495.63, 288, 23, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (872,'00872','CourtCommander Tennis Ball Machine', 'P', 'Involve few medical suggest say floor.', 91.32, 1381, 5, 
            125.76, 156, 37, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (873,'00873','GrandSlam Baseball Caps', 'P', 'Bit staff court market thus reason story.', 171.99, 716, 3, 
            216.83, 203, 87, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (874,'00874','Bullseye Dartboard', 'P', 'Add close style want behavior teacher station.', 314.93, 1906, 12, 
            446.06, 826, 79, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (875,'00875','GoalKeeper Soccer Net', 'P', 'Nearly doctor authority moment.', 206.1, 600, 9, 
            247.5, 258, 19, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (876,'00876','RallyTrack Rally Car Helmet', 'P', 'Produce hot decide drop.', 84.36, 768, 8, 
            100.4, 614, 100, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (877,'00877','SwiftSail Sailing Gloves', 'P', 'Method mention relate company later identify least realize.', 453.14, 415, 15, 
            548.03, 574, 44, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (878,'00878','CrossCountry Nordic Ski Poles', 'P', 'Box save brother.', 262.23, 2155, 11, 
            389.43, 265, 14, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (879,'00879','WaveRipper Jet Ski Life Vest', 'P', 'Next daughter summer among memory money.', 323.52, 681, 20, 
            382.52, 614, 57, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (880,'00880','IronWill Kettlebells', 'P', 'Threat professional wide military ever take.', 148.01, 743, 8, 
            194.15, 840, 57, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (881,'00881','FlightPath Badminton Shuttlecocks', 'P', 'Else sing police ago hot.', 78.79, 400, 9, 
            112.22, 421, 42, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (882,'00882','TargetMaster Biathlon Rifle', 'P', 'Land middle cultural cut.', 14.41, 2059, 14, 
            20.91, 466, 90, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (883,'00883','CoreCruncher Ab Wheel', 'P', 'Heavy century race everything line account thus.', 13.87, 46, 20, 
            17.15, 228, 41, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (884,'00884','ProStride Skating Tights', 'P', 'Make pay expect probably old his TV ok.', 75.67, 1327, 19, 
            91.65, 641, 78, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (885,'00885','AquaStream Water Polo Ball', 'P', 'Job ago media total current international blue hot.', 435.35, 972, 10, 
            512.44, 633, 65, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (886,'00886','SwiftServe Volleyball', 'P', 'Fast hospital remember.', 197.28, 99, 15, 
            249.34, 59, 58, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (887,'00887','EnduroPack Triathlon Transition Bag', 'P', 'Low pattern painting team out.', 203.88, 23, 20, 
            295.64, 198, 66, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (888,'00888','SpinCycle Indoor Cycling Bike', 'P', 'Wrong although consumer possible including officer window raise.', 497.16, 192, 17, 
            606.23, 963, 68, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (889,'00889','IceGuard Hockey Pads', 'P', 'Watch interest ability including however.', 73.47, 1608, 11, 
            86.46, 384, 44, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (890,'00890','AlpinePro Ski Jacket', 'P', 'According consider hundred.', 403.83, 995, 8, 
            602.66, 60, 71, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (891,'00891','RapidRally Racquetball Racket', 'P', 'Institution bring despite project tree author.', 470.2, 174, 15, 
            573.13, 208, 61, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (892,'00892','StrikeOut Softball Helmet', 'P', 'Both research we.', 121.9, 507, 6, 
            146.64, 749, 32, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (893,'00893','MatchPoint Squash Racket', 'P', 'Property us enough car prove when.', 291.97, 1106, 20, 
            437.39, 337, 83, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (894,'00894','LungeLine Equestrian Riding Crop', 'P', 'Note somebody our should my none.', 134.45, 2842, 9, 
            164.59, 472, 19, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (895,'00895','TacklePro Football Shoulder Pads', 'P', 'On two compare fight father first right.', 441.83, 1793, 13, 
            492.29, 702, 85, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (896,'00896','ExtremeGrip Climbing Shoes', 'P', 'Already consider stop to.', 107.83, 1553, 18, 
            123.77, 1, 33, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (897,'00897','MarathonHydra Hydration Vest', 'P', 'Exactly return actually teach gas what.', 221.82, 2280, 15, 
            276.23, 705, 35, 9);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (898,'00898','EpicQuest Fantasy Novel Series', 'P', 'Site despite daughter learn sense moment foot area.', 112.85, 231, 14, 
            140.56, 166, 69, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (899,'00899','The Daily Grind Coffee Table Magazine', 'P', 'Account box myself light road total.', 119.03, 1625, 3, 
            165.61, 418, 20, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (900,'00900','TechTrends IT and Innovation Magazine', 'P', 'Official cut through media tough force.', 237.5, 288, 15, 
            352.45, 317, 59, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (901,'00901','Skyline Gel Ink Pens - 12 Pack', 'P', 'Once be national various.', 87.12, 807, 4, 
            107.82, 434, 51, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (902,'00902','Timeless Leather-Bound Journal', 'P', 'There paper both leave.', 367.99, 284, 8, 
            404.92, 947, 94, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (903,'00903','Inspirations Art Sketchbook', 'P', 'Enter economy likely whole.', 141.59, 1249, 14, 
            203.04, 546, 10, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (904,'00904','Galactic Adventures Sci-Fi Anthology', 'P', 'Available husband pay such decide kind growth.', 47.73, 140, 20, 
            53.33, 843, 71, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (905,'00905','Mindful Living Wellness Magazine', 'P', 'Fine usually town north century people finish.', 470.86, 683, 17, 
            676.38, 595, 62, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (906,'00906','Precision Drafting Mechanical Pencil Set', 'P', 'Tough seven such manager learn sense especially.', 37.77, 203, 5, 
            45.95, 374, 36, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (907,'00907','Executive Monogrammed Stationery Set', 'P', 'News about work.', 286.58, 2806, 6, 
            401.92, 300, 76, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (908,'00908','Zen Garden Adult Coloring Book', 'P', 'Can service laugh ago part everything huge.', 249.96, 2122, 3, 
            281.17, 686, 96, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (909,'00909','OrganizePro Desk Planner', 'P', 'Single Congress imagine.', 136.56, 2045, 7, 
            174.82, 46, 32, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (910,'00910','HighGloss Fashion Magazine', 'P', 'Skin example much bill whose example design.', 100.44, 2866, 8, 
            137.18, 240, 13, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (911,'00911','SmoothScribe Fountain Pens', 'P', 'Through hotel resource yeah themselves deep.', 249.47, 2122, 19, 
            306.39, 490, 46, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (912,'00912','DigiMark Digital Highlighters', 'P', 'Too may political from establish.', 354.15, 2306, 15, 
            481.12, 6, 74, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (913,'00913','EcoNote Recycled Notebooks - 5 Pack', 'P', 'Start song hand receive to respond.', 95.1, 716, 10, 
            134.08, 74, 44, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (914,'00914','The Cookbook Digest Quarterly Magazine', 'P', 'Attention how involve.', 443.28, 196, 15, 
            600.78, 137, 79, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (915,'00915','UltimateOffice All-in-One Desk Organizer', 'P', 'Through however sell box writer avoid size.', 227.99, 1476, 5, 
            275.42, 764, 96, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (916,'00916','BrushStroke Watercolor Pad', 'P', 'Fund leader degree sure yet.', 391.73, 2441, 20, 
            526.07, 102, 36, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (917,'00917','SecretSpine Book Safe', 'P', 'Choice economic relationship must class few.', 402.35, 2987, 18, 
            456.31, 860, 69, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (918,'00918','CreativeCrafts Scrapbooking Essentials', 'P', 'Find in each apply open.', 99.46, 773, 17, 
            128.91, 821, 36, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (919,'00919','PowerPort USB Desk Hub', 'P', 'For thought air green all newspaper this.', 92.23, 56, 2, 
            119.8, 187, 45, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (920,'00920','Visionary Business Leaders Biographies', 'P', 'Hold finally food face commercial.', 492.92, 216, 7, 
            633.03, 474, 59, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (921,'00921','SharpLook Professional Presentation Folders', 'P', 'Language attack simple city bring agent player.', 73.17, 272, 18, 
            97.78, 858, 71, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (922,'00922','Crafters'' Companion DIY Magazine', 'P', 'Million experience lot public pattern of left.', 15.82, 1958, 4, 
            21.46, 599, 94, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (923,'00923','StickyNote Spectrum Collection', 'P', 'Structure anything high some site build type.', 347.43, 437, 18, 
            421.79, 929, 18, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (924,'00924','Elite Writers Classic Literature Series', 'P', 'Job argue main human.', 432.96, 2344, 20, 
            550.45, 674, 88, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (925,'00925','Harmony Yoga and Lifestyle Magazine', 'P', 'Likely student often we finish provide.', 231.08, 899, 6, 
            302.81, 346, 73, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (926,'00926','VibrantVisions Colored Pencils - 24 Count', 'P', 'Defense keep example throw at beyond.', 196.6, 2573, 9, 
            290.42, 973, 75, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (927,'00927','Quantum Physics Simplified Reference Book', 'P', 'Participant case same fast win.', 383.81, 2687, 10, 
            499.6, 859, 98, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (928,'00928','TechWiz Office Multi-Tool Pen', 'P', 'Ready difficult when four both customer.', 3.48, 1732, 16, 
            4.61, 932, 99, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (929,'00929','PlanetEarth Environmental Almanac', 'P', 'Amount political magazine above million.', 142.28, 1784, 11, 
            205.12, 522, 15, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (930,'00930','WorldChef Culinary Magazine', 'P', 'Church political believe bed else go lose.', 137.23, 333, 20, 
            202.49, 815, 26, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (931,'00931','Architect''s Choice Drafting Ruler', 'P', 'Customer personal run most a turn bit.', 362.45, 124, 4, 
            417.29, 735, 37, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (932,'00932','CrystalClear Page Magnifier', 'P', 'Region suffer most result.', 406.05, 341, 7, 
            569.81, 535, 52, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (933,'00933','Aromatic Espresso Journal', 'P', 'Industry check argue cut close practice particularly green.', 281.93, 985, 16, 
            350.3, 570, 56, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (934,'00934','TranquilSounds Music Therapy Magazine', 'P', 'Final close himself church now particularly ball turn.', 234.97, 716, 9, 
            344.49, 996, 66, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (935,'00935','LaserPrecision Cut Scissors', 'P', 'Site field real rise mean move nor.', 201.63, 289, 16, 
            222.98, 519, 19, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (936,'00936','ModernHomes Interior Design Magazine', 'P', 'Share share staff moment she century measure.', 211.67, 868, 5, 
            279.92, 69, 84, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (937,'00937','SpaceTech Telescopic Pointer', 'P', 'Firm true entire budget team add mission.', 480.16, 2299, 17, 
            579.81, 5, 41, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (938,'00938','Vintage Vellum Writing Paper', 'P', 'Common seek government military evening without apply.', 408.95, 652, 14, 
            586.46, 591, 44, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (939,'00939','Boundless Creativity Sticker Pack', 'P', 'Century significant population certain.', 412.37, 1047, 10, 
            530.55, 587, 85, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (940,'00940','BudgetBoss Financial Planning Workbook', 'P', 'Bag agree condition world section American action.', 419.97, 777, 17, 
            605.7, 536, 22, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (941,'00941','CineFilm Movie Critics Journal', 'P', 'Popular job huge red three must.', 125.58, 969, 5, 
            185.53, 558, 38, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (942,'00942','EcoBind Biodegradable Binder', 'P', 'Hundred play analysis wonder view.', 194.14, 578, 13, 
            282.84, 319, 86, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (943,'00943','Mythical Tales Graphic Novel', 'P', 'Same way nothing specific before.', 230.28, 104, 20, 
            272.78, 248, 43, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (944,'00944','GlobalGourmet Food & Wine Magazine', 'P', 'White manager hospital.', 232.83, 222, 7, 
            286.75, 250, 86, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (945,'00945','ClipCatch Magnetic Paperclip Holder', 'P', 'Into space image already.', 404.99, 288, 9, 
            500.35, 228, 29, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (946,'00946','Vibrance High Pigment Markers', 'P', 'Know theory center back work indicate.', 325.17, 1616, 12, 
            465.15, 263, 59, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (947,'00947','EasyFile Tabbed Dividers', 'P', 'Go should long seek.', 402.44, 1038, 20, 
            557.94, 811, 36, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (948,'00948','SmoothLines Calligraphy Set', 'P', 'Land billion positive answer page health others.', 278.75, 905, 15, 
            328.46, 411, 45, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (949,'00949','Coding for Kids Interactive Workbook', 'P', 'Feel natural move too production although.', 490.16, 383, 17, 
            611.51, 586, 88, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (950,'00950','History in Pictures Documentary Magazine', 'P', 'Million concern possible interest.', 189.75, 1455, 10, 
            222.73, 417, 20, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (951,'00951','VersaTab Reusable Dry Erase Tabs', 'P', 'Activity night home manage get.', 397.23, 92, 2, 
            556.0, 670, 61, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (952,'00952','Artisanal Breads Cookbook', 'P', 'Claim finally edge pattern.', 281.13, 2677, 14, 
            381.79, 58, 46, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (953,'00953','Snapshot Photo Album', 'P', 'Thing pull rather.', 69.59, 193, 19, 
            93.51, 229, 35, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (954,'00954','FitnessForAll Exercise Guide Book', 'P', 'Get heart class although news first.', 459.0, 878, 16, 
            608.4, 220, 56, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (955,'00955','HeavyDuty Stapler with Staples Set', 'P', 'Admit water respond although.', 326.31, 272, 19, 
            424.19, 393, 93, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (956,'00956','AquaInk Watercolor Brush Pens', 'P', 'Last case join attorney provide just state.', 381.53, 1339, 7, 
            539.53, 133, 50, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (957,'00957','The Aromatherapy Guide Magazine', 'P', 'Fight offer condition reach trouble list save same.', 496.56, 575, 15, 
            660.63, 482, 44, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (958,'00958','Pocket Protector Classic Set', 'P', 'Police television certainly player take.', 346.76, 249, 2, 
            504.64, 165, 38, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (959,'00959','Cultures of the World Travel Magazine', 'P', 'Improve how place continue physical message good.', 339.79, 2056, 15, 
            504.8, 232, 49, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (960,'00960','Floral Fantasy Weekly Planner', 'P', 'Standard tell cultural girl.', 264.38, 43, 4, 
            358.49, 709, 60, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (961,'00961','TravelTales Adventure Journal', 'P', 'Movie not good want report just strong.', 137.99, 352, 19, 
            171.94, 218, 40, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (962,'00962','LushPlants Gardening Magazine', 'P', 'Natural above hotel.', 254.14, 2553, 20, 
            314.46, 271, 21, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (963,'00963','QuickDry Gel Highlighters', 'P', 'Yard page particular wish population try control these.', 405.43, 2796, 16, 
            593.03, 712, 85, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (964,'00964','Retro Vinyl Record Notebook', 'P', 'Measure too society offer individual challenge.', 90.77, 682, 8, 
            100.88, 207, 49, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (965,'00965','ChicStyles Fashion Designer Sketch Pad', 'P', 'Protect response man report difficult cover sit.', 236.69, 2243, 6, 
            347.42, 859, 21, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (966,'00966','Deluxe Drafting Compass Kit', 'P', 'Local conference whom when sport.', 480.1, 2812, 14, 
            677.16, 519, 31, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (967,'00967','Classic Cinema Poster Postcards', 'P', 'Apply final student over despite why short.', 460.21, 72, 15, 
            628.16, 638, 69, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (968,'00968','ClearView Document Sleeves', 'P', 'Per glass song get large TV then.', 105.2, 2971, 8, 
            145.23, 955, 80, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (969,'00969','SelfCare Health and Beauty Magazine', 'P', 'Tv cell inside until big practice spend if.', 323.73, 1211, 4, 
            438.99, 78, 26, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (970,'00970','ProPainter Acrylic Paint Set', 'P', 'Low officer check war.', 165.21, 1001, 4, 
            246.18, 792, 88, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (971,'00971','OfficeErgo Lumbar Support Cushion', 'P', 'Language full we important change situation.', 352.05, 1906, 4, 
            422.23, 887, 24, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (972,'00972','Astrology and Stars Magazine', 'P', 'Like even thus he piece.', 133.79, 913, 19, 
            164.03, 604, 41, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (973,'00973','MiniMind Sudoku Puzzle Book', 'P', 'Environment guy only its field today perform.', 155.1, 812, 5, 
            207.01, 52, 81, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (974,'00974','SheerElegance Letter Opener', 'P', 'Between light world class nothing.', 223.65, 1760, 16, 
            300.66, 383, 35, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (975,'00975','GreenGrow Organic Gardening Guide', 'P', 'Fly though four manager.', 410.45, 531, 15, 
            537.61, 745, 56, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (976,'00976','OceanBlue Personalized Stationery', 'P', 'Beat either artist fly understand.', 38.07, 1476, 19, 
            46.27, 203, 69, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (977,'00977','DIY Decor Home Improvement Magazine', 'P', 'Evidence agree direction true others us born.', 10.78, 687, 13, 
            15.93, 183, 54, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (978,'00978','MightyAdhesive Glue Stick Duo', 'P', 'She dark manage property while middle section day.', 401.91, 781, 19, 
            595.32, 683, 87, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (979,'00979','Writable CD Label Kit', 'P', 'Each happy firm mean reach final.', 379.73, 975, 5, 
            477.14, 8, 45, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (980,'00980','Kids'' Craft Corner Magazine', 'P', 'Bank similar the bring organization.', 406.76, 1075, 3, 
            590.51, 573, 20, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (981,'00981','Executive Planner Leather Folio', 'P', 'Quickly each upon debate understand.', 231.81, 1455, 19, 
            271.8, 913, 53, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (982,'00982','Deluxe Desktop Calculator', 'P', 'Country position change.', 484.76, 106, 10, 
            700.31, 984, 63, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (983,'00983','Rainbow Roll Washi Tape Set', 'P', 'Trial voice call after.', 488.68, 2785, 18, 
            651.04, 666, 76, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (984,'00984','SmartEats Nutrition and Diet Book', 'P', 'Military cell learn industry.', 153.55, 2759, 2, 
            170.74, 511, 76, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (985,'00985','Designer Desk Lamp with Dimmer', 'P', 'Very notice sea risk example.', 229.87, 2559, 18, 
            310.46, 183, 49, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (986,'00986','Expandable File Folder with Tabs', 'P', 'Body ability I subject quality within.', 439.84, 835, 6, 
            569.8, 379, 47, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (987,'00987','HomeBrewing Beer Enthusiast Magazine', 'P', 'Safe up accept sing necessary.', 388.5, 183, 3, 
            434.16, 889, 49, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (988,'00988','DocumentGuard Fireproof Safe Bag', 'P', 'Question agent gas wind real maintain institution.', 29.12, 2364, 8, 
            40.99, 723, 95, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (989,'00989','Floral Impressions Greeting Card Set', 'P', 'Though out true military.', 229.23, 23, 11, 
            292.06, 165, 100, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (990,'00990','Desk Zen Garden Kit', 'P', 'Authority again low always free.', 56.93, 677, 20, 
            84.74, 717, 62, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (991,'00991','ArtDeco Premium Pencil Skirt', 'P', 'Then they half human color or professor.', 164.78, 75, 19, 
            191.37, 313, 81, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (992,'00992','OfficeYoga Instructional Poster', 'P', 'Program often together.', 281.33, 363, 10, 
            400.42, 60, 70, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (993,'00993','Infinity Journal with Embossed Cover', 'P', 'Feeling prepare key.', 104.37, 258, 18, 
            139.29, 839, 49, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (994,'00994','MemoryKeeper Scrapbook Album', 'P', 'Mention join early.', 115.31, 760, 6, 
            167.24, 629, 29, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (995,'00995','Pet Lovers'' Digest Magazine', 'P', 'Computer arrive foot base capital rule animal soldier.', 74.01, 500, 17, 
            89.29, 440, 45, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (996,'00996','All-in-One Printer Paper - Ream', 'P', 'Trial source chair produce outside theory.', 279.79, 147, 10, 
            407.78, 413, 12, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (997,'00997','The Thinker''s Sharpener – Premium Pencil Sharpener', 'P', 'Cultural career morning how.', 280.49, 988, 19, 
            349.24, 390, 51, 10);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (998,'00998','CozyNest Memory Foam Mattress', 'P', 'Share religious within record.', 104.68, 847, 19, 
            140.36, 993, 82, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (999,'00999','VintageVogue Wall Mirror', 'P', 'Main check major someone arrive list.', 128.21, 653, 15, 
            147.68, 729, 99, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1000,'01000','UrbanRetreat Leather Recliner', 'P', 'Country friend best both country article experience.', 195.41, 307, 6, 
            248.79, 406, 37, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1001,'01001','Serenity Waterfall Indoor Fountain', 'P', 'Market understand project improve go professor popular now.', 83.39, 659, 11, 
            101.43, 5, 19, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1002,'01002','MysticFlame Aromatherapy Candles', 'P', 'Itself less democratic year society.', 131.29, 1604, 12, 
            194.06, 665, 84, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1003,'01003','PlushPile Shaggy Area Rug', 'P', 'Practice crime want management.', 242.46, 939, 20, 
            335.58, 398, 11, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1004,'01004','LuminaGlow Dimmable Floor Lamp', 'P', 'Course concern defense over.', 481.87, 288, 8, 
            633.09, 352, 93, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1005,'01005','WhisperWeave Blackout Curtains', 'P', 'Knowledge authority section include machine cost else.', 40.38, 391, 9, 
            46.27, 55, 45, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1006,'01006','SleekSpace Modular Sofa', 'P', 'Produce material receive wife answer term court.', 347.22, 2891, 6, 
            445.06, 861, 45, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1007,'01007','HarmonyHues Hand-Painted Vases', 'P', 'Member particularly whom edge you.', 138.59, 639, 13, 
            189.89, 607, 57, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1008,'01008','ZenGarden Faux Bonsai Tree', 'P', 'Try present child quality finish since.', 416.84, 811, 20, 
            514.81, 781, 70, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1009,'01009','PurityCollection Egyptian Cotton Towels', 'P', 'Interest learn none night.', 464.87, 760, 11, 
            560.41, 941, 93, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1010,'01010','ClassicChic Picture Frame Gallery Set', 'P', 'Him article what seem.', 199.54, 479, 4, 
            280.7, 674, 64, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1011,'01011','RusticRealm Barnwood Coffee Table', 'P', 'Lawyer move system far.', 404.48, 669, 8, 
            475.93, 943, 73, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1012,'01012','ModernMosaic Decorative Throw Pillows', 'P', 'Feel certainly back old floor.', 55.58, 1580, 6, 
            76.88, 269, 96, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1013,'01013','ElegantOrchid Silk Flower Arrangement', 'P', 'Husband prevent build major item with paper.', 42.12, 1880, 3, 
            47.78, 236, 14, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1014,'01014','FineFurnish Oak Dining Set', 'P', 'Red describe anyone newspaper stuff.', 103.33, 202, 6, 
            129.39, 149, 78, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1015,'01015','SoftSilhouette Curtain Drapery', 'P', 'Party production newspaper wife tree win save.', 310.57, 1974, 3, 
            385.05, 231, 91, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1016,'01016','SatinSheen Bedspread Set', 'P', 'Mind chance commercial.', 486.43, 2706, 5, 
            729.4, 431, 88, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1017,'01017','OrnateOpulence Crystal Chandelier', 'P', 'Yourself help study term away.', 497.22, 956, 15, 
            621.7, 962, 17, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1018,'01018','HavenLuxe Velvet Accent Chair', 'P', 'Under trip finish month sister before.', 315.74, 411, 19, 
            355.26, 249, 82, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1019,'01019','EnchantedEvening Patio String Lights', 'P', 'Capital past learn through.', 257.48, 91, 12, 
            366.24, 562, 46, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1020,'01020','BlissfulBloom Area Rugs', 'P', 'Sense customer west indeed miss war.', 308.23, 445, 19, 
            416.43, 534, 10, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1021,'01021','TimelessTextile Linen Tablecloth', 'P', 'Leader account home language writer career edge.', 190.05, 835, 12, 
            238.24, 285, 91, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1022,'01022','IronCraftsman Wrought Iron Railings', 'P', 'Economy thought at.', 68.23, 477, 19, 
            89.61, 680, 96, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1023,'01023','DreamWeaver Handmade Tapestry', 'P', 'Recent statement onto final glass here thing soon.', 397.77, 2368, 18, 
            510.87, 943, 80, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1024,'01024','ComfortCradle Rocking Chair', 'P', 'Than least before him reflect.', 153.17, 415, 17, 
            184.3, 712, 29, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1025,'01025','PureAmbiance Essential Oil Diffuser', 'P', 'Before worry into very full.', 142.91, 2962, 6, 
            214.27, 55, 48, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1026,'01026','ArtisanAccents Decorative Wall Plates', 'P', 'Kitchen base minute trade itself consider seem among.', 4.45, 1687, 8, 
            5.42, 206, 22, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1027,'01027','HeritageHome Hardwood Bookcase', 'P', 'Better everybody one stay study cup inside my.', 480.92, 454, 11, 
            604.48, 618, 32, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1028,'01028','TropicBreeze Ceiling Fan', 'P', 'Serious wind particular record.', 93.17, 2084, 10, 
            105.14, 708, 20, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1029,'01029','ScentSational Wax Warmer', 'P', 'Bed contain stop notice treat learn.', 363.86, 1050, 7, 
            459.91, 189, 47, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1030,'01030','InfiniteReflections LED Bathroom Mirror', 'P', 'Rule win for maybe.', 352.41, 596, 19, 
            420.05, 64, 53, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1031,'01031','VibrantVignette Indoor Planters', 'P', 'Onto that decade town value.', 387.37, 834, 18, 
            465.94, 695, 34, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1032,'01032','TranquilTide Wall Art Canvas', 'P', 'Night now treat travel history protect.', 221.28, 169, 10, 
            287.24, 188, 73, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1033,'01033','RusticRose Curtain Tiebacks', 'P', 'Although grow magazine better court social.', 5.31, 879, 7, 
            6.67, 142, 16, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1034,'01034','EliteElegance Crystal Wine Decanter', 'P', 'Phone drive table old compare player arrive wear.', 208.99, 1443, 2, 
            298.01, 862, 89, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1035,'01035','MajesticMantle Electric Fireplace', 'P', 'Face thing oil air father.', 117.57, 1027, 4, 
            166.72, 468, 24, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1036,'01036','SleepSanctuary Deluxe Bed Canopy', 'P', 'Get stage opportunity.', 479.22, 222, 14, 
            658.61, 574, 24, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1037,'01037','NatureNook Corner Plant Stand', 'P', 'Station son job air perhaps wish design.', 397.67, 371, 3, 
            501.81, 729, 83, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1038,'01038','BoldBloom Outdoor Cushions', 'P', 'His her guy movement best job region.', 425.97, 905, 18, 
            597.6, 923, 55, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1039,'01039','CaptivatingCandlesticks Mantel Decor', 'P', 'So always type test reason.', 104.5, 720, 20, 
            126.74, 662, 29, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1040,'01040','GentleGlide Porch Swing', 'P', 'Growth short reveal himself summer.', 208.7, 2423, 11, 
            262.75, 669, 63, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1041,'01041','SummerScent Reed Diffuser Collection', 'P', 'Focus onto international share.', 463.92, 2748, 16, 
            521.67, 764, 68, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1042,'01042','VelvetVault Jewelry Box', 'P', 'Drug space look next.', 372.26, 343, 6, 
            470.42, 66, 77, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1043,'01043','RoyalRepose Tufted Headboard', 'P', 'Here save you foot trip save raise of.', 495.56, 788, 2, 
            658.04, 148, 74, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1044,'01044','LushLattice Garden Trellis', 'P', 'Office program send more world religious.', 333.34, 841, 5, 
            491.24, 438, 99, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1045,'01045','GalleryGlow Picture Light', 'P', 'Pressure walk wide detail.', 82.88, 917, 4, 
            101.14, 356, 13, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1046,'01046','Impressions Vanity Stool', 'P', 'Avoid industry knowledge more.', 142.9, 2180, 7, 
            175.25, 407, 38, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1047,'01047','ChevronCharm Knitted Throw Blanket', 'P', 'Player challenge sister even within page reality.', 313.13, 272, 6, 
            410.5, 868, 67, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1048,'01048','WillowWisps Hanging Lanterns', 'P', 'At leg world family.', 348.84, 43, 7, 
            404.2, 896, 84, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1049,'01049','ClassicContours Crown Molding', 'P', 'Service fly Congress husband talk.', 428.8, 617, 16, 
            523.8, 99, 19, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1050,'01050','SculptedSerenity Garden Statue', 'P', 'Budget television of action deep news.', 97.23, 793, 3, 
            144.35, 740, 66, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1051,'01051','DivineDrapes Embroidered Window Treatments', 'P', 'Song fish skill cell information wind base.', 222.59, 239, 10, 
            255.06, 711, 19, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1052,'01052','PlacidPond Tabletop Water Feature', 'P', 'Positive situation tell effect simply vote.', 217.49, 1929, 9, 
            277.59, 434, 70, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1053,'01053','UrbanElegance Industrial Shelving Unit', 'P', 'Money meet area talk seat.', 45.43, 1788, 12, 
            52.73, 977, 90, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1054,'01054','MorningGlory Bedroom Curtains', 'P', 'Current yourself myself away.', 48.58, 788, 17, 
            56.86, 403, 93, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1055,'01055','Hearthside Fireplace Tool Set', 'P', 'Number almost college can computer report business.', 202.28, 720, 19, 
            266.81, 808, 88, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1056,'01056','Organique Bamboo Bath Mat', 'P', 'Read close board the try if.', 114.91, 815, 17, 
            129.26, 200, 100, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1057,'01057','NauticalNest Coastal Wall Decor', 'P', 'Approach time my article.', 221.85, 601, 2, 
            280.17, 890, 70, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1058,'01058','Enigma Abstract Sculpture', 'P', 'Fine evidence less heart thousand American.', 92.83, 1594, 11, 
            127.44, 30, 48, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1059,'01059','CozyComforts Heated Throw Blanket', 'P', 'Hundred article it interesting.', 59.7, 686, 12, 
            77.27, 118, 17, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1060,'01060','GlitterGlam Makeup Organizer', 'P', 'Boy adult couple contain security.', 204.44, 777, 2, 
            234.18, 995, 28, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1061,'01061','WarmWhispers Tabletop Fireplace', 'P', 'Expert system risk summer decide time town school.', 370.98, 2812, 7, 
            475.73, 678, 56, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1062,'01062','ContourComfort Adjustable Desk Chair', 'P', 'Today speech response work.', 326.85, 653, 9, 
            448.82, 931, 39, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1063,'01063','SplendidSpire Candle Holder', 'P', 'Energy choose budget whose accept happen goal easy.', 190.98, 773, 17, 
            271.46, 383, 60, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1064,'01064','MoonlitMeadow Wall Murals', 'P', 'Cultural production car experience yet.', 265.66, 382, 17, 
            318.65, 200, 78, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1065,'01065','AntiqueAlcove Vintage Trunk', 'P', 'Catch side apply they here contain mouth religious.', 417.17, 575, 4, 
            527.9, 396, 70, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1066,'01066','SkylineSilhouettes Cityscape Decals', 'P', 'Never job movement building.', 215.67, 2969, 8, 
            260.99, 936, 49, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1067,'01067','PrismPlay Light-Reflecting Window Film', 'P', 'Participant low foot stay.', 59.98, 465, 9, 
            81.63, 815, 72, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1068,'01068','HearthHaven Plush Pet Bed', 'P', 'Plant shake book happy matter say have.', 248.32, 687, 6, 
            342.61, 418, 74, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1069,'01069','LuminousLanterns Moroccan-Style Lights', 'P', 'Almost conference last record quickly event institution dream.', 330.54, 844, 5, 
            392.19, 891, 92, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1070,'01070','GrandGallery Wall Shelves', 'P', 'Especially pass five each.', 434.29, 2306, 5, 
            547.94, 14, 17, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1071,'01071','SunsetShores Beachy Framed Art', 'P', 'Condition chair chance near assume your image positive.', 405.01, 558, 9, 
            483.13, 860, 57, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1072,'01072','TactileTreasures Textured Wallpaper', 'P', 'Say any rather whose now wall.', 276.52, 2273, 13, 
            352.37, 70, 88, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1073,'01073','BreezyBungalow Hammock with Stand', 'P', 'Career appear safe eye discover school represent.', 221.98, 1129, 4, 
            323.51, 759, 25, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1074,'01074','DreamyDelight Nightstand', 'P', 'Simply begin note give they only newspaper.', 99.05, 443, 10, 
            122.97, 681, 17, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1075,'01075','VibrantVista Curtains in Ombre', 'P', 'Film southern kitchen hotel air.', 397.74, 730, 7, 
            563.12, 61, 98, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1076,'01076','BotanicalBliss Duvet Cover Set', 'P', 'Laugh fear job politics lose physical hour.', 322.07, 1050, 8, 
            445.24, 426, 38, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1077,'01077','CrescentMoon Wall Shelf', 'P', 'Difference exactly service series than list material.', 179.04, 1001, 4, 
            252.51, 798, 23, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1078,'01078','OrnamentalOasis Outdoor Rugs', 'P', 'Physical indeed international effect.', 310.59, 663, 19, 
            383.3, 182, 76, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1079,'01079','SecretGarden Metal Wall Trellis', 'P', 'Away heavy door argue.', 361.81, 407, 20, 
            461.73, 238, 53, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1080,'01080','ZenithPeak Hammock Chair', 'P', 'Challenge range sing keep size investment visit including.', 128.97, 811, 14, 
            180.46, 778, 44, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1081,'01081','WhisperingWillow Wind Chimes', 'P', 'Place table lead east one.', 108.23, 1317, 4, 
            133.08, 870, 88, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1082,'01082','PoshPouf Ottoman', 'P', 'Onto while candidate gas enter.', 416.82, 629, 5, 
            567.02, 490, 11, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1083,'01083','StellarSpace Star Projector', 'P', 'Ago around never door policy career relate bad.', 352.36, 1265, 19, 
            492.64, 268, 15, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1084,'01084','WovenWonder Basket Set', 'P', 'Should southern ago hope indicate entire wall.', 292.17, 1681, 7, 
            339.13, 433, 33, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1085,'01085','SunburstSimplicity Decorative Mirror', 'P', 'Soon hotel value soon glass.', 87.07, 294, 15, 
            116.37, 219, 27, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1086,'01086','AbstractAura Painting Collection', 'P', 'Cup dark action side happen what tax.', 394.21, 2331, 11, 
            589.32, 673, 91, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1087,'01087','SpaSensation Towel Warmer', 'P', 'Step mother evidence share nature interview everybody.', 334.39, 2631, 16, 
            452.14, 944, 15, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1088,'01088','RegalRelics Vintage Door Knocker', 'P', 'Defense place right win couple half front.', 102.75, 1587, 18, 
            130.72, 546, 75, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1089,'01089','LuminaryLines Staircase Runner', 'P', 'Suffer none opportunity put partner.', 228.84, 22, 13, 
            280.47, 176, 32, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1090,'01090','BijouBox Velvet Lined Jewelry Chest', 'P', 'Hear do old air write boy.', 489.78, 83, 17, 
            611.9, 253, 13, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1091,'01091','FluffyFleece Weighted Blanket', 'P', 'Response hear fly.', 403.54, 2306, 7, 
            456.6, 858, 96, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1092,'01092','OpulentOttoman Storage Bench', 'P', 'Loss kind either measure they.', 214.54, 854, 15, 
            242.54, 656, 26, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1093,'01093','MajesticMount TV Wall Bracket', 'P', 'Task bag suddenly certain determine ball learn.', 33.55, 939, 11, 
            38.29, 277, 53, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1094,'01094','Craftsmanship Console Table', 'P', 'Whole kid establish war.', 317.71, 280, 2, 
            472.21, 627, 65, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1095,'01095','VisionaryVelvet Upholstered Chaise Lounge', 'P', 'Network we toward.', 53.65, 2873, 16, 
            66.77, 174, 92, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1096,'01096','CelestialSpheres Garden Globes', 'P', 'Star such financial another democratic forward ten try.', 94.73, 705, 2, 
            110.08, 664, 96, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1097,'01097','Allure', 'P', 'Capital president well bad.', 22.73, 522, 17, 
            32.46, 644, 55, 11);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1098,'01098','GreenThumb Ergonomic Trowel', 'P', 'Region Republican when yeah middle.', 10.64, 80, 9, 
            14.73, 39, 75, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1099,'01099','BlossomBurst Seed Starter Kit', 'P', 'Let music result foot friend.', 353.7, 493, 3, 
            402.31, 802, 50, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1100,'01100','NatureNest Hanging Planters', 'P', 'Majority quickly break let scene early plan need.', 29.6, 2877, 18, 
            37.3, 784, 25, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1101,'01101','TerraFirma Potting Bench', 'P', 'Meet audience citizen drop born movement.', 345.78, 194, 14, 
            510.68, 19, 99, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1102,'01102','BloomBoost Flower Fertilizer', 'P', 'Change soldier someone political around interview.', 183.42, 1520, 10, 
            222.05, 567, 82, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1103,'01103','CanopyComfort Outdoor Swing Chair', 'P', 'Plan half attorney meeting race.', 162.02, 183, 7, 
            193.5, 487, 58, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1104,'01104','FloraFountain Solar-Powered Water Feature', 'P', 'Someone writer billion among performance answer art evening.', 151.79, 2975, 12, 
            177.92, 495, 53, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1105,'01105','PatioGlow Fire Pit Table', 'P', 'Focus writer right face we say continue.', 485.77, 476, 4, 
            654.14, 424, 37, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1106,'01106','GardenGuru Pruning Shears', 'P', 'Term cut already couple amount mention within.', 327.66, 659, 16, 
            473.94, 864, 64, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1107,'01107','SproutRise Adjustable Plant Stand', 'P', 'Good including study debate.', 374.41, 261, 8, 
            435.89, 372, 11, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1108,'01108','VerdantValley Lawn Mower', 'P', 'Like know water well.', 486.81, 833, 12, 
            630.55, 42, 95, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1109,'01109','EmberRoast Barbecue Grill Set', 'P', 'Bit instead whose Mrs develop.', 187.9, 2842, 11, 
            237.06, 295, 11, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1110,'01110','BotanicBeauty Indoor Herb Garden', 'P', 'Rule war born soldier.', 92.58, 2202, 2, 
            102.91, 430, 11, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1111,'01111','SunLounge Rattan Recliner', 'P', 'Arm walk wall both shake.', 252.44, 113, 12, 
            332.68, 218, 26, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1112,'01112','AquaSpritz Irrigation System', 'P', 'Modern floor spring relate.', 394.41, 1192, 9, 
            518.75, 841, 36, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1113,'01113','LuxeLeaf Exotic Plant Collection', 'P', 'Center price about offer number.', 31.92, 2583, 13, 
            37.34, 14, 48, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1114,'01114','EverEdge Steel Lawn Edging', 'P', 'Physical far hand at.', 111.06, 2759, 10, 
            140.39, 355, 54, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1115,'01115','BackyardBounty Compost Bin', 'P', 'Maintain movement response nearly easy peace management.', 29.89, 1317, 12, 
            35.78, 545, 17, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1116,'01116','GrillMaster Pro Smoker', 'P', 'Hold collection art focus subject style.', 325.86, 1843, 20, 
            448.12, 255, 37, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1117,'01117','WoodlandWhisper Bird Feeder', 'P', 'Lawyer call write talk skill economic modern.', 184.14, 1872, 11, 
            207.8, 443, 94, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1118,'01118','Nature''sHaven Bee House', 'P', 'Wind million people support theory officer.', 360.35, 1038, 4, 
            441.55, 465, 62, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1119,'01119','ElegantEarth Garden Sculpture', 'P', 'Reduce compare run office make glass.', 262.49, 2264, 5, 
            300.13, 273, 13, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1120,'01120','SerenityPond Koi Pond Kit', 'P', 'Guy teacher huge then across assume treat answer.', 259.64, 1139, 6, 
            360.96, 810, 73, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1121,'01121','HarvestHome Wheelbarrow', 'P', 'Happen event relate debate month.', 258.25, 2743, 9, 
            312.37, 834, 80, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1122,'01122','SunsetSiesta Hammock with Stand', 'P', 'Window leg board figure.', 308.06, 2975, 3, 
            384.08, 247, 25, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1123,'01123','BistroBliss Outdoor Table Set', 'P', 'Fight build foot list board professor.', 65.78, 1721, 17, 
            87.03, 552, 81, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1124,'01124','PetalPerfect Garden Gloves', 'P', 'Financial main possible soon.', 459.17, 359, 11, 
            630.23, 597, 21, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1125,'01125','BarbecueBlitz Tool Set', 'P', 'Threat past organization.', 423.64, 2155, 6, 
            605.09, 990, 99, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1126,'01126','WeatherWise Garden Thermometer', 'P', 'Common ten charge.', 322.59, 235, 3, 
            375.32, 490, 29, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1127,'01127','PlantWhisperer Watering Can', 'P', 'Charge under race live book raise until.', 46.82, 956, 13, 
            59.89, 492, 39, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1128,'01128','PerennialParadise Garden Border', 'P', 'When reason same dream budget call.', 310.44, 1075, 3, 
            458.39, 659, 99, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1129,'01129','LuxeLawn Artificial Grass', 'P', 'Deep day ago eight economic service near.', 205.71, 737, 15, 
            255.68, 977, 93, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1130,'01130','RusticRetreat Garden Bench', 'P', 'Would whatever town marriage in more war.', 267.99, 277, 2, 
            362.24, 852, 81, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1131,'01131','GrillGlitz Cleaning Brush', 'P', 'Will sign box interview we.', 151.7, 1928, 2, 
            182.04, 903, 72, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1132,'01132','OasisOrnament Wind Spinner', 'P', 'Opportunity cold technology model current.', 8.47, 1587, 16, 
            9.77, 578, 90, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1133,'01133','GardenGleam Solar Lights', 'P', 'Should avoid leader make these.', 111.0, 602, 18, 
            128.78, 808, 20, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1134,'01134','BreezyBorders Mesh Fencing', 'P', 'Several future color hospital recently.', 133.18, 470, 11, 
            155.51, 639, 29, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1135,'01135','PatioParadise Umbrella', 'P', 'Republican class positive paper town well.', 271.38, 1370, 9, 
            355.52, 842, 90, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1136,'01136','SeedlingSensation Grow Lights', 'P', 'Society specific offer raise analysis number.', 73.76, 705, 17, 
            110.51, 789, 54, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1137,'01137','AquaArcade Automatic Sprinkler', 'P', 'Whether research yeah expert security appear sell.', 301.25, 686, 16, 
            424.31, 197, 73, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1138,'01138','ZenZone Bamboo Fountain', 'P', 'Energy play staff rule relate ask.', 17.82, 1417, 19, 
            19.62, 960, 59, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1139,'01139','FloraFlex Hanging Baskets', 'P', 'Style outside institution green sport article matter.', 455.12, 642, 10, 
            519.0, 364, 100, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1140,'01140','SizzleStation Outdoor Kitchen', 'P', 'One win understand discussion admit mother.', 273.58, 359, 14, 
            340.97, 694, 45, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1141,'01141','BloomingOasis Greenhouse', 'P', 'Why later company main according.', 328.03, 1942, 18, 
            381.68, 858, 89, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1142,'01142','FreshFeast Portable Barbecue', 'P', 'Claim actually teach many within bad true.', 275.37, 617, 11, 
            305.0, 682, 35, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1143,'01143','GourmetGarden Vertical Planter', 'P', 'Accept want if magazine.', 381.53, 2987, 17, 
            523.71, 739, 14, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1144,'01144','CanopyCraft Gazebo Kit', 'P', 'Local customer hold professional a computer join.', 314.94, 1616, 13, 
            349.49, 348, 73, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1145,'01145','TwilightTorch Tiki Torches', 'P', 'Difference arm often whole.', 291.64, 1324, 15, 
            355.93, 876, 87, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1146,'01146','LeafLifter Rake', 'P', 'Staff sometimes indeed forget side her.', 473.47, 2107, 20, 
            523.16, 67, 40, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1147,'01147','CultivateCraze Garden Cultivator', 'P', 'Discuss in dog your resource.', 188.1, 1580, 5, 
            258.12, 591, 48, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1148,'01148','HerbHarbor Window Box', 'P', 'Threat scene represent security.', 351.84, 526, 13, 
            406.18, 80, 73, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1149,'01149','GardenGlory Decorative Stones', 'P', 'Sound home there lose himself.', 93.04, 639, 9, 
            125.32, 770, 69, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1150,'01150','CozyCocoon Tree Swing', 'P', 'Blood just baby model walk age investment.', 297.07, 1651, 15, 
            339.41, 169, 35, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1151,'01151','Sunbaked Clay Pots', 'P', 'Care head sound up event add.', 188.24, 188, 2, 
            250.91, 136, 49, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1152,'01152','LushLattice Privacy Screen', 'P', 'Instead national day cultural history enjoy.', 275.69, 84, 19, 
            321.16, 931, 60, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1153,'01153','OutdoorOdyssey Telescope', 'P', 'North life admit sense structure culture.', 224.23, 1614, 14, 
            255.94, 525, 30, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1154,'01154','PicnicPro Folding Table', 'P', 'Mean better provide time author better middle.', 44.65, 749, 11, 
            62.63, 801, 43, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1155,'01155','BloomBuddy Plant Caddy', 'P', 'Receive firm affect day.', 368.42, 346, 13, 
            466.91, 50, 17, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1156,'01156','NatureNurture Seedling Heat Mat', 'P', 'Practice them feeling make movie.', 326.38, 517, 5, 
            454.36, 51, 62, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1157,'01157','GrubGrill Rotisserie Kit', 'P', 'Worker edge floor.', 34.8, 2599, 8, 
            43.25, 429, 92, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1158,'01158','PestoPatch Herb Garden', 'P', 'Follow mother may sing this great.', 1.53, 1738, 18, 
            2.14, 496, 91, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1159,'01159','GardenGlow LED Pathway Lights', 'P', 'Production structure cover reduce place sound store.', 202.36, 358, 9, 
            237.11, 909, 38, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1160,'01160','TimberTreat Wooden Planter Box', 'P', 'Prevent center television instead.', 37.42, 671, 14, 
            53.15, 486, 69, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1161,'01161','AquaOasis Fountain Pump', 'P', 'Who unit itself court understand section follow.', 367.4, 2863, 2, 
            460.05, 805, 53, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1162,'01162','BloomBelt Gardening Tool Belt', 'P', 'Small surface contain author.', 240.67, 1048, 8, 
            307.56, 544, 93, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1163,'01163','SunSeeker Retractable Awning', 'P', 'Attorney concern star.', 195.98, 1760, 20, 
            282.47, 326, 78, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1164,'01164','VineVirtue Garden Trellis', 'P', 'Site politics carry suggest win.', 173.74, 1707, 19, 
            225.26, 977, 49, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1165,'01165','Evergreen Essence Tree Sapling', 'P', 'Standard there try wait write data card.', 332.86, 2169, 16, 
            498.19, 414, 53, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1166,'01166','AlFresco Dining Set', 'P', 'Entire lay near painting.', 464.96, 924, 8, 
            544.4, 546, 17, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1167,'01167','BackyardBliss Outdoor Rug', 'P', 'Stage success page.', 200.79, 236, 6, 
            222.63, 996, 19, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1168,'01168','CharmingChimes Wind Chimes', 'P', 'He real remember.', 251.44, 103, 16, 
            367.5, 990, 31, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1169,'01169','RoyalRest Adirondack Chair', 'P', 'Might executive important upon tend low book.', 59.43, 790, 15, 
            75.34, 321, 26, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1170,'01170','TerraCotta Timepiece Sundial', 'P', 'Both after describe part art.', 231.71, 1872, 18, 
            281.57, 524, 94, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1171,'01171','GreenGrill Eco-Friendly Charcoal', 'P', 'Development leader choose local truth site.', 69.12, 333, 3, 
            87.04, 616, 87, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1172,'01172','GardenGlisten Reflective Balls', 'P', 'North change cold character order everyone.', 31.22, 2631, 7, 
            36.04, 387, 77, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1173,'01173','SweetSmoker Hickory Wood Chips', 'P', 'Standard position current report box something occur.', 431.7, 1304, 2, 
            538.58, 980, 97, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1174,'01174','PatioPainter Deck Stain', 'P', 'Between eye laugh this break.', 237.06, 288, 7, 
            323.07, 846, 56, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1175,'01175','LawnLegend Fertilizer Spreader', 'P', 'Including thing recent decision few.', 39.73, 737, 17, 
            51.23, 695, 24, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1176,'01176','EcoEats Compostable Dinnerware', 'P', 'Others hair visit bring rate perform quality.', 276.6, 231, 2, 
            308.43, 997, 22, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1177,'01177','MulchMaster Garden Shredder', 'P', 'Bank nothing baby sign.', 23.61, 806, 9, 
            32.39, 316, 88, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1178,'01178','TranquilTiki Outdoor Lanterns', 'P', 'Dream quality discussion or heavy game.', 427.8, 1895, 12, 
            599.57, 23, 28, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1179,'01179','FernFrenzy Shade Plants', 'P', 'Majority government it similar political with analysis statement.', 57.74, 270, 4, 
            66.63, 352, 57, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1180,'01180','GreenhouseGroove Temperature Controller', 'P', 'Yet model nor adult news standard.', 460.35, 2599, 16, 
            681.58, 579, 12, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1181,'01181','MoonlightMagic Night Blooming Flowers', 'P', 'Economic hot mouth perhaps now.', 442.71, 2963, 9, 
            507.34, 185, 48, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1182,'01182','DewDrops Rain Barrel', 'P', 'Boy on couple economic check relate former.', 48.0, 1603, 7, 
            68.0, 265, 91, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1183,'01183','VineyardVirtue Grape Vines', 'P', 'Various nothing low listen her.', 308.56, 670, 10, 
            375.31, 199, 24, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1184,'01184','FlameFeast Firewood Rack', 'P', 'Bar alone street sense ok direction away.', 72.96, 1763, 5, 
            102.37, 598, 94, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1185,'01185','RoseReserve Garden Hose', 'P', 'Throw receive mean front become establish low artist.', 147.57, 732, 6, 
            172.06, 524, 68, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1186,'01186','GrillGuard Protective Cover', 'P', 'Huge enter clearly open it weight.', 318.37, 2474, 18, 
            432.8, 729, 37, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1187,'01187','SapphireStream Pond Liner', 'P', 'Radio bed debate back case mouth view.', 429.9, 1381, 13, 
            485.26, 285, 98, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1188,'01188','NatureNap Swing Bed', 'P', 'Rule appear series walk child sometimes.', 421.82, 2344, 6, 
            502.5, 709, 10, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1189,'01189','GardenGuide Plant Identification Tags', 'P', 'Describe newspaper article write ball go who.', 452.65, 539, 17, 
            565.75, 316, 52, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1190,'01190','PatioPerfection Cleaner', 'P', 'Place example environment friend five.', 51.46, 477, 10, 
            63.6, 55, 36, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1191,'01191','CropCradle Tomato Cage', 'P', 'Age coach star sing cultural while give.', 170.57, 2589, 7, 
            201.62, 461, 88, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1192,'01192','StellarSeed Mix Wildflowers', 'P', 'Hospital thought attorney state.', 349.03, 617, 11, 
            449.79, 503, 35, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1193,'01193','HerbivoreHaven Animal Repellent', 'P', 'Best prevent try board one story American summer.', 114.71, 2577, 17, 
            143.92, 470, 98, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1194,'01194','PrairiePioneer Landscape Fabric', 'P', 'Their ball south a agent.', 369.59, 222, 3, 
            450.44, 166, 59, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1195,'01195','OrchardOffering Fruit Tree Varietals', 'P', 'Reason those operation manage available baby doctor happy.', 424.3, 1625, 12, 
            574.01, 544, 68, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1196,'01196','BackyardBloomers Annual Flower Mix', 'P', 'Capital bed garden miss seven.', 246.36, 1760, 2, 
            357.1, 602, 50, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1197,'01197','SmokeSavor Barbecue Flavor Infuser', 'P', 'Trouble movie can kitchen night local.', 238.52, 52, 5, 
            317.89, 696, 60, 12);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1198,'01198','TurboTech Performance Exhaust System', 'P', 'Enjoy play role thing.', 296.59, 2169, 8, 
            430.94, 479, 49, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1199,'01199','ClearView Advanced Windshield Wipers', 'P', 'Individual whom month allow morning feel item.', 38.23, 939, 19, 
            50.0, 494, 35, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1200,'01200','NightGlow LED Headlight Conversion Kit', 'P', 'Individual friend serve plan dog writer.', 282.89, 2722, 5, 
            376.36, 48, 69, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1201,'01201','ArmorShell Truck Bed Liner', 'P', 'Everything south prevent with parent affect.', 31.04, 278, 7, 
            39.71, 537, 30, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1202,'01202','DashCommand Center Console Organizer', 'P', 'State house when under course study player.', 362.36, 969, 13, 
            415.43, 140, 69, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1203,'01203','AeroFin Carbon Fiber Spoiler', 'P', 'Either discuss guess catch these me reach.', 67.01, 1549, 2, 
            74.2, 740, 39, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1204,'01204','PowerPulse Battery Charger', 'P', 'Sit sit indicate remain environment.', 302.73, 2281, 10, 
            340.43, 678, 16, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1205,'01205','RoadGuardian Dash Cam', 'P', 'Risk whose significant artist specific.', 50.3, 736, 10, 
            64.19, 689, 26, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1206,'01206','SkyView Panoramic Sunroof Kit', 'P', 'Activity too worker wall in but another.', 22.68, 659, 6, 
            26.06, 795, 75, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1207,'01207','EcoClean Waterless Car Wash Spray', 'P', 'Once carry never commercial up.', 120.39, 1596, 15, 
            137.59, 608, 71, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1208,'01208','SoundScape Premium Car Audio System', 'P', 'Western number operation pull card.', 120.43, 391, 13, 
            160.49, 907, 15, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1209,'01209','SmoothRide Suspension Kit', 'P', 'Perform head girl medical institution television.', 239.53, 2901, 10, 
            312.0, 365, 87, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1210,'01210','IronGrip Steering Wheel Cover', 'P', 'Stock movie drive explain wife tell.', 367.04, 627, 10, 
            519.28, 501, 10, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1211,'01211','SpeedShift Performance Gear Knob', 'P', 'Partner small direction moment these system.', 472.86, 2423, 15, 
            552.97, 197, 97, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1212,'01212','AutoGlow Underbody LED Lights', 'P', 'Doctor include indicate much education image.', 200.83, 749, 6, 
            226.77, 815, 89, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1213,'01213','PureAir Cabin Air Filter', 'P', 'Add product charge.', 497.44, 786, 13, 
            626.84, 478, 30, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1214,'01214','RapidRepair Tire Inflator Kit', 'P', 'Example keep think east dinner care.', 251.58, 685, 5, 
            347.29, 133, 20, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1215,'01215','StealthLock Remote-Controlled Car Alarm', 'P', 'Think station major seem yes her against.', 456.31, 168, 19, 
            647.25, 299, 24, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1216,'01216','SparkGenius Advanced Ignition Coils', 'P', 'Respond summer case term.', 8.25, 289, 20, 
            12.19, 852, 30, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1217,'01217','MirrorTech Rearview Camera System', 'P', 'Us last garden the key forget baby result.', 324.86, 808, 11, 
            389.03, 935, 78, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1218,'01218','DiamondCut Alloy Wheels', 'P', 'Each painting direction wait treatment energy identify receive.', 27.22, 918, 3, 
            33.24, 921, 69, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1219,'01219','RoadWarrior All-Terrain Tires', 'P', 'Arrive generation current analysis believe yourself eight power.', 391.98, 1249, 8, 
            529.65, 118, 44, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1220,'01220','LeatherLux Seat Covers', 'P', 'Choose establish measure cut notice painting ability.', 96.15, 1747, 7, 
            115.6, 965, 13, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1221,'01221','Prestige Car Key Fob Case', 'P', 'Specific two scientist consider.', 62.89, 1437, 16, 
            85.15, 719, 83, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1222,'01222','ProTint Window Tinting Film', 'P', 'Practice spring loss no whether yes top.', 7.04, 491, 4, 
            10.41, 344, 81, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1223,'01223','CarbonCraft Dashboard Trim Kit', 'P', 'Finish agency free situation.', 335.63, 2091, 9, 
            465.4, 418, 94, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1224,'01224','CoolBreeze AC Recharge Kit', 'P', 'Line former painting behavior.', 7.23, 2866, 13, 
            10.14, 46, 60, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1225,'01225','ShineMaster Headlight Restoration Kit', 'P', 'Wall production lay skill.', 408.72, 2270, 17, 
            525.63, 1, 67, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1226,'01226','RoadMaster High-Performance Brake Pads', 'P', 'Interesting bed face economic inside shoulder against.', 448.46, 233, 6, 
            532.21, 149, 14, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1227,'01227','EngineGuard Oil Pressure Sensor', 'P', 'Someone just debate chance account financial camera.', 5.68, 681, 5, 
            8.37, 98, 95, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1228,'01228','TrailTrek Roof Cargo Box', 'P', 'Bed give skin together cold include leader.', 341.78, 833, 4, 
            467.45, 518, 32, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1229,'01229','EliteXenon HID Conversion Kit', 'P', 'Choose Congress should father country.', 424.51, 969, 6, 
            541.34, 451, 57, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1230,'01230','SoundBarrier Noise Reduction Material', 'P', 'Part eye scene lead.', 211.17, 996, 13, 
            263.06, 799, 68, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1231,'01231','AeroDynamic Car Roof Racks', 'P', 'Message number water truth anything manager girl.', 62.11, 879, 12, 
            83.28, 838, 55, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1232,'01232','ChargePro Portable Jump Starter', 'P', 'Majority game Democrat usually Mr mind recent.', 30.36, 1035, 15, 
            42.69, 466, 100, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1233,'01233','LuxeLiner Custom Floor Mats', 'P', 'Some stage center again unit.', 27.8, 2084, 20, 
            40.21, 444, 53, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1234,'01234','SafeDrive Blind Spot Mirrors', 'P', 'Religious billion similar newspaper hair the include dark.', 189.13, 2782, 9, 
            274.49, 606, 42, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1235,'01235','PristinePolish Chrome Cleaner', 'P', 'Head leader at to high according.', 72.75, 812, 19, 
            101.25, 21, 43, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1236,'01236','SlickShift Transmission Fluid', 'P', 'Staff mean many different book card.', 444.39, 2841, 6, 
            547.14, 859, 53, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1237,'01237','UltimateUV Sunshade', 'P', 'Let few similar positive.', 440.81, 1307, 14, 
            574.63, 641, 44, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1238,'01238','ClearCoat Scratch Repair Pen', 'P', 'Trouble take pretty final.', 2.21, 491, 15, 
            3.12, 754, 49, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1239,'01239','VentFlow Air Conditioning Cleaner', 'P', 'Help big its development minute professor free.', 14.42, 2693, 20, 
            17.67, 71, 60, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1240,'01240','RimRevive Wheel Repair Kit', 'P', 'Necessary pull human camera.', 268.65, 1401, 8, 
            307.62, 518, 28, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1241,'01241','OdorElim Car Freshener', 'P', 'Third international response baby.', 10.45, 860, 11, 
            14.32, 825, 29, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1242,'01242','GripMaster Snow Chains', 'P', 'Clearly recent research word many big trial design.', 438.86, 2178, 3, 
            507.34, 479, 28, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1243,'01243','ElectraCharge Electric Vehicle Charger', 'P', 'Run exactly drive.', 410.18, 861, 6, 
            493.19, 798, 94, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1244,'01244','SpeedometerPro Calibration Tool', 'P', 'Reach after sometimes around notice.', 172.19, 66, 7, 
            208.67, 710, 96, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1245,'01245','EngineRevive Fuel System Cleaner', 'P', 'Probably fly decade allow pull.', 358.6, 1512, 11, 
            412.21, 405, 24, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1246,'01246','PaintPerfection Color Match Spray', 'P', 'Since glass skin.', 458.61, 1417, 11, 
            570.26, 774, 41, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1247,'01247','RustAway Undercoating Protection', 'P', 'Partner manager country talk since before religious.', 382.26, 2721, 7, 
            515.59, 782, 40, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1248,'01248','AeroWing Universal Spoilers', 'P', 'Decision they reflect enjoy or degree the Democrat.', 182.32, 1520, 8, 
            215.16, 612, 53, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1249,'01249','PowerPort Dual USB Car Charger', 'P', 'See laugh as table many site.', 303.51, 1785, 16, 
            440.99, 469, 18, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1250,'01250','DashBright Dashboard Polish', 'P', 'Left eight drive soldier similar.', 310.82, 1388, 17, 
            364.36, 709, 67, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1251,'01251','TireTrack Digital Pressure Gauge', 'P', 'Quite act it make machine well yeah.', 109.89, 37, 13, 
            144.8, 31, 63, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1252,'01252','FluidCheck Brake Fluid Tester', 'P', 'Past daughter two alone concern.', 116.37, 2901, 7, 
            146.11, 420, 19, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1253,'01253','RadiantHeat Seat Heater Kit', 'P', 'Military story any discover social interview quality car.', 155.59, 937, 18, 
            210.45, 952, 60, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1254,'01254','SecureStrap Ratchet Tie Down Set', 'P', 'Address television tough realize.', 269.59, 171, 4, 
            341.63, 293, 47, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1255,'01255','VisionX Off-Road Light Bar', 'P', 'Each candidate police series reflect international.', 256.97, 216, 17, 
            334.19, 465, 41, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1256,'01256','StealthTint Privacy Glass Film', 'P', 'Beyond long for look red.', 381.07, 2306, 8, 
            522.07, 406, 68, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1257,'01257','CoolTech Refrigerant Leak Detector', 'P', 'Common stop table score take change.', 237.67, 183, 15, 
            334.64, 134, 84, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1258,'01258','FlexMount Adjustable Phone Holder', 'P', 'Issue international along rate treatment gas dark.', 468.43, 732, 9, 
            610.98, 16, 58, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1259,'01259','NanoBond Ceramic Coating', 'P', 'Strong because ball.', 188.42, 1165, 9, 
            219.83, 902, 42, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1260,'01260','ShadowBlack Vinyl Wrap', 'P', 'Lay site character.', 221.21, 251, 12, 
            257.35, 536, 100, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1261,'01261','GearGuard Transmission Lock', 'P', 'Whether gun during thought.', 48.21, 612, 2, 
            61.2, 365, 83, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1262,'01262','PrismVision Rear Projection HUD', 'P', 'Off real factor idea edge small each center.', 84.68, 2474, 14, 
            98.9, 268, 27, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1263,'01263','BoltBuddy Emergency Lug Nut Remover', 'P', 'Officer outside your field onto hold.', 137.27, 847, 6, 
            176.23, 748, 70, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1264,'01264','QuickConnect Trailer Hitch System', 'P', 'Trouble exist board current hard.', 241.66, 2631, 13, 
            315.81, 575, 91, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1265,'01265','SilentSeal Door Insulation Strip', 'P', 'Born during little see.', 405.06, 592, 14, 
            508.41, 250, 23, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1266,'01266','PolarShield Windshield Cover', 'P', 'Certainly artist much near.', 496.6, 1635, 10, 
            724.26, 258, 99, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1267,'01267','FuelSaver Pro Performance Chip', 'P', 'Manage drive worry occur best store.', 499.21, 168, 3, 
            633.12, 263, 76, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1268,'01268','SparkMaster Spark Plug Tool Set', 'P', 'Indicate building meeting far safe seven population.', 451.66, 2901, 12, 
            600.7, 529, 72, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1269,'01269','BreezeIntake Cold Air Intake System', 'P', 'Interview although board.', 105.25, 745, 12, 
            143.57, 79, 23, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1270,'01270','RoadReflex Suspension Stabilizer Bar', 'P', 'Cold operation explain perform leg space.', 48.82, 2030, 15, 
            63.52, 520, 65, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1271,'01271','CleanView Wiper Blade Refills', 'P', 'Experience little how.', 241.64, 289, 16, 
            275.63, 647, 18, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1272,'01272','SoundProof Cabin Insulation Foam', 'P', 'Hope never wife high.', 170.63, 678, 5, 
            207.09, 531, 44, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1273,'01273','AlloyArmor Wheel Protectant', 'P', 'Wait century religious standard thank sit.', 466.44, 2008, 11, 
            537.59, 937, 47, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1274,'01274','TouchTech Keyless Entry Pad', 'P', 'Consider glass company such manage by similar.', 185.83, 334, 2, 
            254.62, 237, 75, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1275,'01275','CargoSecure Trunk Organizer', 'P', 'Detail or if interest.', 170.41, 133, 20, 
            217.26, 75, 71, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1276,'01276','MotionDetect Car Alarm Sensor', 'P', 'Head those machine out reduce.', 462.95, 1214, 9, 
            622.08, 881, 82, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1277,'01277','PowerBoost Turbocharger Kit', 'P', 'Yeah ago become time win.', 361.27, 1941, 6, 
            453.71, 780, 38, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1278,'01278','ShineOn Tire Shine Spray', 'P', 'Population on cultural including enough compare peace.', 269.23, 1784, 12, 
            385.22, 629, 97, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1279,'01279','EngineMax Oil Additive', 'P', 'Decade difficult very economic stuff citizen your form.', 148.37, 638, 17, 
            182.88, 647, 41, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1280,'01280','BrakeBright LED Stop Lights', 'P', 'Nothing line often its.', 70.5, 1793, 18, 
            96.96, 88, 75, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1281,'01281','AutoAdjust Headrest Monitor Mount', 'P', 'Best space industry military.', 247.59, 921, 4, 
            344.78, 765, 60, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1282,'01282','ClutchMaster Clutch Kit', 'P', 'Have buy west case either opportunity cost.', 69.37, 290, 7, 
            99.76, 497, 53, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1283,'01283','FuelFix Fuel Cap Replacement', 'P', 'Exist television through goal.', 51.77, 2971, 18, 
            69.54, 591, 15, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1284,'01284','LaserAlign Wheel Alignment Tool', 'P', 'Side yourself minute light easy.', 299.19, 1916, 20, 
            374.26, 316, 65, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1285,'01285','PanelPatch Dent Repair Kit', 'P', 'Sometimes edge say office girl outside teacher everything.', 490.76, 2293, 20, 
            579.09, 332, 83, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1286,'01286','GripTight Handbrake Cover', 'P', 'Yourself including successful during player federal.', 292.51, 382, 8, 
            385.8, 956, 87, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1287,'01287','GlareGuard Polarized Driving Glasses', 'P', 'Cut field claim since could.', 64.49, 1249, 19, 
            84.53, 443, 72, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1288,'01288','AeroFlow Performance Air Filter', 'P', 'Mouth size go decade.', 204.17, 202, 8, 
            242.83, 114, 12, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1289,'01289','CrystalClear Headlamp Cleaner', 'P', 'Physical treatment success now.', 27.4, 841, 3, 
            34.9, 697, 81, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1290,'01290','PowerPump Electric Tire Inflator', 'P', 'Husband it instead less meet society during.', 415.35, 617, 14, 
            563.0, 587, 66, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1291,'01291','UltraWash Pressure Washer', 'P', 'Hand than rather bad.', 293.05, 2946, 13, 
            421.53, 589, 27, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1292,'01292','SwiftScan OBD2 Scanner', 'P', 'Base draw low card nice hope.', 410.05, 1331, 18, 
            524.75, 658, 83, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1293,'01293','RoadClip Cup Holder Expander', 'P', 'Lose movement should law article national court.', 82.16, 2367, 16, 
            118.3, 921, 42, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1294,'01294','NightSight Driving Fog Lamps', 'P', 'Floor cold only field or.', 311.53, 899, 18, 
            394.45, 817, 44, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1295,'01295','PaintGuard Clear Protection Film', 'P', 'Close allow employee once minute certain fish.', 458.73, 2631, 13, 
            514.57, 651, 21, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1296,'01296','FlexFit Universal Mud Flaps', 'P', 'First particular industry very offer.', 260.95, 1066, 9, 
            375.15, 234, 59, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1297,'01297','SeatSaver Waterproof Seat Protector', 'P', 'Audience century seem dog who.', 327.19, 2657, 6, 
            411.74, 114, 86, 13);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1298,'01298','WhiskerFeast Gourmet Cat Food', 'P', 'Believe my financial nature support the play short.', 333.83, 2178, 15, 
            405.84, 53, 90, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1299,'01299','FetchMaster Durable Dog Frisbee', 'P', 'Only indicate east research.', 476.57, 1469, 20, 
            644.5, 953, 30, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1300,'01300','AquaPure Water Conditioner for Fish Tanks', 'P', 'Article economy brother tell.', 324.8, 913, 19, 
            360.82, 297, 22, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1301,'01301','PurrLuxe Self-Cleaning Litter Box', 'P', 'Close in answer night can.', 100.5, 1139, 11, 
            149.81, 868, 43, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1302,'01302','SnuggleSoft Plush Pet Bed', 'P', 'Relate fact do whole any pick address cultural.', 43.63, 2048, 18, 
            50.22, 754, 91, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1303,'01303','ChewTough Indestructible Dog Bone', 'P', 'Page treatment network professional system.', 24.19, 147, 8, 
            33.48, 630, 61, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1304,'01304','FeatherFun Bird Toy Collection', 'P', 'Care across sister produce price make.', 164.97, 2949, 6, 
            184.72, 816, 58, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1305,'01305','NutriBites Premium Dog Treats', 'P', 'Only night wait near hair course.', 161.29, 2947, 11, 
            228.84, 170, 14, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1306,'01306','FelineShine Hairball Control Treats', 'P', 'Group finish long field idea above popular.', 15.73, 352, 11, 
            19.14, 698, 10, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1307,'01307','BunnyBounce Rabbit Exercise Ball', 'P', 'Begin for later take.', 48.52, 539, 19, 
            72.01, 556, 63, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1308,'01308','SqueakJoy Interactive Mouse Toy', 'P', 'Become travel create base pressure character success.', 430.67, 705, 5, 
            556.13, 751, 47, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1309,'01309','CanineShield Flea & Tick Collar', 'P', 'Break dark dark year direction experience.', 431.13, 474, 4, 
            477.53, 361, 29, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1310,'01310','TurtleTreat Aquatic Turtle Food', 'P', 'Several issue pressure account president number.', 303.77, 46, 7, 
            367.85, 819, 10, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1311,'01311','FluffyCloud Memory Foam Cat Bed', 'P', 'Down employee effect election.', 153.94, 147, 19, 
            184.59, 756, 80, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1312,'01312','ZoomGlide Retractable Dog Leash', 'P', 'View describe raise national window.', 317.07, 2045, 8, 
            420.77, 321, 93, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1313,'01313','BirdieChirp Parrot Talking Toy', 'P', 'Here staff face.', 183.4, 1083, 10, 
            209.97, 539, 33, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1314,'01314','PawProtect Winter Dog Boots', 'P', 'Remember window agree per structure seat.', 357.2, 346, 18, 
            465.67, 759, 75, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1315,'01315','AquaticWonder Aquarium Decor Set', 'P', 'Cause always participant because real.', 30.77, 437, 11, 
            37.01, 294, 93, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1316,'01316','FurryFit Pet Weight Management Food', 'P', 'Year arrive assume middle.', 191.67, 2008, 7, 
            287.26, 955, 30, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1317,'01317','ScratchPal Cat Scratching Post', 'P', 'Fly fast point part.', 301.74, 531, 8, 
            355.58, 408, 100, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1318,'01318','HamsterHaven Exercise Wheel', 'P', 'Something half help teacher.', 208.41, 150, 7, 
            286.99, 925, 82, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1319,'01319','QuietNight Anti-Anxiety Dog Bed', 'P', 'Fact list south.', 324.03, 214, 16, 
            367.99, 468, 21, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1320,'01320','PurePaws Hypoallergenic Shampoo', 'P', 'Early same note forget she those between east.', 456.74, 284, 20, 
            664.24, 986, 36, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1321,'01321','MightyMunch Crunchy Catnip Treats', 'P', 'Project certain new drug behind.', 368.77, 168, 3, 
            447.25, 383, 41, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1322,'01322','TrailTracker GPS Pet Collar', 'P', 'Should stock truth heart.', 484.79, 1352, 20, 
            661.67, 775, 20, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1323,'01323','PondFeast Koi Fish Food Pellets', 'P', 'Medical tonight cost bad.', 288.13, 1616, 7, 
            410.9, 517, 70, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1324,'01324','BrightBeak Bird Beak Conditioner', 'P', 'Writer buy yourself model new wait.', 289.41, 841, 18, 
            408.98, 175, 13, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1325,'01325','WagWell Organic Dog Biscuits', 'P', 'Method receive which air military.', 9.18, 236, 3, 
            12.51, 633, 54, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1326,'01326','GroomGenius Pet Hair Clipper', 'P', 'Manager another big industry recognize.', 412.92, 2400, 18, 
            574.52, 250, 34, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1327,'01327','LizardLounge Heat Mat for Reptiles', 'P', 'Hear several hope loss.', 437.67, 1758, 19, 
            506.24, 921, 15, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1328,'01328','FetchFrenzy Automatic Ball Launcher', 'P', 'Live might deep mean smile.', 454.49, 214, 18, 
            608.08, 50, 40, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1329,'01329','AquaGlow LED Fish Tank Light', 'P', 'Trial bill travel role final recently prepare.', 465.99, 2553, 6, 
            697.13, 661, 82, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1330,'01330','JoyJumps Dog Agility Training Set', 'P', 'Stock want president boy stand.', 336.73, 868, 12, 
            390.89, 273, 80, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1331,'01331','PerfectPerch Window Mounted Cat Bed', 'P', 'Enter church born capital poor purpose above.', 174.75, 1364, 3, 
            236.75, 618, 61, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1332,'01332','CanineCalm CBD Oil for Dogs', 'P', 'Evidence whom everyone fill.', 195.12, 2952, 9, 
            234.77, 234, 89, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1333,'01333','FeatherFiesta Cockatiel Treat Sticks', 'P', 'Boy heavy able process relationship practice.', 297.46, 1916, 10, 
            341.05, 888, 43, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1334,'01334','KittyKraze Interactive Laser Toy', 'P', 'Sense activity many decide car body change exactly.', 199.96, 216, 5, 
            260.22, 63, 18, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1335,'01335','WhiskerWash Pet Grooming Gloves', 'P', 'Understand attack large green could four minute.', 200.68, 815, 13, 
            227.33, 97, 91, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1336,'01336','SniffSnack Scented Chew Toys', 'P', 'Maybe forward rise.', 126.26, 2599, 7, 
            167.37, 584, 76, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1337,'01337','ComfyCave Covered Dog Bed', 'P', 'Before approach contain south I rate.', 209.2, 645, 13, 
            295.24, 548, 97, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1338,'01338','BreatheEasy Pet Air Purifier', 'P', 'Act green down religious option black measure.', 283.64, 803, 13, 
            391.83, 859, 54, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1339,'01339','PawPedic Orthopedic Pet Mattress', 'P', 'Store often four try owner letter.', 336.36, 476, 4, 
            447.63, 483, 21, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1340,'01340','MightyMeow Cat Climbing Tower', 'P', 'Human history fill trade fast country.', 97.3, 293, 5, 
            118.08, 389, 52, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1341,'01341','BiscuitBrew Dog Tea Supplements', 'P', 'Chance image there middle section.', 18.75, 2208, 11, 
            22.45, 3, 73, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1342,'01342','PlayPond Fish Feeding Ring', 'P', 'Idea give person.', 28.04, 1324, 16, 
            34.55, 929, 34, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1343,'01343','RodentRomp Small Animal Playpen', 'P', 'Become generation value opportunity stock everything.', 319.78, 2971, 7, 
            438.19, 143, 35, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1344,'01344','BrightBite Dental Cleaning Treats', 'P', 'It film good recent manage picture sit.', 117.26, 1211, 18, 
            158.04, 423, 64, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1345,'01345','CritterCuddle Small Pet Carrier', 'P', 'Teacher even away pull identify clear cover.', 460.93, 980, 9, 
            635.8, 943, 56, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1346,'01346','TurtleTop Floating Basking Platform', 'P', 'Task assume guess city above.', 263.86, 2428, 19, 
            337.2, 187, 31, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1347,'01347','FeatherFast Bird Molting Supplement', 'P', 'Include be activity serious.', 196.25, 682, 15, 
            251.25, 763, 91, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1348,'01348','JingleJaws Durable Squeaky Toy', 'P', 'Many senior huge unit so benefit.', 387.1, 1964, 6, 
            512.14, 134, 55, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1349,'01349','OmegaOil Skin & Coat Supplement', 'P', 'Color force condition it.', 482.92, 733, 19, 
            603.17, 452, 68, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1350,'01350','EasyEats Slow Feeder Dog Bowl', 'P', 'Produce thought his about also.', 77.13, 618, 13, 
            110.73, 505, 74, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1351,'01351','HappyHooves Equine Health Snacks', 'P', 'Theory religious week miss week.', 466.64, 1872, 20, 
            668.68, 513, 76, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1352,'01352','FeatheredFriends Birdhouse Kit', 'P', 'Themselves room me travel improve discussion key size.', 313.64, 1980, 19, 
            410.03, 630, 32, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1353,'01353','ScaleSoothe Reptile Skin Cream', 'P', 'Feel interview there difficult fight.', 411.85, 2769, 14, 
            492.94, 941, 55, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1354,'01354','PureWhisker Cat Water Fountain', 'P', 'South year store official evening score.', 297.0, 699, 12, 
            387.22, 963, 28, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1355,'01355','FurryFriend Custom Pet Tags', 'P', 'Daughter notice mean one.', 299.95, 2824, 20, 
            396.27, 36, 11, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1356,'01356','BurrowBuddy Hamster Bedding', 'P', 'Husband yes huge full none instead citizen.', 200.4, 1298, 5, 
            236.22, 962, 56, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1357,'01357','VibrantVista Aquarium Background', 'P', 'Rest water Republican good.', 212.31, 1027, 15, 
            236.42, 883, 76, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1358,'01358','SnackSphere Treat Dispensing Ball', 'P', 'Spring music store central community thought without.', 127.94, 2145, 9, 
            147.58, 433, 68, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1359,'01359','CoolCoat Dog Cooling Vest', 'P', 'Test task move third.', 423.89, 324, 8, 
            558.73, 735, 38, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1360,'01360','NatureNibble Rabbit Hay Feeder', 'P', 'Myself appear fine ready Republican.', 211.65, 2422, 6, 
            239.87, 707, 68, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1361,'01361','KittyKorner Cat Door Hinge', 'P', 'Road whole hot court southern lot indicate.', 136.22, 1066, 13, 
            176.26, 259, 81, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1362,'01362','PawsitiveMood Dog Aromatherapy Sprays', 'P', 'Democratic table reflect ask brother.', 428.12, 868, 15, 
            580.89, 236, 15, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1363,'01363','FleeceFiesta Guinea Pig Blanket', 'P', 'Hold book company letter daughter big.', 77.71, 2449, 10, 
            113.72, 432, 30, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1364,'01364','ChaseChomp Interactive Cat Toy', 'P', 'Prepare crime blue family force history.', 11.2, 1719, 15, 
            13.96, 271, 80, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1365,'01365','NoFlea Plus Spot-On Treatment', 'P', 'Section common main.', 343.22, 956, 9, 
            407.36, 767, 94, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1366,'01366','SunnySeat Window Perch for Cats', 'P', 'Mention its memory side effort.', 296.96, 695, 7, 
            363.51, 831, 57, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1367,'01367','JogAlong Pet Stroller', 'P', 'Full near attack happy physical once.', 394.56, 921, 20, 
            450.39, 520, 36, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1368,'01368','NightBright LED Dog Collar', 'P', 'Actually skill clearly different data.', 441.91, 545, 10, 
            563.32, 812, 39, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1369,'01369','HerbalHeal Pet Wound Ointment', 'P', 'Per item run same goal education relate.', 242.31, 588, 5, 
            281.71, 272, 46, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1370,'01370','CanineCuisine Premium Wet Dog Food', 'P', 'Read sign human.', 94.6, 641, 7, 
            140.17, 573, 46, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1371,'01371','BirdBath Solar-Powered Fountain', 'P', 'Car teacher former.', 354.81, 148, 11, 
            522.47, 300, 33, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1372,'01372','Hideaway Hamster Nest', 'P', 'Former deep room lead skin arm who design.', 309.61, 2368, 4, 
            391.26, 382, 44, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1373,'01373','DentaCare Daily Oral Rinse for Pets', 'P', 'Early mother realize seat expect Mrs leave.', 119.3, 1211, 5, 
            156.93, 632, 81, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1374,'01374','PurrfectPlay Cat Teaser Wand', 'P', 'Thank live feel difference program.', 166.7, 1577, 2, 
            237.01, 780, 97, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1375,'01375','PoochPouch Front Dog Carrier', 'P', 'Whole fact your south himself.', 427.78, 84, 10, 
            528.66, 283, 88, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1376,'01376','AquaticLife Underwater Aquarium Pump', 'P', 'Box movie effect everything statement sign soon.', 480.17, 1086, 15, 
            683.97, 171, 88, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1377,'01377','GoldenYears Senior Dog Supplements', 'P', 'Ground thank western nice.', 129.13, 481, 14, 
            147.2, 600, 86, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1378,'01378','FelineFine Catnip Spray', 'P', 'Certain soldier goal data.', 466.6, 814, 6, 
            620.97, 412, 51, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1379,'01379','QuickClean Pet Waste Scooper', 'P', 'Place bit establish brother fight.', 433.75, 1388, 10, 
            633.85, 327, 80, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1380,'01380','PetPicnic Portable Food & Water Bowl', 'P', 'Power let quickly enter.', 355.43, 353, 15, 
            448.95, 119, 23, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1381,'01381','ThunderWrap Anxiety Relief Pet Wrap', 'P', 'When address know too campaign through.', 205.45, 231, 18, 
            268.82, 862, 86, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1382,'01382','AdventureLeash Hands-Free Running Leash', 'P', 'Once home recently.', 96.67, 239, 13, 
            128.39, 821, 87, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1383,'01383','CozyCritter Heated Pet Mat', 'P', 'Start his soldier perhaps sit state.', 355.89, 1906, 11, 
            494.28, 802, 71, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1384,'01384','EasyGlide Pet Nail Trimmer', 'P', 'Road soon theory on fall surface employee.', 407.4, 111, 7, 
            593.1, 311, 81, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1385,'01385','FreshFeather Parakeet Diet Seed Mix', 'P', 'Performance station indicate rest nice a.', 237.43, 1364, 18, 
            278.97, 448, 85, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1386,'01386','MightyRoar Lion Mane Dog Costume', 'P', 'Probably agree forward at.', 432.23, 133, 18, 
            517.38, 398, 27, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1387,'01387','PurelyPaws Ear Cleaning Solution', 'P', 'Final administration again fact lawyer.', 231.46, 503, 6, 
            291.79, 430, 50, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1388,'01388','KittenMittens Soft Nail Caps', 'P', 'Remember nice in character wrong south capital.', 227.66, 2180, 15, 
            309.68, 790, 99, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1389,'01389','FluffDry High-Velocity Pet Dryer', 'P', 'Loss bill why assume community message great.', 264.22, 476, 9, 
            340.88, 938, 84, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1390,'01390','ScentSational Pet Deodorizing Spray', 'P', 'Care drop couple several campaign check.', 445.67, 2202, 20, 
            585.86, 290, 29, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1391,'01391','Paw', 'P', 'Play control Mr upon stop born especially.', 463.22, 947, 8, 
            612.73, 910, 91, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1392,'01392','WhiskerWisp Cat Toy Wand', 'P', 'Huge investment world car good parent within.', 338.65, 620, 16, 
            446.65, 533, 95, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1393,'01393','FetchField Natural Rubber Dog Ball', 'P', 'State ten trip ball instead series.', 106.98, 1443, 8, 
            145.22, 530, 31, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1394,'01394','SootheSoft Calming Pet Bed', 'P', 'Family hot water simple.', 254.68, 2952, 5, 
            321.42, 324, 64, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1395,'01395','Aquamarine Dream Fish Tank Ornament', 'P', 'Exactly section article process push.', 66.65, 802, 6, 
            93.05, 293, 33, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1396,'01396','TrailTrekker Collapsible Dog Bowl', 'P', 'Public president chance table.', 296.68, 486, 16, 
            334.08, 629, 17, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1397,'01397','FeatherFolly Interactive Bird Toy', 'P', 'Floor pull political.', 202.76, 293, 8, 
            236.75, 148, 26, 14);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1398,'01398','Celestial Charm Pendant Necklace', 'P', 'Give allow tree able candidate lay do.', 163.0, 525, 2, 
            198.52, 954, 70, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1399,'01399','Midnight Sparkle Stud Earrings', 'P', 'Machine include occur continue community particularly majority.', 184.52, 769, 2, 
            229.47, 202, 66, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1400,'01400','Timeless Elegance Pocket Watch', 'P', 'Face how southern result modern answer decision.', 229.5, 981, 4, 
            284.22, 530, 60, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1401,'01401','Ocean Whisper Pearl Necklace', 'P', 'Role soldier same difference commercial outside foot speech.', 334.1, 810, 6, 
            393.76, 99, 72, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1402,'01402','Aurora Halo Diamond Earrings', 'P', 'Wide keep either.', 14.72, 315, 4, 
            19.86, 378, 68, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1403,'01403','Solar Flare Chronograph Watch', 'P', 'Bar practice tough good political hard project million.', 26.21, 1732, 16, 
            37.09, 249, 41, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1404,'01404','Mystic Moonstone Drop Necklace', 'P', 'Space last Republican exist research region.', 383.41, 140, 9, 
            490.88, 920, 52, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1405,'01405','Radiant Sunburst Hoop Earrings', 'P', 'Interesting attention then not.', 480.65, 2975, 7, 
            675.39, 709, 53, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1406,'01406','Infinity Loop Leather Watch', 'P', 'Short my back operation.', 4.7, 575, 19, 
            5.84, 168, 22, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1407,'01407','Vintage Vine Engraved Necklace', 'P', 'Plan real side begin whole charge discussion.', 278.41, 2743, 2, 
            348.29, 419, 22, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1408,'01408','Crystal Cascade Chandelier Earrings', 'P', 'Expert Mr professor.', 156.03, 436, 19, 
            192.83, 584, 55, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1409,'01409','Horizon Line Smartwatch', 'P', 'Visit treat today surface finally.', 467.0, 1811, 5, 
            581.82, 442, 42, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1410,'01410','Enchanted Forest Pendant', 'P', 'Responsibility learn front art group travel.', 364.32, 436, 14, 
            429.62, 880, 59, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1411,'01411','Starlight Symphony Earrings', 'P', 'Moment serve society real.', 69.58, 206, 7, 
            100.51, 526, 69, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1412,'01412','Lunar Phase Automatic Watch', 'P', 'World its society blue yourself.', 483.57, 588, 18, 
            559.74, 686, 67, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1413,'01413','Whispering Willow Leaf Necklace', 'P', 'Should water production small marriage defense.', 141.41, 956, 16, 
            162.78, 231, 31, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1414,'01414','Golden Hour Stud Earrings', 'P', 'Human everybody today stuff industry room far.', 474.91, 716, 11, 
            623.03, 252, 19, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1415,'01415','Urban Elegance Mesh Watch', 'P', 'Item cultural leader appear final.', 25.45, 2632, 11, 
            28.28, 684, 85, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1416,'01416','Sapphire Sea Locket Necklace', 'P', 'Teach election face difficult mouth let.', 375.79, 2931, 20, 
            538.44, 323, 10, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1417,'01417','Twilight Twinkle Drop Earrings', 'P', 'Political ever trouble say become create.', 418.4, 762, 20, 
            466.75, 127, 89, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1418,'01418','Classic Heritage Pocket Watch', 'P', 'Cost really somebody discover store.', 393.48, 678, 7, 
            573.65, 406, 30, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1419,'01419','Secret Garden Charm Necklace', 'P', 'Current situation push job most stage activity task.', 163.16, 2844, 6, 
            189.07, 265, 63, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1420,'01420','Rose Gold Bliss Hoop Earrings', 'P', 'Response among cell sing special property always candidate.', 360.39, 27, 14, 
            519.23, 724, 24, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1421,'01421','Voyager World Time Watch', 'P', 'Least send happen control box people per now.', 278.06, 567, 7, 
            352.03, 87, 13, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1422,'01422','Regal Ruby Heart Necklace', 'P', 'Miss military third dinner trip.', 429.72, 343, 5, 
            595.13, 471, 61, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1423,'01423','Shimmering Snowflake Earrings', 'P', 'Visit past source recently century from.', 438.11, 408, 9, 
            512.64, 163, 87, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1424,'01424','Navigator''s Vintage Chronograph', 'P', 'Law apply seek.', 39.14, 290, 12, 
            44.44, 862, 77, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1425,'01425','Phoenix Fire Pendant Necklace', 'P', 'Wind find stuff brother.', 342.23, 390, 7, 
            405.4, 393, 77, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1426,'01426','Eclipse Shadow Stud Earrings', 'P', 'Always claim argue hair.', 214.21, 335, 5, 
            298.3, 915, 60, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1427,'01427','Metropolitan Smartwatch', 'P', 'Job outside home catch although.', 371.65, 454, 17, 
            412.28, 115, 65, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1428,'01428','Harmony Songbird Necklace', 'P', 'Nice nothing interview eat site.', 183.03, 2891, 9, 
            230.61, 154, 86, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1429,'01429','Opulent Orbit Circle Earrings', 'P', 'Record stage entire final.', 332.25, 667, 17, 
            402.94, 91, 95, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1430,'01430','Timekeeper''s Heirloom Watch', 'P', 'Example site first kind cell.', 189.7, 125, 4, 
            280.88, 974, 24, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1431,'01431','Dazzling Daisy Chain Necklace', 'P', 'Hear kind protect than usually indeed necessary.', 335.26, 60, 7, 
            400.17, 259, 77, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1432,'01432','Aurora Borealis Teardrop Earrings', 'P', 'Born news senior process month level.', 137.8, 566, 15, 
            171.73, 176, 94, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1433,'01433','Pioneer Spirit Smartwatch', 'P', 'Until walk both lawyer instead hospital over.', 320.95, 2214, 7, 
            460.51, 53, 65, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1434,'01434','Tranquil Tide Gemstone Necklace', 'P', 'Find vote event term.', 457.05, 833, 14, 
            646.25, 887, 60, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1435,'01435','Majesty Crown Earrings', 'P', 'Source really dinner.', 260.93, 745, 14, 
            341.44, 447, 91, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1436,'01436','Old World Classic Watch', 'P', 'Read education social benefit coach control.', 425.11, 349, 13, 
            624.43, 579, 88, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1437,'01437','Butterfly Bliss Pendant Necklace', 'P', 'Former maintain claim decision may base along.', 229.82, 219, 4, 
            267.46, 363, 79, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1438,'01438','Silver Lining Hoop Earrings', 'P', 'Clearly science provide word station anyone.', 464.86, 2345, 6, 
            608.32, 931, 54, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1439,'01439','Perpetual Motion Kinetic Watch', 'P', 'Bill tax different executive.', 170.65, 436, 10, 
            200.96, 338, 58, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1440,'01440','Celestial Bodies Layered Necklace', 'P', 'In film live environmental research material.', 387.51, 2325, 20, 
            486.38, 574, 47, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1441,'01441','Art Deco Elegance Earrings', 'P', 'Glass month financial.', 338.99, 178, 4, 
            422.51, 618, 19, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1442,'01442','Urban Pulse Digital Watch', 'P', 'Probably natural health school.', 96.38, 435, 3, 
            111.7, 884, 62, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1443,'01443','Whispering Wind Feather Necklace', 'P', 'Wait number economy put many meet product.', 32.26, 1051, 15, 
            44.11, 87, 61, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1444,'01444','Midnight Masquerade Stud Earrings', 'P', 'Research American day under find local.', 232.71, 15, 4, 
            328.22, 990, 86, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1445,'01445','Heritage Heirloom Pocket Watch', 'P', 'Time suffer nation also all but also.', 62.44, 2177, 16, 
            90.7, 135, 73, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1446,'01446','Ocean''s Embrace Coral Necklace', 'P', 'Whose interesting financial way describe.', 404.71, 899, 5, 
            561.32, 209, 80, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1447,'01447','Fiery Comet Drop Earrings', 'P', 'Admit car year guess party option never music.', 287.67, 343, 10, 
            353.08, 269, 23, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1448,'01448','Elite Navigator Pilot Watch', 'P', 'Attack write once service magazine.', 466.34, 2059, 10, 
            698.32, 778, 54, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1449,'01449','Serene Lotus Blossom Necklace', 'P', 'Impact stage one assume find know as.', 207.15, 956, 16, 
            239.54, 821, 21, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1450,'01450','Glittering Galaxy Hoop Earrings', 'P', 'Politics senior threat network wait.', 238.34, 834, 6, 
            289.19, 465, 96, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1451,'01451','Executive Precision Watch', 'P', 'Top sea stay purpose method determine loss.', 462.0, 72, 7, 
            680.34, 888, 46, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1452,'01452','Majestic Peacock Pendant Necklace', 'P', 'Rate beautiful agency.', 301.83, 116, 3, 
            347.94, 558, 77, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1453,'01453','Vintage Lace Filigree Earrings', 'P', 'Generation no wall raise receive.', 97.83, 1035, 19, 
            116.42, 25, 75, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1454,'01454','Aviator''s Timeless Chronograph', 'P', 'Participant upon number perform theory argue produce.', 156.3, 402, 11, 
            201.12, 663, 21, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1455,'01455','Ethereal Spirit Dreamcatcher Necklace', 'P', 'Central production program enjoy.', 333.4, 702, 9, 
            481.75, 56, 31, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1456,'01456','Cascading Waterfall Earrings', 'P', 'Final recognize laugh fast anything any.', 419.07, 99, 14, 
            477.48, 3, 99, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1457,'01457','Rugged Explorer Smartwatch', 'P', 'Behind executive enjoy news edge floor agree.', 287.63, 947, 12, 
            417.1, 191, 70, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1458,'01458','Glimmering Twilight Star Necklace', 'P', 'Seem without play family option follow song.', 364.64, 2211, 18, 
            524.78, 28, 56, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1459,'01459','Lustrous Leaf Stud Earrings', 'P', 'Always then large bank middle its.', 443.24, 1047, 7, 
            627.91, 293, 49, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1460,'01460','Masterpiece Mechanical Watch', 'P', 'Citizen financial leader couple top.', 53.64, 543, 8, 
            75.08, 778, 85, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1461,'01461','Heart of the Ocean Necklace', 'P', 'Decision room attention nation director walk upon.', 366.19, 253, 16, 
            407.55, 337, 74, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1462,'01462','Golden Sunburst Earrings', 'P', 'Book forget what save.', 123.74, 367, 15, 
            148.05, 701, 61, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1463,'01463','Urban Modernist Watch', 'P', 'Quality happen since learn sign field tend who.', 88.58, 203, 17, 
            127.06, 892, 10, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1464,'01464','Radiant Rose Pendant Necklace', 'P', 'Congress at once great data radio plan.', 228.74, 835, 13, 
            320.56, 776, 77, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1465,'01465','Enchanted Emerald Earrings', 'P', 'Up trouble large service past cell company similar.', 20.86, 699, 5, 
            25.52, 270, 26, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1466,'01466','Aristocrat Antique Pocket Watch', 'P', 'Despite approach human mission.', 57.27, 681, 6, 
            83.82, 564, 23, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1467,'01467','Blooming Blossom Necklace', 'P', 'Exist fear approach own change catch away.', 224.66, 2129, 4, 
            293.78, 998, 98, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1468,'01468','Swirling Wind Chime Earrings', 'P', 'Her seem among the.', 61.58, 415, 3, 
            70.96, 78, 51, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1469,'01469','Precision Crafted Tourbillon Watch', 'P', 'Meet activity fill.', 206.79, 2376, 10, 
            242.2, 397, 15, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1470,'01470','Eternal Flame Memorial Necklace', 'P', 'Project happen three recently us.', 11.51, 259, 9, 
            16.77, 415, 85, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1471,'01471','Sparkling Spiral Hoop Earrings', 'P', 'Interest he prove begin western author light ability.', 184.04, 2329, 16, 
            254.04, 793, 40, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1472,'01472','Adventurer''s World Timer Watch', 'P', 'You condition key hold.', 267.43, 2208, 18, 
            389.74, 271, 10, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1473,'01473','Mystical Moon Pendant Necklace', 'P', 'Game mention despite.', 146.13, 125, 17, 
            212.14, 227, 40, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1474,'01474','Baroque Beauty Drop Earrings', 'P', 'Record heart idea sea.', 241.25, 1760, 2, 
            316.49, 346, 55, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1475,'01475','Grand Tourbillon Mechanical Watch', 'P', 'Use read difference attorney shoulder.', 399.8, 2877, 9, 
            511.84, 178, 13, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1476,'01476','Soaring Spirit Eagle Necklace', 'P', 'Catch oil mention.', 74.66, 235, 2, 
            98.0, 643, 10, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1477,'01477','Twilight''s Last Gleaming Earrings', 'P', 'Party field buy any various rate.', 150.39, 749, 15, 
            213.29, 858, 83, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1478,'01478','Cosmopolitan Connect Smartwatch', 'P', 'Process camera major strategy.', 191.55, 354, 13, 
            212.11, 350, 12, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1479,'01479','Divine Divinity Cross Necklace', 'P', 'Prevent million because instead this end.', 219.03, 71, 12, 
            248.34, 655, 46, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1480,'01480','Royal Regalia Crown Earrings', 'P', 'Technology together west run.', 332.86, 878, 9, 
            406.43, 74, 81, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1481,'01481','Time Traveler Pocket Watch', 'P', 'Range only between.', 242.24, 2806, 14, 
            307.95, 558, 17, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1482,'01482','Whimsical Whirlwind Pendant Necklace', 'P', 'Like project place language if thought force.', 31.59, 1991, 16, 
            35.14, 71, 47, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1483,'01483','Dancing Dragonfly Earrings', 'P', 'Drug kind our free daughter energy.', 462.31, 972, 19, 
            525.86, 518, 38, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1484,'01484','Elite Executive Wristwatch', 'P', 'Although grow year moment happen allow.', 66.26, 869, 5, 
            77.93, 604, 15, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1485,'01485','Sacred Geometry Pendant Necklace', 'P', 'Within Mr similar development.', 116.8, 314, 18, 
            173.2, 27, 92, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1486,'01486','Prismatic Light Hoop Earrings', 'P', 'State seat himself race spend after big else.', 293.56, 1625, 3, 
            339.3, 252, 97, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1487,'01487','Vanguard Visionary Smartwatch', 'P', 'Really the eat group work society.', 5.86, 93, 19, 
            8.12, 619, 82, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1488,'01488','Angel''s Whisper Necklace', 'P', 'Prepare surface human statement.', 294.14, 1863, 5, 
            433.53, 719, 53, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1489,'01489','Rhapsody in Blue Sapphire Earrings', 'P', 'What fund better street tax phone how.', 259.56, 415, 7, 
            295.72, 228, 84, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1490,'01490','Legacy Luxury Watch', 'P', 'Use author happen establish.', 105.22, 932, 2, 
            123.74, 638, 33, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1491,'01491','Dreamcatcher''s Delight Necklace', 'P', 'Leader education current blue quality ago sister.', 242.38, 1928, 12, 
            281.96, 114, 71, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1492,'01492','Silver Serenade Chandelier Earrings', 'P', 'Same agent event soon necessary lay hospital soldier.', 315.34, 687, 11, 
            451.22, 191, 26, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1493,'01493','Quantum Leap Smartwatch', 'P', 'Base technology environmental least bad start.', 477.62, 2759, 18, 
            544.24, 280, 82, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1494,'01494','Harmony in Heart Necklace', 'P', 'And couple mission everybody.', 199.25, 288, 15, 
            219.61, 949, 85, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1495,'01495','Gilded Glamour Stud Earrings', 'P', 'Middle economy relationship many.', 380.29, 2422, 10, 
            514.88, 888, 82, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1496,'01496','Renaissance Revival Pocket Watch', 'P', 'Local seek institution culture fight answer ready collection.', 21.41, 1139, 3, 
            30.15, 285, 69, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1497,'01497','Star Voyager Astronomical Watch', 'P', 'Fill turn actually shake blue responsibility debate.', 451.85, 915, 2, 
            669.09, 624, 97, 15);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1498,'01498','"Eclipse" - Limited Edition Vinyl by Luna Harmonics', 'P', 'Herself bank foreign according alone environment figure pull.', 286.7, 2285, 4, 
            342.02, 112, 47, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1499,'01499','"RetroGroove Classics" - 80s Hits Compilation CD', 'P', 'Sea inside claim able cup.', 437.86, 303, 2, 
            577.77, 972, 56, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1500,'01500','"Midnight Jazz Sessions" - Live Concert DVD', 'P', 'Amount use wind nor all.', 158.99, 2423, 4, 
            194.32, 857, 50, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1501,'01501','"Urban Anthems" - Vinyl Collection of City Beats', 'P', 'Recent nothing seven together court successful let base.', 167.38, 30, 6, 
            244.9, 628, 53, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1502,'01502','"Golden Oldies" - Remastered Hits CD Box Set', 'P', 'See product other serious eat term inside.', 350.4, 975, 15, 
            471.5, 874, 66, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1503,'01503','"Cinema Legends" - Collector’s Edition Classic Films DVD', 'P', 'Let Mrs administration radio.', 174.07, 382, 19, 
            236.1, 735, 95, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1504,'01504','"Acoustic Serenity" - Meditation Music Vinyl', 'P', 'Responsibility soldier enjoy marriage rock them.', 455.57, 2687, 8, 
            528.32, 616, 71, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1505,'01505','"Dance Floor Fire" - Top Club Hits CD', 'P', 'Produce full year mean.', 286.05, 687, 17, 
            418.72, 343, 12, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1506,'01506','"Epic Soundtracks" - Iconic Movie Scores Vinyl Series', 'P', 'Key age season myself power.', 49.03, 685, 3, 
            68.17, 671, 91, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1507,'01507','"Rock Revolution" - Definitive Collection CD', 'P', 'Take yourself start close course.', 442.21, 2709, 8, 
            555.6, 331, 33, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1508,'01508','"Vinyl Vibes" - Chill Lo-fi Beats Record', 'P', 'Week view carry painting conference behind race once.', 14.54, 470, 2, 
            21.01, 655, 83, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1509,'01509','"Soulful Sessions" - Live R&B and Soul DVD', 'P', 'Write window garden every owner prove lot.', 405.21, 849, 20, 
            557.23, 538, 34, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1510,'01510','"Guitar Gods" - Legendary Solos Vinyl Edition', 'P', 'Else deep test huge hospital improve public.', 41.46, 1058, 11, 
            57.69, 75, 92, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1511,'01511','"Indie Invasion" - Breakthrough Artists Compilation CD', 'P', 'Hair him spend whatever public our skin side.', 478.28, 629, 10, 
            623.74, 310, 50, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1512,'01512','"Horror Classics" - Ultimate Scary Movies DVD Set', 'P', 'Room table able hour until whether.', 127.57, 465, 16, 
            188.18, 316, 38, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1513,'01513','"Techno Pulse" - Essential Dance Tracks Vinyl', 'P', 'Write fish election play organization stop black.', 196.47, 453, 17, 
            218.91, 255, 52, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1514,'01514','"Unplugged" - Acoustic Hits from the 90s CD', 'P', 'Total apply movie.', 107.6, 969, 19, 
            119.25, 853, 53, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1515,'01515','"Cinematic Journeys" - Epic Film Collection DVD', 'P', 'Suffer total attorney total heart receive.', 15.05, 932, 5, 
            19.04, 672, 25, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1516,'01516','"Vinyl Renaissance" - The Revival Mix', 'P', 'Similar western suggest yourself.', 383.06, 1469, 9, 
            567.75, 497, 40, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1517,'01517','"The Jazz Experience" - Essential Recordings CD', 'P', 'Can detail generation house order out.', 487.67, 1476, 20, 
            620.71, 988, 25, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1518,'01518','"Action Heroes" - High-Octane Films DVD Collection', 'P', 'Truth fast central never manage century.', 496.92, 206, 15, 
            589.38, 14, 17, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1519,'01519','"Reggae Roots" - Iconic Tracks Vinyl Edition', 'P', 'Friend ahead chance suffer goal democratic.', 317.8, 2631, 2, 
            438.45, 399, 12, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1520,'01520','"Divas of the Decades" - Female Vocalists CD', 'P', 'Former talk himself a enjoy think.', 333.55, 988, 10, 
            428.51, 961, 54, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1521,'01521','"Sci-Fi Sagas" - Legendary Series DVD Box Set', 'P', 'Opportunity bill recent beyond.', 173.32, 192, 3, 
            196.11, 778, 100, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1522,'01522','"Blues Highway" - Classic Blues Compilation Vinyl', 'P', 'Around worry who Mrs.', 206.19, 395, 14, 
            254.89, 36, 59, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1523,'01523','"Pop Icons" - Ultimate Hits CD', 'P', 'Teacher a nothing company.', 131.96, 2306, 16, 
            151.96, 86, 83, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1524,'01524','"Thriller Nights" - Classic Suspense Movies DVD', 'P', 'Likely tough quickly important live whole.', 286.23, 1635, 5, 
            427.3, 921, 73, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1525,'01525','"Rockabilly Riot" - Vintage Vinyl Collection', 'P', 'Lay often size media fact.', 215.09, 2180, 5, 
            263.54, 745, 82, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1526,'01526','"Opera Masterpieces" - Timeless Performances CD', 'P', 'Audience follow one ago.', 376.0, 1594, 12, 
            427.04, 692, 35, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1527,'01527','"Family Favorites" - Animated Classics DVD Set', 'P', 'Democrat loss art floor enjoy tree car newspaper.', 445.05, 293, 8, 
            506.02, 694, 25, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1528,'01528','"Vinyl Nights" - Smooth Jazz Edition', 'P', 'Perform spend enter religious speak catch.', 265.3, 210, 11, 
            329.02, 190, 36, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1529,'01529','"Country Roads" - Legendary Country Hits CD', 'P', 'Away provide pattern.', 27.43, 546, 14, 
            32.75, 657, 99, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1530,'01530','"Epic Adventures" - Fantasy & Action DVD Series', 'P', 'Rather civil main view hard.', 90.56, 1165, 13, 
            102.0, 916, 84, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1531,'01531','"Punk Power" - Raw and Rebellious Vinyl', 'P', 'Pattern purpose win focus particularly hot east.', 267.39, 517, 4, 
            384.85, 827, 35, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1532,'01532','"Singer-Songwriter Souls" - Inspirational CD', 'P', 'Region ground no goal become money.', 100.76, 1033, 10, 
            126.86, 634, 34, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1533,'01533','"Comedy Gold" - Timeless Stand-up and Films DVD', 'P', 'Significant box perhaps movie.', 101.26, 150, 18, 
            141.99, 51, 79, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1534,'01534','"Vinyl Dreams" - Psychedelic Rock Collection', 'P', 'Remember likely successful who vote tonight.', 25.0, 475, 15, 
            31.6, 496, 49, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1535,'01535','"Classical Harmony" - Essential Classics CD', 'P', 'Avoid book turn receive party chair my.', 7.67, 1384, 2, 
            9.28, 965, 83, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1536,'01536','"Mystery & Magic" - Enchanting Films DVD Box Set', 'P', 'Page town quality field firm someone summer material.', 240.98, 1024, 12, 
            265.38, 883, 36, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1537,'01537','"Retro Disco" - Ultimate Party Vinyl', 'P', 'International great several challenge wide ever.', 375.0, 827, 2, 
            539.83, 856, 70, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1538,'01538','"Legends Live" - Iconic Concerts CD', 'P', 'Little yet control pass this lawyer tell.', 129.36, 788, 10, 
            183.03, 147, 61, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1539,'01539','"Cult Classics" - Underground Films DVD Collection', 'P', 'Interesting president situation.', 484.2, 2841, 3, 
            570.54, 48, 74, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1540,'01540','"Groove Galaxy" - Funk and Soul Vinyl', 'P', 'Treat form big.', 451.11, 2248, 5, 
            510.79, 683, 21, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1541,'01541','"Melodic Memories" - Nostalgic Hits CD', 'P', 'Somebody despite head thousand culture form.', 450.29, 852, 11, 
            535.02, 189, 35, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1542,'01542','"Animation Anthology" - Beloved Cartoons DVD', 'P', 'Less magazine past.', 80.91, 1991, 15, 
            100.59, 54, 34, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1543,'01543','"Vinyl Frontier" - Space Age Sounds Record', 'P', 'As last player hour opportunity after.', 73.55, 363, 8, 
            94.53, 548, 89, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1544,'01544','"Ballads of the Heart" - Romantic Hits CD', 'P', 'Every treat well art forget commercial.', 394.32, 2134, 14, 
            582.15, 472, 34, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1545,'01545','"Documentary Discoveries" - Enlightening Films DVD', 'P', 'All suggest purpose.', 300.53, 1211, 18, 
            376.09, 68, 54, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1546,'01546','"Holiday Harmonies" - Festive Vinyl Collection', 'P', 'Discover war feel eat cultural ever town.', 403.11, 861, 20, 
            592.27, 633, 16, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1547,'01547','"Soundscapes" - Ambient and New Age CD', 'P', 'Gas network organization because ago.', 377.5, 22, 2, 
            528.25, 691, 53, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1548,'01548','"War Epics" - Historic Battle Movies DVD Set', 'P', 'Whole unit happy stage safe.', 25.76, 2121, 20, 
            33.32, 815, 92, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1549,'01549','"Beat Breakers" - Essential Hip-Hop Vinyl', 'P', 'Into war discussion.', 394.15, 2703, 6, 
            444.81, 442, 24, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1550,'01550','"Grunge Legends" - 90s Rock Icons CD', 'P', 'West discussion whom agree wonder movement best.', 368.77, 669, 15, 
            487.74, 259, 31, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1551,'01551','"Wild West" - Classic Westerns DVD Collection', 'P', 'Hospital close middle build big mission.', 437.24, 620, 19, 
            654.37, 513, 60, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1552,'01552','"Vinyl Revival" - Garage Band Gems', 'P', 'Difficult out onto cup.', 437.45, 10, 14, 
            487.77, 301, 20, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1553,'01553','"Symphonic Splendor" - Classical Masterworks CD', 'P', 'There we learn song everyone add daughter.', 243.92, 1384, 14, 
            330.36, 691, 48, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1554,'01554','"Laugh Out Loud" - Comedy Hits DVD', 'P', 'Be some across unit political nothing store.', 325.48, 730, 11, 
            436.4, 624, 24, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1555,'01555','"ElectroWave" - Synth-Pop and Electronic Vinyl', 'P', 'Evidence want order thousand fight whether bad.', 247.43, 97, 11, 
            283.43, 327, 41, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1556,'01556','"Vocal Virtuosos" - Live Opera and Classical CD', 'P', 'Tell southern yard art.', 263.05, 913, 5, 
            306.05, 554, 12, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1557,'01557','"Romantic Comedies" - Heartwarming Films DVD', 'P', 'Go around Congress.', 90.12, 2947, 9, 
            127.68, 764, 89, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1558,'01558','"Vinyl Escape" - Ambient Nature Sounds Record', 'P', 'Create thus southern here meeting conference also.', 315.4, 736, 6, 
            396.77, 140, 45, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1559,'01559','"Power Ballads" - Epic Love Songs CD', 'P', 'Approach behavior agree reach fast.', 34.82, 580, 16, 
            45.0, 868, 38, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1560,'01560','"Musical Masterpieces" - Broadway Shows DVD Set', 'P', 'Each college term wide under town probably.', 418.57, 913, 12, 
            536.98, 573, 80, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1561,'01561','"Indie Innovators" - Experimental Sounds Vinyl', 'P', 'Participant leave down evening feel.', 231.55, 345, 9, 
            345.78, 730, 12, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1562,'01562','"Motown Magic" - Soulful Hits Compilation CD', 'P', 'Factor act believe customer sport star everyone.', 388.3, 439, 11, 
            535.85, 146, 38, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1563,'01563','"Film Noir Classics" - Vintage Crime Dramas DVD', 'P', 'Trial treatment travel we consumer.', 354.06, 918, 17, 
            427.03, 471, 80, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1564,'01564','"Vinyl Grooves" - Rare Funk & Soul Collection', 'P', 'Name test north another spend draw section suggest.', 338.42, 2345, 16, 
            433.7, 872, 59, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1565,'01565','"Metal Mayhem" - Headbanging Hits CD', 'P', 'Little show catch on relate treat market west.', 47.34, 453, 12, 
            58.22, 234, 99, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1566,'01566','"Nature’s Wonders" - Scenic Documentaries DVD', 'P', 'Officer opportunity piece forget occur TV.', 453.32, 166, 15, 
            533.69, 718, 20, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1567,'01567','"Underground Vinyl" -', 'P', 'Somebody cause star arm.', 478.85, 2091, 11, 
            675.46, 395, 87, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1568,'01568','"Echoes of Eternity" - Ambient Sounds Vinyl', 'P', 'Week enter teacher half ability shake.', 451.41, 314, 17, 
            574.85, 765, 90, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1569,'01569','"Retro Grooves" - Classic Hits Vinyl Collection', 'P', 'Fine phone paper.', 371.39, 264, 16, 
            534.87, 114, 57, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1570,'01570','"Midnight Serenade" - Jazz CD Compilation', 'P', 'Five appear out information seek expert create law.', 447.18, 2272, 16, 
            543.45, 610, 14, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1571,'01571','"Galactic Journeys" - Sci-Fi Movie DVD', 'P', 'Option I star college short against address.', 455.25, 558, 5, 
            549.09, 434, 43, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1572,'01572','"Rhythms of the Rainforest" - Nature Sounds CD', 'P', 'Allow impact radio.', 449.34, 1603, 4, 
            586.51, 727, 74, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1573,'01573','"Golden Age Cinema" - Classic Films DVD Box Set', 'P', 'Environmental hot capital hotel hour.', 411.52, 141, 12, 
            576.92, 81, 40, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1574,'01574','"Urban Beats" - Hip-Hop Vinyl Anthology', 'P', 'Build note heavy home first stage somebody.', 203.17, 2781, 10, 
            225.02, 675, 55, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1575,'01575','"Siren Songs" - Female Vocalists Vinyl Record', 'P', 'Forget place evening factor practice.', 127.28, 121, 7, 
            180.84, 569, 13, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1576,'01576','"High Tide" - Surf Rock Classics CD', 'P', 'Rather call beautiful reveal.', 385.96, 2806, 16, 
            552.25, 266, 54, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1577,'01577','"Candlelight Classics" - Romantic Music Vinyl', 'P', 'Blood someone address often check sport language.', 298.94, 172, 8, 
            418.43, 43, 77, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1578,'01578','"Silver Screen Scores" - Movie Soundtracks CD', 'P', 'Fast ten some professor.', 429.54, 1229, 13, 
            565.17, 192, 56, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1579,'01579','"Beyond the Horizon" - Adventure Documentary DVD', 'P', 'Reach later and authority work as point.', 21.83, 576, 13, 
            24.37, 336, 82, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1580,'01580','"Nostalgic Notes" - 80s Hits Record Collection', 'P', 'Enough employee agree plant send we item.', 431.35, 2796, 20, 
            514.57, 346, 95, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1581,'01581','"Haunting Melodies" - Gothic Rock CD', 'P', 'Whom series describe.', 378.79, 611, 5, 
            514.19, 379, 35, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1582,'01582','"Laugh Out Loud" - Comedy Specials DVD Set', 'P', 'Third develop fight wife today watch learn.', 357.24, 1382, 11, 
            421.5, 15, 87, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1583,'01583','"Soulful Strums" - Acoustic Guitar Vinyl Album', 'P', 'Leader front factor.', 165.52, 1417, 5, 
            231.31, 25, 71, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1584,'01584','"Dreamscapes" - Electronic Ambient DVD', 'P', 'Than manager mother happy.', 82.78, 968, 15, 
            104.11, 446, 18, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1585,'01585','"Legends of Blues" - Essential Blues Vinyl', 'P', 'College factor hit create television choice local.', 477.59, 1863, 14, 
            586.59, 657, 63, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1586,'01586','"Starlight Ballads" - Classic Love Songs CD', 'P', 'Above you everyone accept could ball fear.', 271.13, 1216, 5, 
            299.83, 63, 14, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1587,'01587','"Mystery Theatre" - Thriller Movie Collection DVD', 'P', 'Case first however rise yet authority sell serious.', 417.56, 2211, 17, 
            607.86, 789, 54, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1588,'01588','"Sunrise Sessions" - Morning Jazz CD Set', 'P', 'Contain structure response serve low turn should.', 378.66, 1249, 17, 
            486.64, 59, 51, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1589,'01589','"Vinyl Vibes" - Indie Hits Record Compilation', 'P', 'Worker finish run treat about.', 291.72, 600, 17, 
            335.28, 259, 10, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1590,'01590','"Epic Tales" - Historical Drama DVD Series', 'P', 'Memory message night lawyer create.', 419.89, 119, 2, 
            476.99, 703, 54, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1591,'01591','"Heartland Harmonies" - Country Classics Vinyl', 'P', 'Responsibility attack certainly practice.', 408.51, 2824, 7, 
            612.71, 159, 88, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1592,'01592','"Rock Revolution" - Legendary Rock Albums CD', 'P', 'Whose listen whatever blood statement.', 238.75, 1485, 11, 
            344.02, 230, 40, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1593,'01593','"Dance Floor Anthems" - Disco and Funk Vinyl', 'P', 'Executive major day total suffer college bar.', 154.4, 475, 18, 
            220.22, 509, 94, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1594,'01594','"Cinema Icons" - Award-Winning Films DVD', 'P', 'Lay art it purpose.', 358.13, 576, 3, 
            528.55, 108, 58, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1595,'01595','"Acoustic Essence" - Singer-Songwriter CD', 'P', 'Realize party indeed long bank expect though.', 235.1, 1370, 19, 
            321.18, 191, 74, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1596,'01596','"Vinyl Frontier" - Space-Themed Music Record', 'P', 'Prove bank commercial step.', 407.04, 1075, 4, 
            581.69, 838, 24, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1597,'01597','"Comedy Gold" - Stand-Up Classics DVD Collection', 'P', 'Decision high believe.', 305.77, 1050, 10, 
            449.24, 242, 62, 16);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1598,'01598','CyberCore Gaming Laptop', 'P', 'Environment fall eye yourself contain.', 12.36, 130, 6, 
            15.21, 194, 13, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1599,'01599','QuantumByte SSD Drive', 'P', 'Picture seven something talk.', 306.32, 237, 16, 
            369.64, 749, 47, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1600,'01600','EchoSync Wireless Earbuds for Gamers', 'P', 'Will common watch.', 28.19, 2202, 3, 
            34.46, 708, 95, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1601,'01601','PixelPro 4K Monitor', 'P', 'Ball responsibility network.', 242.84, 278, 20, 
            355.17, 620, 57, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1602,'01602','ThunderNet High-Speed Router', 'P', 'Organization something east near direction.', 238.42, 2376, 13, 
            312.57, 587, 47, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1603,'01603','StealthTouch Backlit Mechanical Keyboard', 'P', 'Rise soon quite.', 439.72, 596, 6, 
            652.85, 33, 54, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1604,'01604','VisionQuest VR Headset', 'P', 'Dark size finish recognize partner specific yet.', 369.68, 1785, 14, 
            440.95, 638, 60, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1605,'01605','AlphaWave Noise-Cancelling Headphones', 'P', 'Third lead food wind subject left administration organization.', 243.23, 749, 10, 
            297.91, 283, 54, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1606,'01606','RazorSharp Graphics Tablet', 'P', 'Meet message off range risk.', 185.52, 811, 20, 
            260.82, 756, 96, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1607,'01607','PhotonBeam Projector', 'P', 'Follow value employee order others.', 264.95, 2952, 17, 
            303.32, 831, 69, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1608,'01608','StreamMaster Live Streaming Kit', 'P', 'Old college teacher rich child collection share.', 203.75, 1192, 2, 
            302.95, 128, 53, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1609,'01609','CodeCraft Developer Software Suite', 'P', 'Interesting light life experience away.', 481.93, 1090, 11, 
            573.08, 480, 67, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1610,'01610','InfinityPad Drawing Tablet', 'P', 'Spring around care thousand who.', 81.97, 2589, 6, 
            112.64, 92, 27, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1611,'01611','ZenithPower Desktop PSU', 'P', 'Success guy brother picture collection tell with.', 227.23, 2969, 12, 
            265.35, 717, 45, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1612,'01612','CloudVault Personal Storage Solution', 'P', 'Generation final teach try.', 303.92, 723, 12, 
            341.66, 434, 62, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1613,'01613','VirtualStudio Video Editing Software', 'P', 'Page draw bar hot power forward edge machine.', 298.98, 688, 4, 
            378.65, 843, 70, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1614,'01614','TitanCase Waterproof Laptop Case', 'P', 'Attorney no her loss.', 414.26, 835, 2, 
            553.18, 278, 74, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1615,'01615','HyperLink USB-C Hub', 'P', 'Happy join poor.', 109.21, 150, 19, 
            149.53, 211, 80, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1616,'01616','NovaShield Anti-Virus Software', 'P', 'Others turn beat know section finish prepare indeed.', 473.44, 799, 13, 
            560.28, 59, 17, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1617,'01617','PulseAudio Sound Mixer', 'P', 'Activity involve watch story.', 134.31, 2693, 8, 
            193.22, 206, 96, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1618,'01618','OrbitTrack Satellite Mouse', 'P', 'Certainly nothing firm popular mention change end.', 174.72, 253, 19, 
            194.25, 58, 43, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1619,'01619','NebulaCloud Web Hosting Service', 'P', 'Program indicate million.', 479.84, 810, 12, 
            632.99, 126, 34, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1620,'01620','LightningPort Portable Charger', 'P', 'Significant without culture at information.', 475.53, 864, 17, 
            605.84, 248, 57, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1621,'01621','CryptoSafe Encryption Software', 'P', 'Great girl avoid big law people project.', 438.52, 30, 7, 
            536.7, 297, 40, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1622,'01622','AeroCool Silent PC Fan', 'P', 'Once number wish case service.', 192.22, 1278, 14, 
            222.04, 936, 85, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1623,'01623','SwiftScan Document Scanner', 'P', 'Guess officer evidence second nothing.', 55.3, 2272, 2, 
            75.17, 895, 94, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1624,'01624','PrecisionPen Stylus', 'P', 'Speak item box to ask great financial.', 206.11, 311, 19, 
            301.38, 29, 13, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1625,'01625','BlackOut Privacy Screen Filter', 'P', 'Only usually issue dog.', 12.12, 2211, 19, 
            15.78, 227, 39, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1626,'01626','DreamColor LED Strip Lights', 'P', 'Itself common whose weight environment people.', 231.26, 297, 8, 
            271.49, 68, 59, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1627,'01627','DataDefender Firewall Appliance', 'P', 'Wonder happy include six sit there.', 86.44, 651, 16, 
            126.06, 5, 55, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1628,'01628','UltraFlex Folding Bluetooth Keyboard', 'P', 'Mean mouth phone.', 154.07, 708, 15, 
            172.19, 38, 80, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1629,'01629','GhostDrive External Hard Drive', 'P', 'Series discover learn.', 190.31, 2721, 20, 
            227.03, 637, 88, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1630,'01630','SpectrumPro Color Calibration Tool', 'P', 'Population subject grow impact however simply main.', 425.72, 748, 3, 
            507.55, 406, 29, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1631,'01631','MasterMind Strategy Game Software', 'P', 'Current week here later medical.', 390.52, 642, 16, 
            451.83, 843, 88, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1632,'01632','StarField Laser Pointer', 'P', 'At win attorney have offer fact.', 352.82, 1382, 2, 
            491.97, 627, 68, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1633,'01633','AquaProof Keyboard Cover', 'P', 'Computer important improve deep.', 204.98, 1602, 7, 
            236.57, 612, 96, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1634,'01634','IronLock VPN Service', 'P', 'Much face someone now five final.', 282.67, 650, 9, 
            401.01, 966, 27, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1635,'01635','PowerSurge Protector Strip', 'P', 'Building career treatment study may tree eight.', 59.23, 312, 11, 
            68.34, 665, 61, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1636,'01636','OmniPrint 3D Printer', 'P', 'Attorney finish class leg box.', 239.25, 2824, 16, 
            354.22, 21, 41, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1637,'01637','ZenStream Streaming Device', 'P', 'Society protect either cover.', 307.32, 638, 14, 
            376.78, 81, 66, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1638,'01638','EchoMic USB Microphone', 'P', 'Later plant southern report child.', 215.85, 2281, 17, 
            239.08, 405, 20, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1639,'01639','CyberGuard Webcam Cover', 'P', 'Author right American lawyer laugh.', 132.01, 262, 12, 
            155.49, 576, 91, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1640,'01640','TitanGrip Gaming Mouse', 'P', 'Begin six his.', 21.35, 1307, 11, 
            31.0, 995, 45, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1641,'01641','PixelPerfect Photo Printer', 'P', 'Because house kind when company.', 99.79, 1001, 3, 
            111.8, 455, 85, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1642,'01642','SolarSync Solar-Powered Wireless Mouse', 'P', 'Health discuss itself how world spring kid.', 357.81, 624, 6, 
            439.0, 854, 21, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1643,'01643','ThunderCharge Fast Charging Dock', 'P', 'Office measure better who.', 141.34, 545, 18, 
            177.2, 305, 83, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1644,'01644','BinaryBand Smartwatch', 'P', 'Until lay cut.', 390.65, 2661, 20, 
            542.18, 96, 68, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1645,'01645','VisionEnhance Screen Magnifier', 'P', 'Song mind newspaper.', 140.14, 638, 3, 
            163.57, 597, 27, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1646,'01646','SoundSphere Desktop Speakers', 'P', 'Never represent bring already must say.', 305.24, 1758, 17, 
            419.23, 377, 55, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1647,'01647','DataDive Recovery Software', 'P', 'Large small tend cover tough reduce result.', 89.77, 1620, 8, 
            110.38, 274, 63, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1648,'01648','FusionPad Dual OS Tablet', 'P', 'Magazine family authority discussion role woman administration project.', 402.6, 2632, 7, 
            458.86, 675, 75, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1649,'01649','GlideTouch Touchpad Enhancer', 'P', 'Least thank again traditional matter report despite wonder.', 41.04, 730, 6, 
            53.61, 742, 38, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1650,'01650','MemoryMatrix RAM Upgrade Kit', 'P', 'Least nice myself never.', 488.14, 1779, 15, 
            654.28, 529, 78, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1651,'01651','UltraView Desktop Organizer', 'P', 'Final top to explain little.', 361.18, 385, 3, 
            446.06, 281, 95, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1652,'01652','SpaceSaver Compact Keyboard', 'P', 'Skill each picture last poor case seat.', 371.25, 2866, 8, 
            519.7, 986, 94, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1653,'01653','PowerBoost Battery Pack', 'P', 'Somebody measure under development.', 248.68, 72, 5, 
            364.49, 373, 13, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1654,'01654','SecureKey USB Encryption Key', 'P', 'Drop matter mission never rate.', 267.41, 767, 7, 
            317.64, 27, 20, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1655,'01655','AirBridge WiFi Extender', 'P', 'Table kind call administration national adult ago.', 20.06, 119, 9, 
            29.76, 157, 71, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1656,'01656','PixelCraft Digital Art Software', 'P', 'Policy follow glass month outside.', 216.7, 1613, 17, 
            321.06, 673, 67, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1657,'01657','SwiftKey Programmable Macro Keyboard', 'P', 'Part include training chair.', 37.65, 1545, 16, 
            52.13, 524, 81, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1658,'01658','NetNinja Ad Blocker', 'P', 'Buy social store agency quite party note.', 79.83, 695, 10, 
            106.99, 641, 92, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1659,'01659','HarmonyHub Smart Home Controller', 'P', 'Chair record happy picture actually design provide.', 104.01, 150, 6, 
            132.86, 516, 86, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1660,'01660','CircuitMaster Electronics Toolkit', 'P', 'Congress candidate hand success third if Mr.', 425.5, 22, 10, 
            540.93, 808, 29, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1661,'01661','PhantomDrive Virtual Drive Software', 'P', 'Staff Congress data set culture majority name head.', 97.31, 2282, 9, 
            118.11, 415, 60, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1662,'01662','SparkLight LED Task Lamp', 'P', 'Budget appear ready available entire decade.', 484.98, 1904, 11, 
            727.42, 900, 84, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1663,'01663','QuantumLeap Time Management App', 'P', 'Most page few really.', 304.6, 2529, 11, 
            412.87, 861, 24, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1664,'01664','OmniHub Multi-Device Dock', 'P', 'Sound on skill activity could.', 17.25, 196, 18, 
            24.93, 788, 46, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1665,'01665','ShieldCase Anti-Shock Laptop Sleeve', 'P', 'Stop with increase.', 264.02, 210, 17, 
            366.13, 731, 69, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1666,'01666','BeatBlast Music Production Software', 'P', 'Cause ready citizen long receive.', 326.92, 1229, 10, 
            396.81, 364, 54, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1667,'01667','IronFrame Rugged Tablet Stand', 'P', 'Note adult quite public close nor.', 188.31, 104, 13, 
            276.43, 411, 75, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1668,'01668','TorrentStream Media Server', 'P', 'Better feeling challenge exactly break environmental.', 47.22, 2559, 19, 
            56.77, 726, 98, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1669,'01669','PixelShade Blue Light Filter Glasses', 'P', 'Discuss positive certain force hundred many.', 272.63, 439, 18, 
            311.15, 704, 56, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1670,'01670','ArcticChill CPU Liquid Cooler', 'P', 'Plan shake full short identify give agency effect.', 391.16, 2288, 14, 
            547.16, 577, 73, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1671,'01671','ProTune Audio Interface', 'P', 'Back than stay suggest still cover pick.', 440.85, 2328, 11, 
            630.93, 644, 82, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1672,'01672','FlashFire Gaming Controller', 'P', 'Smile mouth nature.', 60.64, 2805, 12, 
            79.54, 537, 42, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1673,'01673','UnityDock Universal Docking Station', 'P', 'Option art simply another bag throughout.', 180.64, 1437, 13, 
            233.58, 521, 43, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1674,'01674','PrintMaster 3D Printing Filament', 'P', 'Adult tend control man.', 395.65, 173, 7, 
            480.11, 569, 31, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1675,'01675','LunarLight Night Vision Webcam', 'P', 'May production team spring.', 150.54, 2045, 20, 
            191.79, 184, 12, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1676,'01676','Thunderbolt External SSD', 'P', 'Laugh perhaps appear.', 72.15, 1512, 13, 
            79.81, 236, 36, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1677,'01677','CodeCompiler Programming IDE', 'P', 'Get necessary have main every responsibility.', 74.18, 1904, 8, 
            108.26, 513, 87, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1678,'01678','PinnaclePro Video Conference Camera', 'P', 'Kitchen American appear statement able.', 4.42, 2415, 12, 
            5.62, 382, 80, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1679,'01679','CrystalClear Monitor Cleaning Kit', 'P', 'State son current other.', 234.34, 2415, 3, 
            283.71, 978, 80, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1680,'01680','OmegaCharge Wireless Charging Mat', 'P', 'Leader trial field too.', 245.13, 403, 20, 
            356.04, 22, 15, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1681,'01681','SoundWave Bluetooth Speakerphone', 'P', 'Have current along it some.', 160.66, 1038, 14, 
            182.96, 530, 61, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1682,'01682','StreamLine Content Management System', 'P', 'Record picture who difference follow improve effort.', 275.05, 439, 13, 
            401.47, 810, 84, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1683,'01683','VirtualBoard Interactive Whiteboard', 'P', 'Threat check price generation small exist up finally.', 63.29, 1469, 17, 
            83.66, 727, 12, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1684,'01684','TaskTitan Productivity Planner Software', 'P', 'Land simple another every that trouble television.', 72.78, 2264, 20, 
            107.25, 837, 36, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1685,'01685','CloudConnect IoT Gateway', 'P', 'Scene west car house small after maybe purpose.', 253.97, 933, 19, 
            313.19, 764, 77, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1686,'01686','DragonFire Network Security Scanner', 'P', 'Himself number happen structure yeah represent ability.', 320.43, 1317, 2, 
            422.09, 587, 19, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1687,'01687','InfinityDisplay Curved Monitor', 'P', 'Avoid million receive three decide.', 150.35, 1127, 15, 
            219.67, 26, 40, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1688,'01688','PhantomVPN Virtual Private Network Service', 'P', 'Adult hour partner interview box improve keep.', 232.8, 1941, 20, 
            292.99, 436, 35, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1689,'01689','PulseTracker Fitness Tracking Software', 'P', 'Group kind something thus per girl.', 116.82, 833, 5, 
            163.59, 545, 64, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1690,'01690','SpaceTech Astronomy Software', 'P', 'Pressure capital message bit difference.', 228.87, 580, 12, 
            308.18, 757, 21, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1691,'01691','RapidRender Video Rendering GPU', 'P', 'Loss receive audience material main environmental interest.', 215.15, 768, 19, 
            322.56, 320, 88, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1692,'01692','EchoBackup Online Backup Service', 'P', 'Or base relationship vote do economy.', 47.22, 1364, 11, 
            58.94, 907, 61, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1693,'01693','OmniReader RFID Scanner', 'P', 'Than serve goal mouth consumer water.', 242.88, 2703, 10, 
            353.65, 795, 38, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1694,'01694','CyberSentry Home Security Software', 'P', 'Fine prepare gun.', 424.32, 1904, 19, 
            497.46, 152, 54, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1695,'01695','SmartSync File Synchronization Tool', 'P', 'Young fish hospital hour.', 271.48, 638, 18, 
            396.58, 8, 47, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1696,'01696','UltraCast Streaming Stick', 'P', 'Ten past must thus though soldier us.', 48.6, 310, 6, 
            66.12, 448, 44, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1697,'01697','NetCraft Website Builder Toolkit', 'P', 'Big arrive coach activity hold manage.', 211.27, 649, 17, 
            256.47, 22, 14, 17);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1698,'01698','ProOrganize Desk Tray Set', 'P', 'Leader lay notice about care.', 283.68, 262, 8, 
            371.01, 499, 42, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1699,'01699','ClearMind Whiteboard System', 'P', 'Whole risk our human store image purpose.', 106.61, 2937, 12, 
            147.55, 161, 80, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1700,'01700','SpaceSaver Collapsible File Organizer', 'P', 'Reduce raise behavior everybody month city.', 375.29, 976, 6, 
            523.11, 155, 39, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1701,'01701','Streamline Stapler', 'P', 'Nor happy each surface exactly.', 23.31, 231, 2, 
            30.73, 562, 71, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1702,'01702','PrecisionPoint Gel Pens', 'P', 'Around financial officer sign ground difficult idea.', 382.02, 2455, 5, 
            472.09, 850, 100, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1703,'01703','UltraBind Binding Machine', 'P', 'Election operation today his away ability.', 262.45, 1863, 13, 
            391.35, 682, 16, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1704,'01704','QuietPrint Wireless Printer', 'P', 'Media sell usually give.', 464.95, 1384, 14, 
            576.27, 840, 70, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1705,'01705','ZenDesk Bamboo Organizer', 'P', 'Dog city environment hard medical base.', 106.13, 1024, 17, 
            138.56, 49, 13, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1706,'01706','ChargeHub USB Charging Station', 'P', 'Stand dark finish base after.', 178.86, 402, 12, 
            208.89, 64, 38, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1707,'01707','BrightView Desk Lamp', 'P', 'So hold follow knowledge radio term article.', 304.92, 24, 14, 
            429.74, 764, 16, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1708,'01708','Infinity Cork Bulletin Board', 'P', 'Two card big alone.', 194.33, 2164, 2, 
            213.84, 279, 96, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1709,'01709','SmoothGlide Tape Dispenser', 'P', 'Current financial culture painting room scene last brother.', 172.36, 1594, 19, 
            229.0, 690, 20, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1710,'01710','ArchiveMaster Document Scanner', 'P', 'Much occur rate.', 387.94, 976, 14, 
            442.35, 893, 13, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1711,'01711','Visionary Dry-Erase Markers', 'P', 'Two itself seat movement.', 225.12, 917, 15, 
            255.42, 725, 77, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1712,'01712','EcoNote Recycled Notebooks', 'P', 'Thought on present can.', 439.56, 349, 5, 
            658.81, 33, 67, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1713,'01713','CompactCut Paper Shredder', 'P', 'Fund no decision take.', 186.78, 2898, 15, 
            276.07, 933, 44, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1714,'01714','SwiftScan Portable Document Scanner', 'P', 'Nation end clearly continue me threat choose suddenly.', 182.96, 1843, 17, 
            240.62, 749, 44, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1715,'01715','TaskTracker Weekly Planner', 'P', 'Score enter it.', 492.82, 2863, 4, 
            690.42, 380, 36, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1716,'01716','PowerPort Desktop Power Strip', 'P', 'Use answer open coach.', 212.67, 732, 6, 
            282.54, 218, 40, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1717,'01717','Harmony Headphones with Mic', 'P', 'True sound thus story write.', 463.2, 25, 4, 
            562.13, 561, 78, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1718,'01718','ClipCatch Magnetic Paperclip Holder', 'P', 'Law minute attorney size.', 159.76, 1870, 6, 
            236.62, 734, 32, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1719,'01719','PeakPerformance Ergonomic Chair', 'P', 'Dog you piece view.', 45.98, 2328, 11, 
            57.14, 549, 45, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1720,'01720','SecureLock Filing Cabinets', 'P', 'Art story foot total.', 357.14, 576, 12, 
            424.3, 361, 92, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1721,'01721','ClearThought Glass Desk Mat', 'P', 'Control other how.', 188.19, 1602, 5, 
            260.9, 418, 74, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1722,'01722','SwiftSort Mail Sorter', 'P', 'After structure nearly organization.', 164.01, 708, 18, 
            224.96, 383, 41, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1723,'01723','ColorPop Highlighter Set', 'P', 'Perhaps water energy star return oil side.', 423.82, 2293, 3, 
            544.73, 452, 85, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1724,'01724','EasyFile Hanging File Folders', 'P', 'Black trial beautiful owner two relationship offer.', 158.93, 2824, 17, 
            202.38, 966, 69, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1725,'01725','MaxStorage Box Files', 'P', 'Voice what nothing sister them price civil.', 397.15, 852, 18, 
            494.43, 380, 27, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1726,'01726','QuickConnect Conference Speaker', 'P', 'Consumer statement behind recognize.', 6.03, 206, 20, 
            7.82, 180, 96, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1727,'01727','ZenGarden Desk Organizer', 'P', 'However budget recognize later.', 107.52, 2044, 10, 
            145.99, 934, 94, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1728,'01728','SharpEdge Safety Scissors', 'P', 'Ask cultural week treat program but wish.', 494.15, 280, 6, 
            587.84, 693, 54, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1729,'01729','MasterMind Desk Calendar', 'P', 'World town specific.', 45.88, 111, 11, 
            52.59, 846, 91, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1730,'01730','SilentKey Wireless Keyboard', 'P', 'Including subject often agree.', 282.25, 667, 15, 
            311.86, 139, 32, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1731,'01731','FlexiRack Adjustable Shelving', 'P', 'Receive family do source series to may.', 64.19, 2559, 18, 
            95.55, 148, 31, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1732,'01732','BrilliantIdea Desk Lamp with Organizer', 'P', 'Daughter beat doctor charge.', 230.47, 111, 15, 
            299.8, 114, 38, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1733,'01733','PrecisePen Stylus and Pen Combo', 'P', 'Professional moment boy store everything need thing spend.', 105.13, 1339, 18, 
            120.31, 874, 19, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1734,'01734','EcoCraft Biodegradable Pens', 'P', 'Pressure form front western spring someone.', 46.86, 2144, 20, 
            69.03, 166, 23, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1735,'01735','MegaMemo Sticky Note Set', 'P', 'Each than someone why with.', 192.44, 253, 12, 
            236.55, 770, 24, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1736,'01736','SleekSpace Monitor Stand', 'P', 'Few here show involve seven figure action citizen.', 89.8, 1384, 15, 
            106.8, 824, 37, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1737,'01737','PureAir Desktop Air Purifier', 'P', 'Whose hospital upon college building.', 436.34, 153, 12, 
            498.55, 568, 95, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1738,'01738','Executive Leather Desk Pad', 'P', 'Sometimes evidence media short make yard face.', 52.32, 844, 5, 
            72.01, 411, 23, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1739,'01739','QuickLabel Label Maker', 'P', 'Century foot moment cultural.', 109.53, 1846, 12, 
            158.55, 245, 31, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1740,'01740','PrimePaper Printer Paper', 'P', 'Discussion leader body professional.', 468.42, 2270, 16, 
            625.54, 332, 91, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1741,'01741','DuoTone Color Coding Labels', 'P', 'Training matter hear member hit war explain.', 251.43, 2169, 3, 
            279.8, 406, 90, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1742,'01742','SmartSort Drawer Dividers', 'P', 'Sister role life wrong improve act.', 111.95, 1512, 11, 
            139.25, 338, 78, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1743,'01743','ArchivePlus Expanding File', 'P', 'Team check voice must understand school.', 91.71, 183, 5, 
            126.48, 583, 21, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1744,'01744','CrystalClear Monitor Riser', 'P', 'Listen child sign medical compare yeah event.', 372.19, 111, 5, 
            526.74, 96, 10, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1745,'01745','MobileMaster Laptop Stand', 'P', 'Score mention majority past trip available.', 364.89, 1382, 11, 
            506.28, 208, 61, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1746,'01746','GripWrite Comfort Grip Pens', 'P', 'Why room suffer last.', 358.26, 788, 9, 
            394.8, 165, 20, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1747,'01747','EliteEnvelope Security Envelopes', 'P', 'Cup party campaign him nice.', 464.9, 343, 12, 
            513.36, 838, 67, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1748,'01748','OptimaIndex Tab Dividers', 'P', 'Thing media trial even all room back person.', 462.45, 1437, 15, 
            536.89, 833, 95, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1749,'01749','EasyErase Board Cleaner', 'P', 'Center wonder indeed.', 352.3, 72, 8, 
            403.39, 323, 24, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1750,'01750','SecureSafe Desktop Safe', 'P', 'Add nearly response attorney simply.', 414.86, 2178, 18, 
            590.2, 421, 34, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1751,'01751','TaskLight Clip-on Desk Lamp', 'P', 'Factor make while machine meeting address.', 307.68, 1929, 6, 
            385.01, 715, 93, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1752,'01752','ColorCode File Labels', 'P', 'Modern land her chance.', 27.08, 1164, 10, 
            37.12, 19, 10, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1753,'01753','WriteWell Fountain Pens', 'P', 'Score north they class people peace guy.', 91.71, 2769, 11, 
            124.45, 320, 73, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1754,'01754','Signature Series Executive Pen Set', 'P', 'Born set movie.', 276.81, 1083, 20, 
            360.25, 23, 56, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1755,'01755','NoteNest Desktop Note Holder', 'P', 'Only its training.', 99.07, 233, 12, 
            119.34, 999, 50, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1756,'01756','SleekSlide Presentation Pointer', 'P', 'Appear east exist floor all theory may.', 460.3, 733, 19, 
            635.58, 439, 84, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1757,'01757','SmartStore Compact Flash Drives', 'P', 'Beat development its some reduce back action.', 15.46, 2455, 5, 
            23.04, 534, 89, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1758,'01758','PowerPrint High-Speed Printer', 'P', 'Information agreement away team there.', 465.72, 2269, 20, 
            569.9, 837, 72, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1759,'01759','SoftTouch Mouse Pad', 'P', 'Give message major economic.', 369.57, 294, 17, 
            503.84, 672, 60, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1760,'01760','MultiMount Adjustable Phone Holder', 'P', 'Travel list draw final various.', 360.62, 173, 9, 
            416.55, 638, 43, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1761,'01761','TidyTray Desktop Organizer', 'P', 'American still type hit well win.', 393.48, 104, 4, 
            486.05, 514, 24, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1762,'01762','Precision Draft Mechanical Pencils', 'P', 'Table can source food PM.', 167.79, 174, 7, 
            186.78, 958, 49, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1763,'01763','SpacePlus Under Desk Storage', 'P', 'Strong day long wall edge.', 245.31, 1793, 2, 
            273.35, 234, 68, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1764,'01764','Infinity Planner Premium Edition', 'P', 'Sign model end.', 85.93, 1743, 13, 
            109.3, 872, 46, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1765,'01765','SwiftShred Manual Hand Shredder', 'P', 'However last cup position realize fight.', 197.95, 1197, 10, 
            267.69, 923, 46, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1766,'01766','DeskDeco Minimalist Vase', 'P', 'Institution market entire also his test.', 7.64, 453, 18, 
            9.09, 66, 99, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1767,'01767','ClipHub Paperclip Dispenser', 'P', 'Late include ever strong property.', 310.25, 543, 20, 
            403.95, 988, 33, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1768,'01768','MemoMaster Voice-Activated Recorder', 'P', 'Individual between prevent choice hope agree a.', 323.23, 2589, 7, 
            481.47, 285, 13, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1769,'01769','BalanceBoard Standing Desk Platform', 'P', 'Political spring us full face action.', 146.9, 695, 9, 
            212.9, 132, 25, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1770,'01770','FocusLight LED Task Light', 'P', 'Between imagine as democratic nearly.', 222.5, 411, 3, 
            251.77, 233, 19, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1771,'01771','ChargeMate Wireless Charging Pad', 'P', 'Very agreement its college seat.', 40.34, 2211, 5, 
            58.32, 444, 38, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1772,'01772','EasyAccess Keyboard Tray', 'P', 'Deal political only this such woman.', 353.68, 864, 18, 
            439.68, 115, 20, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1773,'01773','CraftCorner Desk Scissors', 'P', 'Low organization office across popular.', 220.4, 2288, 6, 
            263.7, 212, 12, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1774,'01774','PureWrite Erasable Gel Pens', 'P', 'Sometimes industry collection same year myself.', 91.98, 486, 14, 
            137.04, 697, 38, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1775,'01775','KeepItTidy Cable Management Clips', 'P', 'Nation author nature thousand wide.', 359.38, 2474, 8, 
            481.26, 95, 97, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1776,'01776','ArchiveBox Decorative Storage Boxes', 'P', 'Admit to call last.', 354.64, 108, 5, 
            500.0, 317, 66, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1777,'01777','SmartScan QR Code Scanner', 'P', 'Marriage later happy people.', 487.87, 249, 11, 
            726.29, 50, 34, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1778,'01778','UltraOrganize File Management Software', 'P', 'Nor who new would bit while reason.', 387.31, 98, 14, 
            465.64, 455, 52, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1779,'01779','PremiumPrint Laser Toner Cartridges', 'P', 'Option daughter three one book old discuss.', 254.33, 251, 13, 
            340.28, 566, 50, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1780,'01780','ClipOn Webcam Privacy Cover', 'P', 'Instead recent capital bill.', 19.49, 2759, 8, 
            25.39, 285, 90, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1781,'01781','DeskDynamo Handheld Vacuum', 'P', 'Feel body course.', 439.5, 654, 6, 
            576.61, 189, 28, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1782,'01782','VisionPlus Magnifying Glass', 'P', 'Office meeting create him step development.', 303.67, 22, 15, 
            336.26, 405, 67, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1783,'01783','LuxeLiner Drawer Liners', 'P', 'Form something toward air.', 272.54, 670, 13, 
            382.63, 722, 38, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1784,'01784','SwiftClick Presentation Remote', 'P', 'Condition treat something first Democrat.', 134.91, 2248, 8, 
            157.83, 341, 76, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1785,'01785','OrganizeIt Shelving Unit', 'P', 'Sister once character writer outside ahead expect live.', 301.06, 2841, 2, 
            343.77, 649, 96, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1786,'01786','MarkIt Permanent Markers', 'P', 'Capital concern hand language future.', 33.26, 97, 15, 
            49.23, 527, 43, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1787,'01787','MultiTask Multifunction Printer', 'P', 'Hotel machine Democrat improve.', 20.02, 359, 8, 
            23.51, 644, 71, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1788,'01788','ComfortCraft Ergonomic Footrest', 'P', 'Although building how experience memory.', 3.04, 1139, 3, 
            3.56, 837, 43, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1789,'01789','SmartPen Digital Pen', 'P', 'Movement support wish find it forward usually she.', 54.1, 1083, 18, 
            66.34, 53, 53, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1790,'01790','ArchiveAssistant Labeling Tape', 'P', 'Team else study clear.', 20.57, 1393, 17, 
            24.99, 347, 66, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1791,'01791','PowerDesk Height-Adjustable Desk', 'P', 'Pressure personal goal attention push rich.', 438.6, 233, 9, 
            508.28, 510, 63, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1792,'01792','ColorCraft Art Supply Caddy', 'P', 'Watch kind name us side still.', 161.27, 1974, 16, 
            186.03, 874, 20, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1793,'01793','SecureClip Bulldog Clips', 'P', 'Fish certain relate fund line draw.', 405.95, 1192, 5, 
            579.84, 485, 62, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1794,'01794','TaskTape Adhesive Tape Rolls', 'P', 'Stay audience anything speak eye follow though each.', 427.61, 341, 2, 
            488.69, 202, 27, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1795,'01795','NoteNook Spiral Notebooks', 'P', 'Quite sometimes appear plan response.', 64.71, 1738, 18, 
            89.38, 600, 18, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1796,'01796','StandStrong Laptop Riser', 'P', 'Do present identify.', 434.51, 1139, 4, 
            527.46, 556, 95, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1797,'01797','GlideMouse Ergonomic Mouse', 'P', 'Rock girl far.', 336.51, 1270, 17, 
            456.39, 694, 94, 18);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1798,'01798','AeroTrek Hardshell Spinner Suitcase', 'P', 'Probably measure help eat office we all unit.', 415.68, 996, 10, 
            559.95, 639, 15, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1799,'01799','VoyagePro Travel Backpack', 'P', 'Western citizen lead say.', 438.2, 1364, 14, 
            633.05, 529, 15, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1800,'01800','JetSetter Compact Carry-On', 'P', 'Mention method thousand research must.', 432.74, 2084, 16, 
            493.94, 388, 30, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1801,'01801','GlobeTrotter Duffel Bag', 'P', 'Down himself room anyone paper enough seven.', 251.43, 251, 11, 
            318.73, 892, 34, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1802,'01802','PassportPouch RFID Blocking Holder', 'P', 'Imagine main bit under.', 477.83, 2898, 9, 
            710.74, 886, 35, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1803,'01803','SkyHigh Overhead Backpack', 'P', 'That what control.', 124.01, 121, 9, 
            156.66, 717, 64, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1804,'01804','AdventurePack All-Terrain Luggage', 'P', 'Language shoulder recognize final myself girl.', 146.1, 435, 11, 
            169.93, 567, 59, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1805,'01805','NomadNest Foldable Travel Organizer', 'P', 'Girl fall blue model past build sense whom.', 462.08, 150, 6, 
            673.77, 197, 95, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1806,'01806','InfinityRoller Expandable Suitcase', 'P', 'Pass even when yard conference because.', 73.74, 933, 12, 
            93.85, 926, 48, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1807,'01807','HorizonHopper Weekend Bag', 'P', 'Quickly energy mention term black.', 54.55, 673, 2, 
            75.47, 957, 49, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1808,'01808','Tranquility Neck Pillow', 'P', 'Explain wide price add claim condition.', 452.58, 2169, 3, 
            580.75, 319, 35, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1809,'01809','CompactCase Toiletry Organizer', 'P', 'Trial would executive mention president situation would another.', 91.12, 302, 5, 
            113.36, 884, 34, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1810,'01810','WanderWheel Rolling Briefcase', 'P', 'Someone table next measure heavy lawyer I.', 52.79, 683, 15, 
            61.97, 263, 55, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1811,'01811','DestinationDuo Twin Packing Cubes', 'P', 'Politics outside child drug know.', 273.44, 2782, 18, 
            309.23, 567, 25, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1812,'01812','JourneyJacket Luggage Cover', 'P', 'Act reduce speech relate purpose.', 83.99, 2613, 6, 
            125.48, 93, 30, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1813,'01813','SafeTravels Money Belt', 'P', 'Bring your friend include or.', 5.54, 269, 15, 
            7.12, 160, 33, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1814,'01814','ExplorerElite Laptop Sleeve', 'P', 'Garden sit south.', 24.21, 974, 12, 
            31.4, 79, 92, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1815,'01815','TrekTech Multi-Tool Keychain', 'P', 'Note wrong take tonight physical course.', 312.98, 731, 8, 
            415.41, 793, 55, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1816,'01816','SerenitySleep Eye Mask', 'P', 'Seat author behind material measure his.', 130.34, 612, 5, 
            180.43, 773, 69, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1817,'01817','TravelTide Compression Socks', 'P', 'Experience real number prove move.', 358.92, 1570, 19, 
            461.42, 626, 23, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1818,'01818','QuestQuiver Crossbody Bag', 'P', 'College of same avoid well system day authority.', 137.5, 743, 7, 
            166.24, 109, 98, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1819,'01819','RoamRite 4-Wheel Spinner', 'P', 'Minute work key administration movement.', 152.4, 2514, 3, 
            186.42, 194, 21, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1820,'01820','SwiftSprint Shoe Bags', 'P', 'Region popular street cold sign sometimes.', 144.63, 800, 2, 
            215.1, 448, 29, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1821,'01821','MotionMate High-Capacity Backpack', 'P', 'Cell be yard their piece perform.', 311.36, 2522, 13, 
            387.59, 730, 59, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1822,'01822','PeacefulPassage Ear Plugs', 'P', 'Include its drop behind.', 98.21, 1980, 9, 
            128.36, 13, 16, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1823,'01823','NomadNote Travel Journal', 'P', 'Production card Mr with.', 28.32, 486, 3, 
            32.65, 14, 84, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1824,'01824','ZipZap Electronics Organizer', 'P', 'Above show law market response.', 335.58, 454, 10, 
            484.1, 949, 54, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1825,'01825','MileHigh Mini Steamer', 'P', 'West they civil where generation cover especially.', 90.65, 592, 15, 
            109.57, 619, 40, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1826,'01826','GlobalGrip Ergonomic Luggage Handle', 'P', 'Indicate at lay kitchen friend different customer information.', 322.16, 1594, 10, 
            370.41, 636, 45, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1827,'01827','VoyageVault Portable Safe', 'P', 'Development simply spend doctor enjoy.', 386.55, 761, 2, 
            510.81, 465, 19, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1828,'01828','TrekTeller Digital Luggage Scale', 'P', 'Every region big population wear vote.', 233.79, 239, 3, 
            316.19, 738, 19, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1829,'01829','PathFinder LED Luggage Tag', 'P', 'Feel school less suffer remember food.', 134.55, 1750, 20, 
            166.72, 107, 52, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1830,'01830','JourneyJoy Waterproof Pouch', 'P', 'Visit approach perhaps attorney yet.', 166.15, 2084, 14, 
            225.77, 238, 37, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1831,'01831','SwiftSwap Reversible Jacket', 'P', 'Country big easy month responsibility.', 358.5, 1229, 11, 
            461.53, 888, 22, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1832,'01832','TravelTrio 3-in-1 Adapter', 'P', 'Speak business could various test.', 25.42, 1127, 9, 
            34.51, 954, 10, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1833,'01833','FreedomFold Garment Bag', 'P', 'Official also consumer improve rule positive artist.', 103.36, 696, 20, 
            123.19, 568, 31, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1834,'01834','ComfortCarry Padded Strap', 'P', 'Why month weight important home family.', 117.64, 1761, 5, 
            140.96, 517, 33, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1835,'01835','SkySleeper Inflatable Pillow', 'P', 'Go chance able kind.', 244.99, 2422, 10, 
            363.71, 500, 10, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1836,'01836','Wanderlust Wallet with Power Bank', 'P', 'Hotel paper money law.', 185.46, 803, 4, 
            264.65, 355, 68, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1837,'01837','NavigatorNap Travel Blanket', 'P', 'Follow recently wonder player back.', 365.18, 2623, 2, 
            541.1, 632, 81, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1838,'01838','FlashFind Key Finder', 'P', 'Draw action could person ask.', 496.11, 592, 13, 
            723.36, 183, 79, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1839,'01839','PeacePack Anti-Theft Backpack', 'P', 'Phone check meeting service.', 314.04, 808, 7, 
            345.98, 687, 46, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1840,'01840','TerraTrack Collapsible Water Bottle', 'P', 'Center else phone along.', 443.54, 324, 15, 
            587.92, 254, 93, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1841,'01841','QuickClip Multi-Purpose Clip', 'P', 'Every themselves hit serious.', 445.45, 2076, 7, 
            659.75, 473, 67, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1842,'01842','SecureStep TSA Lock', 'P', 'Two chance theory mouth people course.', 165.92, 2169, 18, 
            194.56, 691, 10, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1843,'01843','HorizonView Binoculars', 'P', 'Return method arm season create.', 26.31, 2151, 19, 
            33.2, 759, 19, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1844,'01844','PocketProof Pickpocket-Proof Pants', 'P', 'Across service party meeting.', 29.07, 2295, 5, 
            38.94, 798, 96, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1845,'01845','TranquilTravel Tea Infuser Bottle', 'P', 'Hard down serve foreign standard.', 281.02, 2963, 10, 
            418.74, 416, 51, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1846,'01846','RoamingRay Solar Charger', 'P', 'Democratic weight build specific mission.', 324.33, 2873, 14, 
            445.53, 596, 97, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1847,'01847','JourneyJewel Travel Jewelry Case', 'P', 'Place improve heavy certainly eat.', 57.78, 2325, 19, 
            74.95, 476, 45, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1848,'01848','UltimateUmbrella Windproof Travel Umbrella', 'P', 'Small various six Congress a.', 228.07, 249, 7, 
            328.22, 639, 80, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1849,'01849','VentureVest Travel Vest with Hidden Pockets', 'P', 'Key together affect house.', 381.15, 1635, 17, 
            482.52, 887, 84, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1850,'01850','EcoEscape Reusable Travel Bottles', 'P', 'Then avoid both once kitchen black month.', 292.76, 731, 15, 
            339.04, 985, 74, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1851,'01851','TimeTraveler World Time Watch', 'P', 'Society son rest add prepare minute opportunity.', 151.09, 349, 6, 
            181.85, 74, 55, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1852,'01852','Pathfinder Portable Hammock', 'P', 'Arrive center Mr next fear early project.', 298.04, 533, 5, 
            417.66, 537, 24, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1853,'01853','OrbitOrganizer Electronics Pouch', 'P', 'Machine time knowledge two challenge figure heavy rich.', 373.36, 1035, 5, 
            522.57, 584, 58, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1854,'01854','NomadicKnit Packable Down Jacket', 'P', 'Try very eight money usually forget choice nature.', 373.24, 1577, 8, 
            521.03, 572, 97, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1855,'01855','MemoryMilestones Scratch-Off World Map', 'P', 'Rest series understand history.', 74.53, 1964, 20, 
            101.64, 51, 70, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1856,'01856','GlobeGuard Eco-Friendly Sunscreen', 'P', 'Apply fund now.', 22.27, 2693, 15, 
            24.88, 584, 83, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1857,'01857','TrekTape Duct Tape Keychain', 'P', 'Away trial popular up wind ago.', 403.33, 209, 2, 
            578.35, 789, 66, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1858,'01858','SafeStep Retractable Cable Lock', 'P', 'Safe analysis tend cost benefit place majority.', 266.18, 522, 12, 
            387.96, 301, 42, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1859,'01859','AllWeather Wrist Wallet', 'P', 'Rate gas trade star cost easy network.', 10.23, 2323, 4, 
            13.98, 492, 96, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1860,'01860','QuickDry Microfiber Towel', 'P', 'Piece ten family performance.', 420.7, 968, 7, 
            554.96, 362, 32, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1861,'01861','SmartSpace Vacuum Packing Bags', 'P', 'Without this management wind white today author third.', 92.88, 108, 6, 
            109.9, 986, 20, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1862,'01862','WanderWrap Convertible Scarf', 'P', 'Total model these stand attack.', 446.33, 954, 13, 
            644.17, 51, 49, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1863,'01863','AirAssist Flight Compression Bracelet', 'P', 'Be bank fear cost.', 429.2, 1974, 8, 
            512.96, 99, 21, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1864,'01864','FlexFit Foldable Hat', 'P', 'Race participant treat provide much traditional.', 128.7, 2428, 2, 
            191.72, 399, 76, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1865,'01865','StellarSack Sleeping Bag Liner', 'P', 'South foreign government suddenly plan.', 342.47, 259, 4, 
            451.27, 605, 42, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1866,'01866','PassportPanorama Travel Wallet', 'P', 'Face believe report.', 218.61, 833, 8, 
            261.85, 388, 87, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1867,'01867','MiniMedic First Aid Kit', 'P', 'Husband determine ability hope.', 193.58, 60, 16, 
            289.48, 637, 67, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1868,'01868','VentureVials Travel Spice Kit', 'P', 'Blood owner quickly TV style after.', 81.75, 2726, 17, 
            106.61, 810, 71, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1869,'01869','QuietQuest Noise-Canceling Headphones', 'P', 'Past around write find.', 180.78, 2371, 4, 
            222.77, 847, 27, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1870,'01870','ChargeChain Multi-Country Charger', 'P', 'Thank stay street money daughter inside hand.', 26.73, 1669, 4, 
            32.43, 626, 55, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1871,'01871','LightLook Clip-On Reading Light', 'P', 'Concern of entire inside century live.', 287.48, 762, 8, 
            366.1, 204, 16, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1872,'01872','PocketPilot Mini Compass', 'P', 'Plan statement beyond up small career parent.', 49.79, 2924, 4, 
            71.82, 767, 48, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1873,'01873','SnapSafe TSA-Approved Luggage Lock', 'P', 'Should former population.', 304.3, 2952, 8, 
            420.86, 268, 68, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1874,'01874','StrollStrap Bag Bungee', 'P', 'Arm rest open score administration.', 155.56, 2134, 19, 
            203.58, 463, 39, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1875,'01875','JourneyJolt Portable Espresso Maker', 'P', 'Way particularly customer force image.', 487.93, 696, 2, 
            711.65, 362, 29, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1876,'01876','SafeSip Drink Protector', 'P', 'Step onto thus force detail shoulder seem.', 102.06, 946, 19, 
            148.09, 226, 20, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1877,'01877','CloudComfort Inflatable Seat Cushion', 'P', 'Ever sister part later foot goal center.', 406.96, 2858, 17, 
            606.27, 405, 70, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1878,'01878','TrekTrim Travel Grooming Kit', 'P', 'Central arrive upon film represent TV enough.', 256.31, 437, 4, 
            301.43, 404, 33, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1879,'01879','WanderWheel Luggage Wheels', 'P', 'Voice field require threat cost.', 355.21, 2161, 8, 
            522.88, 327, 61, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1880,'01880','SecureSleeve Passport Protector', 'P', 'Organization yard contain maintain author her.', 340.73, 749, 4, 
            463.53, 131, 62, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1881,'01881','FlightFlask Reusable Travel Flask', 'P', 'Particularly will national.', 479.66, 1603, 5, 
            695.68, 778, 22, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1882,'01882','EcoExpedition Bamboo Cutlery Set', 'P', 'Fund can great affect personal.', 95.53, 2841, 13, 
            110.46, 813, 65, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1883,'01883','EasyExplore Handheld GPS Device', 'P', 'Wind share past debate imagine old.', 149.73, 2208, 9, 
            199.34, 166, 10, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1884,'01884','TravelTwist Universal Sink Plug', 'P', 'Whether issue little sometimes race pull.', 256.36, 2430, 13, 
            303.25, 411, 96, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1885,'01885','SnapShot Compact Camera Bag', 'P', 'Huge American run.', 410.64, 2178, 16, 
            469.88, 867, 37, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1886,'01886','PillPod Mini Medicine Organizer', 'P', 'Range TV police sense.', 72.17, 1058, 8, 
            87.79, 187, 97, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1887,'01887','JetLag Defender Eye Serum', 'P', 'Out identify itself rise center bag camera east.', 60.64, 297, 10, 
            82.84, 863, 62, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1888,'01888','RefreshRinse Portable Shower', 'P', 'Relate common share inside buy since position evidence.', 351.11, 2553, 18, 
            430.29, 889, 50, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1889,'01889','ZipZenity Anti-Stress Kit', 'P', 'Eye when hot level someone down.', 277.3, 1721, 9, 
            346.98, 61, 79, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1890,'01890','AdventureAid Sewing Kit', 'P', 'Now we ahead couple.', 240.95, 2441, 11, 
            325.25, 917, 17, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1891,'01891','GlobalGadget Multi-Currency Money Clip', 'P', 'Including interest offer movement.', 7.12, 312, 19, 
            8.67, 320, 25, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1892,'01892','TranquilTunes Travel Speaker', 'P', 'Carry time federal car policy.', 313.03, 1032, 16, 
            407.98, 545, 54, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1893,'01893','VitalVista Travel Health Monitor', 'P', 'Mother life project something five too.', 354.98, 2661, 9, 
            522.66, 942, 42, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1894,'01894','JourneyJive Bluetooth Tracker', 'P', 'Environment because from suffer main for year.', 268.76, 617, 20, 
            358.68, 793, 12, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1895,'01895','QuestQuilt Packable Travel Quilt', 'P', 'My three sign media.', 170.61, 1384, 14, 
            255.72, 843, 27, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1896,'01896','SecureStrap Luggage Strap with Scale', 'P', 'Suffer every quality yet event defense.', 277.27, 130, 8, 
            362.05, 558, 34, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1897,'01897','GlideGear Foldable Travel Slippers', 'P', 'Measure ten against long care seven debate.', 246.8, 500, 7, 
            324.1, 171, 76, 19);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1898,'01898','WinterWhirl Snow Globe', 'P', 'Central scene community statement nature relate.', 411.73, 2178, 6, 
            595.99, 222, 85, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1899,'01899','AutumnHarvest Pumpkin Spice Kit', 'P', 'Clearly here various.', 311.34, 233, 13, 
            362.39, 838, 91, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1900,'01900','SpringBlossom Garden Flags', 'P', 'Fill participant piece summer.', 156.8, 2858, 9, 
            203.83, 135, 15, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1901,'01901','SummerSplash Pool Party Set', 'P', 'During assume possible skill seat mission end.', 462.56, 75, 14, 
            649.17, 101, 45, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1902,'01902','SpookySpectacle Halloween Decor Kit', 'P', 'Clear budget station people all land.', 477.06, 457, 2, 
            581.7, 217, 20, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1903,'01903','FestiveFrost Christmas Ornament Collection', 'P', 'Effort laugh ball large.', 404.04, 1780, 15, 
            514.85, 469, 26, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1904,'01904','EasterEnchantment Egg Decorating Kit', 'P', 'Election drive determine large.', 169.03, 934, 3, 
            204.45, 982, 81, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1905,'01905','HarvestHue Fall Leaf Garland', 'P', 'Bed thank finish traditional.', 99.55, 996, 18, 
            146.05, 518, 95, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1906,'01906','BeachBliss Summer Towel Collection', 'P', 'Mention get rather program first call.', 262.52, 226, 17, 
            392.63, 629, 53, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1907,'01907','NoelNights Holiday Lighting System', 'P', 'Really about physical step.', 344.0, 1035, 11, 
            470.76, 185, 13, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1908,'01908','ValentineVibes Romantic Gift Set', 'P', 'Nature world marriage man.', 220.16, 1625, 9, 
            262.45, 404, 100, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1909,'01909','IndependenceIgnite Patriotic Fireworks Kit', 'P', 'Window stand before family energy same good measure.', 366.36, 977, 4, 
            471.63, 62, 99, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1910,'01910','AutumnAroma Scented Candles', 'P', 'Yard its night generation kitchen positive bar line.', 238.66, 452, 17, 
            274.51, 1, 29, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1911,'01911','SnowSeeker Winter Sports Gear', 'P', 'Pass card happen city.', 402.13, 1687, 15, 
            458.18, 518, 37, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1912,'01912','SpringAwaken Seed Starter Kit', 'P', 'Leg policy manager suggest always raise environmental.', 434.91, 1278, 12, 
            617.82, 746, 62, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1913,'01913','SummerSizzle BBQ Essentials', 'P', 'Culture your moment piece.', 374.52, 588, 5, 
            560.05, 319, 44, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1914,'01914','HauntHarbor Halloween Costume Selection', 'P', 'Rather where series toward remain foreign call save.', 394.58, 2446, 4, 
            550.59, 626, 66, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1915,'01915','YuletideYarns Festive Storybook Collection', 'P', 'Treatment bank sometimes bring worry.', 454.82, 2947, 10, 
            571.93, 731, 37, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1916,'01916','EasterEggstravaganza Basket Fillers', 'P', 'Edge evidence box top present beautiful who.', 377.62, 2589, 4, 
            535.84, 645, 34, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1917,'01917','ThanksgivingTable Gourmet Cooking Ingredients', 'P', 'Already necessary include between word.', 365.16, 2030, 6, 
            493.42, 166, 72, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1918,'01918','WinterWarmth Heated Blanket', 'P', 'Quickly next nation account exactly.', 438.96, 627, 2, 
            520.73, 343, 91, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1919,'01919','SpringSprout Planting Pots', 'P', 'Leader technology such western.', 190.47, 623, 18, 
            251.32, 252, 18, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1920,'01920','SolsticeSunset Outdoor Lighting', 'P', 'Back author pressure attention ago.', 407.16, 2461, 14, 
            547.33, 991, 36, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1921,'01921','HalloweenHaunt Spooky Sound Effects Machine', 'P', 'Place three nothing six apply do impact.', 479.9, 1168, 3, 
            576.03, 308, 45, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1922,'01922','MerryMantel Stocking Holder Set', 'P', 'Democratic control past recent draw.', 443.62, 958, 15, 
            664.01, 63, 43, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1923,'01923','BunnyBounce Inflatable Easter Decor', 'P', 'Final hand gun than analysis reduce simply.', 181.44, 814, 15, 
            242.14, 501, 30, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1924,'01924','AutumnAmbiance Fireplace Tools', 'P', 'Decision without government order management wife assume personal.', 175.7, 1388, 18, 
            224.92, 102, 46, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1925,'01925','SummerSerenade Night Lanterns', 'P', 'Record example production record kitchen.', 447.12, 1681, 5, 
            501.51, 697, 60, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1926,'01926','GhostlyGlow Halloween Lanterns', 'P', 'Ability look certainly quality prepare during mind gas.', 238.41, 195, 17, 
            333.91, 904, 70, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1927,'01927','FrostFete Ice Sculpture Mold', 'P', 'Human reach offer impact college.', 41.18, 190, 16, 
            50.47, 680, 20, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1928,'01928','SpringScent Floral Diffuser Set', 'P', 'Line perform close.', 25.26, 84, 3, 
            28.31, 433, 88, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1929,'01929','LibertyLanterns Fourth of July Decor', 'P', 'Drop this hair shoulder newspaper draw record.', 97.63, 525, 3, 
            112.91, 490, 80, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1930,'01930','HarvestHome Baking Dish Set', 'P', 'Black affect necessary strong.', 309.24, 1929, 16, 
            352.27, 269, 47, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1931,'01931','BeachBound Sandcastle Kit', 'P', 'Language memory election we idea.', 64.79, 580, 14, 
            82.25, 427, 84, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1932,'01932','SpookyShadows Halloween Projector', 'P', 'Life send well it.', 187.51, 113, 7, 
            224.31, 358, 44, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1933,'01933','YuleTide Carol Karaoke Machine', 'P', 'Whether white million carry.', 120.99, 1721, 19, 
            175.54, 850, 17, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1934,'01934','EggHunt Easter Activity Set', 'P', 'Ability fish toward.', 83.62, 249, 13, 
            121.16, 284, 23, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1935,'01935','CornucopiaCraft Thanksgiving Decor Kit', 'P', 'It process among enough.', 112.89, 2796, 15, 
            155.36, 982, 49, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1936,'01936','SnowflakeSpiral Winter Wonderland Decor', 'P', 'Cover financial site respond put.', 289.0, 617, 20, 
            368.91, 11, 92, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1937,'01937','SpringFling Kite Flying Kit', 'P', 'Response wall cut garden seven later significant.', 55.34, 2273, 9, 
            77.02, 725, 100, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1938,'01938','PatrioticPulse Independence Day Speaker', 'P', 'Little affect officer leg.', 453.87, 300, 14, 
            610.88, 602, 12, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1939,'01939','AutumnAlchemy Cocktail Mixer Set', 'P', 'Everything investment you however site available country.', 30.51, 762, 14, 
            44.23, 726, 93, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1940,'01940','SummerSolstice Sun Catcher', 'P', 'Base economic former time.', 29.99, 1512, 3, 
            41.63, 887, 42, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1941,'01941','GhoulGather Halloween Party Pack', 'P', 'Amount environment decade everyone story different visit.', 335.91, 1942, 9, 
            444.43, 629, 80, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1942,'01942','NoelNotebook Holiday Planning Organizer', 'P', 'One economy more small out start beautiful.', 418.28, 214, 5, 
            499.07, 806, 15, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1943,'01943','BlossomBouquet Spring Wreath', 'P', 'Dog ask management.', 123.17, 2563, 6, 
            156.07, 697, 100, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1944,'01944','FireworkFiesta Fourth of July Kit', 'P', 'Organization produce point.', 69.86, 1550, 11, 
            98.96, 317, 98, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1945,'01945','ThanksgivingTrove Table Setting Collection', 'P', 'Step dinner next always position raise.', 470.65, 788, 10, 
            635.47, 97, 40, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1946,'01946','IceIllumination Frozen Light Show', 'P', 'Expect reveal determine popular professional event meeting.', 394.47, 280, 3, 
            530.51, 635, 12, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1947,'01947','SpringRenewal Gardening Gloves', 'P', 'Soldier show throughout person decade interest.', 396.8, 56, 8, 
            488.79, 709, 32, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1948,'01948','StarSpangled Banner Making Kit', 'P', 'Beautiful citizen property performance month remain.', 422.02, 390, 9, 
            597.86, 381, 17, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1949,'01949','HarvestMoon Night Light', 'P', 'Social newspaper wait.', 492.65, 2134, 18, 
            660.1, 924, 32, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1950,'01950','SeaSplash Summer Beach Ball', 'P', 'Certain foot quickly debate.', 374.73, 2449, 2, 
            421.64, 788, 64, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1951,'01951','PhantomPhun Halloween Mask Crafting Kit', 'P', 'Church radio camera go box.', 427.12, 1026, 4, 
            593.1, 239, 77, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1952,'01952','Christmastide Cocoa Mug Set', 'P', 'Such majority manage design.', 307.82, 2805, 6, 
            371.33, 758, 29, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1953,'01953','EasterEssence Candle Trio', 'P', 'Adult his let event.', 36.18, 2522, 19, 
            51.05, 83, 26, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1954,'01954','GratitudeGarden Thanksgiving Centerpiece', 'P', 'See tree ten.', 493.33, 83, 8, 
            721.33, 65, 18, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1955,'01955','FrostyFriends Winter Holiday Cards', 'P', 'Career better bank sure them determine people.', 52.21, 819, 18, 
            64.3, 562, 98, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1956,'01956','SpringSongbird Feeder', 'P', 'Look green newspaper rate almost reality.', 302.26, 2264, 17, 
            366.26, 129, 30, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1957,'01957','FreedomFlare Patriotic Yard Signs', 'P', 'Produce wind budget forget almost present expert.', 417.47, 479, 17, 
            521.33, 287, 13, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1958,'01958','Witches''Wonder Halloween Baking Set', 'P', 'Future benefit who until.', 389.54, 1270, 16, 
            523.2, 826, 21, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1959,'01959','YuletideYarn Knitting Kit for Christmas Sweaters', 'P', 'Fact paper alone range husband continue maintain.', 118.38, 737, 13, 
            154.59, 173, 22, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1960,'01960','TulipTwirl Spring Vase Collection', 'P', 'Whom magazine coach customer hand authority.', 221.95, 1550, 7, 
            278.61, 825, 62, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1961,'01961','PatriotPlates Decorative Fourth of July Tableware', 'P', 'Ever soon pressure total popular each.', 434.79, 2669, 10, 
            525.33, 404, 23, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1962,'01962','AutumnAura Essential Oil Blend', 'P', 'Laugh sister should leg save.', 197.33, 1075, 9, 
            269.29, 792, 59, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1963,'01963','SummerShade Umbrella Stand', 'P', 'Word type hour wrong really senior.', 67.86, 686, 14, 
            94.3, 841, 18, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1964,'01964','HauntingHues Halloween Makeup Kit', 'P', 'Major room until.', 462.01, 2214, 13, 
            587.79, 637, 68, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1965,'01965','MistletoeMerriment Christmas Party Games', 'P', 'Other agreement artist wish senior sea.', 286.28, 2121, 12, 
            417.49, 113, 83, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1966,'01966','SpringSafari Animal Planters', 'P', 'Join store wife surface medical.', 204.54, 2784, 4, 
            263.64, 675, 41, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1967,'01967','LibertyLights Solar-Powered Flag Light', 'P', 'Follow argue run have.', 10.26, 171, 16, 
            13.81, 347, 38, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1968,'01968','HarvestHands Fall Gardening Kit', 'P', 'Reach author plan up power.', 243.13, 854, 18, 
            342.41, 923, 83, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1969,'01969','BreezyBeach Portable Fan', 'P', 'Address decision read.', 169.01, 371, 19, 
            234.02, 529, 22, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1970,'01970','GhostlyGatherings Party Invitations', 'P', 'North catch unit Mrs fear.', 75.28, 436, 7, 
            91.84, 964, 33, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1971,'01971','NoelNectar Christmas Cocktail Mixers', 'P', 'Team go eight tonight party others.', 489.31, 271, 13, 
            663.68, 675, 33, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1972,'01972','EasterEggcitement Craft Supplies', 'P', 'Dark participant sell along service.', 316.18, 1635, 8, 
            378.95, 222, 12, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1973,'01973','PilgrimPride Thanksgiving Costume Accessories', 'P', 'Certainly really cultural.', 179.93, 190, 13, 
            229.53, 284, 53, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1974,'01974','WinterWhisper Plush Throw', 'P', 'Save probably everyone avoid be.', 175.47, 2657, 6, 
            242.21, 302, 47, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1975,'01975','SpringBreeze Wind Chimes', 'P', 'Employee fall why check.', 365.41, 2312, 19, 
            466.58, 890, 40, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1976,'01976','StarlitSoiree Fourth of July Lanterns', 'P', 'Friend cold hit imagine.', 434.08, 116, 12, 
            587.52, 174, 60, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1977,'01977','AutumnAdornments Leaf Pattern Tablecloth', 'P', 'Often structure president first although.', 205.72, 2449, 3, 
            240.64, 333, 96, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1978,'01978','SunnySeasons Picnic Basket Set', 'P', 'Identify dinner for energy.', 426.31, 558, 17, 
            602.06, 53, 67, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1979,'01979','FrightNight Essentials Halloween Movie Marathon Kit', 'P', 'Simple type prepare performance.', 389.82, 1348, 11, 
            554.26, 940, 78, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1980,'01980','FestiveFoliage Christmas Tree Skirt', 'P', 'Analysis represent risk employee many.', 51.92, 921, 2, 
            67.96, 75, 35, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1981,'01981','BunnyHops Easter Decorative Throw Pillows', 'P', 'Church assume professional baby.', 188.46, 1075, 18, 
            215.11, 638, 63, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1982,'01982','GratefulGlow Thanksgiving Candle Set', 'P', 'Face rather among relationship research service.', 230.32, 493, 8, 
            290.49, 409, 62, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1983,'01983','IceCastle Winter Light Display', 'P', 'Trial month place instead black.', 186.42, 1156, 3, 
            262.02, 792, 78, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1984,'01984','BlossomBrunch Spring Tea Set', 'P', 'South sound necessary own month.', 396.15, 1895, 2, 
            495.19, 26, 43, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1985,'01985','PatriotPatch DIY Flag Kit', 'P', 'Lot grow lawyer little rule hotel response.', 192.87, 667, 14, 
            212.6, 58, 94, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1986,'01986','AutumnEcho Wind Chime', 'P', 'Hit approach property sell force.', 388.7, 927, 6, 
            465.72, 857, 51, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1987,'01987','SunkissedSummer Tanning Lotion', 'P', 'Parent road keep he.', 295.65, 1249, 16, 
            404.88, 928, 27, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1988,'01988','BooBash Halloween Punch Bowl Set', 'P', 'Special fish matter pick source between.', 453.21, 188, 3, 
            586.94, 73, 91, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1989,'01989','YuletideTunes Holiday Music Box', 'P', 'Radio most late significant language.', 492.44, 921, 9, 
            637.44, 152, 27, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1990,'01990','SpringSower Seed Bomb Kit', 'P', 'Responsibility both end moment board there Congress role.', 131.52, 2428, 12, 
            160.85, 988, 97, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1991,'01991','IndependenceIlluminate Firework LED Lights', 'P', 'Business carry interest daughter start matter.', 452.68, 1669, 5, 
            667.97, 237, 67, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1992,'01992','HarvestHarmony Table Runner', 'P', 'Discuss hundred itself.', 356.64, 2269, 9, 
            476.1, 45, 35, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1993,'01993','SummerStars Projector', 'P', 'Able executive her whom down.', 272.62, 2045, 20, 
            367.49, 110, 56, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1994,'01994','HauntedHallows Halloween Yard Decor', 'P', 'Keep less bar into.', 106.92, 588, 5, 
            134.21, 787, 44, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1995,'01995','Christmastime Cookie Cutter Set', 'P', 'Could well lay future start sense program discover.', 437.43, 456, 3, 
            583.29, 50, 30, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1996,'01996','EasterEnsemble Table Decor Set', 'P', 'Necessary others poor kitchen.', 361.44, 1384, 4, 
            429.76, 588, 67, 20);
INSERT INTO product_services (id, code, name, product_service, description, cost, 
            supplier_id, unitmeasure_id, selling_price, quantity_in_stock, ReorderLevel, category_id) 
            VALUES (1997,'01997','Thankful', 'P', 'Girl new near bring hit black throw oil.', 434.2, 1602, 6, 
            500.22, 786, 63, 20);
