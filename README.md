# Prediction-Models-Meta-analysis

# 📊 Systematic Review & Meta-Analysis: Prediction Models in Prostate Cancer

This repository contains the materials, data, and code for our **systematic review and meta-analysis** on prediction models used in prostate cancer.  
The project follows **PRISMA guidelines** and evaluates methodological quality, discrimination, calibration, and clinical utility of published models.  


## Project Structure
```
│
├── data/                     # Datasets used (if allowed, else just metadata)
│   ├── extracted_data.csv     
│   └── .gitkeep
│
├── scripts/                  # Code used for analysis
│   ├── meta_analysis.R        # R code 
│   └── forest_plot.R          
│
├── results/                  
│   ├── forest_plot.png
│   ├── funnel_plot.png
│   └── PRISMA_flowchart.png
│
├── docs/                     
│   ├── PRISMA_checklist.pdf
│   ├── search_strategy.txt
│   └── inclusion_exclusion.md
│
├── LICENSE                   # This project is licensed under the MIT License
├── .gitignore                
└── README.md                 
```
---

## 📑 Methods

- **Databases searched:** PubMed, Scopus (up to 2024)  
- **Inclusion criteria:** Prediction models for prostate cancer diagnosis/prognosis  
- **Quality assessment:** PROBAST framework  
- **Meta-analysis method:** Random-effects (DerSimonian-Laird)  
- **Statistical software:** R (`metafor`)

---

## 📊 Results

- Number of studies included: **144**  
- Pooled AUC: **0.XX (95% CI: 0.XX–0.XX)**  
- Heterogeneity: **I² = XX%**  
- Funnel plot showed **no/possible publication bias**  

Example output:  
![Forest Plot](results/forest_plot.png)

---

## 📜 Citation

If you use this repository, please cite:  

**[Emmanuel N. Israel], et al.** *Systematic Review and Meta-Analysis of Prediction Models in Prostate Cancer.* (2025)  

---

## 🔗 Related Project

This review provides the research foundation for our  
[Machine Learning Model for Prostate Cancer Prediction](https://github.com/Emif8t/Prostate-Cancer-ML-Model).
