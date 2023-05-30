-- Find the item that has minimum weight
SELECT *
FROM ITEMS
WHERE WEIGHT = (SELECT MIN(WEIGHT) FROM ITEMS);

-- Find the different warehouses in "Pune"
SELECT *
FROM WAREHOUSES
WHERE CITY = 'Pune';

-- Find the details of items ordered by a customer "Mr. Patil"
SELECT I.ITEMNO, I.DESCRIPTION, I.WEIGHT, I.COST, O.ORDERED_QUANTITY
FROM ITEMS I
JOIN ORDERS_ITEMS O ON I.ITEMNO = O.ITEMNO
JOIN ORDERS R ON O.ONO = R.ONO
JOIN CUSTOMER C ON R.CNO = C.CNO
WHERE C.CNAME = 'Mr. Patil';

-- Find a Warehouse which has maximum stores
SELECT W.WID, W.WNAME, COUNT(S.SID) AS STORE_COUNT
FROM WAREHOUSES W
JOIN STORES S ON W.WID = S.WID
GROUP BY W.WID, W.WNAME
ORDER BY STORE_COUNT DESC
LIMIT 1;

-- Find an item which is ordered for a minimum number of times
SELECT I.ITEMNO, I.DESCRIPTION, COUNT(O.ITEMNO) AS ORDER_COUNT
FROM ITEMS I
LEFT JOIN ORDERS_ITEMS O ON I.ITEMNO = O.ITEMNO
GROUP BY I.ITEMNO, I.DESCRIPTION
ORDER BY ORDER_COUNT
LIMIT 1;

-- Find the detailed orders given by each customer
SELECT C.CNO, C.CNAME, O.ONO, O.ODATE, I.ITEMNO, I.DESCRIPTION, O.ORDERED_QUANTITY
FROM CUSTOMER C
JOIN ORDERS O ON C.CNO = O.CNO
JOIN ORDERS_ITEMS OI ON O.ONO = OI.ONO
JOIN ITEMS I ON OI.ITEMNO = I.ITEMNO;