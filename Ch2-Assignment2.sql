/***********************/
/*Name: Nolan Jaeger   */
/*Class: CS 3410       */
/* Term: Fall 2020     */
/* Assgn #: 2 part 1   */
/***********************/
SELECT TOP (1000) [WarehouseID]
      ,[SKU]
      ,[SKU_Description]
      ,[QuantityOnHand]
      ,[QuantityOnOrder]
  FROM [Cape_Codd].[dbo].[INVENTORY];
/* 2.17 */
SELECT SKU,SKU_Description
FROM INVENTORY;
/* 2.18 */
SELECT SKU_Description, SKU
FROM INVENTORY;
/* 2.19 */
SELECT WarehouseID
FROM INVENTORY;
/* 2.20 */
SELECT distinct WarehouseID
FROM INVENTORY;
/* 2.21 */
SELECT WarehouseID, SKU, SKU_Description, QuantityOnHand, QuantityOnOrder
FROM INVENTORY;
/* 2.22 */
SELECT *
FROM INVENTORY;
/* 2.23 */
SELECT *
FROM INVENTORY
WHERE QuantityOnHand > 0;
/* 2.24 */
SELECT SKU, SKU_Description
FROM INVENTORY
WHERE QuantityOnHand = 0;
/* 2.25 */
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0
ORDER BY WarehouseID asc;
/* 2.26 */
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand > 0
ORDER BY WarehouseID desc, SKU asc;
/* 2.27 */
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0 AND QuantityOnOrder > 0
ORDER BY WarehouseID desc, SKU asc;
/***************************/
/* Name: Nolan Jaeger      */
/* Class: CS 3410          */
/* Term: Fall 2020         */
/* Assgn #: 2 Part 2       */
/***************************/
/* A */
SELECT *
FROM CUSTOMER;
SELECT *
FROM ITEM;
SELECT *
FROM SALE;
SELECT *
FROM SALE_ITEM;
/* B */
SELECT LastName, FirstName, Phone
FROM CUSTOMER;
/* C */
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE FirstName = 'John';
/* D */
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE FirstName LIKE 'D%';
/* E */
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE LastName LIKE '%ne%';
/* F */
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE Phone LIKE '%56_';
/* G */
SELECT MAX(Total) as MaxTotalSales,
MIN(Total) as MinTotalSales
FROM SALE;
/* H */
SELECT AVG(Total) as AvgTotalSales
FROM SALE;
/* I */
SELECT COUNT(*) as NumOfCustomers
FROM SALE;
/* J */
SELECT LastName, FirstName
FROM CUSTOMER
GROUP BY LastName, FirstName;
/* K */
SELECT LastName, FirstName, COUNT(*) as NumOfCustomers
FROM CUSTOMER
GROUP BY LastName, FirstName;
