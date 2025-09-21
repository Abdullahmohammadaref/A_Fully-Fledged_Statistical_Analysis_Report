#Chi-squres test for each categorial variables with two or more categories

cont_table_gender = table(dataset[["gender"]], dataset$Churn)
print(cont_table_gender)
chi_squared_test_gender = chisq.test(cont_table_gender)

cont_table_Dependents = table(dataset[["Dependents"]], dataset$Churn)
print(cont_table_Dependents)
chi_squared_test_Dependents = chisq.test(cont_table_Dependents)

cont_table_Partner = table(dataset[["Partner"]], dataset$Churn)
print(cont_table_Partner)
chi_squared_test_Partner = chisq.test(cont_table_Partner)

cont_table_SeniorCitizen = table(dataset[["SeniorCitizen"]], dataset$Churn)
print(cont_table_SeniorCitizen)
chi_squared_test_SeniorCitizen = chisq.test(cont_table_SeniorCitizen)

cont_table_OnlineSecurity = table(dataset[["OnlineSecurity"]], dataset$Churn)
print(cont_table_OnlineSecurity)
chi_squared_test_OnlineSecurity = chisq.test(cont_table_OnlineSecurity)

cont_table_PaperlessBilling = table(dataset[["PaperlessBilling"]], dataset$Churn)
print(cont_table_PaperlessBilling)
chi_squared_test_PaperlessBilling = chisq.test(cont_table_PaperlessBilling)

cont_table_TechSupport = table(dataset[["TechSupport"]], dataset$Churn)
print(cont_table_TechSupport)
chi_squared_test_TechSupport = chisq.test(cont_table_TechSupport)

cont_table_PhoneService = table(dataset[["PhoneService"]], dataset$Churn)
print(cont_table_PhoneService)
chi_squared_test_PhoneService = chisq.test(cont_table_PhoneService)

cont_table_InternetService = table(dataset[["InternetService"]], dataset$Churn)
print(cont_table_InternetService)
chi_squared_test_InternetService = chisq.test(cont_table_InternetService)

cont_table_MultipleLines = table(dataset[["MultipleLines"]], dataset$Churn)
print(cont_table_MultipleLines)
chi_squared_test_MultipleLines = chisq.test(cont_table_MultipleLines)

cont_table_OnlineBackup = table(dataset[["OnlineBackup"]], dataset$Churn)
print(cont_table_OnlineBackup)
chi_squared_test_OnlineBackup = chisq.test(cont_table_OnlineBackup)

cont_table_DeviceProtection = table(dataset[["DeviceProtection"]], dataset$Churn)
print(cont_table_DeviceProtection)
chi_squared_test_DeviceProtection = chisq.test(cont_table_DeviceProtection)

cont_table_StreamingTV = table(dataset[["StreamingTV"]], dataset$Churn)
print(cont_table_StreamingTV)
chi_squared_test_StreamingTV = chisq.test(cont_table_StreamingTV)

cont_table_StreamingMovies = table(dataset[["StreamingMovies"]], dataset$Churn)
print(cont_table_StreamingMovies)
chi_squared_test_StreamingMovies = chisq.test(cont_table_StreamingMovies)

cont_table_Contract = table(dataset[["Contract"]], dataset$Churn)
print(cont_table_Contract)
chi_squared_test_Contract = chisq.test(cont_table_Contract)

cont_table_PaymentMethod = table(dataset[["PaymentMethod"]], dataset$Churn)
print(cont_table_PaymentMethod)
chi_squared_test_PaymentMethod = chisq.test(cont_table_PaymentMethod)

#Binomila logistic regression test for each numerical independent variables

logistic_model_tenure <- glm(Churn ~ tenure, data=dataset, family="binomial")

logistic_model_MonthlyCharges <- glm(Churn ~ MonthlyCharges, data=dataset, family="binomial")

logistic_model_TotalCharges <- glm(Churn ~ TotalCharges, data=dataset, family="binomial")


######## printing P_values for each test  #########
print(paste("gender", chi_squared_test_gender$p.value))
print(paste("Dependents", chi_squared_test_Dependents$p.value))
print(paste("Partner", chi_squared_test_Partner$p.value))
print(paste("SeniorCitizen", chi_squared_test_SeniorCitizen$p.value))
print(paste("OnlineSecurity", chi_squared_test_OnlineSecurity$p.value))
print(paste("PaperlessBilling", chi_squared_test_PaperlessBilling$p.value))
print(paste("TechSupport", chi_squared_test_TechSupport$p.value))
print(paste("PhoneService", chi_squared_test_PhoneService$p.value))
print(paste("InternetService", chi_squared_test_InternetService$p.value))
print(paste("MultipleLines", chi_squared_test_MultipleLines$p.value))
print(paste("OnlineBackup", chi_squared_test_OnlineBackup$p.value))
print(paste("DeviceProtection", chi_squared_test_DeviceProtection$p.value))
print(paste("StreamingTV", chi_squared_test_StreamingTV$p.value))
print(paste("StreamingMovies", chi_squared_test_StreamingMovies$p.value))
print(paste("Contract", chi_squared_test_Contract$p.value))
print(paste("PaymentMethod", chi_squared_test_PaymentMethod$p.value))

print(paste("tenure", summary(logistic_model_tenure)$coefficients[2,4]))
print(paste("MonthlyCharges", summary(logistic_model_MonthlyCharges)$coefficients[2,4]))
print(paste("TotalCharges", summary(logistic_model_TotalCharges)$coefficients[2,4]))
