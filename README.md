# Ecommerce_dataset

1. INTRODUCTION:
This dataset provides detailed insights into Amazon sales data, including SKU Code, Date, Category, Size, to help optimize product profitability.

Link of public data source: https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data

Column name -	Description
Category -	Type of product. (String)
Size -	Size of the product. (String)
Date -	Date of the sale. (Date)
Status	- Status of the sale. (String)
Fulfilment -	Method of fulfilment. (String)
Style	- Style of the product. (String)
SKU	- Stock Keeping Unit. (String)
ASIN	- Amazon Standard Identification Number. (String)
Courier - Status	Status of the courier. (String)
Qty	- Quantity of the product. (Integer)
Amount -	Amount of the sale. (Float)
B2B	- Business to business sale. (Boolean)
Currency	- The currency used for the sale: INR (String)
Ship service level	- Ship service level (String)
Ship city	- City for shipping (String)
Ship state	- State for shipping (String)
Fulfilled By	- Delivery service (String)

Link of my Tableau Dasboard:
https://public.tableau.com/app/profile/l.m.y.n/viz/EcommerceDataset2/Sales
https://public.tableau.com/app/profile/l.m.y.n/viz/EcommerceDataset_16949599229780/Fulfillment

2. SUMMARY OF DATA EXPLORATORY:
/*I. Clean data*/
--1. Check if any null/blank value from used columns
--2. Fill blank with value or remove if unneccessary:
  ----a) Courier Status:
  ----b) Amount:
  ----c) Currency:
  ----d) ship_city:
  ----e) ship_state:
  ----f) fulfilled_by:
  /*II. Sales overview*/
  --1. Sales per month:
 
 --2. Sales by category:
 
  --3. Avg Price per category:
 
  --4. Sales by Size:
 
  --5. Sales by Top 10 State
 
/*III. Check fulfillment on Amazon and Merchant*/
  --1. Sales by Fulfilment:
 
  --2. Sales by Status for each fulfillment:
  --Remark: Change Status to 3 category: shipped, cancelled, and pending for an easier check
  ----a) Check Status by value:
 
  ----b) Check Status by percent:
 
  --3. Check fulfilled by for each fulfillment:
 
  --4. Check ship_service_level for each fulfillment:
 












