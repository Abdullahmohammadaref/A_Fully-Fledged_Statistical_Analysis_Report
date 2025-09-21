# loading the dataset
dataset = read.csv("WA_Fn-UseC_-Telco-Customer-Churn.csv")
# general overview of the data
View(dataset)

# we have a total of 7043 rows in the dataset
dim(dataset)

# removing unecessary columns
dataset$customerID <- NULL

# we can see that TotalCharges column have 11 NULL values
for (column in names(dataset)) {
  print(column)
  data = dataset[[column]]
  print(summary(data))
}

# removing rows with NULL values
dataset <- na.omit(dataset)
print(nrow(dataset))


# printing each column name, data type and unique values to make decisions  on the data cleaning process
for (column in names(dataset)) {
  print(column)
  print(class(dataset[[column]]))
  print(unique(dataset[[column]]))
}

# creating a copy of the data before performing changes on the values because this copy will later be used in the "2_data_exeploration.R" script to crate a box plot
dataset_na_and_customerID_removed <- data.frame(dataset)



# Changing string values to numerical values
# Changing the datatype of columns from string to numerical

dataset$gender[dataset$gender == "Male"] <- 1
dataset$gender[dataset$gender == "Female"] <- 0
dataset$gender <- as.numeric(dataset$gender)

boolean_columns <- c("Partner", "Dependents", "PhoneService", "PaperlessBilling", "Churn")
for (column in boolean_columns) {
  dataset[[column]][dataset[[column]] == "Yes"] <- 1
  dataset[[column]][dataset[[column]] == "No"] <- 0
  dataset[[column]] <- as.numeric(dataset[[column]])
}

dataset$MultipleLines[dataset$MultipleLines == "Yes"] <- 1
dataset$MultipleLines[dataset$MultipleLines == "No"] <- 0
dataset$MultipleLines[dataset$MultipleLines == "No phone service"] <- 0
dataset$MultipleLines <- as.numeric(dataset$MultipleLines)

internet_boolean_columns <- c("OnlineSecurity", "OnlineBackup", "DeviceProtection", "TechSupport", "StreamingTV", "StreamingMovies")
for (column in internet_boolean_columns) {
  dataset[[column]][dataset[[column]] == "Yes"] <- 1
  dataset[[column]][dataset[[column]] == "No"] <- 0
  dataset[[column]][dataset[[column]] == "No internet service"] <- 0
  dataset[[column]] <- as.numeric(dataset[[column]])
}

dataset$Contract[dataset$Contract == "Month-to-month"] <- 0
dataset$Contract[dataset$Contract == "One year"] <- 1
dataset$Contract[dataset$Contract == "Two year"] <- 2
dataset$Contract <- as.numeric(dataset$Contract)


# scaling numerical values with standardized scaling to decrease the effect of outliers
dataset[["tenure"]] <- (dataset[["tenure"]] - mean(dataset[["tenure"]])) / sd(dataset[["tenure"]])
dataset[["MonthlyCharges"]] <- (dataset[["MonthlyCharges"]] - mean(dataset[["MonthlyCharges"]])) / sd(dataset[["MonthlyCharges"]])
dataset[["TotalCharges"]] <- (dataset[["TotalCharges"]] - mean(dataset[["TotalCharges"]])) / sd(dataset[["TotalCharges"]])

# sampling the data into training and testing data 
dataset_sample <- sample(nrow(dataset), size = floor(0.70 * nrow(dataset)))

train_dataset <- dataset[dataset_sample,]
test_dataset <- dataset[-dataset_sample,]
