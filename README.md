# Ecommerce_dataset

**1.**  **INTRODUCTION:**

This dataset provides detailed insights into Amazon sales data, including SKU Code, Date, Category, Size, to help optimize product profitability.

Link of public data source: [_https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data_](https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data)

| **Column name** | **Description** |
| --- | --- |
| Category | Type of product. (String) |
| Size | Size of the product. (String) |
| Date | Date of the sale. (Date) |
| Status | Status of the sale. (String) |
| Fulfilment | Method of fulfilment. (String) |
| Style | Style of the product. (String) |
| SKU | Stock Keeping Unit. (String) |
| ASIN | Amazon Standard Identification Number. (String) |
| Courier Status | Status of the courier. (String) |
| Qty | Quantity of the product. (Integer) |
| Amount | Amount of the sale. (Float) |
| B2B | Business to business sale. (Boolean) |
| Currency | The currency used for the sale: INR (String) |
| Ship service level | Ship service level (String) |
| Ship city | City for shipping (String) |
| Ship state | State for shipping (String) |
| Fulfilled By | Delivery service (String) |

Link of my Tableau Dasboard:

[_https://public.tableau.com/app/profile/l.m.y.n/viz/EcommerceDataset2/Sales_](https://public.tableau.com/app/profile/l.m.y.n/viz/EcommerceDataset2/Sales)

[_https://public.tableau.com/app/profile/l.m.y.n/viz/EcommerceDataset\_16949599229780/Fulfillment_](https://public.tableau.com/app/profile/l.m.y.n/viz/EcommerceDataset_16949599229780/Fulfillment)

**2. SUMMARY OF DATA**  **EXPLORATORY:**

/\*I. Clean data\*/

--1. Check if any null/blank value from used columns

--2. Fill blank with value or remove if unneccessary:

----a) Courier Status:

----b) Amount:

----c) Currency:

----d) ship\_city:

----e) ship\_state:

----f) fulfilled\_by:

/\*II. Sales overview\*/

--1. Sales per month:

![](RackMultipart20230918-1-7xmrgz_html_b7a5f12a870b3eb.gif)

--2. Sales by category:

![](RackMultipart20230918-1-7xmrgz_html_ece9bbc80e8bfb62.gif)

--3. Avg Price per category:

![](RackMultipart20230918-1-7xmrgz_html_951400f066cc421f.gif)

--4. Sales by Size:

![](RackMultipart20230918-1-7xmrgz_html_6482ae977a0f1b88.gif)

--5. Sales by Top 10 State

![](RackMultipart20230918-1-7xmrgz_html_87bd50ee5cff4e13.gif)

/\*III. Check fulfillment on Amazon and Merchant\*/

--1. Sales by Fulfilment:

![](RackMultipart20230918-1-7xmrgz_html_7470a86569e3994.gif)

--2. Sales by Status for each fulfillment:

--Remark: Change Status to 3 category: shipped, cancelled, and pending for an easier check

----a) Check Status by value:

![](RackMultipart20230918-1-7xmrgz_html_434da437b0dd9994.gif)

----b) Check Status by percent:

![](RackMultipart20230918-1-7xmrgz_html_e9102427150367c3.gif)

--3. Check fulfilled by for each fulfillment:

![](RackMultipart20230918-1-7xmrgz_html_26689262569cffb6.gif)

--4. Check ship\_service\_level for each fulfillment:

![](RackMultipart20230918-1-7xmrgz_html_de051369483495fd.gif)
