use sys;
create table citystore(
store_id varchar(20),
store_type_id varchar(20),
store_size varchar(10),
city_id varchar(20),
state varchar(10),
state_abr varchar(20),
city varchar(20)
);
desc citystore;

select * from citystore;

alter table citystore
change column store_size area varchar(20);

INSERT INTO CityStore (store_id, store_type_id, area, city_id, state, state_abr, city) VALUES
('S0091', 'ST04', '19 m²', 'C013', 'AR', 'Arkansas', 'Washington'),
('S0012', 'ST04', '28 m²', 'C005', 'TX', 'Texas', 'Huntsville'),
('S0045', 'ST04', '17 qm', 'C008', 'NC', 'North Carolina', 'Asheville'),
('S0032', 'ST03', '14 m²', 'C019', 'CA', 'California', 'Los Angeles'),
('S0027', 'ST04', '24 qm', 'C022', 'TX', 'Texas', 'Texarkana'),
('S0088', 'ST04', '20 qm', 'C009', 'OK', 'Oklahoma', 'Tulsa'),
('S0095', 'ST02', '44 qm', 'C014', 'OH', 'Ohio', 'Cincinnati'),
('S0055', 'ST04', '24 qm', 'C014', 'FL', 'Florida', 'Gainesville'),
('S0099', 'ST03', '14 qm', 'C014', 'DE', 'Delaware', 'Wilmington'),
('S0078', 'ST04', '19 m²', 'C036', 'GA', 'Georgia', 'Alpharetta');

alter table citystore
add column rating integer;

SET SQL_SAFE_UPDATES = 0;

UPDATE CityStore SET rating = 1 WHERE store_id = 'S0091';
UPDATE CityStore SET rating = 2 WHERE store_id = 'S0012';
UPDATE CityStore SET rating = 3 WHERE store_id = 'S0045';
UPDATE CityStore SET rating = 4 WHERE store_id = 'S0032';
UPDATE CityStore SET rating = 5 WHERE store_id = 'S0027';
UPDATE CityStore SET rating = 1 WHERE store_id = 'S0088';
UPDATE CityStore SET rating = 3 WHERE store_id = 'S0095';
UPDATE CityStore SET rating = 2 WHERE store_id = 'S0055';
UPDATE CityStore SET rating = 3 WHERE store_id = 'S0099';
UPDATE CityStore SET rating = 1 WHERE store_id = 'S0078';

alter table citystore
drop column state;
select * from citystore;
rename table  citystore to Store;


CREATE TABLE OfficeSupplies (
    OrderDate DATE,
    Region VARCHAR(50),
    Rep VARCHAR(50),
    Item VARCHAR(50),
    Units INT,
    UnitPrice DECIMAL(10,2)
);
desc OfficeSupplies;
select * from OfficeSupplies;
INSERT INTO OfficeSupplies VALUES
('2014-07-04', 'East', 'Richard', 'Pen Set', 62, 4.99),
('2014-07-12', 'East', 'Nick', 'Binder', 29, 1.99),
('2014-07-21', 'Central', 'Morgan', 'Pen Set', 55, 12.49),
('2014-07-29', 'East', 'Susan', 'Binder', 81, 19.99),
('2014-08-14', 'Central', 'Matthew', 'Pen Set', 42, 23.95),
('2014-08-15', 'East', 'Richard', 'Pencil', 35, 4.99),
('2014-08-24', 'West', 'James', 'Desk', 3, 275.00),
('2014-09-01', 'Central', 'Smith', 'Desk', 2, 125.00),
('2014-09-10', 'Central', 'Bill', 'Pencil', 7, 1.29),
('2014-09-18', 'East', 'Richard', 'Pen Set', 16, 15.99),
('2014-09-27', 'West', 'James', 'Pen', 76, 1.99),
('2014-10-05', 'Central', 'Morgan', 'Binder', 51, 19.99),
('2014-10-14', 'West', 'Thomas', 'Binder', 57, 19.99),
('2014-10-22', 'East', 'Richard', 'Pen', 64, 8.99);
SET SQL_SAFE_UPDATES = 0;
delete from OfficeSupplies where orderdate='2014-07-12';
update officesupplies 
set units=45
 where OrderDate='2014-07-12';

delete from officesupplies where orderdate='2014-09-10';

