library(readxl)
mydata <- read_excel("C:\\Users\\USER\\Desktop\\Book4.xlsx")
mydata$logit_AUC <- log(mydata$AUC / (1 - mydata$AUC))
mydata$logit_AUC <- log(mydata$AUC / (1 - mydata$AUC))
mydata$se_logit_AUC <- 1 / sqrt(mydata$Sample_size * mydata$AUC * (1 - mydata$AUC)) 
rdm_data <- subset(mydata, Groups == "RDM")
rdm_data$var_logit_AUC <- rdm_data$se_logit_AUC^2
rdm_model <- rma(yi = logit_AUC, vi = var_logit_AUC, data = rdm_data, method = "REML")
rdm_loo <- leave1out(rdm_model)
rdm_loo_df <- as.data.frame(rdm_loo)
rdm_loo_df$Study <- rdm_data$Study_ID

forest(rdm_model,
        slab = rdm_data$Study_ID,
        main = "Sensitivity for RDM",
        xlab = "AUC (Back-transformed from logit)",
        mlab = "Pooled Estimate",
        transf = transf.ilogit, 
        cex = 0.4,
        lwd = 1,
        pch = 15,
        col = "black",
        refline = transf.ilogit(rdm_model$b[1]),  # back-rdmansformed pooled effect
        efac = 0.3)
