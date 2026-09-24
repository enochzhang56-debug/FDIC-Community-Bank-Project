# FDIC-Community-Bank-Project
Identifying California community bank investment/acquisition targets using FDIC financial data and BEA state GDP. SQL, Python, Excel, Tableau.

# Background and Overview

If an investor of a bank holding company is looking to diversify risk, deposit growth, and expand into different markets, a common strategy is to invest or acquire community banks.

The question then becomes which ones show the most consistent growth, and which ones may carry risks when the economy expands and contracts. This project analyses data from the FDIC (Federal Deposit Insurance Corporation) and compares it to data pulled from BEA (U.S. Bureau of Economic Analysis) to identify community bank trends compared to state GDP and recommend banks to invest/acquire in the short term.

Insights and Recommendations are provided based off of:

- **Return on Assets (ROA).** Measures how much return the bank generates for asset holders.
- **Return on Equity (ROE).** Measures how much profit the bank generates for shareholders
- **Deposits (DEP).** Measures stability of funding base and public trust in the bank.
- **Assets.** Measures the total resources a bank controls that generate revenue.
- **Real GDP / Interest Rate Correlation.** Tracks how performance is influenced by external factors.

Data pulled using an API key and API requests. Code for it can be found [here] (https://github.com/enochzhang56/FDIC-Community-Bank-Project/blob/main/FDIC_API_Requests.ipynb).


Raw data joined and combined using SQL. Code for it can be found [here].(https://github.com/enochzhang56/FDIC-Community-Bank-Project/in/FDIC_Data_Joining.sql)

# Data Structure

| Table | Column | Data Type |
|---|---|---|
| **institutions** | CERT (PK) | String |
| | NAME | String |
| | CITY | String |
| | STALP | String |
| | ESTYMD | Date |
| | BKCLASS | String |
| **financials** | CERT (FK) | String |
| | REPDTE | Date |
| | ASSET | Float |
| | EQUITY* | Float |
| | DEP | Float |
| | NETINC | Float |
| | ROA | Float |
| | ROE | Float |
| | EEFFR | Float |
| | LNRE | Float |
| | LNCI | Float |
| | LNCON | Float |
| | NUMEMP | Int |
| | Interest Rate* | Float |
| **state_gdp** | STALP | String |
| | TimePeriod | String/Date |
| | RealGDP | Float |

*derived data, only applicable in FILTERED TOP 14 Sheet

**Relationships:** `institutions` (1) → `financials` (∞) via CERT. `institutions` (1) → `state_gdp` (∞) via STALP, related by time period (quarter alignment).

# Executive Summary

After screening 115 community banks across California from 2022-2025, six banks: Westamerica, East West Bank, HCN, Preferred Bank, First General Bank, and Axos Bank, emerged as consistent performers across the 5 KPIs. East West Bank, Axos Bank, and Preferred Bank stood out, as these three banks had above-average and consistent ROA and ROE, as well as large and growing deposit and asset bases.

Below is the graphical representation of the Bank's respective ROE and ROA against the fluctuations in the Federal Interest Rate and Real GDP of California, as well as their deposit and asset trends.

*[Insert ROA / ROE / Federal Interest Rate / Real GDP / Assets / Deposits charts here]*

## Bank Trends:

- Axos Bank had an average **ROE of 16.87%**, against the total average of 8.9%, and had an average **ROA of 1.70%**, against the total average of 1.25%. This growth is consistent across all 16 quarters tracked, with deposits and assets consistently growing, peaking around **80% increase in Q4 of 2025**.
- East West Bank had an average **ROE of 18.21%**, and had an average **ROA of 1.71%**. The growth of the bank is also consistent across all 16 quarters tracked, with deposits and assets peaking at **21% and 28% increase respectively in Q4 of 2025**.
  - East West bank also has the largest Asset and Deposit Base, **at ~$74 Billion Total**, against the total average Deposit and Asset total of $8.1 Billion
- Preferred Bank had an average **ROE of 19.49%**, with an average **ROA of 1.99%.** The bank is also consistently growing in deposits and assets, peaking at **19.53% and 23.74% respectively in Q4 of 2025**.

*[Insert Change in Asset / Change in Deposits tables here]*

# Recommendations

- **Invest/Acquire Shares** in **East West Bank**, as it shows the most consistent returns in Assets and Equity, along with the largest deposit and asset bases among top performers. Amidst the 2023 Interest Rate Hikes, there was minimal disruption in ROE and ROA, indicating a durable profit model rather than relying on federal interest rates for growth.
- **Secondary Banks** to look out for are **Preferred Bank** and **Axos Bank**. These banks show strong ROA and ROE rates, but may be more sensitive to external economic factors as their Asset and Deposit bases are slightly smaller than East West bank, but show promising future growth.
