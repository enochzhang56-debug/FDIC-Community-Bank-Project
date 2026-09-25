# FDIC-Community-Bank-Project
Identifying California community bank investment/acquisition targets using FDIC financial data and BEA state GDP. SQL, Python, Excel, Tableau.

# Background and Overview

If an investor of a bank holding company is looking to diversify risk, deposit growth, and expand into different markets, a common strategy is to invest or acquire community banks.

The question then becomes which ones show the most consistent growth, and which ones may carry risks when the economy expands and contracts. This project analyses data from the FDIC (Federal Deposit Insurance Corporation) and compares it to data pulled from BEA (U.S. Bureau of Economic Analysis) to identify community bank trends compared to state GDP and recommend banks to invest/acquire in the short term.

Insights and Recommendations are provided based off of 5 KPIs:

- **Return on Assets (ROA).** Measures how much return the bank generates for asset holders.
- **Return on Equity (ROE).** Measures how much profit the bank generates for shareholders
- **Deposits (DEP).** Measures stability of funding base and public trust in the bank.
- **Assets.** Measures the total resources a bank controls that generate revenue.
- **Real GDP / Interest Rate Correlation.** Tracks how performance is influenced by external factors.


## Data Sources 
Data pulled using an API key from [FDIC](https://banks.data.fdic.gov/api) and [BEA](https://apps.bea.gov/api/data). Code for it can be found [here](https://github.com/enochzhang56/FDIC-Community-Bank-Project/blob/main/FDIC_API_Requests.ipynb).


Raw data joined and combined using SQL. Code for it can be found [here](https://github.com/enochzhang56/FDIC-Community-Bank-Project/blob/main/FDIC_Data_Joining.sql).

Final Joined Data Set can be downloaded [here](https://github.com/enochzhang56/FDIC-Community-Bank-Project/blob/main/merged_bank_data_.csv). 

Link to Excel File can be found [here](https://1drv.ms/x/c/e4ba8883d1c17b2b/IQDIZn0UfQ5YTLtIRhuxwIBwAYDRfqKSaoJ_RfdqzrSWvTQ?e=UNyIFN).

# Data Structure

<img width="621" height="416" alt="FDIC_Data_Structure" src="https://github.com/user-attachments/assets/b138f034-4e4d-4339-88ce-d82d4d4ee1ba" />


*derived data, only applicable in FILTERED TOP 14 Sheet

# Executive Summary

After screening 115 community banks across California from 2022-2025, six banks: Westamerica, East West Bank, HCN, Preferred Bank, First General Bank, and Axos Bank, emerged as consistent performers across the 5 KPIs. East West Bank, Axos Bank, and Preferred Bank stood out, as these three banks had above-average and consistent ROA and ROE, as well as large and growing deposit and asset bases.

Below is the graphical representation of the Bank's respective ROE and ROA against the fluctuations in the Federal Interest Rate and Real GDP of California, as well as their deposit and asset trends. Find entire analysis procress [here](https://github.com/enochzhang56/FDIC-Community-Bank-Project/blob/main/Analysis.md).

<p align="center">
  <img src="https://github.com/user-attachments/assets/75ddaedf-e4df-4450-bce7-685b4cb4dad1" alt="ROA_ROE" width="450">
  <img src="https://github.com/user-attachments/assets/9e423f13-b88d-437f-a5d5-974dce81218c" alt="ASSET_DEP_TOP3" width="450">
  <br>
  <em>Figure 1. ROA and ROE Trends (left) and Asset/Deposit Distribution (right).</em>
</p>

## Bank Trends:

- Axos Bank had an average **ROE of 16.87%**, against the total average of 8.9%, and had an average **ROA of 1.70%**, against the total average of 1.25%. This growth is consistent across all 16 quarters tracked, with deposits and assets consistently growing, peaking around **80% increase in Q4 of 2025**.
- East West Bank had an average **ROE of 18.21%**, and had an average **ROA of 1.71%**. The growth of the bank is also consistent across all 16 quarters tracked, with deposits and assets peaking at **21% and 28% increase respectively in Q4 of 2025**.
  - East West bank also has the largest Asset and Deposit Base, **at ~$74 Billion Total**, against the total average Deposit and Asset total of $8.1 Billion
- Preferred Bank had an average **ROE of 19.49%**, with an average **ROA of 1.99%.** The bank is also consistently growing in deposits and assets, peaking at **19.53% and 23.74% respectively in Q4 of 2025**.

<img width="892" height="238" alt="FDIC_Deposit_Change" src="https://github.com/user-attachments/assets/284b9280-5fd7-4e1c-be7b-2734a25bfaf7" />
<img width="900" height="233" alt="FDIC_Asset_Change" src="https://github.com/user-attachments/assets/7f4bfcbc-2ba9-4d53-b5f7-a6339356ba7b" />


# Recommendations

- **Invest/Acquire Shares** in **East West Bank**, as it shows the most consistent returns in Assets and Equity, along with the largest deposit and asset bases among top performers. Amidst the 2023 Interest Rate Hikes, there was minimal disruption in ROE and ROA, indicating a durable profit model rather than relying on federal interest rates for growth.
- **Secondary Banks** to look out for are **Preferred Bank** and **Axos Bank**. These banks show strong ROA and ROE rates, but may be more sensitive to external economic factors as their Asset and Deposit bases are slightly smaller than East West bank, but show promising future growth.
