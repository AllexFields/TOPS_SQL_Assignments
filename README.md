# TOPS SQL Assignments

This repository contains my session-wise SQL assignments completed as part of the **TOPS Data Analytics SQL curriculum** — covering everything from database fundamentals to advanced querying, optimization, and SQL's integration with Excel and Python. Each assignment builds on the previous one, moving from basic `SELECT` statements to window functions, CTEs, views, indexing, and a full analytics case study on a real-world dataset.

## Repository Structure

Each file/folder corresponds to a session and is named `Session_<number>_<topic>`. Most sessions are self-contained `.sql` scripts; sessions involving external tools (Excel, Power BI, Python) include the relevant workbook, notebook, or script alongside the SQL.

| Session | Topic | File(s) |
|---|---|---|
| 1 | Introduction to Databases, RDBMS & MySQL vs PostgreSQL | `Session_1_Introduction_To_Databases.sql` |
| 2 | Basic `SELECT` & `FROM`, column aliasing | `Session_2_Basic_Select_From.sql` |
| 3 | `WHERE` clause & comparison/logical operators | `Session_3_WHERE_Clause_Operators.sql` |
| 4 | Wildcards & pattern matching (`LIKE`, `BETWEEN`, `IN`) | `Session_4_Wildcards_Pattern_Matching.sql` |
| 5 | `DISTINCT`, `ORDER BY`, `LIMIT` | `Session_5_Distinct_OrderBY_Limit.sql` |
| 6 | Aggregate functions (`SUM`, `COUNT`, `AVG`, `MIN`, `MAX`, `ROUND`) | `Session_6_Aggregrate_Func.sql` |
| 7 | `GROUP BY` & `HAVING` | `Session_7_GroupBy_Having.sql` |
| 8 | Joins — `INNER`, `LEFT`, `RIGHT` | `Session_8_Joins_Left_Right_Inner.sql` |
| 9 | Advanced joins — `FULL OUTER`, `SELF JOIN`, `CROSS JOIN` | `Session_9_Advance_Joins_SQL.sql` |
| 10 | `UNION` vs `UNION ALL` | `Session_10_Union_&_Union_All.sql` |
| 11 | Subqueries (scalar, row, table/derived) | `Session_11_Subqueries.sql` |
| 12 | Common Table Expressions (CTEs) & YoY sales growth | `Session_12_CTE_YoY-Sales.sql` |
| 13 | Window functions — `OVER()`, `PARTITION BY` | `Session_13_Window_Functions.sql` |
| 14 | Window functions — `ROW_NUMBER`, `RANK`, `DENSE_RANK` | `Session_14_Window_Functions_Part_2.sql` |
| 15 | Date functions (`DATE_ADD`, `DATEDIFF`, `YEAR()`, etc.) | `Session_15_Date_Functions.sql` |
| 16 | String functions (`CONCAT`, `SUBSTR`, `TRIM`, `REPLACE`) | `Session_16_String_Functions.sql` |
| 17 | Conditional logic with `CASE WHEN` | `Session_17_Conditional_Logical.sql` |
| 18 | Views — creation, updating, and use in reporting | `Session_18_Create_View.sql` |
| 19 | Indexing & query optimization (`EXPLAIN ANALYZE`) | `Session_19_Indexing_Query_Optimization.sql` |
| 20 | Import/export data — CSV, Power BI | `Session_20/` (`Session_20_Import_Export_Data.sql`, `Task_4_PowerBI.pbix`, `Task_5.ipynb`, `mi_matches.csv`) |
| 21 | SQL + Excel integration (dashboard building) | `Session_21_Restaurant_Dashboard.xlsx` |
| 22 | SQL + Python integration (`sqlite3`, pandas, Jupyter) | `Session_22_Python_SQL_Integration/` (`Generating_my_databse.py`, `Session_22.ipynb`, `my_database.db`) |
| Case Study | Zomato Bangalore Restaurants — full analytics case study | `Case Study/` (`Case_Study.sql`, `Ingest_db_case_study.ipynb`) |

## Case Study: Zomato Bangalore Restaurants

The capstone case study uses the [Zomato Bangalore Restaurants dataset from Kaggle](https://www.kaggle.com/) to answer business questions a Data Analyst at Zomato might face — restaurant performance, pricing, ratings, customer preferences, and market segmentation. Queries in `Case Study/Case_Study.sql` cover tasks such as:

- Top-rated restaurants by locality (with vote counts)
- Unique cuisines and restaurant counts per area
- Average cost-for-two by restaurant type
- Low-rated but high-vote-count restaurants (flagging risk/opportunity)
- Segmenting restaurants into Budget / Mid-range / Premium categories using `CASE WHEN`

`Ingest_db_case_study.ipynb` handles loading the raw Kaggle CSV into the database used for the analysis.

## Tools & Technologies

- **Database engines:** MySQL, PostgreSQL
- **Querying:** SQL Workbench / MySQL Workbench
- **Integration:** Microsoft Excel (Power Query), Power BI, Python (pandas, sqlite3, Jupyter Notebook)

## How to Use

Each `.sql` file can be run independently — most begin by creating their own database/schema and sample tables, then insert sample data before running the demonstrated queries. Files with numbered `Task` comments correspond to specific assignment questions from that session.

---

**Shivam Thakur**  
Aspiring Data Analyst | Python Learner | Exploring Data Analytics & AI

## 📬 Connect With Me

- 💼 LinkedIn: https://www.linkedin.com/in/shivam-thakur-55b167406/
- 📧 Email: dataanalyst.shivamthakur@gmail.com

---
⭐ Thank you for visiting my repository! Feel free to explore
