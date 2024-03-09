INSERT INTO product_category (CategoryName) VALUES
    ('pc accessories'),
    ('laptop'),
    ('mobile'),
    ('camera'),
    ('tv'),
    ('others')
    ;

--SUBCATEGORY INSERTION
INSERT INTO product_subcategory (SubCategoryName, CategoryId) VALUES
    ('mouse', 1),
    ('keyboard', 1),
    ('monitor', 1),
    ('headphone', 1),
    ('speaker', 1),
    ('webcam', 1),
    ('microphone', 1),
    ('ups', 1),
    ('printer', 1),
    ('scanner', 1),
    ('projector', 1),
    ('processor', 1),
    ('ram', 1),
    ('hard disk', 1),
    ('ssd', 1),
    ('graphics card', 1),
    ('motherboard', 1),
    ('cpu cooler',1),
    ('gaming laptop', 2),
    ('business laptop', 2),
    ('student laptop', 2),
    ('gaming mobile', 3),
    ('feature mobile', 3),
    ('smartphone', 3),
    ('dslr camera', 4),
    ('mirrorless camera', 4),
    ('action camera', 4),
    ('smart tv', 5),
    ('oled tv', 5),
    ('smart watch', 6),
    ('smart band', 6),
    ('smart speaker', 6),
    ('drone', 6),
    ('smart toy', 6)
    ;