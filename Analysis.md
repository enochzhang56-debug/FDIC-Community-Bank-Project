# Full Analysis: FDIC Community Bank Project

This document contains the full data cleaning, exploratory data analysis (EDA), and bank-by-bank analysis behind the [README](./README.md) summary and recommendations. It's intended for anyone who wants to see the full reasoning trail, not just the headline findings.

---

## Data Cleaning

**Formatted columns to correct data types** (Dollars, Date).

**ESTYMD had ~50 incorrectly formatted dates**, because Excel does not accept anything before 1900 as a real date. Converted them to 1/1/1900 for simplicity.

**Mizrahi Tefahot Bank, Ltd. has missing values** for: NETINC, ROE, LNCON, and NUMEMP. Left this data blank, since these fields were non-essential to the core analysis.

---

## EDA Process

### Outlier Detection

Created a pivot table, selected each bank, and found Max/Min/Average ROA and ROE figures to identify outliers.

- **Identified Capital Bank and Trust Company** as a potential outlier, with 70.44% ROA and 114.96% ROE.
  - Filtered the master sheet and found that their assets were >$200,000.00 and deposits were = $500.00.

<img width="495" height="56" alt="Screenshot 2026-09-24 at 5 00 58 PM" src="https://github.com/user-attachments/assets/7e13b35a-5c00-4424-9f63-04ce691bf669" />


- **Identified First American Trust, FSB** as a potential outlier, with 119.52% ROE.
  - Filtered the master sheet and found that it was a highly volatile bank.

<img width="521" height="71" alt="Screenshot 2026-09-24 at 5 01 27 PM" src="https://github.com/user-attachments/assets/131eb59b-9580-41f9-a028-6d55119b685e" />


### Top 15 ROE Banks

Found the 15 highest average-ROE banks (excluding the outlier bank) and plotted their quarterly ROE against each other.

**Comparing Trends of ROE:** the initial chart of all 15 banks was offset by Capital Bank and Trust Company's trend (peaking near 130%, dropping to -100%), which compressed every other bank's trend line into an unreadable cluster near zero.


<img width="468" height="265" alt="Screenshot 2026-09-24 at 5 02 09 PM" src="https://github.com/user-attachments/assets/63c84c5d-32b9-419a-bc84-cb62d6ed8442" />


**Removing Outlier: First American Trust** — after also removing this bank (highly volatile, as noted above), the remaining top-14 ROE trend chart became readable:

<img width="536" height="331" alt="Screenshot 2026-09-24 at 5 03 28 PM" src="https://github.com/user-attachments/assets/db0c0150-23ee-48ef-a532-e843311ec7d8" />


- Top 14 ROE banks all show consistent ROE, with none dipping into negative territory.
- There is a general trend where most banks peaked from 2023 Q2–Q3.
- Consistent ROE across quarters signals operational stability.

**Compare Trends of ROA:** The Bank of New York Mellon Trust Company stood out sharply on ROA (peaking near 20%, versus most banks clustered under 5%). Removed from this specific chart (**noting it for final analysis, not discarding it entirely**) to make the remaining banks' trends visible:

<img width="668" height="371" alt="Screenshot 2026-09-24 at 5 04 04 PM" src="https://github.com/user-attachments/assets/7d8fc53d-3909-4959-a7f6-b121d2cc60d6" />

<img width="664" height="387" alt="Screenshot 2026-09-24 at 5 04 26 PM" src="https://github.com/user-attachments/assets/12975461-17dc-46fa-af3e-60387d48c213" />

- With New York Mellon removed, First General Bank emerges as a distinct high-ROA performer, peaking around 4% and remaining consistently elevated through 2023–2024.

---

## Derived Columns

**Created an "EQUITY" column** using the formula `K / (M/100)`, where:
- K = Net Income (NETINC)
- M = ROE

`EQUITY` — Float (total equity, $000s). This backs out equity from the ROE definition (ROE = Net Income / Equity), since equity wasn't directly available in the FDIC financials pull.

**Created an "Interest Rate" column** by pulling data from the [Federal Reserve's Fed Funds series](https://fred.stlouisfed.org/series/fedfunds).

---

## Bivariate Analysis

### Deposits vs. ROE
- High deposits show strong customer trust and market presence.
- Stable, low-cost funding.

<img width="434" height="326" alt="Screenshot 2026-09-24 at 5 04 52 PM" src="https://github.com/user-attachments/assets/e0b78c04-cf17-4f1f-942f-96b3c2455d38" />


### Loan-to-Asset Ratio vs. ROE
- This ratio reveals how lending-aggressive a bank is, signaling higher earning potential but higher risk exposure to economic downturns and interest rate shocks.
- A higher ratio also signals that the bank's assets have lower liquidity.

<img width="392" height="297" alt="Screenshot 2026-09-24 at 5 08 08 PM" src="https://github.com/user-attachments/assets/fdfde1cd-ef59-4d8e-b729-a0f606af4bd7" />


### Equity-to-Assets Ratio vs. ROE
- This ratio reveals how much of a bank's assets are financed by the bank's owners rather than depositors or debt, which may indicate lower risk of failure and more stable growth.

<img width="352" height="283" alt="Screenshot 2026-09-24 at 5 08 20 PM" src="https://github.com/user-attachments/assets/85bb516d-6677-409e-95f2-a8a4447cc15f" />


---

## Bank-Level Analysis

Began by cross-referencing ROE/ROA trends and the bivariate graphs above to identify which banks warranted deeper, individual analysis.

**Strong performers by metric:**

| Metric | Strong Performers |
|---|---|
| ROA | First General Bank, FFB Bank, Westamerica, Preferred, Murphy, HCN |
| ROE | Westamerica, HCN, Bank of New York Mellon Trust, Preferred, Axos, East West Bank |
| Deposits (High) | East West Bank, Westamerica, Axos, Preferred, Farmers & Merchant Bank |
| Loan-to-Asset (High) | CalPrivate, HCN, Axos, First General, Mission Bank |
| Loan-to-Asset (Low) | Westamerica, New York Mellon |
| Equity-to-Asset (High) | New York Mellon (highly volatile), First General Bank |
| Equity-to-Asset (Low) | Most banks fell in the 0–10% range |

**Per-bank metric summary** (which metrics each bank stood out on):

| Bank | Standout Metrics |
|---|---|
| Westamerica | ROE, ROA, Deposits, Loan-to-Asset |
| HCN | ROA, ROE, Loan-to-Asset |
| NY Mellon | ROE, Loan-to-Asset, Equity-to-Asset |
| Preferred | ROE, ROA, Deposits |
| Axos | ROE, Deposits, Loan-to-Asset |
| East West Bank | ROE, Deposits |
| Farmers & Merchant | Deposits |
| CalPrivate | Loan-to-Asset |
| First General | ROA, Loan-to-Asset, Equity-to-Asset |
| Mission Bank | Loan-to-Asset |
| FFB | ROA |
| Murphy | ROA |

**Banks selected for deeper analysis:** Westamerica, The Bank of New York Mellon Trust, Preferred Bank, East West Bank, First General Bank, Axos Bank, and HCN.

---

## Tableau Analysis

Built out Tableau views for the shortlisted banks: 
Equity-to-Asset Ratio, Efficiency Ratio, Asset Amount, Deposits, and Equity Amount, each broken out by bank.

<img width="665" height="511" alt="Screenshot 2026-09-24 at 5 11 04 PM" src="https://github.com/user-attachments/assets/2655312b-4439-4634-9bb8-4f37a40d1cdb" />

### Key findings by bank

**The Bank of New York Mellon Trust Company** has the highest ROA, but based on its efficiency ratio and asset size, the bank is actually quite small.
- Bank of New York Mellon is a trust company, and trust companies operate on a fee-based custody/wealth-management model with minimal balance-sheet assets relative to income.
- **This bank was excluded from further comparative analysis** as a result — its ROA/ROE aren't measuring the same thing as a standard commercial bank's.

**Westamerica Bank** is a larger bank and a State Member bank. Acquiring assets in this bank yields consistent returns, and the bank is resilient to dips in the federal interest rate.

**East West Bank** is relatively the largest bank among the stronger performers, and is especially resilient to both rises and dips in the federal interest rate.

**HCN Bank** has both consistent and high ROA and ROE, but its efficiency ratio is somewhat lower, and it is also a smaller bank.

---

*For the final shortlist, KPI comparisons, and investment/acquisition recommendations, see the [README](./README.md).*
