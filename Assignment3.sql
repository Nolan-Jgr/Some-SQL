/**********************/
/* Name: Nolan Jaeger */
/* Class: CS3410      */
/* Term: Fall 2020    */
/* Assign #: 3        */
/**********************/

/* 2.28 */
SELECT SKU, SKU_Description, WarehouseID
FROM inventory
WHERE QuantityOnHand = 0 OR QuantityOnOrder = 0
ORDER BY WarehouseID desc, SKU asc;

/* 2.29 */
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM inventory
WHERE QuantityOnHand > 1 AND QuantityOnHand < 10;

/* 2.30 */
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM inventory
WHERE QuantityOnHand BETWEEN 2 AND 9;

/* 2.31 */
SELECT DISTINCT SKU, SKU_Description
FROM inventory
WHERE SKU_Description LIKE 'Half-dome%';

/* 2.32 */
SELECT DISTINCT SKU, SKU_Description
FROM inventory
WHERE SKU_Description LIKE '%Climb%';

/* 2.33 */
SELECT DISTINCT SKU, SKU_Description
FROM inventory
WHERE SKU_Description LIKE '__d%';

/* 2.34 */
SELECT COUNT(QuantityOnHand) AS CountQty,
SUM(QuantityOnHand) AS SumQty,
AVG(QuantityOnHand) AS AvgQty,
MIN(QuantityOnHand) AS MinQty,
MAX(QuantityOnHand) AS MaxQty
FROM inventory;

/* 2.35 */
/* COUNT - counts the number of rows in that table. SUM - calculates the sum of the specified values. */

/* 2.36 */
SELECT WarehouseID,
SUM(QuantityOnHand) AS TotItemsOnHand
FROM inventory
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand desc;

/* 2.37 */
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM inventory
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
ORDER BY TotalItemsOnHandLT3 desc;

/* 2.38 */
SELECT WarehouseID, SUM (QuantityOnHand) AS TotalItemsOnHandLT3
FROM inventory
WHERE QuantityOnHand <= 3
GROUP BY WarehouseID
HAVING SUM(QuantityOnHand) < 2
ORDER BY TotalItemsOnHandLT3 desc;

/* 2.39 */
/* the WHERE clause was applied first */

/* 2.40 */
SELECT SKU, SKU_Description, warehouse.WarehouseID, WarehouseCity, WarehouseState
FROM inventory, warehouse
WHERE (inventory.WarehouseID = warehouse.WarehouseID) AND (WarehouseCity = 'Atlanta' OR WarehouseCity = 'Bangor' OR WarehouseCity = 'Chicago');

/* 2.41 */
SELECT SKU, SKU_Description, inventory.WarehouseID, WarehouseCity, WarehouseState
FROM inventory, warehouse
WHERE warehouse.WarehouseID IN
(SELECT WarehouseID
FROM warehouse
WHERE WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago'))
ORDER BY warehouse.WarehouseCity, SKU asc, inventory.WarehouseID asc;

/* 2.42 */
SELECT SKU, SKU_Description, warehouse.WarehouseID, WarehouseCity, WarehouseState
FROM inventory, warehouse
WHERE (inventory.WarehouseID = warehouse.WarehouseID) AND (WarehouseCity <> 'Atlanta') AND (WarehouseCity <> 'Bangor') AND (WarehouseCity <> 'Chicago');

/* 2.43 */
SELECT SKU, SKU_Description, inventory.WarehouseID, WarehouseCity, WarehouseState
FROM inventory, warehouse
WHERE warehouse.WarehouseID IN
(SELECT WarehouseID
FROM warehouse
WHERE WarehouseCity NOT IN ('Atlanta', 'Bangor', 'Chicago'))
ORDER BY warehouse.WarehouseCity, SKU asc, inventory.WarehouseID asc;

/* 2.44 */
SELECT CONCAT(inventory.SKU_Description, ' is located in ', warehouse.WarehouseCity) as ItemLocation
FROM inventory, warehouse
WHERE inventory.WarehouseID = warehouse.WarehouseID;

/* 2.45 */
SELECT SKU, SKU_Description, inventory.WarehouseID
FROM inventory, warehouse
WHERE warehouse.WarehouseID IN
(SELECT WarehouseID
FROM warehouse
WHERE Manager like 'Lucille Smith')

/* 2.46 */
SELECT SKU, SKU_Description, warehouse.WarehouseID
FROM inventory, warehouse
WHERE (inventory.WarehouseID = warehouse.WarehouseID) AND (Manager = 'Lucille Smith');

/* 2.47 */
SELECT SKU, SKU_Description, warehouse.WarehouseID
FROM inventory join warehouse
   ON inventory.WarehouseID = warehouse.WarehouseID
WHERE (Manager = 'Lucille Smith');

/* 2.48 */
SELECT WarehouseID, AVG(QuantityOnHand) AS AvgQtyOnHandPerWare
FROM inventory
WHERE WarehouseID IN
(SELECT WarehouseID
FROM warehouse
WHERE Manager LIKE 'Lucille Smith')
GROUP BY SKU;

/* 2.49 */
SELECT inventory.WarehouseID, AVG(QuantityOnHand) AS AverageQtyOnHand
FROM inventory, warehouse
WHERE (inventory.WarehouseID = warehouse.WarehouseID) AND (Manager = 'Lucille Smith');

/* 2.50 */
SELECT inventory.WarehouseID, AVG(QuantityOnHand) AS AverageQtyOnHand
FROM inventory JOIN warehouse
   ON inventory.WarehouseID = warehouse.WarehouseID
WHERE (Manager = 'Lucille Smith');

