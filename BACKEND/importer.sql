INSERT INTO importer (ImporterAgencyName, ImporterContactNumber, ImporterEmail, ImporterPin)
VALUES
    ('TechImports', '1234567890', 'techimports@example.com', 'tech1234'),
    ('GadgetWorld', '9876543210', 'gadgetworld@example.com', 'gadget5678'),
    ('ElectroDeals', '3456789012', 'electrodeals@example.com', 'electro3456'),
    ('DigitalImports', '6789012345', 'digitalimports@example.com', 'digital6789'),
    ('SmartTech Solutions', '2345678901', 'smarttech@example.com', 'smart1234'),
    ('TechWizards', '8901234567', 'techwizards@example.com', 'wizards7890'),
    ('InnovateImports', '4567890123', 'innovateimports@example.com', 'innovate2345'),
    ('FutureGadgets', '5678901234', 'futuregadgets@example.com', 'future5678'),
    ('EpicElectronics', '7890123456', 'epicelectronics@example.com', 'epic7890'),
    ('QuantumTech', '9012345678', 'quantumtech@example.com', 'quantum1234');

ALTER TABLE importer
DROP COLUMN ImporterName;