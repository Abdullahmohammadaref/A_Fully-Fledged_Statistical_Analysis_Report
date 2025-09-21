# Install package only once
install.packages("car")

# start running from here after installing packages
# loading a required library
library(car)

# binomial logistic regression model with attributes that have passes the hypothesis test
# we use the train_dataset to train the model
logistic_model <- glm(Churn ~ Dependents + 
                              Partner + 
                              SeniorCitizen + 
                              OnlineSecurity + 
                              PaperlessBilling + 
                              TechSupport + 
                              InternetService + 
                              MultipleLines + 
                              OnlineBackup + 
                              DeviceProtection + 
                              StreamingTV + 
                              StreamingMovies + 
                              Contract + 
                              PaymentMethod +
                              tenure, 
                              data=train_dataset, 
                              family="binomial"
                      )
# printing model outputs
summary(logistic_model)

# generating prediction probabilities for a test_dataset
predicted_probs <- predict(logistic_model, newdata=test_dataset, type="response")
# predicting if the churn is 0 or 1 with a prediction probability threshold of 0.1
predicted_class <- ifelse(predicted_probs > 0.1, 1, 0)

# variance inflation factor (VIF) for detecting multicollinearity
varience_inflation_factor = vif(logistic_model)
print(varience_inflation_factor)

