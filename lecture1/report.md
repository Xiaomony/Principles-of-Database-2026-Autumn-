I design the database and store the raw data in the following tables with columns described below:

- customers
    - customer_id _**int (primary key)**_
    - customer_name _**varchar(20) (not null)**_
    - customer_phone _**varchar(20)**_

```
 customer_id | customer_name | customer_phone
-------------+---------------+----------------
           1 | Lin Xiaoyu    | 138-0000-1001
           2 | Omar Aziz     | 138-0000-1002
           3 | Priya Shah    | 138-0000-1003
           4 | Chen Wei      | 138-0000-1004
           5 | Sofia Rossi   | 138-0000-1005
           6 | Kim Minjun    | 138-0000-1006
           7 | Lucas Martin  | 138-0000-1007
           8 | Aisha Rahman  | 138-0000-1008
           9 | Wang Yue      | 138-0000-1009
          10 | Daniel Lee    | 138-0000-1010
          11 | Mei Zhou      | 138-0000-1011
          12 | Noah Patel    | 138-0000-1012
```

- cuisines
    - cuisine_code _**int (primary key)**_
    - cuisine_name _**varchar(20) (not null)**_

```
 cuisine_code |  cuisine_name
--------------+----------------
            1 | Chinese
            2 | Indian
            3 | Italian
            4 | Healthy
            5 | Korean
            6 | Japanese
            7 | Middle Eastern
```

- restuarants
    - restuarant_id _**int (primary key)**_
    - restuarant_name _**varchar(100) (not null)**_
    - cuisine_code _**int (foreign key → cuisines.cuisine_code)**_

```
 restuarant_id |   restuarant_name   | cuisine_code
---------------+---------------------+--------------
             1 | Harbor Dumpling     |            1
             2 | Curry Leaf Kitchen  |            2
             3 | Olive & Oven        |            3
             4 | Green Bowl Lab      |            4
             5 | Seoul Street Bites  |            5
             6 | Spice Route Noodles |            1
             7 | Tokyo Bento House   |            6
             8 | Levant Table        |            7
```

- districts
    - district_code _**int (primary key)**_
    - district_name _**varchar(20) (not null)**_

```
 district_code | district_name
---------------+---------------
             1 | Nanshan
             2 | Futian
             3 | Luohu
             4 | Longhua
             5 | Longgang
             6 | Bao'an
```

- couriers
    - courier_id _**int (primary key)**_
    - courier_name _**varchar(20) (not null)**_
    - courier_phone _**varchar(20)**_

```
 courier_id | courier_name | courier_phone
------------+--------------+---------------
          1 | Zhang Rui    | 139-0000-2001
          2 | Li Na        | 139-0000-2002
          3 | Hassan Ali   | 139-0000-2003
          4 | Sun Jie      | 139-0000-2004
          5 | Park Jisoo   | 139-0000-2005
          6 | Liu Yang     | 139-0000-2006
          7 | Maya Singh   | 139-0000-2007
          8 | Wu Tong      | 139-0000-2008
```

- payments
    - payment_code _**numeric(2) (primary key)**_
    - payment_name _**varchar(20) (not null)**_

```
 payment_code |  payment_name
--------------+----------------
            1 | WeChat Pay
            2 | Alipay
            3 | Credit Card
            4 | Digital Wallet
```

- orders
    - order_id _**numeric(9) (primary key)**_
    - order_time _**timestamp (not null)**_
    - customer_id _**int (foreign key → customers.customer_id)**_
    - delivery_addr _**varchar(100)**_
    - restuarant_id _**int (foreign key → restuarants.restuarant_id)**_
    - district_code _**int (foreign key → districts.district_code)**_
    - courier_id _**int (foreign key → couriers.courier_id)**_
    - payment_code _**numeric(2) (foreign key → payments.payment_code)**_
    - delivery_fee _**numeric(3,2) (not null)**_
    - items _**varchar(500) (not null)**_

```
 order_id |     order_time      | customer_id |               delivery_addr               | restuarant_id | district_code | courier_id | payment_code | delivery_fee |                                                                                                    items
----------+---------------------+-------------+-------------------------------------------+---------------+---------------+------------+--------------+--------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 26090101 | 2026-09-01 11:35:00 |           1 | Building 3, Innovation Park, Nanshan      |             1 |             1 |          1 |            1 |         4.00 | 1|I001|Pork Xiao Long Bao|CAT01|Main|28.00|2|No ginger; 2|I003|Cucumber Salad|CAT02|Side|16.00|1|-; 3|I004|Soy Milk|CAT03|Drink|10.00|1|Warm
 26090102 | 2026-09-01 12:10:00 |           2 | Room 608, Finance Tower, Futian           |             2 |             2 |          2 |            2 |         5.00 | 1|I005|Butter Chicken|CAT01|Main|46.00|1|Medium spicy; 2|I007|Garlic Naan|CAT02|Side|12.00|2|-; 3|I008|Mango Lassi|CAT03|Drink|18.00|1|Less ice
 26090103 | 2026-09-01 12:42:00 |           3 | Gate 2, South Campus, Nanshan             |             4 |             2 |          3 |            3 |         3.00 | 1|I014|Tofu Green Bowl|CAT01|Main|38.00|1|No peanuts; 2|I015|Pumpkin Soup|CAT02|Side|20.00|1|-; 3|I016|Cold-Pressed Juice|CAT03|Drink|22.00|1|No ice
 26090104 | 2026-09-01 18:05:00 |           4 | Block B, Harbor Residence, Luohu          |             5 |             3 |          4 |            1 |         6.00 | 1|I017|Beef Bibimbap|CAT01|Main|44.00|1|Extra kimchi; 2|I020|Barley Tea|CAT03|Drink|10.00|2|Cold
 26090105 | 2026-09-01 19:16:00 |           5 | Apt 1204, Bay View Garden, Nanshan        |             3 |             1 |          5 |            4 |         4.00 | 1|I009|Margherita Pizza|CAT01|Main|52.00|1|Thin crust; 2|I011|Tiramisu|CAT04|Dessert|26.00|2|-; 3|I012|Sparkling Water|CAT03|Drink|12.00|1|Cold
 26090201 | 2026-09-02 11:28:00 |           6 | Lobby, Metro Plaza, Longhua               |             7 |             4 |          6 |            2 |         5.00 | 1|I025|Salmon Bento|CAT01|Main|58.00|1|No wasabi; 2|I027|Miso Soup|CAT02|Side|12.00|1|-; 3|I028|Matcha Pudding|CAT04|Dessert|20.00|1|-
 26090202 | 2026-09-02 12:03:00 |           7 | Desk 4F-21, Software Hub, Nanshan         |             1 |             1 |          1 |            3 |         4.00 | 1|I002|Shrimp Dumplings|CAT01|Main|32.00|1|-; 2|I003|Cucumber Salad|CAT02|Side|16.00|2|Extra vinegar; 3|I004|Soy Milk|CAT03|Drink|10.00|1|Cold
 26090203 | 2026-09-02 12:47:00 |           8 | Room 917, Central Business Center, Futian |             8 |             5 |          7 |            1 |         7.00 | 1|I029|Chicken Shawarma Plate|CAT01|Main|45.00|1|No onion; 2|I031|Hummus|CAT02|Side|18.00|1|Extra pita; 3|I032|Mint Lemonade|CAT03|Drink|16.00|1|Less sugar
 26090204 | 2026-09-02 18:22:00 |           9 | Unit 2-1603, Riverside Court, Bao'an      |             6 |             6 |          8 |            2 |         6.00 | 1|I021|Beef Noodle Soup|CAT01|Main|35.00|2|One mild, one spicy; 2|I023|Spicy Wontons|CAT02|Side|22.00|1|-; 3|I024|Plum Juice|CAT03|Drink|12.00|2|No ice
 26090205 | 2026-09-02 19:08:00 |          10 | Building 8, Creative Park, Nanshan        |             1 |             1 |          2 |            1 |         4.00 | 1|I001|Pork Xiao Long Bao|CAT01|Main|28.00|1|No ginger; 2|I001|Pork Xiao Long Bao|CAT01|Main|28.00|1|Extra ginger; 3|I004|Soy Milk|CAT03|Drink|10.00|2|Warm
 26090301 | 2026-09-03 11:51:00 |          11 | Library Entrance, North Campus, Nanshan   |             4 |             2 |          3 |            4 |         3.00 | 1|I013|Chicken Quinoa Bowl|CAT01|Main|42.00|1|Dressing on side; 2|I015|Pumpkin Soup|CAT02|Side|20.00|1|-; 3|I016|Cold-Pressed Juice|CAT03|Drink|22.00|1|Less ice
 26090302 | 2026-09-03 12:18:00 |          12 | Apt 502, Maple Residence, Futian          |             2 |             2 |          4 |            3 |         5.00 | 1|I006|Vegetable Biryani|CAT01|Main|38.00|1|Mild; 2|I007|Garlic Naan|CAT02|Side|12.00|1|-; 3|I008|Mango Lassi|CAT03|Drink|18.00|2|No ice
 26090303 | 2026-09-03 18:36:00 |           1 | Desk 901, Tech Tower, Nanshan             |             3 |             1 |          5 |            1 |         4.00 | 1|I010|Mushroom Pasta|CAT01|Main|48.00|1|No cheese; 2|I011|Tiramisu|CAT04|Dessert|26.00|1|-; 3|I012|Sparkling Water|CAT03|Drink|12.00|1|Room temperature
 26090304 | 2026-09-03 19:02:00 |           2 | Room 608, Finance Tower, Futian           |             5 |             3 |          6 |            2 |         6.00 | 1|I018|Kimchi Fried Rice|CAT01|Main|36.00|1|Extra egg; 2|I019|Korean Fried Chicken|CAT01|Main|48.00|1|Mild; 3|I020|Barley Tea|CAT03|Drink|10.00|1|Cold
 26090305 | 2026-09-03 19:44:00 |           3 | Gate 2, South Campus, Nanshan             |             7 |             4 |          7 |            3 |         5.00 | 1|I026|Chicken Teriyaki Bento|CAT01|Main|46.00|1|Sauce separate; 2|I027|Miso Soup|CAT02|Side|12.00|2|-; 3|I028|Matcha Pudding|CAT04|Dessert|20.00|1|-
 26090401 | 2026-09-04 11:39:00 |           4 | Block B, Harbor Residence, Luohu          |             8 |             5 |          8 |            1 |         7.00 | 1|I030|Falafel Wrap|CAT01|Main|32.00|2|One without tomato; 2|I031|Hummus|CAT02|Side|18.00|1|Extra olive oil; 3|I032|Mint Lemonade|CAT03|Drink|16.00|2|Less sugar
 26090402 | 2026-09-04 12:24:00 |           5 | Apt 1204, Bay View Garden, Nanshan        |             1 |             1 |          1 |            4 |         4.00 | 1|I001|Pork Xiao Long Bao|CAT01|Main|25.20|2|-; 2|I002|Shrimp Dumplings|CAT01|Main|32.00|1|-; 3|I003|Cucumber Salad|CAT02|Side|16.00|1|No garlic
 26090403 | 2026-09-04 12:55:00 |           6 | Lobby, Metro Plaza, Longhua               |             2 |             2 |          2 |            2 |         5.00 | 1|I005|Butter Chicken|CAT01|Main|41.40|1|Medium spicy; 2|I007|Garlic Naan|CAT02|Side|12.00|2|-; 3|I008|Mango Lassi|CAT03|Drink|18.00|1|Less ice
 26090404 | 2026-09-04 18:11:00 |           7 | Desk 4F-21, Software Hub, Nanshan         |             3 |             1 |          3 |            3 |         4.00 | 1|I009|Margherita Pizza|CAT01|Main|49.00|1|Extra basil; 2|I011|Tiramisu|CAT04|Dessert|26.00|1|-; 3|I012|Sparkling Water|CAT03|Drink|12.00|2|Cold
 26090405 | 2026-09-04 19:27:00 |           8 | Room 917, Central Business Center, Futian |             4 |             2 |          4 |            1 |         3.00 | 1|I013|Chicken Quinoa Bowl|CAT01|Main|42.00|2|One without corn; 2|I014|Tofu Green Bowl|CAT01|Main|38.00|1|No peanuts; 3|I016|Cold-Pressed Juice|CAT03|Drink|22.00|2|No ice
 26090501 | 2026-09-05 11:46:00 |           9 | Unit 2-1603, Riverside Court, Bao'an      |             5 |             3 |          5 |            2 |         6.00 | 1|I017|Beef Bibimbap|CAT01|Main|39.60|1|Extra vegetables; 2|I019|Korean Fried Chicken|CAT01|Main|48.00|1|Mild; 3|I020|Barley Tea|CAT03|Drink|10.00|2|Cold
 26090502 | 2026-09-05 12:31:00 |          10 | Building 8, Creative Park, Nanshan        |             6 |             6 |          6 |            3 |         6.00 | 1|I022|Dan Dan Noodles|CAT01|Main|32.00|2|One without peanuts; 2|I023|Spicy Wontons|CAT02|Side|22.00|1|Extra chili; 3|I024|Plum Juice|CAT03|Drink|12.00|1|No ice
 26090503 | 2026-09-05 18:04:00 |          11 | Library Entrance, North Campus, Nanshan   |             7 |             4 |          7 |            1 |         5.00 | 1|I025|Salmon Bento|CAT01|Main|55.00|1|No wasabi; 2|I026|Chicken Teriyaki Bento|CAT01|Main|46.00|1|Extra sauce; 3|I028|Matcha Pudding|CAT04|Dessert|20.00|2|-
 26090504 | 2026-09-05 19:19:00 |          12 | Apt 502, Maple Residence, Futian          |             8 |             5 |          8 |            4 |         7.00 | 1|I029|Chicken Shawarma Plate|CAT01|Main|45.00|1|No onion; 2|I030|Falafel Wrap|CAT01|Main|32.00|1|-; 3|I031|Hummus|CAT02|Side|18.00|2|Extra pita; 4|I032|Mint Lemonade|CAT03|Drink|16.00|1|Less ice
 26090601 | 2026-09-06 11:57:00 |           1 | Building 3, Innovation Park, Nanshan      |             6 |             6 |          1 |            1 |         6.00 | 1|I021|Beef Noodle Soup|CAT01|Main|35.00|1|Extra beef; 2|I022|Dan Dan Noodles|CAT01|Main|32.00|1|Mild; 3|I023|Spicy Wontons|CAT02|Side|22.00|1|-; 4|I024|Plum Juice|CAT03|Drink|12.00|1|Cold
 26090602 | 2026-09-06 12:43:00 |           4 | Block B, Harbor Residence, Luohu          |             2 |             2 |          2 |            2 |         5.00 | 1|I005|Butter Chicken|CAT01|Main|46.00|2|One mild, one hot; 2|I006|Vegetable Biryani|CAT01|Main|38.00|1|-; 3|I007|Garlic Naan|CAT02|Side|12.00|2|-; 4|I008|Mango Lassi|CAT03|Drink|18.00|1|No ice
 26090603 | 2026-09-06 18:52:00 |           7 | Apt 1802, Harbor Heights, Nanshan         |             5 |             3 |          3 |            3 |         6.00 | 1|I017|Beef Bibimbap|CAT01|Main|44.00|1|Extra kimchi; 2|I018|Kimchi Fried Rice|CAT01|Main|36.00|1|No egg; 3|I019|Korean Fried Chicken|CAT01|Main|48.00|1|Mild; 4|I020|Barley Tea|CAT03|Drink|10.00|2|Cold
 26090604 | 2026-09-06 19:33:00 |          10 | Building 8, Creative Park, Nanshan        |             4 |             2 |          4 |            4 |         3.00 | 1|I013|Chicken Quinoa Bowl|CAT01|Main|42.00|1|No corn; 2|I014|Tofu Green Bowl|CAT01|Main|38.00|1|Extra tofu; 3|I015|Pumpkin Soup|CAT02|Side|20.00|2|-; 4|I016|Cold-Pressed Juice|CAT03|Drink|22.00|1|No ice
```
