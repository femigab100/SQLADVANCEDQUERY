use advanced_analytics;
-- Advanced Query
-- Monthly Revenue by Region and Category
SELECT
    DATE_FORMAT(s.sale_date, '%Y-%m') AS sale_month,
    s.region,
    p.category,
    SUM(s.quantity * s.unit_price) AS total_revenue
FROM
    sales s
JOIN
    products p ON s.product_id = p.product_id
GROUP BY
    sale_month, s.region, p.category
ORDER BY
    sale_month, s.region, p.category;

-- Top 5 Products by Revenue in the last quarter
    WITH recent_sales AS (
    SELECT
        s.product_id,
        p.product_name,
        SUM(s.quantity * s.unit_price) AS revenue
    FROM
        sales s
    JOIN
        products p ON s.product_id = p.product_id
    WHERE
        s.sale_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
    GROUP BY
        s.product_id, p.product_name
),
ranked_products AS (
    SELECT
        *,
        RANK() OVER (ORDER BY revenue DESC) AS ranking
    FROM
        recent_sales
)
SELECT
    product_id, product_name, revenue
FROM
    ranked_products
WHERE
    ranking <= 5;

-- Consecutive Monthly Purchases
SELECT DISTINCT
    c.customer_id,
    c.customer_name
FROM
    customers c
JOIN
    sales s1 ON c.customer_id = s1.customer_id
JOIN
    sales s2 ON c.customer_id = s2.customer_id
WHERE
    PERIOD_DIFF(DATE_FORMAT(s2.sale_date, '%Y%m'), DATE_FORMAT(s1.sale_date, '%Y%m')) = 1;


