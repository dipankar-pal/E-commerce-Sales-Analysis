

CREATE TABLE furniture_sales (
    productTitle TEXT,
    originalprice NUMERIC(10,2),
    Price NUMERIC(10,2),
    sold INT,
    tagText VARCHAR(50),
    Sales NUMERIC(10,2),
    Shipping_price NUMERIC(10,2),
    discount NUMERIC(5,2)
);


SELECT * FROM furniture_sales LIMIT 10;


--total sales
SELECT SUM(Sales) AS total_sales FROM furniture_sales;


--avg_discount
SELECT AVG(discount) AS avg_discount FROM furniture_sales;


--Top5 sold product
SELECT productTitle, SUM(sold) AS total_sold
FROM furniture_sales
GROUP BY productTitle
ORDER BY total_sold DESC
LIMIT 5;

-- Most Profitable Products
SELECT productTitle, SUM(Sales - Shipping_price) AS net_profit
FROM furniture_sales
GROUP BY productTitle
ORDER BY net_profit DESC
LIMIT 5;

--Discount Impact on Sales
SELECT discount, AVG(sold) AS avg_units_sold
FROM furniture_sales
GROUP BY discount
ORDER BY discount;


--Free Shipping vs. Paid Shipping Sales
SELECT tagText, SUM(Sales) AS total_sales
FROM furniture_sales
GROUP BY tagText;

--Sales Distribution by Price Range
SELECT 
    CASE 
        WHEN Price < 20 THEN 'Low Price (<$20)'
        WHEN Price BETWEEN 20 AND 50 THEN 'Mid Price ($20-$50)'
        ELSE 'High Price (>$50)'
    END AS price_range,
    SUM(Sales) AS total_sales
FROM furniture_sales
GROUP BY price_range
ORDER BY total_sales DESC;


--



































































































