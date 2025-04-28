# File: churn_analysis.R

# Install required packages if not installed
# install.packages("dplyr")
# install.packages("ggplot2")
# install.packages("readr")

# Load libraries
library(dplyr)
library(ggplot2)
library(readr)

# 1. Load Dataset
churn_data <- read_csv("customer_churn_data.csv")

# View basic structure
print(head(churn_data))

# 2. Data Cleaning
# Check for NA values
print(colSums(is.na(churn_data)))

# Some TotalCharges may be missing, remove such rows
churn_data <- churn_data %>% filter(!is.na(TotalCharges))

# Confirm cleaning
print(colSums(is.na(churn_data)))

# 3. Churn Summary
total_customers <- nrow(churn_data)
total_churned <- churn_data %>% filter(Churn == "Yes") %>% nrow()
churn_rate <- (total_churned / total_customers) * 100

cat("\nTotal Customers:", total_customers)
cat("\nTotal Churned:", total_churned)
cat("\nChurn Rate:", round(churn_rate, 2), "%\n")

# 4. Visualization 1: Churn by Contract Type
churn_by_contract <- churn_data %>%
  group_by(Contract) %>%
  summarize(Churned = sum(Churn == "Yes"))

ggplot(churn_by_contract, aes(x = Contract, y = Churned, fill = Contract)) +
  geom_bar(stat = "identity") +
  labs(title = "Churn by Contract Type", x = "Contract Type", y = "Number of Churned Customers") +
  theme_minimal() +
  theme(legend.position = "none")

# Save plot
ggsave("outputs/churn_by_contract.png", width = 6, height = 4)

# 5. Visualization 2: Churn by Internet Service
churn_by_internet <- churn_data %>%
  filter(Churn == "Yes") %>%
  group_by(InternetService) %>%
  summarize(Churned = n())

ggplot(churn_by_internet, aes(x = "", y = Churned, fill = InternetService)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(title = "Churn by Internet Service") +
  theme_void()

# Save plot
ggsave("outputs/churn_by_internet.png", width = 6, height = 4)

# 6. Visualization 3: Monthly Charges vs Churn
ggplot(churn_data, aes(x = Churn, y = MonthlyCharges, fill = Churn)) +
  geom_boxplot() +
  labs(title = "Monthly Charges vs Churn", x = "Churn Status", y = "Monthly Charges") +
  theme_minimal()

# Save plot
ggsave("outputs/churn_vs_monthlycharges.png", width = 6, height = 4)

# 7. Visualization 4: Tenure vs Churn
ggplot(churn_data, aes(x = Churn, y = tenure, fill = Churn)) +
  geom_boxplot() +
  labs(title = "Tenure vs Churn", x = "Churn Status", y = "Tenure (Months)") +
  theme_minimal()

# Save plot
ggsave("outputs/churn_vs_tenure.png", width = 6, height = 4)

