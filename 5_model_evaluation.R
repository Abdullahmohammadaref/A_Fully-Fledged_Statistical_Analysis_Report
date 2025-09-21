# only install packages once
install.packages("pROC")

# start running from here after installing packages
#loading library
library(pROC)


### Area under the curve
roc_result <- roc(test_dataset$Churn, predicted_probs)
auc(roc_result)

#confusion matrix
confusion_matrix = table(predicted_class, test_dataset$Churn)
print(confusion_matrix)


true_positives = confusion_matrix[2, 2] 
true_negatives  = confusion_matrix[1, 1]
false_positives = confusion_matrix[2, 1]  
false_negatives = confusion_matrix[1, 2] 

### evaluation metrics
precision = true_positives/(true_positives + false_positives)
recall = true_positives/(true_positives + false_negatives)
accuracy = (true_positives + true_negatives) / nrow(test_dataset)

print(precision)
print(recall)
print(accuracy)

######## Testing prediciton
prediction_results <- data.frame(
  predicted_values = predicted_class,
  actual_values = test_dataset$Churn
)

View(prediction_results)