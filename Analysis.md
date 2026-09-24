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

  | Bank | ROA | ROE |
  |---|---|---|
  | CalPrivate Bank | 2.60 | 29.58 |
  | **Capital Bank and Trust Company** | **70.45** | **114.96** |
  | Cathay Bank | 1.72 | 14.56 |

- **Identified First American Trust, FSB** as a potential outlier, with 119.52% ROE.
  - Filtered the master sheet and found that it was a highly volatile bank.

  | Bank | ROA | ROE |
  |---|---|---|
  | Farmers and Merchants Bank of Long Beach | 0.98 | 9.04 |
  | FFB Bank | 2.79 | 26.34 |
  | **First American Trust, FSB** | **1.61** | **119.52** |
  | First Commercial Bank (USA) | 1.71 | 9.16 |

### Top 15 ROE Banks

Found the 15 highest average-ROE banks (excluding the outlier bank) and plotted their quarterly ROE against each other.

| Bank | Avg. ROA | Avg. ROE |
|---|---|---|
| Capital Bank and Trust Company | 45.88 | 70.87 |
| First American Trust, FSB | 0.59 | 29.56 |
| HCN Bank | 2.38 | 24.04 |
| Westamerica Bank | 2.01 | 23.28 |
| The Bank of New York Mellon Trust Company, National Association | 16.71 | 20.75 |
| FFB Bank | 2.33 | 19.91 |
| Preferred Bank | 1.99 | 19.49 |
| CalPrivate Bank | 1.77 | 18.96 |
| East West Bank | 1.71 | 18.21 |
| Plumas Bank | 1.66 | 17.73 |
| Axos Bank | 1.70 | 16.87 |
| Oak Valley Community Bank | 1.30 | 16.33 |
| Farmers & Merchants Bank of Central California | 1.64 | 16.24 |
| Mission Bank | 1.58 | 16.19 |
| First General Bank | 3.08 | 15.54 |

**Comparing Trends of ROE:** the initial chart of all 15 banks was dominated by Capital Bank and Trust Company's extreme swing (peaking near 130%, dropping to -100%), which compressed every other bank's trend line into an unreadable cluster near zero. This is a classic outlier-distortion problem — the chart was technically accurate but told the wrong story.

**Removing Outlier: First American Trust** — after also removing this bank (highly volatile, as noted above), the remaining top-14 ROE trend chart became readable:

- Top 14 ROE banks all show consistent ROE, with none dipping into negative territory.
- There is a general trend where most banks peaked from 2023 Q2–Q3.
- Consistent ROE across quarters signals operational stability.

**Compare Trends of ROA:** The Bank of New York Mellon Trust Company stood out sharply on ROA (peaking near 20%, versus most banks clustered under 5%). Removed from this specific chart (**noting it for final analysis, not discarding it entirely**) to make the remaining banks' trends visible:

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



### Loan-to-Asset Ratio vs. ROE
- This ratio reveals how lending-aggressive a bank is, signaling higher earning potential but higher risk exposure to economic downturns and interest rate shocks.
- A higher ratio also signals that the bank's assets have lower liquidity.

### Equity-to-Assets Ratio vs. ROE
- This ratio reveals how much of a bank's assets are financed by the bank's owners rather than depositors or debt, which may indicate lower risk of failure and more stable growth.

### Real GDP vs. ROE
- Plotted against California's Real GDP over the same period to check whether bank profitability tracks the broader state economy.

### Interest Rate vs. ROE
- Banks will naturally gain or lose deposits and assets as interest rates rise and fall.
- Resilience against interest rate hikes and dips signals a more consistent, durable bank.

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

Built out Tableau views for the shortlisted banks: ROA trends, ROE trends, Federal Interest Rate over time, Real GDP over time, Equity-to-Asset Ratio, Efficiency Ratio, Asset Amount, Deposits, and Equity Amount, each broken out by bank.

### Key findings by bank

**The Bank of New York Mellon Trust Company** has the highest ROA, but based on its efficiency ratio and asset size, the bank is actually quite small.
- Bank of New York Mellon is a trust company, and trust companies operate on a fee-based custody/wealth-management model with minimal balance-sheet assets relative to income.
- **This bank was excluded from further comparative analysis** as a result — its ROA/ROE aren't measuring the same thing as a standard commercial bank's.

**Westamerica Bank** is a larger bank and a State Member bank. Acquiring assets in this bank yields consistent returns, and the bank is resilient to dips in the federal interest rate.

**East West Bank** is relatively the largest bank among the stronger performers, and is especially resilient to both rises and dips in the federal interest rate.

**HCN Bank** has both consistent and high ROA and ROE, but its efficiency ratio is somewhat lower, and it is also a smaller bank.

---

*For the final shortlist, KPI comparisons, and investment/acquisition recommendations, see the [README](./README.md).*
