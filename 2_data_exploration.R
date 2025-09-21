# only install packages once
install.packages("ggcorrplot")
install.packages("ggplot2")
install.packages("gridExtra")
install.packages("psych")

# start running the file from here after installing packages
#loading packages
library(ggcorrplot)
library(ggplot2)
library("gridExtra")
library("psych")

# printing some descriptive statistics values for each of column of our dataset.
for (column in names(dataset)) {
  print(column)
  data = dataset[[column]]
  print(summary(data))
  print(describe(data))
  print(sd(data))  # standard deviation
}



# Creating a correlatin matrix to spot a correlation between attributes and the target value
ggsave("correlation_matrix_plot.png", plot = ggcorrplot(cor(dataset[, sapply(dataset, is.numeric)])), height = 15, width = 15, , units = "in")



# plotting a list of barcharts for each column and its relation with the target value
bar_charts <- list()

#1

gender_barchart <- ggplot(dataset, aes(x = factor(Churn, levels = c(0, 1), labels = c("No", "Yes")))) +
                    geom_bar(aes(fill = factor(gender, levels = c(0, 1), labels = c("Female", "Male"))), position = "dodge") + 
                      labs(fill = "Gender", x = "Churn")
bar_charts <- c(bar_charts, gender_barchart)

#2 

payment_meathod_barchart <- ggplot(dataset, aes(x = factor(Churn, levels = c(0, 1), labels = c("No", "Yes")))) +
                             geom_bar(aes(fill = PaymentMethod), position = "dodge") + 
                              labs(fill = "PaymentMethod", x = "Churn")
bar_charts <- c(bar_charts, payment_meathod_barchart)

#3

InternetService_barchart <- ggplot(dataset, aes(x = factor(Churn, levels = c(0, 1), labels = c("No", "Yes")))) +
                             geom_bar(aes(fill = InternetService), position = "dodge") +
                              labs(fill = "InternetService", x = "Churn")
bar_charts <- c(bar_charts, InternetService_barchart)

#4

Dependents_barchart <- ggplot(dataset, aes(x = factor(Churn, levels = c(0, 1), labels = c("No", "Yes")))) +
                         geom_bar(aes(fill = factor(Dependents, levels = c(0, 1), labels = c("No", "Yes"))), position = "dodge") + 
                          labs(fill = "Dependents", x = "Churn")
bar_charts <- c(bar_charts, Dependents_barchart)

#5

Partner_barchart <- ggplot(dataset, aes(x = factor(Churn, levels = c(0, 1), labels = c("No", "Yes")))) +
                     geom_bar(aes(fill = factor(Partner, levels = c(0, 1), labels = c("No", "Yes"))), position = "dodge") + 
                      labs(fill = "Partner", x = "Churn")
bar_charts <- c(bar_charts, Partner_barchart)

#6

SeniorCitizen_barchart <- ggplot(dataset, aes(x = factor(Churn, levels = c(0, 1), labels = c("No", "Yes")))) +
                           geom_bar(aes(fill = factor(SeniorCitizen, levels = c(0, 1), labels = c("No", "Yes"))), position = "dodge") + 
                            labs(fill = "SeniorCitizen", x = "Churn")
bar_charts <- c(bar_charts, SeniorCitizen_barchart)

#7

OnlineSecurity_barchart <- ggplot(dataset, aes(x = factor(Churn, levels = c(0, 1), labels = c("No", "Yes")))) +
                             geom_bar(aes(fill = factor(OnlineSecurity, levels = c(0, 1), labels = c("No", "Yes"))), position = "dodge") + 
                              labs(fill = "OnlineSecurity", x = "Churn")
bar_charts <- c(bar_charts, OnlineSecurity_barchart)

#8

PaperlessBilling_barchart <- ggplot(dataset, aes(x = factor(Churn, levels = c(0, 1), labels = c("No", "Yes")))) +
                              geom_bar(aes(fill = factor(PaperlessBilling, levels = c(0, 1), labels = c("No", "Yes"))), position = "dodge") + 
                                labs(fill = "PaperlessBilling", x = "Churn")
bar_charts <- c(bar_charts, PaperlessBilling_barchart)

#9

TechSupport_barchart <- ggplot(dataset, aes(x = factor(Churn, levels = c(0, 1), labels = c("No", "Yes")))) +
                         geom_bar(aes(fill = factor(TechSupport, levels = c(0, 1), labels = c("No", "Yes"))), position = "dodge") + 
                          labs(fill = "TechSupport", x = "Churn")
bar_charts <- c(bar_charts, TechSupport_barchart)

#10

PhoneService_barchart <- ggplot(dataset, aes(x = factor(Churn, levels = c(0, 1), labels = c("No", "Yes")))) +
                           geom_bar(aes(fill = factor(PhoneService, levels = c(0, 1), labels = c("No", "Yes"))), position = "dodge") + 
                            labs(fill = "PhoneService", x = "Churn")
bar_charts <- c(bar_charts, PhoneService_barchart)

#11

Contract_barchart <- ggplot(dataset, aes(x = factor(Churn, levels = c(0, 1), labels = c("No", "Yes")))) +
                        geom_bar(aes(fill = factor(Contract, levels = c(0, 1, 2), labels = c("Month-to-month", "One year", "Two year"))), position = "dodge") + 
                        labs(fill = "Contract", x = "Churn")
bar_charts <- c(bar_charts, Contract_barchart)

#12

MultipleLines_barchart <- ggplot(dataset, aes(x = factor(Churn, levels = c(0, 1), labels = c("No", "Yes")))) +
                            geom_bar(aes(fill = factor(MultipleLines, levels = c(0, 1), labels = c("No", "Yes"))), position = "dodge") + 
                            labs(fill = "MultipleLines", x = "Churn")
bar_charts <- c(bar_charts, MultipleLines_barchart)

#13

OnlineSecurity_barchart <- ggplot(dataset, aes(x = factor(Churn, levels = c(0, 1), labels = c("No", "Yes")))) +
                              geom_bar(aes(fill = factor(OnlineSecurity, levels = c(0, 1), labels = c("No", "Yes"))), position = "dodge") + 
                              labs(fill = "OnlineSecurity", x = "Churn")
bar_charts <- c(bar_charts, OnlineSecurity_barchart)

#14

DeviceProtection_barchart <- ggplot(dataset, aes(x = factor(Churn, levels = c(0, 1), labels = c("No", "Yes")))) +
                                geom_bar(aes(fill = factor(DeviceProtection, levels = c(0, 1), labels = c("No", "Yes"))), position = "dodge") + 
                                labs(fill = "DeviceProtection", x = "Churn")
bar_charts <- c(bar_charts, DeviceProtection_barchart)

#15

StreamingTV_barchart <- ggplot(dataset, aes(x = factor(Churn, levels = c(0, 1), labels = c("No", "Yes")))) +
                          geom_bar(aes(fill = factor(StreamingTV, levels = c(0, 1), labels = c("No", "Yes"))), position = "dodge") + 
                          labs(fill = "StreamingTV", x = "Churn")
bar_charts <- c(bar_charts, StreamingTV_barchart)

#16

StreamingMovies_barchart <- ggplot(dataset, aes(x = factor(Churn, levels = c(0, 1), labels = c("No", "Yes")))) +
  geom_bar(aes(fill = factor(StreamingMovies, levels = c(0, 1), labels = c("No", "Yes"))), position = "dodge") + 
  labs(fill = "StreamingMovies", x = "Churn")
bar_charts <- c(bar_charts, StreamingMovies_barchart)

# Putting all the bar charts in one plot with three bar charts in each row
bar_charts_grid <- grid.arrange(grobs = bar_charts, ncol = 3)

#saving the box plots into the projects directory
ggsave("bar_charts.png", plot = bar_charts_grid, width = 10, height = 10, units = "in")


# Generating a box plot for MonthlyCharges and TotalCharges
MonthlyCharges_box_plot <- ggplot(dataset_na_and_customerID_removed, aes(x = Churn, y = MonthlyCharges)) + 
                            geom_boxplot(fill="steelblue",) + 
                              labs(fill = "MonthlyCharges", x = "Churn")

TotalCharges_box_plot <- ggplot(dataset_na_and_customerID_removed, aes(x = Churn ,y = TotalCharges)) + 
                          geom_boxplot(fill="steelblue",) + 
                            labs(fill = "TotalCharges", x = "Churn")

box_plots <- c(MonthlyCharges_box_plot, TotalCharges_box_plot)

# putting all those box plots in one plot
box_plots_grid <- grid.arrange(grobs = box_plots, ncol = 1)

# saving the box plots into the projects directory
ggsave("box_plots.png", plot = box_plots_grid, width = 10, height = 10, units = "in")

