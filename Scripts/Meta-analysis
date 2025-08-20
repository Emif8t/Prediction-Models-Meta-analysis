library(readxl)
library(metafor)
library(dplyr)

mydata <- read_excel("G:\\My Drive\\Academics\\Prostate cancer prediction model\\Current Book4.xlsx")

# Define logit transform and inverse logit
logit <- function(p) log(p / (1 - p))
inv_logit <- function(x) exp(x) / (1 + exp(x))

# Function to run meta-analysis for one group
run_meta_for_group <- function(dat_sub) {
  # Transform AUC and CI to logit scale
  mi <- logit(dat_sub$AUC)
  sei <- (logit(dat_sub$Upper_CI) - logit(dat_sub$Lower_CI)) / (2 * 1.96)

  # Run random-effects meta-analysis
  res <- rma(yi = mi, sei = sei, method = "REML")

  # Predictions
  pred <- predict(res, digits = 3)

  # Back-transform results
  pooled_auc <- inv_logit(pred$pred)
  ci.lb <- inv_logit(pred$ci.lb)
  ci.ub <- inv_logit(pred$ci.ub)

  # Prediction interval (pi=TRUE must be passed explicitly)
  pred_pi <- predict(res, pi=TRUE)
  pi.lb <- inv_logit(pred_pi$pi.lb)
  pi.ub <- inv_logit(pred_pi$pi.ub)

  # Extract heterogeneity stats
  i2 <- round(res$I2, 1)
  tau2 <- round(res$tau2, 4)
  q_pval <- signif(res$QEp, 3)

  return(data.frame(
    k = res$k,
    Pooled_AUC = round(pooled_auc, 3),
    CI_Lower = round(ci.lb, 3),
    CI_Upper = round(ci.ub, 3),
    PI_Lower = round(pi.lb, 3),
    PI_Upper = round(pi.ub, 3),
    I2 = i2,
    Tau2 = tau2,
    Q_pval = q_pval
  ))
}

# Apply to each group
group_list <- unique(mydata$Groups)
final_results <- do.call(rbind, lapply(group_list, function(grp) {
  dat_sub <- subset(mydata, Groups == grp)
  res <- run_meta_for_group(dat_sub)
  res$Group <- grp
  return(res)
}))

# Reorder columns
final_results <- final_results[, c("Group", "k", "Pooled_AUC", "CI_Lower", "CI_Upper", 
                                   "PI_Lower", "PI_Upper", "I2", "Tau2", "Q_pval")]

print(final_results)

