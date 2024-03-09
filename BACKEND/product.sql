/*
1 | mouse             |          1
             2 | keyboard          |          1
             3 | monitor           |          1
             4 | headphone         |          1
             5 | speaker           |          1
             6 | webcam            |          1
             7 | microphone        |          1
             8 | ups               |          1
             9 | printer           |          1
            10 | scanner           |          1
            11 | projector         |          1
            12 | processor         |          1
            13 | ram               |          1
            14 | hard disk         |          1
            15 | ssd               |          1
            16 | graphics card     |          1
            17 | motherboard       |          1
            18 | cpu cooler        |          1
            19 | gaming laptop     |          2
            20 | business laptop   |          2
            21 | student laptop    |          2
            22 | gaming mobile     |          3
            23 | feature mobile    |          3
            24 | smartphone        |          3
            25 | dslr camera       |          4
            26 | mirrorless camera |          4
            27 | action camera     |          4
            28 | smart tv          |          5
            29 | oled tv           |          5
            30 | smart watch       |          6
            31 | smart band        |          6
            32 | smart speaker     |          6
            33 | drone             |          6
            34 | smart toy         |          6

*/

INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    -- Computer Accessories (Subcategory ID: 1)
    ('Logitech K120 Wired Keyboard', 'Logitech', 50, 625.00, 'Windows USB Plug-and-Play Full-Size Spill-Resistant Curved Space Bar Compatible with PC Laptop', 4.8, 10, 2, 3),
    ('Dell U2415 UltraSharp Monitor', 'Dell', 20, 329.99, '24-inch 1920x1200 LED-Lit Screen, HDMI, DisplayPort, Mini DisplayPort, and USB 3.0', 4.5, NULL, 3, 6),
    ('Seagate Barracuda 2TB HDD', 'Seagate', 30, 69.99, '7200 RPM, 3.5" Internal Hard Drive', 4.4, 5, 14, 7),
    -- Add more computer accessories products as needed

    -- Laptops (Subcategory ID: 2)
    ('HP Pavilion Gaming Laptop', 'HP', 15, 899.99, '15.6" FHD, Intel Core i5, NVIDIA GTX 1650, 8GB RAM, 256GB SSD', 4.7, 15, 18, 4),
    ('Dell XPS 13 Business Laptop', 'Dell', 10, 1299.99, '13.3" 4K UHD, Intel Core i7, 16GB RAM, 512GB SSD', 4.9, 20, 19, 2),
    -- Add more laptop products as needed

    -- Mobile Devices (Subcategory ID: 3)
    ('Samsung Galaxy S21', 'Samsung', 25, 799.99, '6.2" Dynamic AMOLED, 128GB Storage, 12MP Camera', 4.6, NULL, 25, 8),
    ('Nokia 3310 Feature Phone', 'Nokia', 50, 49.99, '2.4" Color Display, 2MP Camera, 16MB Storage', 4.2, 7, 26, 1),
    -- Add more mobile devices products as needed

    -- Cameras (Subcategory ID: 4)
    ('Canon EOS 5D Mark IV DSLR', 'Canon', 10, 2499.00, '30.4 MP Full-Frame CMOS Sensor, 4K Video, Dual Pixel CMOS AF', 4.8, 12, 27, 10),
    ('Sony Alpha a6400 Mirrorless Camera', 'Sony', 15, 899.99, '24.2MP APS-C Sensor, 4K Video, Real-Time Eye AF', 4.7, NULL, 28, 9),
    -- Add more camera products as needed

    -- Home Electronics (Subcategory ID: 5)
    ('LG C1 OLED 4K Smart TV', 'LG', 5, 1499.99, '55" OLED Display, Dolby Vision, HDMI 2.1, webOS Smart Platform', 4.9, NULL, 29, 5),
    ('Amazon Echo Dot (4th Gen) Smart Speaker', 'Amazon', 30, 49.99, 'Alexa Voice Control, Compact Design, Charcoal', 4.5, 8, 31, 3),
    -- Add more home electronics products as needed

    -- Wearables and Gadgets (Subcategory ID: 6)
    ('Apple Watch Series 7', 'Apple', 8, 399.00, '41mm GPS, Always-On Retina Display, Blood Oxygen & ECG App', 4.8, NULL, 32, 2),
    ('DJI Mavic Air 2 Drone', 'DJI', 12, 799.00, '48MP Photo, 4K/60fps Video, SmartPhoto, HDR, Obstacle Avoidance', 4.6, 10, 33, 6),
    -- Add more wearables and gadgets products as needed
    ;


--mouse

VALUES
    ('Logitech MX Master 3 Wireless Mouse', 'Logitech', 40, 99.99, 'Advanced Ergonomic Design Precision Sensor Customizable Buttons Bluetooth/USB-C', 4.9, 15, 1, 4),
    -- Add more mouse products as needed
    ('Corsair Dark Core RGB/SE Wired/Wireless Gaming Mouse', 'Corsair', 25, 79.99, '16,000 DPI Optical Sensor, 9 Programmable Buttons, RGB Lighting, Qi Wireless Charging', 4.6, 8, 1, 6),
    ('Microsoft Sculpt Ergonomic Mouse', 'Microsoft', 30, 49.99, 'Ergonomic Design, BlueTrack Sensor, Windows Button, Wireless', 4.5, 10, 1, 3),
    -- Add more mouse products as needed
    ('Razer DeathAdder Elite Gaming Mouse', 'Razer', 20, 69.99, '16,000 DPI Optical Sensor, Mechanical Switches, 7 Programmable Buttons, RGB Lighting', 4.7, 12, 1, 9),
    -- Add more mouse products as needed
    ('SteelSeries Rival 600 Gaming Mouse', 'SteelSeries', 15, 79.99, 'Dual Optical Sensors, 12,000 CPI, 256 Weight Configurations, Split-Trigger Buttons', 4.8, NULL, 1, 7),
    ('HP X900 Wired Mouse', 'HP', 50, 19.99, '3-Button USB Wired Mouse, Optical Sensor, Ambidextrous Design', 4.2, 5, 1, 2),
    ('Anker Ergonomic Wireless Vertical Mouse', 'Anker', 35, 29.99, '2.4G Wireless, 800 / 1200 / 1600 DPI, 5 Buttons, USB Receiver', 4.4, NULL, 1, 8),
    ('Logitech G Pro X Superlight Gaming Mouse', 'Logitech', 10, 149.99, 'Lightspeed Wireless, HERO Sensor, 25,600 DPI, Ultra Lightweight Design', 4.9, 20, 1, 1),
    -- Add more mouse products as needed
    ('RAPOO M10 Plus Wireless Mouse', 'RAPOO', 28, 14.99, '2.4G Wireless, 1000 DPI, Ambidextrous Design, Portable', 4.0, 6, 1, 10),
    ('HyperX Pulsefire FPS Pro Gaming Mouse', 'HyperX', 18, 49.99, '16,000 DPI, Pixart 3389 Sensor, 6 Programmable Buttons, RGB Lighting', 4.6, NULL, 1, 5),
    ('DELL MS116 Wired Optical Mouse', 'DELL', 45, 9.99, '1000 DPI, 3 Buttons, Scroll Wheel, USB Connectivity', 4.3, 18, 1, 2),

--keyboard
    ('Logitech G Pro X Mechanical Gaming Keyboard', 'Logitech', 30, 129.99, 'Hot-swappable switches, RGB Lighting, Compact Tenkeyless Design', 4.8, 10, 2, 3),
    ('Corsair K95 RGB Platinum XT Mechanical Gaming Keyboard', 'Corsair', 15, 199.99, 'Cherry MX Switches, PBT Double-shot Keycaps, Dedicated Macro Keys, RGB Backlighting', 4.7, NULL, 2, 6),
    ('Razer BlackWidow Elite Mechanical Gaming Keyboard', 'Razer', 25, 139.99, 'Razer Green Switches, Magnetic Wrist Rest, Multi-function Digital Dial, RGB Lighting', 4.6, 8, 2, 7),
    ('Dell Alienware Pro Mechanical Gaming Keyboard', 'Dell', 20, 169.99, 'Cherry MX Brown Switches, 16.8M RGB Lighting, Dedicated Macro Keys, Magnetic Palm Rest', 4.5, 15, 2, 2),
    -- Add more keyboard products as needed
    ('SteelSeries Apex Pro Mechanical Gaming Keyboard', 'SteelSeries', 18, 199.99, 'Adjustable Mechanical Switches, OLED Smart Display, Aircraft Grade Aluminum Frame', 4.9, NULL, 2, 9),
    ('HyperX Alloy FPS Pro Mechanical Gaming Keyboard', 'HyperX', 22, 69.99, 'Cherry MX Red Switches, Red LED Backlighting, Compact Tenkeyless Design', 4.4, 5, 2, 8),
    ('HP Pavilion Gaming Keyboard 500', 'HP', 35, 79.99, 'Membrane Switches, RGB Lighting, Dedicated Media Controls, Volume Wheel', 4.2, NULL, 2, 4),
    ('ASUS ROG Strix Flare Mechanical Gaming Keyboard', 'ASUS', 12, 159.99, 'Cherry MX Red Switches, Aura Sync RGB Lighting, Customizable Badge, Dedicated Media Controls', 4.7, 12, 2, 1),
    -- Add more keyboard products as needed
    ('Logitech K780 Multi-Device Wireless Keyboard', 'Logitech', 40, 79.99, 'Easy-Switch buttons for pairing with up to 3 devices, Silent Typing, Numeric Keypad', 4.6, 18, 2, 10),
    ('Microsoft Ergonomic Keyboard', 'Microsoft', 28, 49.99, 'Split Keyset Design, Cushioned Palm Rest, Dedicated Shortcut Keys', 4.3, NULL, 2, 5),
    ('RAZER Cynosa V2 Gaming Keyboard', 'RAZER', 33, 59.99, 'Customizable RGB Lighting, Dedicated Media Controls, Programmable Macros, Synapse 3 Enabled', 4.5, 20, 2, 1),
    -- Add more keyboard products as needed

--monitor
    ('Dell S2719DGF 27" QHD Free Sync Gaming Monitor', 'Dell', 25, 349.99, '27-inch QHD (2560x1440) LED-Lit Monitor with FreeSync, 155Hz Refresh Rate, 1ms Response Time', 4.7, 10, 3, 4),
    ('LG 32GK650F-B 32" QHD Gaming Monitor', 'LG', 18, 399.99, '32-inch QHD (2560x1440) VA Panel, 144Hz Refresh Rate, Radeon FreeSync Technology', 4.8, NULL, 3, 6),
    ('Samsung Odyssey G7 27" Curved QLED Gaming Monitor', 'Samsung', 15, 699.99, '27-inch QHD (2560x1440) Curved Display, 240Hz Refresh Rate, 1ms Response Time, G-Sync Compatible', 4.9, 8, 3, 7),
    ('ASUS VG279Q 27" Full HD Gaming Monitor', 'ASUS', 30, 249.99, '27-inch Full HD (1920x1080) IPS Panel, 144Hz Refresh Rate, Extreme Low Motion Blur (ELMB)', 4.6, 15, 3, 2),
    -- Add more monitor products as needed
    ('Acer Predator X27 Pbmiphzx 27" 4K UHD Monitor', 'Acer', 12, 1499.99, '27-inch 4K UHD (3840x2160) IPS Panel, 144Hz Refresh Rate, G-Sync Ultimate, HDR1000', 4.8, NULL, 3, 9),
    ('ViewSonic VX3276-MHD 32" Full HD IPS Monitor', 'ViewSonic', 22, 249.99, '32-inch Full HD (1920x1080) IPS Panel, Ultra-Slim Design, Dual HDMI Ports', 4.4, 5, 3, 8),
    ('BenQ EX2780Q 27" QHD 144Hz Gaming Monitor', 'BenQ', 20, 449.99, '27-inch QHD (2560x1440) IPS Display, 144Hz Refresh Rate, HDRi, FreeSync', 4.5, NULL, 3, 1),
    ('HP VH240a 23.8" Full HD IPS Monitor', 'HP', 35, 149.99, '23.8-inch Full HD (1920x1080) IPS Panel, Built-in Speakers, Tilt Adjustment', 4.2, 20, 3, 10),
    -- Add more monitor products as needed
    ('Dell U3419W UltraSharp 34" Curved Monitor', 'Dell', 10, 899.99, '34-inch WQHD (3440x1440) Curved Display, 60Hz Refresh Rate, USB-C Connectivity', 4.7, NULL, 3, 3),
    ('MSI Optix MAG271CQR 27" WQHD Curved Gaming Monitor', 'MSI', 28, 349.99, '27-inch WQHD (2560x1440) Curved Display, 144Hz Refresh Rate, FreeSync', 4.3, 18, 3, 5),
    ('LG 27UK850-W 27" 4K UHD IPS Monitor', 'LG', 15, 499.99, '27-inch 4K UHD (3840x2160) IPS Display, HDR10, USB-C, sRGB 99%', 4.6, NULL, 3, 2),
    -- Add more monitor products as needed

--headphone
 ('Sony WH-1000XM4 Wireless Noise-Canceling Headphones', 'Sony', 20, 349.99, 'Industry-leading Noise Cancellation, 30 Hours Battery Life, Touch Controls', 4.9, 15, 4, 3),
    ('Bose QuietComfort 35 II Wireless Bluetooth Headphones', 'Bose', 25, 299.99, 'Active Noise Cancellation, Alexa Voice Control, 20 Hours Battery Life', 4.7, NULL, 4, 6),
    ('Sennheiser HD 660 S Open Back Headphones', 'Sennheiser', 15, 499.99, 'High-Resolution Audio, Open-Back Design, Detachable Cable', 4.8, 8, 4, 7),
    ('JBL LIVE 650BTNC Wireless Over-Ear Noise-Canceling Headphones', 'JBL', 30, 149.99, 'Active Noise Cancellation, 20 Hours Battery Life, Multi-Point Connection', 4.6, 10, 4, 2),
    -- Add more headphone products as needed
    ('Apple AirPods Pro', 'Apple', 18, 249.99, 'Active Noise Cancellation, Transparency Mode, Sweat and Water Resistant', 4.5, NULL, 4, 9),
    ('Beyerdynamic DT 990 PRO Open-Back Studio Headphones', 'Beyerdynamic', 22, 159.99, '250 ohms, Wide Frequency Response, Comfortable Design', 4.4, 5, 4, 8),
    ('Skullcandy Crusher Wireless Over-Ear Headphones', 'Skullcandy', 35, 99.99, 'Adjustable Bass, Bluetooth Wireless, 40 Hours Battery Life', 4.2, NULL, 4, 4),
    ('AKG K371 Closed-Back Studio Headphones', 'AKG', 10, 149.99, 'Over-Ear, Foldable Design, Detachable Cable, 50mm Drivers', 4.7, 20, 4, 1),
    -- Add more headphone products as needed
    ('Audio-Technica ATH-M50x Professional Studio Monitor Headphones', 'Audio-Technica', 28, 149.99, '45mm Drivers, Circumaural Design, Detachable Cable, Critically Acclaimed Sound', 4.8, NULL, 4, 10),
    ('Beats Solo Pro Wireless Noise Cancelling On-Ear Headphones', 'Beats by Dre', 12, 299.99, 'Active Noise Cancelling, Apple H1 Chip, Foldable Design', 4.3, 18, 4, 5),
    ('Plantronics BackBeat PRO 2 Wireless Over-Ear Headphones', 'Plantronics', 20, 199.99, 'Active Noise Canceling, 24 Hours Battery Life, On-Demand Active Noise Canceling', 4.6, NULL, 4, 2),
    -- Add more headphone products as needed

--speaker
    ('Sonos One (Gen 2) Smart Speaker', 'Sonos', 15, 199.99, 'Smart Speaker with Alexa Voice Control, WiFi Streaming, Multi-Room Capability', 4.8, 10, 5, 3),
    ('Bose SoundLink Revolve+ Portable Bluetooth Speaker', 'Bose', 20, 299.99, '360-degree Sound, Portable Design, Water-Resistant', 4.7, NULL, 5, 6),
    ('JBL Charge 4 Waterproof Portable Bluetooth Speaker', 'JBL', 25, 129.99, 'Wireless Bluetooth Streaming, 20 Hours Battery Life, IPX7 Waterproof', 4.6, 8, 5, 7),
    ('UE MEGABOOM 3 Portable Bluetooth Speaker', 'Ultimate Ears', 30, 199.99, '360-degree Sound, Deep Bass, Magic Button for Music Controls', 4.7, 15, 5, 2),
    -- Add more speaker products as needed
    ('Sony SRS-X9 High-Resolution Bluetooth Speaker', 'Sony', 18, 599.99, 'High-Resolution Audio, WiFi and Bluetooth Connectivity, Multi-Room Capability', 4.5, NULL, 5, 9),
    ('Anker Soundcore Motion+ Bluetooth Speaker', 'Anker', 22, 99.99, 'Hi-Res Audio, 30W Audio Output, BassUp Technology, IPX7 Waterproof', 4.4, 5, 5, 8),
    ('Marshall Kilburn II Portable Bluetooth Speaker', 'Marshall', 35, 249.99, '20+ Hours Battery Life, Bluetooth 5.0, Iconic Marshall Design', 4.2, NULL, 5, 4),
    ('Harman Kardon Onyx Studio 6 Wireless Bluetooth Speaker', 'Harman Kardon', 10, 249.99, '8 Hours Playtime, IPX7 Waterproof, Wireless Dual Sound', 4.7, 20, 5, 1),
    -- Add more speaker products as needed
    ('Edifier R980T 4" Active Bookshelf Speakers', 'Edifier', 28, 69.99, '24W RMS Power Output, Dual RCA Inputs, Classic Wood Finish', 4.8, NULL, 5, 10),
    ('Bang & Olufsen Beoplay A9 Wireless Speaker', 'Bang & Olufsen', 12, 2699.99, 'Powerful 480-Watt Amplification, WiFi and Bluetooth, Room Adaptive Sound', 4.9, 18, 5, 5),
    ('Creative Pebble 2.0 Desktop Speakers', 'Creative', 20, 24.99, 'USB-Powered, 45° Elevated Drivers, Easy Access Volume Control', 4.5, NULL, 5, 2),
    -- Add more speaker products as needed

--webcam
    ('Logitech C920 HD Pro Webcam', 'Logitech', 25, 79.99, '1080p Full HD Video Calling, Autofocus, Dual Stereo Microphones', 4.8, 10, 6, 3),
    ('Microsoft LifeCam HD-3000 Webcam', 'Microsoft', 30, 29.99, '720p HD Video Chat, TrueColor Technology, Universal Attachment Base', 4.5, NULL, 6, 6),
    ('Razer Kiyo Streaming Webcam', 'Razer', 20, 99.99, '1080p 30FPS / 720p 60FPS Video, Adjustable Brightness Ring Light, Autofocus', 4.7, 8, 6, 7),
    ('Logitech BRIO Ultra HD Pro Webcam', 'Logitech', 15, 199.99, '4K Ultra HD Video Calling, 5X Digital Zoom, RightLight 3 with HDR', 4.9, 15, 6, 2),
    -- Add more webcam products as needed
    ('AverMedia Live Streamer CAM 313 Webcam', 'AverMedia', 18, 49.99, '720p HD Video, Privacy Shutter, Built-in Microphone', 4.4, NULL, 6, 9),
    ('Creative Live! Cam Sync 1080p Webcam', 'Creative', 22, 39.99, '1080p Full HD Video, Fixed Focus, Built-in Noise-Canceling Microphone', 4.2, 5, 6, 8),
    ('Genius WideCam F100 Webcam', 'Genius', 35, 49.99, '1080p Full HD Wide-Angle Lens, Noise Reduction Microphone, Plug and Play', 4.0, NULL, 6, 4),
    ('AUKEY FHD Webcam', 'AUKEY', 10, 59.99, '1080p Full HD Video, Dual Stereo Microphones, Fixed Focus', 4.5, 20, 6, 1),
    -- Add more webcam products as needed
    ('Lenovo 500 FHD Webcam', 'Lenovo', 28, 69.99, '1080p Full HD Video, 75° Wide-Angle Lens, Privacy Shutter', 4.6, NULL, 6, 10),
    ('HP HD 4310 Webcam', 'HP', 12, 59.99, '1080p Full HD Video, Autofocus, Built-in Stereo Microphones', 4.3, 18, 6, 5),
    ('AUSDOM AW620 Pro Webcam', 'AUSDOM', 20, 79.99, '1080p Full HD Video, Noise-Canceling Microphone, Auto Low Light Correction', 4.1, NULL, 6, 2),

--microphone
    ('Blue Yeti USB Microphone', 'Blue', 25, 129.99, 'Tri-Capsule Array for 4 Pickup Patterns, Gain Control, Mute Button', 4.7, 10, 7, 3),
    ('Audio-Technica ATR2100x-USB Cardioid Dynamic USB/XLR Microphone', 'Audio-Technica', 30, 99.99, 'USB and XLR Outputs, Cardioid Polar Pattern, Built-in Headphone Jack', 4.8, NULL, 7, 6),
    ('Shure SM7B Cardioid Dynamic Studio Vocal Microphone', 'Shure', 20, 399.99, 'Cardioid Polar Pattern, Wide Frequency Response, Air Suspension Shock Isolation System', 4.9, 8, 7, 7),
    ('Rode NT-USB Mini USB Microphone', 'Rode', 15, 99.99, 'Studio-Quality Recording, USB-C Connectivity, Pop Shield Included', 4.6, 15, 7, 2),
    -- Add more microphone products as needed
    ('HyperX QuadCast USB Condenser Gaming Microphone', 'HyperX', 18, 139.99, 'Four Selectable Polar Patterns, Shock Mount, Pop Filter', 4.5, NULL, 7, 9),
    ('FIFINE USB Podcast Condenser Microphone', 'FIFINE', 22, 49.99, 'USB Connectivity, Cardioid Polar Pattern, Metal Construction', 4.4, 5, 7, 8),
    ('Samson Go Mic Portable USB Condenser Microphone', 'Samson', 35, 39.99, 'Compact and Portable Design, Plug and Play USB Connection', 4.2, NULL, 7, 4),
    ('Blue Snowball iCE USB Microphone', 'Blue', 10, 49.99, 'Cardioid Polar Pattern, Custom Condenser Capsule, Plug and Play', 4.0, 20, 7, 1),
    -- Add more microphone products as needed
    ('Maono AU-PM421 USB Microphone Kit', 'Maono', 28, 69.99, 'Cardioid Polar Pattern, 192kHz/24-bit Sampling Rate, Metal Construction', 4.6, NULL, 7, 10),
    ('CAD Audio U37 USB Studio Condenser Recording Microphone', 'CAD Audio', 12, 49.99, 'Cardioid Polar Pattern, Bass Reduction Switch, -10dB Overload-Protection Switch', 4.3, 18, 7, 5),
    ('TONOR USB Gaming Microphone', 'TONOR', 20, 29.99, 'Plug and Play USB Connection, Cardioid Polar Pattern, Mute Button', 4.1, NULL, 7, 2),
    -- Add more microphone products as needed

--ups
    ('APC Back-UPS Pro 1500VA UPS', 'APC', 20, 199.99, '1500VA/900W, Sinewave UPS, 10 Outlets, AVR, LCD Display', 4.8, 10, 8, 3),
    ('CyberPower CP1500PFCLCD PFC Sinewave UPS', 'CyberPower', 25, 189.99, '1500VA/900W, PFC Sinewave UPS, 12 Outlets, AVR, LCD Display', 4.7, NULL, 8, 6),
    ('Tripp Lite SMART1500LCDT UPS', 'Tripp Lite', 15, 169.99, '1500VA/900W, Line-Interactive UPS, 10 Outlets, AVR, LCD Display', 4.6, 8, 8, 7),
    ('Eaton 5SC1500 UPS', 'Eaton', 30, 229.99, '1500VA/900W, Line-Interactive UPS, 10 Outlets, LCD Display', 4.9, 15, 8, 2),
    -- Add more UPS products as needed
    ('APC BE600M1 Back-UPS 600VA UPS', 'APC', 18, 74.99, '600VA/330W, Standby UPS, 7 Outlets, USB Charging Port', 4.5, NULL, 8, 9),
    ('CyberPower EC850LCD Ecologic UPS', 'CyberPower', 22, 89.99, '850VA/510W, Standby UPS, 12 Outlets, ECO Mode', 4.4, 5, 8, 8),
    ('Tripp Lite AVR750U UPS', 'Tripp Lite', 35, 79.99, '750VA/450W, Line-Interactive UPS, 12 Outlets, AVR', 4.2, NULL, 8, 4),
    ('APC BX1500M Back-UPS Pro 1500VA UPS', 'APC', 10, 199.99, '1500VA/900W, Sinewave UPS, 10 Outlets, AVR, LCD Display', 4.0, 20, 8, 1),
    -- Add more UPS products as needed
    ('CyberPower CP850PFCLCD PFC Sinewave UPS', 'CyberPower', 28, 109.99, '850VA/510W, PFC Sinewave UPS, 10 Outlets, AVR, LCD Display', 4.6, NULL, 8, 10),
    ('Tripp Lite SMART1000LCDT UPS', 'Tripp Lite', 12, 129.99, '1000VA/500W, Line-Interactive UPS, 8 Outlets, AVR, LCD Display', 4.3, 18, 8, 5),
    ('Eaton 5E850iUSB UPS', 'Eaton', 20, 79.99, '850VA/480W, Line-Interactive UPS, 6 Outlets, USB Port', 4.5, NULL, 8, 2),
    -- Add more UPS products as needed

--printer

    ('HP LaserJet Pro M404dn Monochrome Laser Printer', 'HP', 25, 199.99, 'Monochrome, Up to 40 ppm, Auto Duplex Printing, Ethernet Connectivity', 4.8, 10, 9, 3),
    ('Epson EcoTank ET-4760 Wireless Color All-in-One Printer', 'Epson', 30, 499.99, 'Color, Supertank Design, Wireless Printing, Auto Document Feeder', 4.7, NULL, 9, 6),
    ('Canon PIXMA TR8520 Wireless All in One Printer', 'Canon', 20, 149.99, 'Color, Print, Copy, Scan, Fax, Wireless Printing, Touchscreen', 4.6, 8, 9, 7),
    ('Brother HL-L2380DW Wireless Monochrome Laser Printer', 'Brother', 15, 189.99, 'Monochrome, Up to 32 ppm, Wireless Printing, Duplex Printing', 4.9, 15, 9, 2),
    -- Add more printer products as needed
    ('Dell E310dw Monochrome Laser Printer', 'Dell', 18, 129.99, 'Monochrome, Up to 27 ppm, Wireless Printing, Auto Duplex Printing', 4.5, NULL, 9, 9),
    ('Samsung Xpress C430W Wireless Color Laser Printer', 'Samsung', 22, 229.99, 'Color, Up to 19 ppm, Wireless Printing, NFC Tap and Print', 4.4, 5, 9, 8),
    ('Lexmark CX517de Color All-In-One Laser Printer', 'Lexmark', 35, 499.99, 'Color, Up to 32 ppm, Duplex Printing, Touchscreen, Ethernet', 4.2, NULL, 9, 4),
    ('HP OfficeJet Pro 9015 All-in-One Wireless Printer', 'HP', 10, 229.99, 'Color, Print, Copy, Scan, Fax, Wireless Printing, Smart Tasks', 4.0, 20, 9, 1),
    -- Add more printer products as needed
    ('Canon imageCLASS MF264dw Monochrome Laser Printer', 'Canon', 28, 179.99, 'Monochrome, Up to 30 ppm, Wireless Printing, Auto Duplex Printing', 4.6, NULL, 9, 10),
    ('Epson WorkForce Pro WF-3720 Wireless All-in-One Printer', 'Epson', 12, 149.99, 'Color, Print, Copy, Scan, Fax, Wireless Printing, Auto Document Feeder', 4.3, 18, 9, 5),
    ('Brother MFC-L8900CDW Color Laser All-in-One Printer', 'Brother', 20, 399.99, 'Color, Up to 33 ppm, Wireless Printing, Auto Duplex Printing', 4.5, NULL, 9, 2),
    -- Add more printer products as needed

--scanner
    ('Epson Perfection V600 Color Photo, Image, Film, Negative Scanner', 'Epson', 25, 229.99, 'High-Quality Scanning, 6400 x 9600 dpi Optical Resolution, Digital ICE Technology', 4.8, 10, 10, 3),
    ('Canon CanoScan LiDE 300 Color Image Scanner', 'Canon', 30, 69.99, 'Compact and Lightweight Design, 2400 x 2400 dpi Optical Resolution, USB Powered', 4.7, NULL, 10, 6),
    ('Fujitsu ScanSnap iX1500 Color Duplex Document Scanner', 'Fujitsu', 20, 429.99, 'Duplex Scanning, Touchscreen, Wireless Connectivity, 30 ppm', 4.6, 8, 10, 7),
    ('Brother DS-720D Mobile Duplex Color Page Scanner', 'Brother', 15, 109.99, 'Compact and Portable, Duplex Scanning, 600 x 600 dpi Optical Resolution', 4.9, 15, 10, 2),
    -- Add more scanner products as needed
    ('HP ScanJet Pro 2500 f1 Flatbed Scanner', 'HP', 18, 279.99, 'Flatbed and Sheetfed Scanning, 1200 x 1200 dpi Optical Resolution, 20 ppm', 4.5, NULL, 10, 9),
    ('Epson WorkForce ES-400 Color Duplex Document Scanner', 'Epson', 22, 349.99, 'Duplex Scanning, 600 x 600 dpi Optical Resolution, 35 ppm', 4.4, 5, 10, 8),
    ('Plustek ePhoto Z300 Photo and Document Scanner', 'Plustek', 35, 199.99, 'Auto Crop and Deskew, 600 dpi Optical Resolution, One-Touch Scanning', 4.2, NULL, 10, 4),
    ('Canon imageFORMULA R40 Office Document Scanner', 'Canon', 10, 279.99, 'Sheetfed Scanning, 600 x 600 dpi Optical Resolution, 40 ppm', 4.0, 20, 10, 1),
    -- Add more scanner products as needed
    ('Epson DS-1630 Flatbed Color Document Scanner', 'Epson', 28, 299.99, 'Flatbed and Sheetfed Scanning, 1200 x 1200 dpi Optical Resolution, 25 ppm', 4.6, NULL, 10, 10),
    ('Doxie Q - Wireless Rechargeable Document Scanner', 'Doxie', 12, 199.99, 'Wireless Scanning, 600 x 600 dpi Optical Resolution, Automatic Document Feeder', 4.3, 18, 10, 5),
    ('Xerox DocuMate 3125 Duplex Color Document Scanner', 'Xerox', 20, 299.99, 'Duplex Scanning, 600 x 600 dpi Optical Resolution, 25 ppm', 4.5, NULL, 10, 2),
    -- Add more scanner products as needed

--projector
    ('Epson Home Cinema 2150 Wireless 1080p Projector', 'Epson', 25, 799.99, 'Full HD 1080p, Wireless Miracast, 2500 Lumens, 60,000:1 Contrast Ratio', 4.8, 10, 11, 3),
    ('BenQ HT2050A 1080P Home Theater Projector', 'BenQ', 30, 699.99, 'Full HD 1080p, 2200 Lumens, 15,000:1 Contrast Ratio, Cinematic Color', 4.7, NULL, 11, 6),
    ('ViewSonic PA503W 3600 Lumens WXGA Projector', 'ViewSonic', 20, 349.99, 'WXGA (1280x800) Resolution, 3600 Lumens, 22,000:1 Contrast Ratio', 4.6, 8, 11, 7),
    ('Optoma HD146X High Performance Projector', 'Optoma', 15, 549.99, 'HD 1080p, 3600 Lumens, 25,000:1 Contrast Ratio, Dynamic Black Technology', 4.9, 15, 11, 2),
    -- Add more projector products as needed
    ('Anker Nebula Capsule Smart Wi-Fi Mini Projector', 'Anker', 18, 299.99, '3600 Lumens, 100 ANSI Lumens, 100-inch Projection, Android 7.1', 4.5, NULL, 11, 9),
    ('LG CineBeam PH30N Portable LED Projector', 'LG', 22, 399.99, 'HD 720p, 250 Lumens, 30,000 Hours Lamp Life, Wireless Screen Share', 4.4, 5, 11, 8),
    ('Epson VS250 SVGA 3,200 Lumens Color Brightness Projector', 'Epson', 35, 299.99, 'SVGA (800x600) Resolution, 3200 Lumens, 15,000:1 Contrast Ratio', 4.2, NULL, 11, 4),
    ('Sony VPL-HW45ES Full HD SXRD Home Cinema Projector', 'Sony', 10, 1999.99, 'Full HD 1080p, 1800 Lumens, 120,000:1 Contrast Ratio, Reality Creation', 4.0, 20, 11, 1),
    -- Add more projector products as needed
    ('Acer H5382BD 720p Home Theater Projector', 'Acer', 28, 369.99, 'HD 720p, 3300 Lumens, 20,000:1 Contrast Ratio, Keystone Correction', 4.6, NULL, 11, 10),
    ('VANKYO Performance V600 Native 1080P LED Projector', 'VANKYO', 12, 249.99, 'Full HD 1080p, 5000 Lumens, 5000:1 Contrast Ratio, ±50° Keystone Correction', 4.3, 18, 11, 5),
    ('BenQ TK800M 4K UHD HDR Home Theater Projector', 'BenQ', 20, 1099.99, '4K UHD (3840x2160) Resolution, 3000 Lumens, 10,000:1 Contrast Ratio', 4.5, NULL, 11, 2),
    -- Add more projector products as needed

--processor
    ('Intel Core i9-11900K Desktop Processor', 'Intel', 25, 549.99, '8 Cores, 16 Threads, 3.50 GHz Base Frequency, 5.30 GHz Max Turbo Frequency', 4.8, 10, 12, 3),
    ('AMD Ryzen 9 5900X 12-Core Desktop Processor', 'AMD', 30, 549.99, '12 Cores, 24 Threads, 3.70 GHz Base Frequency, 4.80 GHz Max Boost Frequency', 4.7, NULL, 12, 6),
    ('Intel Core i7-12700K Desktop Processor', 'Intel', 20, 399.99, '12 Cores, 20 Threads, 3.60 GHz Base Frequency, 5.00 GHz Max Turbo Frequency', 4.6, 8, 12, 7),
    ('AMD Ryzen 7 5800X 8-Core Desktop Processor', 'AMD', 15, 399.99, '8 Cores, 16 Threads, 3.80 GHz Base Frequency, 4.70 GHz Max Boost Frequency', 4.9, 15, 12, 2),
    -- Add more processor products as needed
    ('Intel Core i5-11600K Desktop Processor', 'Intel', 18, 269.99, '6 Cores, 12 Threads, 3.90 GHz Base Frequency, 4.90 GHz Max Turbo Frequency', 4.5, NULL, 12, 9),
    ('AMD Ryzen 5 5600X 6-Core Desktop Processor', 'AMD', 22, 299.99, '6 Cores, 12 Threads, 3.70 GHz Base Frequency, 4.60 GHz Max Boost Frequency', 4.4, 5, 12, 8),
    ('Intel Core i9-12900K Desktop Processor', 'Intel', 35, 699.99, '16 Cores, 24 Threads, 3.20 GHz Base Frequency, 5.30 GHz Max Turbo Frequency', 4.2, NULL, 12, 4),
    ('AMD Ryzen 9 5950X 16-Core Desktop Processor', 'AMD', 10, 799.99, '16 Cores, 32 Threads, 3.40 GHz Base Frequency, 4.90 GHz Max Boost Frequency', 4.0, 20, 12, 1),
    -- Add more processor products as needed
    ('Intel Core i3-10100 Desktop Processor', 'Intel', 28, 119.99, '4 Cores, 8 Threads, 3.60 GHz Base Frequency, 4.30 GHz Max Turbo Frequency', 4.6, NULL, 12, 10),
    ('AMD Ryzen 3 3300X 4-Core Desktop Processor', 'AMD', 12, 149.99, '4 Cores, 8 Threads, 3.80 GHz Base Frequency, 4.30 GHz Max Boost Frequency', 4.3, 18, 12, 5),
    ('Intel Core i7-11700K Desktop Processor', 'Intel', 20, 399.99, '8 Cores, 16 Threads, 3.60 GHz Base Frequency, 5.00 GHz Max Turbo Frequency', 4.5, NULL, 12, 2),
    -- Add more processor products as needed

--ram

    ('Corsair Vengeance LPX 16GB (2 x 8GB) DDR4 3200MHz RAM', 'Corsair', 25, 89.99, 'DDR4, 16GB (2 x 8GB), 3200MHz, CAS Latency 16, XMP 2.0 Support', 4.8, 10, 13, 3),
    ('Crucial Ballistix RGB 32GB (2 x 16GB) DDR4 3600MHz RAM', 'Crucial', 30, 159.99, 'DDR4, 32GB (2 x 16GB), 3600MHz, CAS Latency 16, RGB Lighting', 4.7, NULL, 13, 6),
    ('G.SKILL Ripjaws V 8GB (2 x 4GB) DDR4 3000MHz RAM', 'G.SKILL', 20, 49.99, 'DDR4, 8GB (2 x 4GB), 3000MHz, CAS Latency 15, XMP 2.0 Support', 4.6, 8, 13, 7),
    ('Kingston HyperX Fury 64GB (4 x 16GB) DDR4 3200MHz RAM', 'Kingston', 15, 299.99, 'DDR4, 64GB (4 x 16GB), 3200MHz, CAS Latency 16, Plug and Play', 4.9, 15, 13, 2),
    -- Add more RAM products as needed
    ('ADATA XPG Gammix D10 16GB (2 x 8GB) DDR4 2666MHz RAM', 'ADATA', 18, 74.99, 'DDR4, 16GB (2 x 8GB), 2666MHz, CAS Latency 16, Intel XMP 2.0 Support', 4.5, NULL, 13, 9),
    ('Team T-Force Vulcan Z 32GB (2 x 16GB) DDR4 3000MHz RAM', 'Team', 22, 129.99, 'DDR4, 32GB (2 x 16GB), 3000MHz, CAS Latency 16, Aluminum Heat Spreader', 4.4, 5, 13, 8),
    ('Patriot Viper Steel Series 16GB (2 x 8GB) DDR4 4400MHz RAM', 'Patriot', 35, 119.99, 'DDR4, 16GB (2 x 8GB), 4400MHz, CAS Latency 19, XMP 2.0 Support', 4.2, NULL, 13, 4),
    ('Corsair Dominator Platinum RGB 128GB (4 x 32GB) DDR4 3600MHz RAM', 'Corsair', 10, 799.99, 'DDR4, 128GB (4 x 32GB), 3600MHz, CAS Latency 18, RGB Lighting', 4.0, 20, 13, 1),
    -- Add more RAM products as needed
    ('Crucial Ballistix Sport LT 8GB (2 x 4GB) DDR4 2666MHz RAM', 'Crucial', 28, 59.99, 'DDR4, 8GB (2 x 4GB), 2666MHz, CAS Latency 16, Digital Camo Heatspreader', 4.6, NULL, 13, 10),
    ('G.SKILL Trident Z Neo 64GB (2 x 32GB) DDR4 3600MHz RAM', 'G.SKILL', 12, 349.99, 'DDR4, 64GB (2 x 32GB), 3600MHz, CAS Latency 18, RGB Lighting', 4.3, 18, 13, 5),
    ('HyperX Fury 16GB (1 x 16GB) DDR4 2666MHz RAM', 'HyperX', 20, 79.99, 'DDR4, 16GB (1 x 16GB), 2666MHz, CAS Latency 16, Plug and Play', 4.5, NULL, 13, 2),
    -- Add more RAM products as needed

--HDD
    ('Seagate Barracuda 2TB 3.5" SATA HDD', 'Seagate', 25, 59.99, '2TB Capacity, 7200 RPM, SATA 6Gb/s, 3.5" Form Factor', 4.8, 10, 14, 3),
    ('Western Digital Blue 4TB 3.5" SATA HDD', 'Western Digital', 30, 89.99, '4TB Capacity, 5400 RPM, SATA 6Gb/s, 3.5" Form Factor', 4.7, NULL, 14, 6),
    ('Toshiba P300 3TB 3.5" SATA HDD', 'Toshiba', 18, 79.99, '3TB Capacity, 7200 RPM, SATA 6Gb/s, 3.5" Form Factor', 4.5, NULL, 14, 9),
    ('Seagate IronWolf 6TB 3.5" NAS HDD', 'Seagate', 28, 179.99, '6TB Capacity, 7200 RPM, SATA 6Gb/s, 3.5" Form Factor, AgileArray Technology', 4.6, NULL, 14, 10),
    -- Add more HDD products as needed
    ('Western Digital Red 8TB 3.5" NAS HDD', 'Western Digital', 22, 229.99, '8TB Capacity, 5400 RPM, SATA 6Gb/s, 3.5" Form Factor, NASware 3.0', 4.4, 5, 14, 8),
    ('Seagate BarraCuda 1TB 3.5" SATA HDD', 'Seagate', 35, 44.99, '1TB Capacity, 7200 RPM, SATA 6Gb/s, 3.5" Form Factor', 4.2, NULL, 14, 4),
    ('Hitachi Ultrastar 4TB 3.5" SATA Enterprise HDD', 'Hitachi', 10, 129.99, '4TB Capacity, 7200 RPM, SATA 6Gb/s, 3.5" Form Factor, 2 Million Hours MTBF', 4.0, 20, 14, 1),
    ('WD Black 2TB 3.5" SATA HDD', 'Western Digital', 28, 109.99, '2TB Capacity, 7200 RPM, SATA 6Gb/s, 3.5" Form Factor, Performance Storage', 4.6, NULL, 14, 7),
    -- Add more HDD products as needed
    ('Seagate SkyHawk 10TB 3.5" Surveillance HDD', 'Seagate', 12, 279.99, '10TB Capacity, 7200 RPM, SATA 6Gb/s, 3.5" Form Factor, SkyHawk Health Management', 4.3, 18, 14, 5),
    ('Toshiba X300 5TB 3.5" SATA HDD', 'Toshiba', 20, 119.99, '5TB Capacity, 7200 RPM, SATA 6Gb/s, 3.5" Form Factor, Internal Hard Drive', 4.5, NULL, 14, 2),
    ('Western Digital Gold 12TB 3.5" SATA Enterprise HDD', 'Western Digital', 15, 349.99, '12TB Capacity, 7200 RPM, SATA 6Gb/s, 3.5" Form Factor, Datacenter Storage', 4.2, NULL, 14, 10),
    -- Add more HDD products as needed

--ssd
    ('Samsung 970 EVO 1TB NVMe M.2 Internal SSD', 'Samsung', 25, 149.99, '1TB Capacity, NVMe PCIe Gen3 x4, M.2 2280 Form Factor, Read Speed up to 3400MB/s', 4.8, 10, 15, 3),
    ('Crucial MX500 500GB 2.5" SATA SSD', 'Crucial', 30, 69.99, '500GB Capacity, SATA 6Gb/s, 2.5" Form Factor, 3D NAND Technology', 4.7, NULL, 15, 6),
    ('ADATA XPG SX8200 Pro 2TB NVMe M.2 Internal SSD', 'ADATA', 20, 259.99, '2TB Capacity, NVMe PCIe Gen3 x4, M.2 2280 Form Factor, Read Speed up to 3500MB/s', 4.6, 8, 15, 7),
    ('WD Blue 250GB 3D NAND 2.5" SATA SSD', 'Western Digital', 15, 39.99, '250GB Capacity, SATA 6Gb/s, 2.5" Form Factor, 3D NAND Technology', 4.9, 15, 15, 2),
    -- Add more SSD products as needed
    ('Kingston A2000 1TB NVMe M.2 Internal SSD', 'Kingston', 18, 119.99, '1TB Capacity, NVMe PCIe Gen3 x4, M.2 2280 Form Factor, Read Speed up to 2200MB/s', 4.5, NULL, 15, 9),
    ('Sandisk Ultra 3D NAND 500GB 2.5" SATA SSD', 'SanDisk', 22, 59.99, '500GB Capacity, SATA 6Gb/s, 2.5" Form Factor, 3D NAND Technology', 4.4, 5, 15, 8),
    ('Intel 660p Series 1TB NVMe M.2 Internal SSD', 'Intel', 35, 109.99, '1TB Capacity, NVMe PCIe Gen3 x4, M.2 2280 Form Factor, QLC NAND Technology', 4.2, NULL, 15, 4),
    ('Corsair MP510 480GB NVMe M.2 Internal SSD', 'Corsair', 10, 79.99, '480GB Capacity, NVMe PCIe Gen3 x4, M.2 2280 Form Factor, Read Speed up to 3480MB/s', 4.0, 20, 15, 1),
    -- Add more SSD products as needed
    ('ADATA SU800 256GB 2.5" SATA SSD', 'ADATA', 28, 44.99, '256GB Capacity, SATA 6Gb/s, 2.5" Form Factor, 3D NAND Technology', 4.6, NULL, 15, 10),
    ('Seagate BarraCuda 120 500GB 2.5" SATA SSD', 'Seagate', 12, 59.99, '500GB Capacity, SATA 6Gb/s, 2.5" Form Factor, Read Speed up to 560MB/s', 4.3, 18, 15, 5),
    ('Patriot Burst 240GB 2.5" SATA SSD', 'Patriot', 20, 34.99, '240GB Capacity, SATA 6Gb/s, 2.5" Form Factor, 3D NAND Technology', 4.5, NULL, 15, 2),
    -- Add more SSD products as needed

--gpu 
    ('NVIDIA GeForce RTX 3080 Founders Edition', 'NVIDIA', 25, 699.99, '10GB GDDR6X, 8704 CUDA Cores, Ray Tracing, PCIe 4.0, HDMI, DisplayPort', 4.8, 10, 16, 3),
    ('AMD Radeon RX 6900 XT', 'AMD', 30, 999.99, '16GB GDDR6, 5120 Stream Processors, Ray Tracing, PCIe 4.0, HDMI, DisplayPort', 4.7, NULL, 16, 6),
    ('MSI GeForce RTX 3060 Gaming X Trio', 'MSI', 20, 399.99, '12GB GDDR6, 3584 CUDA Cores, Ray Tracing, PCIe 4.0, HDMI, DisplayPort', 4.6, 8, 16, 7),
    ('Gigabyte AORUS GeForce RTX 3070 Master', 'Gigabyte', 15, 599.99, '8GB GDDR6X, 5888 CUDA Cores, Ray Tracing, PCIe 4.0, HDMI, DisplayPort', 4.9, 15, 16, 2),
    -- Add more GPU products as needed
    ('EVGA GeForce GTX 1660 Super SC Ultra Gaming', 'EVGA', 18, 239.99, '6GB GDDR5, 1408 CUDA Cores, Dual Fan, PCIe 3.0, HDMI, DisplayPort', 4.5, NULL, 16, 9),
    ('ASUS ROG Strix Radeon RX 5700 XT', 'ASUS', 22, 449.99, '8GB GDDR6, 2560 Stream Processors, Axial-tech Fan Design, PCIe 4.0, HDMI, DisplayPort', 4.4, 5, 16, 8),
    ('ZOTAC Gaming GeForce RTX 3090 Trinity', 'ZOTAC', 35, 1499.99, '24GB GDDR6X, 10496 CUDA Cores, IceStorm 2.0 Cooling, PCIe 4.0, HDMI, DisplayPort', 4.2, NULL, 16, 4),
    ('PowerColor Red Devil Radeon RX 580', 'PowerColor', 10, 189.99, '8GB GDDR5, 2304 Stream Processors, Triple Fan Design, PCIe 3.0, HDMI, DisplayPort', 4.0, 20, 16, 1),
    -- Add more GPU products as needed
    ('NVIDIA Quadro P5000', 'NVIDIA', 28, 799.99, '16GB GDDR5X, 2560 CUDA Cores, VR Ready, Pascal Architecture, 4x DisplayPort, 1x DVI-D', 4.6, NULL, 16, 10),
    ('Sapphire Pulse Radeon RX 5600 XT', 'Sapphire', 12, 279.99, '6GB GDDR6, 2304 Stream Processors, Dual-X Cooling, PCIe 4.0, HDMI, DisplayPort', 4.3, 18, 16, 5),
    ('PNY GeForce GTX 1650 Super XLR8 Gaming Overclocked', 'PNY', 20, 159.99, '4GB GDDR5, 1280 CUDA Cores, Single Fan, PCIe 3.0, HDMI, DisplayPort', 4.5, NULL, 16, 2),
    -- Add more GPU products as needed

--motherboard
    ('ASUS ROG Strix B550-F Gaming (Wi-Fi 6) ATX Motherboard', 'ASUS', 25, 189.99, 'ATX Form Factor, AMD B550 Chipset, AM4 Socket, Wi-Fi 6, PCIe 4.0, RGB Lighting', 4.8, 10, 17, 3),
    ('GIGABYTE Z590 AORUS MASTER ATX Motherboard', 'GIGABYTE', 30, 349.99, 'ATX Form Factor, Intel Z590 Chipset, LGA1200 Socket, PCIe 4.0, Thunderbolt 4, RGB Fusion', 4.7, NULL, 17, 6),
    ('MSI B450 TOMAHAWK MAX ATX Motherboard', 'MSI', 20, 109.99, 'ATX Form Factor, AMD B450 Chipset, AM4 Socket, DDR4, USB 3.2 Gen2, Mystic Light', 4.6, 8, 17, 7),
    ('ASRock B550M PRO4 Micro ATX Motherboard', 'ASRock', 15, 94.99, 'Micro ATX Form Factor, AMD B550 Chipset, AM4 Socket, PCIe 4.0, Steel Slot, 9 Power Phase Design', 4.9, 15, 17, 2),
    -- Add more Motherboard products as needed
    ('EVGA Z590 FTW WIFI ATX Motherboard', 'EVGA', 18, 279.99, 'ATX Form Factor, Intel Z590 Chipset, LGA1200 Socket, DDR4, PCIe 4.0, Wi-Fi 6, RGB Header', 4.5, NULL, 17, 9),
    ('ASUS Prime B450M-A/CSM Micro ATX Motherboard', 'ASUS', 22, 74.99, 'Micro ATX Form Factor, AMD B450 Chipset, AM4 Socket, DDR4, USB 3.1, SATA 6Gb/s', 4.4, 5, 17, 8),
    ('GIGABYTE B550 AORUS ELITE V2 ATX Motherboard', 'GIGABYTE', 35, 129.99, 'ATX Form Factor, AMD B550 Chipset, AM4 Socket, PCIe 4.0, Dual M.2 Slots, RGB Fusion', 4.2, NULL, 17, 4),
    ('MSI MAG B550 TOMAHAWK ATX Motherboard', 'MSI', 10, 179.99, 'ATX Form Factor, AMD B550 Chipset, AM4 Socket, DDR4, PCIe 4.0, Mystic Light, USB-C', 4.0, 20, 17, 1),
    -- Add more Motherboard products as needed
    ('ASRock H470 Steel Legend ATX Motherboard', 'ASRock', 28, 129.99, 'ATX Form Factor, Intel H470 Chipset, LGA1200 Socket, DDR4, PCIe 3.0, Steel Slot, Polychrome RGB', 4.6, NULL, 17, 10),
    ('ASUS ROG Crosshair VIII Hero (Wi-Fi 6) ATX Motherboard', 'ASUS', 12, 399.99, 'ATX Form Factor, AMD X570 Chipset, AM4 Socket, Wi-Fi 6, PCIe 4.0, Aura Sync RGB', 4.3, 18, 17, 5),
    ('MSI B450 Gaming Plus MAX ATX Motherboard', 'MSI', 20, 89.99, 'ATX Form Factor, AMD B450 Chipset, AM4 Socket, DDR4, PCIe 3.0, Mystic Light, Audio Boost', 4.5, NULL, 17, 2);
    -- Add more Motherboard products as needed


    -- Adding more CPU cooler products for category 1 (Computer Accessories)
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('NZXT Kraken X63 RGB CPU Cooler', 'NZXT', 18, 149.99, 'AIO liquid cooler 280mm radiator RGB lighting', 4.7, 2, 18, 5),
    ('Noctua NH-D15 Chromax.Black CPU Cooler', 'Noctua', 15, 99.99, 'Dual tower heatsink Dual NF-A15 PWM fans', 4.8, 3, 18, 6),
    ('Corsair H100i RGB Platinum SE CPU Cooler', 'Corsair', 20, 169.99, 'AIO liquid cooler 240mm radiator RGB lighting', 4.6, 4, 18, 7),
    ('Cooler Master Hyper 212 Black Edition CPU Cooler', 'Cooler Master', 25, 44.99, '4 heat pipes Silencio FP120 fan', 4.5, 5, 18, 8),
    ('Arctic Freezer 34 eSports DUO CPU Cooler', 'Arctic', 22, 49.99, 'Dual fan Direct-touch heatpipes MX-4 thermal paste included', 4.7, 2, 18, 9);

-- Adding gaming laptops for subcategory 19 (Laptops)
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Alienware m15 R5 Gaming Laptop', 'Alienware', 15, 2199.99, 'AMD Ryzen 9 5900HX NVIDIA RTX 3080 32GB RAM 1TB SSD', 4.8, 2, 19, 3),
    ('ASUS ROG Strix Scar 17 Gaming Laptop', 'ASUS', 12, 2399.99, 'Intel Core i9-11900H NVIDIA RTX 3080 32GB RAM 1TB SSD', 4.7, 3, 19, 4),
    ('MSI GE66 Raider Gaming Laptop', 'MSI', 18, 1999.99, 'Intel Core i7-10870H NVIDIA RTX 3070 16GB RAM 1TB NVMe SSD', 4.6, 4, 19, 5),
    ('Razer Blade 15 Advanced Gaming Laptop', 'Razer', 20, 2499.99, 'Intel Core i7-10875H NVIDIA RTX 3080 32GB RAM 1TB NVMe SSD', 4.9, 5, 19, 6),
    ('Dell G5 15 Gaming Laptop', 'Dell', 25, 1499.99, 'AMD Ryzen 7 5800H AMD RX 6700M 16GB RAM 512GB SSD', 4.5, 2, 19, 7);

-- Adding more gaming laptops for subcategory 2 (Laptops)
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('HP Omen 15 Gaming Laptop', 'HP', 18, 1799.99, 'AMD Ryzen 7 5800H NVIDIA RTX 3060 16GB RAM 512GB SSD', 4.6, 3, 19, 1),
    ('Lenovo Legion 5 Pro Gaming Laptop', 'Lenovo', 15, 2099.99, 'AMD Ryzen 7 5800H NVIDIA RTX 3070 16GB RAM 1TB NVMe SSD', 4.7, 4, 19, 2),
    ('Acer Predator Helios 300 Gaming Laptop', 'Acer', 22, 1499.99, 'Intel Core i7-11800H NVIDIA RTX 3060 16GB RAM 512GB NVMe SSD', 4.5, 5, 19, 3),
    ('Gigabyte Aorus 15G Gaming Laptop', 'Gigabyte', 20, 1899.99, 'Intel Core i7-10870H NVIDIA RTX 3080 32GB RAM 1TB NVMe SSD', 4.8, 2, 19, 4),
    ('MSI GS66 Stealth Gaming Laptop', 'MSI', 18, 2199.99, 'Intel Core i9-11900H NVIDIA RTX 3080 32GB RAM 1TB NVMe SSD', 4.9, 3, 19, 5);
-- Adding more gaming laptops for subcategory 2 (Laptops)
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('ASUS ROG Zephyrus G14 Gaming Laptop', 'ASUS', 17, 1799.99, 'AMD Ryzen 9 5900HS NVIDIA RTX 3060 16GB RAM 1TB NVMe SSD', 4.8, 2, 19, 6),
    ('Dell Alienware Area-51m R2 Gaming Laptop', 'Dell', 14, 2999.99, 'Intel Core i9-10900K NVIDIA RTX 2080 SUPER 32GB RAM 1TB NVMe SSD', 4.9, 3, 19, 7),
    ('Lenovo Legion 7i Gaming Laptop', 'Lenovo', 20, 2299.99, 'Intel Core i7-10875H NVIDIA RTX 2080 SUPER 16GB RAM 512GB NVMe SSD', 4.7, 4, 19, 8),
    ('MSI Alpha 15 Gaming Laptop', 'MSI', 15, 1299.99, 'AMD Ryzen 7 3750H AMD RX 5500M 16GB RAM 512GB NVMe SSD', 4.5, 5, 19, 9),
    ('Acer Nitro 5 Gaming Laptop', 'Acer', 22, 1099.99, 'Intel Core i5-10300H NVIDIA GTX 1650 8GB RAM 256GB NVMe SSD', 4.6, 4, 19, 10);
-- Adding more gaming laptops for subcategory 2 (Laptops)
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('HP Pavilion Gaming Laptop', 'HP', 18, 1299.99, 'Intel Core i5-10300H NVIDIA GTX 1650 8GB RAM 512GB NVMe SSD', 4.5, 2, 19, 1),
    ('ROG Zephyrus Duo 15 SE Gaming Laptop', 'ASUS', 12, 3299.99, 'AMD Ryzen 9 5900HX NVIDIA RTX 3080 32GB RAM 1TB SSD', 4.8, 3, 19, 2),
    ('Acer Predator Triton 500 Gaming Laptop', 'Acer', 20, 2499.99, 'Intel Core i7-10875H NVIDIA RTX 2080 SUPER 16GB RAM 1TB NVMe SSD', 4.7, 4, 19, 3),
    ('MSI GP66 Leopard Gaming Laptop', 'MSI', 15, 1799.99, 'Intel Core i7-11800H NVIDIA RTX 3070 16GB RAM 512GB NVMe SSD', 4.6, 5, 19, 4),
    ('Dell G3 15 Gaming Laptop', 'Dell', 22, 1199.99, 'Intel Core i5-10300H NVIDIA GTX 1660 Ti 8GB RAM 512GB NVMe SSD', 4.5, 4, 19, 5);
-- Adding more gaming laptops for subcategory 2 (Laptops)
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Lenovo Legion 5 Gaming Laptop', 'Lenovo', 18, 1399.99, 'AMD Ryzen 7 5800H NVIDIA GTX 1660 Ti 16GB RAM 512GB NVMe SSD', 4.6, 2, 19, 6),
    ('ASUS TUF Gaming A15 Laptop', 'ASUS', 15, 1299.99, 'AMD Ryzen 7 4800H NVIDIA GTX 1660 Ti 16GB RAM 512GB NVMe SSD', 4.7, 3, 19, 7),
    ('Razer Blade Pro 17 Gaming Laptop', 'Razer', 20, 2799.99, 'Intel Core i7-10875H NVIDIA RTX 3080 32GB RAM 1TB NVMe SSD', 4.8, 4, 19, 8),
    ('HP Omen 17 Gaming Laptop', 'HP', 18, 1899.99, 'Intel Core i7-10750H NVIDIA RTX 2070 16GB RAM 512GB NVMe SSD', 4.5, 5, 19, 9),
    ('MSI Prestige 15 Gaming Laptop', 'MSI', 22, 1699.99, 'Intel Core i7-10710U NVIDIA GTX 1650 Max-Q 16GB RAM 512GB NVMe SSD', 4.6, 2, 19, 10);




-- Adding business laptops for subcategory 20 (Laptops) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Dell Latitude 7410 Business Laptop', 'Dell', 20, 1799.99, 'Intel Core i7-10810U 14" FHD 16GB RAM 512GB NVMe SSD', 4.6, 2, 20, 1),
    ('Lenovo ThinkPad X1 Carbon Gen 9', 'Lenovo', 18, 2099.99, 'Intel Core i5-1135G7 14" WQHD 8GB RAM 256GB NVMe SSD', 4.7, 3, 20, 2),
    ('HP Elite Dragonfly Business Laptop', 'HP', 15, 1899.99, 'Intel Core i5-8265U 13.3" FHD 16GB RAM 512GB SSD', 4.5, 4, 20, 3),
    ('ASUS ExpertBook B9 Business Laptop', 'ASUS', 22, 2299.99, 'Intel Core i7-1165G7 14" FHD 16GB RAM 1TB NVMe SSD', 4.8, 5, 20, 4),
    ('Acer TravelMate P6 Business Laptop', 'Acer', 20, 1499.99, 'Intel Core i7-1165G7 14" FHD 16GB RAM 512GB NVMe SSD', 4.6, 2, 20, 5);

-- Adding more business laptops for subcategory 20 (Laptops) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Microsoft Surface Laptop 4', 'Microsoft', 18, 1899.99, 'Intel Core i7 13.5" PixelSense 16GB RAM 512GB SSD', 4.7, 3, 20, 6),
    ('Apple MacBook Pro 13-inch', 'Apple', 15, 2199.99, 'Apple M1 Chip 13.3" Retina 8GB RAM 512GB SSD', 4.8, 4, 20, 7),
    ('Dell Precision 5550 Mobile Workstation', 'Dell', 20, 2599.99, 'Intel Core i7-10875H 15.6" UHD 32GB RAM 1TB NVMe SSD', 4.6, 5, 20, 8),
    ('Lenovo ThinkPad T14s', 'Lenovo', 22, 1699.99, 'AMD Ryzen 7 Pro 14" FHD 16GB RAM 512GB NVMe SSD', 4.5, 2, 20, 9),
    ('HP Spectre x360 14', 'HP', 20, 1799.99, 'Intel Core i7-1165G7 13.5" OLED 16GB RAM 1TB NVMe SSD', 4.9, 3, 20, 10);

-- Adding more business laptops for subcategory 20 (Laptops) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Acer Swift 5 Business Laptop', 'Acer', 18, 1299.99, 'Intel Core i5-1135G7 14" FHD 8GB RAM 256GB NVMe SSD', 4.6, 2, 20, 1),
    ('Dell Inspiron 14 Business Laptop', 'Dell', 15, 999.99, 'Intel Core i5-1135G7 14" FHD 8GB RAM 512GB NVMe SSD', 4.7, 3, 20, 2),
    ('Lenovo ThinkBook 14 Business Laptop', 'Lenovo', 20, 1199.99, 'Intel Core i7-1165G7 14" FHD 16GB RAM 512GB NVMe SSD', 4.5, 4, 20, 3),
    ('HP ProBook 450 G8 Business Laptop', 'HP', 22, 1099.99, 'Intel Core i5-1135G7 15.6" FHD 8GB RAM 256GB NVMe SSD', 4.8, 5, 20, 4),
    ('Microsoft Surface Laptop Go', 'Microsoft', 20, 899.99, 'Intel Core i5 12.4" PixelSense 8GB RAM 128GB SSD', 4.6, 2, 20, 5);

-- Adding more business laptops for subcategory 20 (Laptops) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('ASUS VivoBook 14 Business Laptop', 'ASUS', 18, 999.99, 'Intel Core i5-1135G7 14" FHD 8GB RAM 512GB NVMe SSD', 4.7, 3, 20, 6),
    ('Acer TravelMate X5 Business Laptop', 'Acer', 15, 1299.99, 'Intel Core i7-10510U 14" FHD 16GB RAM 512GB NVMe SSD', 4.5, 4, 20, 7),
    ('Lenovo ThinkPad L14 Business Laptop', 'Lenovo', 20, 1199.99, 'Intel Core i5-10210U 14" FHD 8GB RAM 256GB NVMe SSD', 4.8, 5, 20, 8),
    ('HP EliteBook 840 G7 Business Laptop', 'HP', 22, 1499.99, 'Intel Core i7-10610U 14" FHD 16GB RAM 512GB NVMe SSD', 4.6, 2, 20, 9),
    ('Dell Vostro 14 Business Laptop', 'Dell', 20, 899.99, 'Intel Core i5-10210U 14" FHD 8GB RAM 256GB NVMe SSD', 4.6, 3, 20, 10);

-- Adding laptops for students for subcategory 21 (Laptops) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('HP Pavilion x360 Student Laptop', 'HP', 25, 799.99, 'Intel Core i5-1135G7 14" FHD Touch 8GB RAM 256GB SSD', 4.6, 2, 21, 1),
    ('Acer Chromebook 14 for Students', 'Acer', 30, 299.99, 'Intel Celeron N3160 14" HD 4GB RAM 32GB eMMC', 4.3, 0, 21, 2),
    ('Lenovo IdeaPad 3 Student Laptop', 'Lenovo', 28, 549.99, 'AMD Ryzen 5 14" FHD 8GB RAM 256GB SSD', 4.5, 0.1, 21, 3),
    ('ASUS VivoBook 15 Student Laptop', 'ASUS', 20, 699.99, 'Intel Core i3-1005G1 15.6" FHD 8GB RAM 128GB SSD', 4.4, 0, 21, 4),
    ('Dell Inspiron 13 Student Laptop', 'Dell', 22, 749.99, 'Intel Core i7-1165G7 13.3" FHD Touch 16GB RAM 512GB SSD', 4.7, 0, 21, 5)
     ('Acer Aspire 5 Student Laptop', 'Acer', 20, 649.99, 'AMD Ryzen 7 15.6" FHD 8GB RAM 512GB NVMe SSD', 4.5, 3, 21, 7),
    ('Lenovo Chromebook Flex 5', 'Lenovo', 15, 429.99, 'Intel Core i3-10110U 13" FHD Touch 4GB RAM 64GB eMMC', 4.7, 4, 21, 8),
    ('ASUS Chromebook Flip C434', 'ASUS', 22, 549.99, 'Intel Core M3 14" FHD Touch 4GB RAM 64GB eMMC', 4.4, 5, 21, 9),
    ('Dell Latitude 3310 Student Laptop', 'Dell', 20, 799.99, 'Intel Core i5-8265U 13.3" HD 8GB RAM 256GB SSD', 4.6, 2, 21, 10);



    -- Adding gaming mobiles for subcategory 22 (Mobiles) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('ASUS ROG Phone 6', 'ASUS', 15, 1099.99, 'Snapdragon 8cx 6.78" AMOLED 16GB RAM 256GB Storage', 4.8, 2, 22, 1),
    ('Lenovo Legion Phone Duel 3', 'Lenovo', 12, 1299.99, 'Snapdragon 888 6.92" AMOLED 12GB RAM 512GB Storage', 4.7, 3, 22, 2),
    ('Red Magic 7 Gaming Phone', 'Red Magic', 18, 899.99, 'Snapdragon 8cx 6.8" AMOLED 8GB RAM 128GB Storage', 4.6, 1, 22, 3),
    ('ROG Phone 6 Pro', 'ASUS', 20, 1499.99, 'Snapdragon 8cx 6.78" AMOLED 18GB RAM 512GB Storage', 4.9, 4, 22, 4),
    ('Black Shark 5 Gaming Phone', 'Black Shark', 25, 1099.99, 'Snapdragon 8cx 6.67" AMOLED 16GB RAM 256GB Storage', 4.5, 5, 22, 5);


-- Adding feature mobiles for subcategory 23 (Mobiles) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Nokia 3310', 'Nokia', 30, 49.99, '2.4" TFT display 2MP camera 16MB internal storage', 4.5, 0, 23, 1),
    ('Samsung Galaxy A01 Core', 'Samsung', 25, 79.99, '5.3" PLS TFT display 8MP camera 16GB internal storage', 4.3, 0, 23, 2),
    ('Nokia 8000 4G', 'Nokia', 20, 99.99, '2.8" TFT display 2MP camera 4GB internal storage', 4.2, 0, 23, 3),
    ('Motorola Moto G Pure', 'Motorola', 18, 129.99, '6.5" IPS LCD display 13MP camera 32GB internal storage', 4.4, 0, 23, 4),
    ('Sony Xperia L4', 'Sony', 22, 149.99, '6.2" IPS LCD display 13MP triple camera 64GB internal storage', 4.1, 0, 23, 5);

-- Adding Symphony feature phones for subcategory 23 (Feature Mobiles) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Symphony B23', 'Symphony', 20, 29.99, '2.4" TFT display Dual SIM 0.3MP camera 1200mAh battery', 4.3, 2, 23, 1),
    ('Symphony L250i', 'Symphony', 18, 24.99, '2.4" TFT display Dual SIM 0.3MP camera 1000mAh battery', 4.2, 1, 23, 2),
    ('Symphony BL60', 'Symphony', 22, 34.99, '2.8" TFT display Dual SIM 0.8MP camera 1400mAh battery', 4.1, 3, 23, 3),
    ('Symphony Z20', 'Symphony', 15, 39.99, '2.4" TFT display Dual SIM 0.3MP camera 1500mAh battery', 4.0, 4, 23, 4),
    ('Symphony D41i', 'Symphony', 25, 19.99, '1.8" TFT display Dual SIM VGA camera 800mAh battery', 3.9, 5, 23, 5);


-- Adding smartphones for subcategory 24 (Mobiles) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('iPhone 13 Pro', 'Apple', 15, 1199.99, 'A15 Bionic 6.1" Super Retina XDR Triple 12MP camera 128GB storage', 4.8, 2, 24, 1),
    ('Samsung Galaxy S22 Ultra', 'Samsung', 12, 1299.99, 'Exynos 2200 6.8" Dynamic AMOLED 2X Penta 108MP camera 256GB storage', 4.7, 3, 24, 2),
    ('Google Pixel 7', 'Google', 18, 999.99, 'Google Tensor 6.4" LTPO OLED Dual 50MP camera 128GB storage', 4.6, 1, 24, 3),
    ('OnePlus 10 Pro', 'OnePlus', 20, 1099.99, 'Snapdragon 8cx 6.7" Fluid AMOLED Quad 48MP camera 256GB storage', 4.5, 4, 24, 4),
    ('Xiaomi Mi 12', 'Xiaomi', 25, 899.99, 'Snapdragon 8cx 6.8" AMOLED Triple 108MP camera 128GB storage', 4.4, 5, 24, 5);


-- Adding more smartphones for subcategory 24 (Mobiles) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Sony Xperia 5 III', 'Sony', 22, 1099.99, 'Snapdragon 888 6.1" OLED Triple 12MP camera 256GB storage', 4.5, 3, 24, 6),
    ('Motorola Edge 20 Pro', 'Motorola', 20, 999.99, 'Snapdragon 870 6.7" OLED Triple 108MP camera 128GB storage', 4.6, 2, 24, 7),
    ('Huawei P50 Pro', 'Huawei', 18, 1199.99, 'Kirin 9000 6.6" OLED Quad 50MP camera 256GB storage', 4.7, 1, 24, 8),
    ('Realme GT 2 Pro', 'Realme', 25, 899.99, 'Snapdragon 8cx 6.7" Super AMOLED Dual 108MP camera 128GB storage', 4.8, 4, 24, 9),
    ('LG Velvet 2 Pro', 'LG', 15, 1299.99, 'Snapdragon 870 6.8" OLED Triple 64MP camera 256GB storage', 4.4, 5, 24, 10);


-- Adding more smartphones for subcategory 24 (Mobiles) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Asus Zenfone 8', 'Asus', 20, 799.99, 'Snapdragon 888 5.9" AMOLED Dual 64MP camera 128GB storage', 4.7, 1, 24, 1),
    ('Oppo Find X5 Pro', 'Oppo', 18, 1099.99, 'Snapdragon 8cx 6.7" AMOLED Quad 50MP camera 256GB storage', 4.8, 2, 24, 2),
    ('Vivo X70 Pro+', 'Vivo', 22, 999.99, 'Dimensity 1200 6.78" AMOLED Quad 50MP camera 256GB storage', 4.6, 3, 24, 3),
    ('Lenovo Legion Phone 3 Pro', 'Lenovo', 15, 1199.99, 'Snapdragon 8cx 6.92" AMOLED Dual 64MP camera 256GB storage', 4.9, 4, 24, 4),
    ('ZTE Axon 30 Ultra', 'ZTE', 25, 899.99, 'Snapdragon 888 6.67" AMOLED Triple 64MP camera 128GB storage', 4.5, 5, 24, 5);


-- Adding more Samsung smartphones for subcategory 24 (Mobiles) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Samsung Galaxy S22', 'Samsung', 20, 1099.99, 'Exynos 2200 6.1" Dynamic AMOLED 2X Triple 50MP camera 128GB storage', 4.7, 2, 24, 6),
    ('Samsung Galaxy Z Fold 4', 'Samsung', 18, 1999.99, 'Snapdragon 8cx 7.6" Foldable AMOLED Triple 108MP camera 256GB storage', 4.8, 3, 24, 7),
    ('Samsung Galaxy A72', 'Samsung', 22, 699.99, 'Snapdragon 720G 6.7" Super AMOLED Quad 64MP camera 128GB storage', 4.6, 1, 24, 8),
    ('Samsung Galaxy Note 20 Ultra', 'Samsung', 15, 1199.99, 'Exynos 990 6.9" Dynamic AMOLED 2X Triple 108MP camera 256GB storage', 4.9, 4, 24, 9),
    ('Samsung Galaxy S21 FE', 'Samsung', 25, 899.99, 'Snapdragon 870 6.4" Super AMOLED Triple 12MP camera 128GB storage', 4.5, 5, 24, 10);


-- Adding more Samsung smartphones from A series and M series for subcategory 24 (Mobiles) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Samsung Galaxy A52', 'Samsung', 18, 449.99, 'Snapdragon 720G 6.5" Super AMOLED Quad 64MP camera 128GB storage', 4.7, 1, 24, 1),
    ('Samsung Galaxy A32', 'Samsung', 20, 299.99, 'Mediatek Helio G80 6.4" Super AMOLED Quad 64MP camera 64GB storage', 4.6, 2, 24, 2),
    ('Samsung Galaxy M52', 'Samsung', 22, 399.99, 'Snapdragon 778G 6.7" Super AMOLED Triple 64MP camera 128GB storage', 4.5, 3, 24, 3),
    ('Samsung Galaxy M32', 'Samsung', 15, 249.99, 'Mediatek Helio G80 6.4" Super AMOLED Quad 64MP camera 64GB storage', 4.4, 4, 24, 4);


-- Adding latest Samsung Galaxy A series smartphones for subcategory 24 (Mobiles) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Samsung Galaxy A74', 'Samsung', 20, 549.99, 'Snapdragon 778G 6.7" Super AMOLED Quad 64MP camera 128GB storage', 4.8, 2, 24, 1),
    ('Samsung Galaxy A54', 'Samsung', 18, 399.99, 'Snapdragon 750G 6.5" Super AMOLED Quad 48MP camera 64GB storage', 4.7, 1, 24, 2),
    ('Samsung Galaxy A34', 'Samsung', 22, 299.99, 'Snapdragon 690 6.4" Super AMOLED Triple 64MP camera 128GB storage', 4.6, 3, 24, 3),
    ('Samsung Galaxy A24', 'Samsung', 15, 199.99, 'Mediatek Helio G70 6.5" IPS LCD Quad 48MP camera 64GB storage', 4.5, 4, 24, 4),
    ('Samsung Galaxy A14', 'Samsung', 25, 149.99, 'Mediatek Helio G35 6.4" IPS LCD Dual 13MP camera 32GB storage', 4.4, 5, 24, 5);

-- Adding OnePlus smartphones for subcategory 24 (Mobiles) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('OnePlus 9 Pro', 'OnePlus', 20, 899.99, 'Snapdragon 888 6.7" Fluid AMOLED Quad 48MP camera 256GB storage', 4.8, 3, 24, 1),
    ('OnePlus 8T', 'OnePlus', 18, 699.99, 'Snapdragon 865 6.55" Fluid AMOLED Quad 48MP camera 128GB storage', 4.7, 2, 24, 2),
    ('OnePlus Nord 2', 'OnePlus', 22, 499.99, 'Dimensity 1200 6.43" Fluid AMOLED Triple 50MP camera 256GB storage', 4.6, 1, 24, 3),
    ('OnePlus 9', 'OnePlus', 15, 799.99, 'Snapdragon 888 6.55" Fluid AMOLED Triple 48MP camera 128GB storage', 4.5, 4, 24, 4),
    ('OnePlus 7T', 'OnePlus', 25, 549.99, 'Snapdragon 855+ 6.55" Fluid AMOLED Triple 48MP camera 128GB storage', 4.4, 5, 24, 5);

-- Adding Vivo smartphones for subcategory 24 (Mobiles) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Vivo X60 Pro', 'Vivo', 20, 799.99, 'Snapdragon 870 6.56" AMOLED Quad 48MP camera 256GB storage', 4.7, 1, 24, 1),
    ('Vivo V21e', 'Vivo', 18, 399.99, 'Mediatek Dimensity 800U 6.44" AMOLED Dual 64MP camera 128GB storage', 4.6, 2, 24, 2),
    ('Vivo Y73', 'Vivo', 22, 299.99, 'Mediatek Helio G95 6.44" AMOLED Triple 64MP camera 128GB storage', 4.5, 3, 24, 3),
    ('Vivo X50 Pro', 'Vivo', 15, 699.99, 'Snapdragon 765G 6.56" AMOLED Quad 48MP camera 256GB storage', 4.4, 4, 24, 4),
    ('Vivo V17', 'Vivo', 25, 549.99, 'Mediatek Helio P65 6.44" Super AMOLED Quad 48MP camera 128GB storage', 4.3, 5, 24, 5);

-- Adding Oppo smartphones for subcategory 24 (Mobiles) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Oppo Find X3 Pro', 'Oppo', 20, 899.99, 'Snapdragon 888 6.7" AMOLED Quad 50MP camera 256GB storage', 4.8, 2, 24, 1),
    ('Oppo Reno 6 Pro', 'Oppo', 18, 699.99, 'Mediatek Dimensity 1200 6.55" AMOLED Quad 64MP camera 128GB storage', 4.7, 1, 24, 2),
    ('Oppo A74', 'Oppo', 22, 499.99, 'Snapdragon 662 6.43" AMOLED Quad 48MP camera 128GB storage', 4.6, 3, 24, 3),
    ('Oppo F19 Pro', 'Oppo', 15, 549.99, 'Mediatek Helio P95 6.43" AMOLED Quad 48MP camera 128GB storage', 4.5, 4, 24, 4),
    ('Oppo A54', 'Oppo', 25, 399.99, 'Mediatek Helio P35 6.51" IPS LCD Triple 13MP camera 64GB storage', 4.4, 5, 24, 5);


-- Adding Xiaomi smartphones for subcategory 24 (Mobiles) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Xiaomi Mi 11 Ultra', 'Xiaomi', 20, 1099.99, 'Snapdragon 888 6.81" AMOLED Triple 50MP camera 256GB storage', 4.9, 3, 24, 1),
    ('Xiaomi Redmi Note 10 Pro', 'Xiaomi', 18, 299.99, 'Snapdragon 732G 6.67" Super AMOLED Quad 108MP camera 128GB storage', 4.8, 2, 24, 2),
    ('Xiaomi Poco X3 Pro', 'Xiaomi', 22, 249.99, 'Snapdragon 860 6.67" IPS LCD Quad 48MP camera 128GB storage', 4.7, 1, 24, 3),
    ('Xiaomi Mi 10T', 'Xiaomi', 15, 499.99, 'Snapdragon 865 6.67" IPS LCD Triple 64MP camera 128GB storage', 4.6, 4, 24, 4),
    ('Xiaomi Redmi 9A', 'Xiaomi', 25, 129.99, 'Mediatek Helio G25 6.53" IPS LCD Single 13MP camera 32GB storage', 4.5, 5, 24, 5);





-- Adding Google Pixel smartphones for subcategory 24 (Mobiles) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Google Pixel 6 Pro', 'Google', 20, 899.99, 'Google Tensor 6.7" AMOLED Triple 50MP camera 128GB storage', 4.8, 2, 24, 1),
    ('Google Pixel 5a', 'Google', 18, 449.99, 'Snapdragon 765G 6.34" OLED Dual 12.2MP camera 128GB storage', 4.7, 1, 24, 2),
    ('Google Pixel 4a', 'Google', 22, 349.99, 'Snapdragon 730G 5.81" OLED Single 12.2MP camera 128GB storage', 4.6, 3, 24, 3),
    ('Google Pixel 3 XL', 'Google', 15, 599.99, 'Snapdragon 845 6.3" OLED Single 12.2MP camera 64GB storage', 4.5, 4, 24, 4),
    ('Google Pixel 2', 'Google', 25, 299.99, 'Snapdragon 835 5.0" AMOLED Single 12.2MP camera 64GB storage', 4.4, 5, 24, 5);


-- Adding Realme smartphones for subcategory 24 (Mobiles) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Realme GT 2 Pro', 'Realme', 20, 699.99, 'Snapdragon 8 Gen 1 6.7" Super AMOLED Triple 64MP camera 256GB storage', 4.8, 3, 24, 1),
    ('Realme Narzo 50', 'Realme', 18, 249.99, 'Mediatek Helio G96 6.5" IPS LCD Triple 50MP camera 128GB storage', 4.7, 2, 24, 2),
    ('Realme 8 Pro', 'Realme', 22, 349.99, 'Snapdragon 720G 6.4" Super AMOLED Quad 108MP camera 128GB storage', 4.6, 1, 24, 3),
    ('Realme C25', 'Realme', 15, 149.99, 'Mediatek Helio G70 6.5" IPS LCD Triple 13MP camera 64GB storage', 4.5, 4, 24, 4),
    ('Realme X7 Max', 'Realme', 25, 499.99, 'Mediatek Dimensity 1200 6.43" Super AMOLED Triple 64MP camera 128GB storage', 4.4, 5, 24, 5);


-- Adding DSLR cameras for subcategory 25 (DSLR Cameras) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Nikon D850', 'Nikon', 15, 2799.99, '45.7MP FX-Format sensor 4K UHD video 153-point autofocus', 4.9, 2, 25, 1),
    ('Canon EOS 5D Mark IV', 'Canon', 12, 3299.99, '30.4MP Full-Frame sensor 4K video Dual Pixel CMOS AF', 4.8, 3, 25, 2),
    ('Sony Alpha a7 III', 'Sony', 18, 1999.99, '24.2MP Full-Frame sensor 4K HDR video 693-point autofocus', 4.7, 1, 25, 3),
    ('Nikon D7500', 'Nikon', 20, 1249.99, '20.9MP DX-Format sensor 4K UHD video 51-point autofocus', 4.6, 4, 25, 4),
    ('Canon EOS Rebel T7i', 'Canon', 25, 799.99, '24.2MP APS-C sensor Full HD video Dual Pixel CMOS AF', 4.5, 5, 25, 5)
    ('Canon EOS 6D Mark II', 'Canon', 18, 1699.99, '26.2MP Full-Frame sensor 4K video Dual Pixel CMOS AF', 4.7, 1, 25, 6),
    ('Nikon D5600', 'Nikon', 22, 699.99, '24.2MP APS-C sensor Full HD video 39-point autofocus', 4.5, 0, 25, 7),
    ('Sony Alpha a6400', 'Sony', 15, 899.99, '24.2MP APS-C sensor 4K video Real-time Eye AF', 4.8, 2, 25, 8),
    ('Canon EOS 90D', 'Canon', 20, 1199.99, '32.5MP APS-C sensor 4K video Dual Pixel CMOS AF', 4.6, 3, 25, 9),
    ('Nikon D3500', 'Nikon', 25, 499.99, '24.2MP APS-C sensor Full HD video 11-point autofocus', 4.4, 4, 25, 10);

    -- Adding more DSLR cameras for subcategory 25 (DSLR Cameras) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Canon EOS 5DS R', 'Canon', 18, 3499.99, '50.6MP Full-Frame sensor 1080p video 61-point autofocus', 4.6, 3, 25, 6),
    ('Nikon D610', 'Nikon', 22, 1299.99, '24.3MP Full-Frame sensor 1080p video 39-point autofocus', 4.5, 0, 25, 7),
    ('Sony Alpha a9 II', 'Sony', 15, 4499.99, '24.2MP Full-Frame sensor 4K video 693-point autofocus', 4.7, 1, 25, 8),
    ('Canon EOS 80D', 'Canon', 20, 1199.99, '24.2MP APS-C sensor 1080p video Dual Pixel CMOS AF', 4.4, 4, 25, 9),
    ('Nikon D7200', 'Nikon', 25, 899.99, '24.2MP APS-C sensor 1080p video 51-point autofocus', 4.3, 2, 25, 10);


-- Adding mirrorless cameras for subcategory 26 (Mirrorless Cameras) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
   
    ('Canon EOS R6', 'Canon', 12, 2499.99, '20.1MP Full-Frame sensor 4K video Dual Pixel CMOS AF', 4.7, 3, 26, 2),
    ('Fujifilm X-T4', 'Fujifilm', 18, 1799.99, '26.1MP APS-C sensor 4K video In-body image stabilization', 4.6, 1, 26, 3),
    ('Nikon Z6', 'Nikon', 20, 2299.99, '24.5MP Full-Frame sensor 4K UHD video 273-point autofocus', 4.5, 0, 26, 4),
    ('Panasonic Lumix GH5', 'Panasonic', 25, 1699.99, '20.3MP Four Thirds sensor 4K video Dual IS', 4.4, 4, 26, 5);


-- Adding action cameras for subcategory 27 (Action Cameras) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('GoPro HERO9 Black', 'GoPro', 15, 449.99, '20MP sensor 5K video HyperSmooth 3.0 stabilization', 4.8, 2, 27, 1),
    ('DJI Osmo Action', 'DJI', 12, 299.99, '12MP sensor 4K video RockSteady stabilization', 4.7, 3, 27, 2),
    ('Akaso Brave 7 LE', 'Akaso', 18, 139.99, '16MP sensor 4K video 6-axis stabilization', 4.6, 1, 27, 3),
    ('Insta360 ONE R', 'Insta360', 20, 379.99, '5.7K video FlowState stabilization 360-degree capture', 4.5, 0, 27, 4),
    ('Sony RX0 II', 'Sony', 25, 699.99, '15.3MP sensor 4K video 180-degree tiltable screen', 4.4, 4, 27, 5);

-- Adding more action cameras for subcategory 27 (Action Cameras) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Campark V40 4K Action Camera', 'Campark', 18, 99.99, '20MP sensor 4K video Electronic Image Stabilization', 4.6, 1, 27, 6),
    ('Yi 4K+ Action Camera', 'Yi Technology', 22, 199.99, '12MP sensor 4K video Ambarella H2 chipset', 4.5, 0, 27, 7),
    ('Akaso V50 Elite Action Camera', 'Akaso', 15, 139.99, '20MP sensor 4K video Electronic Image Stabilization', 4.4, 2, 27, 8),
    ('Crosstour CT9000 Action Camera', 'Crosstour', 20, 49.99, '16MP sensor 4K video Wide-angle lens', 4.3, 3, 27, 9),
    ('Apeman A100 Action Camera', 'Apeman', 25, 69.99, '20MP sensor 4K video Electronic Image Stabilization', 4.2, 4, 27, 10);




-- Adding more Samsung smart TVs for subcategory 28 (Smart TVs) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Samsung Crystal UHD TU8000 50-inch Smart TV', 'Samsung', 18, 499.99, '4K UHD Crystal Display HDR PurColor', 4.6, 1, 28, 6),
    ('Samsung Q70T QLED 55-inch Smart TV', 'Samsung', 22, 899.99, '4K UHD QLED Quantum HDR Dual LED', 4.5, 0, 28, 7),
    ('Samsung The Frame 65-inch Smart TV', 'Samsung', 15, 1799.99, '4K UHD QLED Art Mode Quantum HDR', 4.4, 2, 28, 8),
    ('Samsung Q80T QLED 75-inch Smart TV', 'Samsung', 20, 2499.99, '4K UHD QLED Quantum HDR Direct Full Array 12X', 4.3, 3, 28, 9),
    ('Samsung Q950TS QLED 85-inch Smart TV', 'Samsung', 25, 6999.99, '8K QLED Quantum HDR Infinity Screen Object Tracking Sound', 4.2, 4, 28, 10);


-- Adding more LG smart TVs for subcategory 28 (Smart TVs) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('LG NanoCell 85 Series 75-inch Smart TV', 'LG', 22, 1799.99, '4K UHD NanoCell display AI ThinQ Dolby Vision IQ', 4.6, 0, 28, 7),
    ('LG UN7300 65-inch Smart TV', 'LG', 15, 899.99, '4K UHD IPS display webOS ThinQ AI Magic Remote', 4.5, 1, 28, 8),
    ('LG NanoCell 90 Series 75-inch Smart TV', 'LG', 25, 1999.99, '4K UHD NanoCell display AI ThinQ Dolby Vision IQ', 4.3, 4, 28, 10);


-- Adding Panasonic smart TVs for subcategory 28 (Smart TVs) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Panasonic HX700 50-inch Smart TV', 'Panasonic', 18, 549.99, '4K UHD LED display Dolby Vision HDR Dolby Atmos', 4.6, 2, 28, 6),
    ('Panasonic HX800 55-inch Smart TV', 'Panasonic', 15, 899.99, '4K UHD LED display Dolby Vision HDR Dolby Atmos', 4.4, 1, 28, 8),
    ('Panasonic HX940 75-inch Smart TV', 'Panasonic', 20, 1999.99, '4K UHD LED display Dolby Vision HDR Dolby Atmos', 4.3, 3, 28, 9),
    ('Panasonic HX600 43-inch Smart TV', 'Panasonic', 25, 399.99, 'Full HD LED display Adaptive Backlight Dimming', 4.2, 4, 28, 10);



-- Adding OLED TVs for subcategory 29 (OLED TVs) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('LG OLED C1 Series 65-inch TV', 'LG', 18, 2299.99, '4K UHD OLED display Alpha 9 Gen 4 AI ThinQ', 4.7, 2, 29, 6),
    ('Sony A90J OLED 55-inch TV', 'Sony', 22, 1999.99, '4K UHD OLED display Cognitive Processor XR Dolby Vision HDR', 4.6, 0, 29, 7),
    ('Panasonic HZ2000 55-inch TV', 'Panasonic', 15, 1999.99, '4K UHD OLED display Dolby Vision IQ HDR10+', 4.5, 1, 29, 8),
    ('Vizio OLED 55-inch TV', 'Vizio', 20, 1499.99, '4K UHD OLED display V-Gaming Engine ProGaming Engine', 4.4, 3, 29, 9),
    ('Sony A80J OLED 77-inch TV', 'Sony', 25, 3499.99, '4K UHD OLED display Cognitive Processor XR Dolby Vision HDR', 4.3, 4, 29, 10);


-- Adding smartwatches for subcategory 30 (Smartwatches) with ImporterId between 1 and 10
-- Adding more smartwatches for subcategory 30 (Smartwatches) with ImporterId between 1 and 10
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('TechTime Pro 2000 Smartwatch', 'TechTime', 18, 149.99, '1.3" AMOLED display Heart rate monitor GPS', 4.7, 2, 30, 1),
    ('EvoSync Nova X Smartwatch', 'EvoSync', 22, 199.99, '1.4" Retina display Sleep tracking Waterproof', 4.6, 0, 30, 2),
    ('ConnectWear Fusion Series Smartwatch', 'ConnectWear', 15, 129.99, '1.2" OLED display Fitness tracker Bluetooth', 4.5, 1, 30, 3),
    ('PulseTrack Elite Smartwatch', 'PulseTrack', 20, 179.99, '1.5" LCD display Blood pressure monitor Notifications', 4.4, 3, 30, 4),
    ('GearVista ProFit Smartwatch', 'GearVista', 25, 249.99, '1.3" AMOLED display SpO2 monitoring Multiple sports modes', 4.3, 4, 30, 5),
    ('SyncSphere X1 Fitness Smartwatch', 'SyncSphere', 18, 159.99, '1.4" TFT display IP68 waterproof Music control', 4.2, 2, 30, 6),
    ('TimeLink Ultra Slim Smartwatch', 'TimeLink', 22, 169.99, '1.1" IPS display Sleep analysis Call alerts', 4.1, 1, 30, 7),
    ('NovaWatch Elegance Series Smartwatch', 'NovaWatch', 15, 139.99, '1.3" HD display ECG monitoring Metal body', 4.0, 0, 30, 8),
    ('QuantumWrist QuantumFit Smartwatch', 'QuantumWrist', 20, 189.99, '1.2" AMOLED display Stress tracking GPS', 3.9, 3, 30, 9),
    ('SyncHorizon Solar Series Smartwatch', 'SyncHorizon', 25, 199.99, '1.4" Solar-powered display Blood oxygen monitor Weather forecast', 3.8, 4, 30, 10),
    ('WaveMaster WaveFit Smartwatch', 'WaveMaster', 18, 129.99, '1.3" TFT display Female health tracking Wireless charging', 3.7, 2, 30, 1),
    ('VisionWear VisionFit Smartwatch', 'VisionWear', 22, 179.99, '1.2" Retina display Sleep tracking Music control', 3.6, 1, 30, 2),
    ('SyncroSphere X2 Smartwatch', 'SyncroSphere', 15, 149.99, '1.3" AMOLED display Water resistance Fitness tracker', 3.5, 0, 30, 3),
    ('TimeCraft MasterFit Smartwatch', 'TimeCraft', 20, 199.99, '1.4" LCD display Blood pressure monitor Notifications', 3.4, 3, 30, 4),
    ('IntelliWatch Infinity Smartwatch', 'IntelliWatch', 25, 219.99, '1.2" OLED display ECG monitoring Multiple sports modes', 3.3, 4, 30, 5),
    ('SyncStream Harmony Series Smartwatch', 'SyncStream', 18, 169.99, '1.3" IPS display IP68 waterproof Music control', 3.2, 2, 30, 6),
    ('NexTime Quantum X Smartwatch', 'NexTime', 22, 189.99, '1.1" HD display Sleep analysis Call alerts', 3.1, 1, 30, 7),
    ('SwiftWrist Luxe Series Smartwatch', 'SwiftWrist', 15, 159.99, '1.3" AMOLED display ECG monitoring Metal body', 3.0, 0, 30, 8),
    ('VitalSync ProFit Smartwatch', 'VitalSync', 20, 229.99, '1.2" TFT display Stress tracking GPS', 2.9, 3, 30, 9),
    ('EchoTime SolarFlare Smartwatch', 'EchoTime', 25, 239.99, '1.4" Solar-powered display Blood oxygen monitor Weather forecast', 2.8, 4, 30, 10);


-- Adding Apple smartwatches for subcategory 30 (Smartwatches)
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Apple Watch Series 7', 'Apple', 18, 399.99, 'Always-on Retina display, Blood oxygen app, ECG app', 4.9, 2, 30, 1),
    ('Apple Watch SE', 'Apple', 22, 279.99, 'Retina display, Fitness tracking, Water-resistant', 4.8, 0, 30, 2),
    ('Apple Watch Series 6', 'Apple', 15, 499.99, 'Blood oxygen monitoring, ECG app, Always-on Retina display', 4.7, 1, 30, 3),
    ('Apple Watch Series 5', 'Apple', 20, 429.99, 'Always-on Retina display, ECG app, Fall detection', 4.6, 3, 30, 4),
    ('Apple Watch Series 4', 'Apple', 25, 349.99, 'LTPO OLED display, ECG app, Water-resistant', 4.5, 4, 30, 5),
    ('Apple Watch Series 3', 'Apple', 18, 199.99, 'Retina display, Heart rate monitoring, GPS', 4.4, 2, 30, 6);


-- Adding smart bands for subcategory 31 (Smart Bands)
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Fitbit Charge 5', 'Fitbit', 18, 179.99, 'AMOLED display EDA sensor Heart rate tracking', 4.7, 2, 31, 1),
    ('Xiaomi Mi Band 6', 'Xiaomi', 22, 49.99, '1.56" AMOLED display SpO2 monitoring Sleep tracking', 4.6, 0, 31, 2),
    ('Samsung Galaxy Fit 2', 'Samsung', 15, 79.99, '1.1" AMOLED display 15-day battery life Fitness tracking', 4.5, 1, 31, 3),
    ('Garmin Vivosmart 4', 'Garmin', 20, 129.99, 'Pulse Ox sensor Body Battery energy monitor Stress tracking', 4.4, 3, 31, 4),
    ('Amazfit Band 5', 'Amazfit', 25, 39.99, '1.1" AMOLED display Blood oxygen measurement Alexa built-in', 4.3, 4, 31, 5),
    ('Huawei Band 6', 'Huawei', 18, 59.99, '1.47" AMOLED display 96 workout modes TruSeen 4.0 heart rate monitor', 4.2, 2, 31, 6);


-- Adding more products for subcategory 31 (Smart Bands)
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Fitbit Inspire 2', 'Fitbit', 18, 99.99, 'Touchscreen display Heart rate tracking Sleep monitoring', 4.6, 2, 31, 1),
    ('Xiaomi Mi Smart Band 5', 'Xiaomi', 22, 44.99, '1.1" AMOLED display Magnetic charging Sleep tracking', 4.5, 0, 31, 2),
    ('Samsung Galaxy Fit e', 'Samsung', 15, 39.99, '0.74" PMOLED display Lightweight design Auto fitness tracking', 4.3, 1, 31, 3),
    ('Garmin vivofit 4', 'Garmin', 20, 79.99, '1+ year battery life Color display Move IQ feature', 4.2, 3, 31, 4),
    ('Amazfit Band 6', 'Amazfit', 25, 49.99, '1.47" AMOLED display Blood oxygen measurement PAI (Personal Activity Intelligence)', 4.1, 4, 31, 5),
    ('Huawei Band 4 Pro', 'Huawei', 18, 59.99, '0.95" AMOLED display SpO2 monitoring Built-in GPS', 4.0, 2, 31, 6);


-- Adding products for subcategory 32 (Smart Speakers)
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Amazon Echo Dot (4th Gen)', 'Amazon', 25, 49.99, 'Smart speaker with Alexa Voice Control', 4.7, 0, 32, 1),
    ('Google Nest Audio', 'Google', 20, 99.99, 'Smart speaker with Google Assistant', 4.6, 0, 32, 2),
    ('Apple HomePod Mini', 'Apple', 15, 99.99, 'Compact smart speaker with Siri integration', 4.5, 0, 32, 3),
    ('Sonos One (Gen 2)', 'Sonos', 18, 199.99, 'Smart speaker with built-in voice control', 4.4, 0, 32, 4),
    ('Bose Home Speaker 300', 'Bose', 22, 199.99, 'Wi-Fi and Bluetooth-enabled smart speaker', 4.3, 0, 32, 5),
    ('JBL Link Portable', 'JBL', 25, 129.99, 'Portable smart speaker with Google Assistant', 4.2, 0, 32, 6),
    ('UE Megablast', 'Ultimate Ears', 20, 249.99, 'Portable smart speaker with Alexa Voice Control', 4.1, 0, 32, 7),
    ('Sony SRS-X9', 'Sony', 18, 299.99, 'Hi-Res Audio compatible smart speaker', 4.0, 0, 32, 8),
    ('Harman Kardon Citation 300', 'Harman Kardon', 15, 349.99, 'Premium smart speaker with Google Assistant', 3.9, 0, 32, 9),
    ('Lenovo Smart Display', 'Lenovo', 22, 149.99, 'Smart display with Google Assistant', 3.8, 0, 32, 10);

-- Adding more smart speakers
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Bose SoundLink Revolve+', 'Bose', 18, 249.99, 'Portable Bluetooth smart speaker', 4.7, 0, 32, 1),
    ('Samsung Galaxy Home', 'Samsung', 20, 299.99, 'Smart speaker with Bixby virtual assistant', 4.6, 0, 32, 2),
    ('Microsoft Invoke', 'Microsoft', 15, 129.99, 'Cortana-enabled smart speaker', 4.5, 0, 32, 3),
    ('LG XBOOM AI ThinQ WK9', 'LG', 22, 199.99, 'Smart display with Google Assistant', 4.4, 0, 32, 4),
    ('Xiaomi XiaoAI Speaker', 'Xiaomi', 25, 59.99, 'Voice-controlled smart speaker', 4.3, 0, 32, 5),
    ('UE Boom 3', 'Ultimate Ears', 20, 149.99, 'Portable Bluetooth smart speaker', 4.2, 0, 32, 6),
    ('Sony SRS-X7', 'Sony', 18, 179.99, 'Wireless smart speaker with Wi-Fi and Bluetooth', 4.1, 0, 32, 7),
    ('JBL Flip 5', 'JBL', 15, 119.99, 'Portable Bluetooth smart speaker', 4.0, 0, 32, 8),
    ('Amazon Echo Studio', 'Amazon', 22, 199.99, 'High-fidelity smart speaker with 3D audio', 3.9, 0, 32, 9),
    ('Google Home Max', 'Google', 25, 299.99, 'High-fidelity smart speaker with Google Assistant', 3.8, 0, 32, 10);


-- Adding products for subcategory 33 (Drones)
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('DJI Mavic Air 2 Drone', 'DJI', 18, 799.99, 'Foldable drone 48MP camera 4K video 34-minute flight time', 4.7, 0, 33, 1),
    ('Parrot Anafi USA Drone', 'Parrot', 22, 1099.99, '32x zoom 4K HDR video Thermal camera', 4.6, 0, 33, 2),
    ('Autel Robotics EVO Lite+', 'Autel Robotics', 15, 1499.99, '8K video 48MP camera 40-minute flight time', 4.5, 0, 33, 3),
    ('Skydio 2 Drone', 'Skydio', 20, 1999.99, 'Autonomous drone 4K video 23-minute flight time', 4.4, 0, 33, 4),
    ('PowerVision PowerEgg X Drone', 'PowerVision', 25, 899.99, 'AI camera 4K video Waterproof design', 4.3, 0, 33, 5),
    ('Yuneec Typhoon H Pro Drone', 'Yuneec', 18, 1299.99, '6-rotor hexacopter 20MP camera 4K video', 4.2, 0, 33, 6),
    ('Autel Robotics EVO Nano Drone', 'Autel Robotics', 22, 699.99, 'Compact drone 48MP camera 4K video 20-minute flight time', 4.1, 0, 33, 7),
    ('DJI Mini 2 Drone', 'DJI', 15, 449.99, 'Ultra-lightweight 4K video 31-minute flight time', 4.0, 0, 33, 8),
    ('Hubsan Zino 2+ Drone', 'Hubsan', 20, 549.99, 'Foldable drone 48MP camera 4K video 33-minute flight time', 3.9, 0, 33, 9),
    ('Potensic Dreamer 4K Drone', 'Potensic', 25, 399.99, '4K UHD camera 31-minute flight time Brushless motors', 3.8, 0, 33, 10);


-- Adding products for subcategory 34 (Smart Toys)
INSERT INTO product (ProductName, BrandName, ProductQuantity, Price, Specification, Rating, DiscountOffer, SubCategoryId, ImporterId)
VALUES
    ('Anki Cozmo Robot', 'Anki', 18, 149.99, 'Educational robot AI-powered Facial recognition', 4.7, 0, 34, 1),
    ('Sphero Bolt App-Enabled Robot', 'Sphero', 22, 149.99, 'Programmable robot LED matrix display Scratch coding', 4.6, 0, 34, 2),
    ('Osmo Genius Starter Kit for iPad', 'Osmo', 15, 99.99, 'Interactive learning games iPad compatible', 4.5, 0, 34, 3);
