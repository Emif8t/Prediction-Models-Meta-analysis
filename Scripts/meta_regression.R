library(readxl)
library(metafor)

mydata <- read_excel("C:\\Users\\USER\\Desktop\\Data for Regression.xlsx")
mydata$logit_AUC <- log(mydata$AUC / (1 - mydata$AUC))
mydata$se_logit_AUC <- 1 / sqrt(mydata$Sample_size * mydata$AUC * (1 - mydata$AUC))

result <- rma(yi = logit_AUC, sei = se_logit_AUC, data = mydata, method = "REML")

#Eager's_regression
regtest(result, model = "rma", predictor = "sei")
funnel(result)

#trim & fill
taf <- trimfill(result)
print(taf)
funnel(taf, main = "Trim-and-Fill Funnel Plot", xlab = "Effect Size")

colnames(mydata) <- trimws(gsub("[\r\n]", "", colnames(mydata)))
res_mod <- rma(
+     yi = logit_AUC,
+     sei = se_logit_AUC,
+     mods = ~ Treatment + Validation + Study_centers + Feature_selection_technique + Feature_used + Model_evaluation_method + Groups + Model_used,
+     data = mydata,
+     method = "REML"
+ )
