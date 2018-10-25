INSERT INTO Documents
    (id, type, number)
VALUES
    (1, 'passport', '10 44 000001'),
    (2, 'passport', '65 12 123456'),
    (3, 'driver license', '43 20 987654'),
    (4, 'passport', '57 11 654234'),
    (5, 'driver license', '27 53 489331'),
    (6, 'passport', '55 23 780736'),
    (7, 'driver license', '81 03 437306'),
    (8, 'passport', '44 02 787202'),
    (9, 'driver license', '25 92 175291'),
    (10, 'driver license', '73 52 261235'),
    (11, 'passport', '46 79 684962'),
    (12, 'driver license', '39 41 253321'),
    (13, 'passport', '56 85 985263'),
    (14, 'passport', '16 52 541054'),
    (15, 'driver license', '35 57 093743'),
    (16, 'passport', '69 05 816934'),
    (17, 'passport', '14 01 890753'),
    (18, 'passport', '09 25 094713'),
    (19, 'passport', '95 65 241466'),
    (20, 'passport', '33 34 552651');

INSERT INTO Couriers
    (id, name, age, document_id, rating, comment)
VALUES
    (1, 'Baybara Eugeniy', 37, 17, 4.0, 'only evening'),
    (2, 'Bushev Vyacheslav', 98, 19, 4.0, 'pensioner'),
    (3, 'Volodin Vadim', 62, 1, 4.5, ''),
    (4, 'Galyamina Vasilisa', 25, 18, 4.5, ''),
    (5, 'Gorbatyuk Sergey', 75, 16, 4.0, 'on the car'),
    (6, 'Kovalev Mark', 59, 13, 4.0, ''),
    (7, 'Kutuev Vladimir', 89, 5, 4.0, ''),
    (8, 'Malcev Vladimir', 49, 7, 3.0, ''),
    (9, 'Mishin Nikita', 18, 10, 4.5, 'public transport'),
    (10, 'Mustafa Irina', 68, 8, 3.0, '');

INSERT INTO Customers
    (id, name, age, document_id, rating, comment)
VALUES
    (1, 'Nemchinov Egor', 86, 6, 4.0, ''),
    (2, 'Nisharadze Anastassia', 62, 14, 4.0, ''),
    (3, 'Ostroukhov Anton', 48, 11, 2.0, ''),
    (4, 'Skaredov Sergey', 21, 12, 2.0, ''),
    (5, 'Sokolov Yaroslav', 97, 15, 5.0, ''),
    (6, 'Spirin Egor', 76, 2, 3.5, ''),
    (7, 'Tursunova Munira', 38, 9, 2.0, ''),
    (8, 'Turin Aleksey', 31, 4, 4.0, ''),
    (9, 'Cherepanov Aleksey', 84, 3, 4.5, ''),
    (10, 'Chubukov Phillip', 45, 20, 2.5, '');

INSERT INTO Orders
    (id, name, departure, destination, height, width, depth, weight, comment, status)
VALUES
    (1, 'Documents', '10 linia VO, 35-26', 'Srednii pr VO, 27-1', 4.2, 12.1, 5.7, 5.8, 'promply', 'done'),
    (2, 'Products', 'Malyi pr VO, 33-2', '10 linia VO, 35-26', 9.3, 1.4, 1.6, 9.1, '', 'in queue'),
    (3, 'Computer technics', '5 linia VO, 45-8', 'Srednii pr VO, 34-2', 7.4, 7.7, 15.9, 18.6, '', 'canceled'),
    (4, 'Documents', 'Srednii pr VO, 34-2', 'Nevskii pr, 9-11', 19.7, 10.1, 3.4, 18.1, 'carefull', 'in queue'),
    (5, 'Clothes', '10 linia VO, 35-26', 'Sadovaia ul, 17-23', 13.2, 4.1, 9.1, 19.4, '', 'done'),
    (6, 'Rollerskates', 'Srednii pr VO, 34-2', '10 linia VO, 35-26', 1.9, 19.4, 10.8, 13.9, '', 'in progress'),
    (7, 'Headphones', 'Srednii pr VO, 27-1', '10 linia VO, 35-26', 19.7, 10.1, 4.9, 1.6, '', 'canceled'),
    (8, 'Documents', '10 linia VO, 35-26', 'Sadovaia ul, 17-23', 8.1, 15.8, 16.6, 14.9, 'to 17:00', 'in queue'),
    (9, 'Parts of the car', 'Universitetskaia nab, 17', '5 linia VO, 45-8', 9.6, 10.6, 6.6, 1.2, '', 'in progress'),
    (10, 'Documents', '10 linia VO, 35-26', '5 linia VO, 45-8', 14.9, 10.9, 11.3, 11.1, '', 'in queue');

INSERT INTO Courier_orders
    (courier_id, order_id)
VALUES
    (5, 1),
    (5, 3),
    (1, 2),
    (8, 4),
    (6, 7),
    (4, 8),
    (9, 10),
    (2, 5),
    (3, 6),
    (7, 9);

INSERT INTO Customer_orders
    (customer_id, order_id)
VALUES
    (3, 1),
    (1, 2),
    (1, 4),
    (5, 5),
    (1, 7),
    (7, 9),
    (2, 3),
    (10, 8),
    (8, 6),
    (4, 10);

INSERT INTO Processed_orders
    (order_id, courier_id, customer_id)
VALUES
    (1, 5, 3),
    (2, 1, 1),
    (3, 5, 2),
    (4, 8, 1),
    (5, 2, 5),
    (6, 3, 8),
    (7, 6, 1),
    (8, 4, 10),
    (9, 7, 7),
    (10, 9, 4);
