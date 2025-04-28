# Customer Churn Analysis (R Language Project)

## Overview
This project analyzes customer churn behavior using a real-world telecom dataset.  
It focuses on data cleaning, churn rate calculation, and generating insightful visualizations with R.

## Features
- Load and clean telecom customer churn dataset
- Calculate total customers, churned customers, and churn rate
- Analyze churn trends based on:
  - Contract Type
  - Internet Service Type
  - Monthly Charges
  - Tenure
- Generate and save plots automatically

## Technologies Used
- **R Language**
- **dplyr** (Data Manipulation)
- **ggplot2** (Data Visualization)
- **readr** (Data Import)

## How to Run
1. Make sure you have R and RStudio installed.
2. Install required libraries:
   ```r
   install.packages("dplyr")
   install.packages("ggplot2")
   install.packages("readr")
   ```
3. Clone this repository.
4. Set your working directory where files are located.
5. Run the script:
   ```r
   source("churn_analysis.R")
   ```
6. Output graphs will be saved in the `/outputs/` folder automatically.

## Output

### 1. Churn by Contract Type
- Displays the number of churned customers based on their contract type (Month-to-Month, One Year, Two Year).
- Helps understand which contract type has higher customer churn.

![churn_by_contract](https://github.com/user-attachments/assets/be1b7747-7417-448b-8311-3f6660b6a0a0)

---

### 2. Churn by Internet Service Type
- A pie chart showing how churn varies depending on the customer's Internet Service (DSL, Fiber Optic, No Internet).
- Useful to identify which service types have higher churn.

![churn_by_internet](https://github.com/user-attachments/assets/ef7dfdbf-49ee-4bba-b733-78b22e080efe)

---

### 3. Monthly Charges vs Churn
- A boxplot comparing Monthly Charges between churned and non-churned customers.
- Helps understand if high billing impacts customer churn.

![churn_vs_monthlycharges](https://github.com/user-attachments/assets/bffd7320-501c-4562-8c69-7156271f6db3)

---

### 4. Tenure vs Churn
- A boxplot comparing tenure (months stayed) between churned and non-churned customers.
- Shows if new customers are more likely to churn compared to long-term ones.

![churn_vs_tenure](https://github.com/user-attachments/assets/62ea4806-7951-4d25-8f9d-67599210176c)

---

## Author
Chaitanya Khot

## License
This project is licensed under the MIT License.
