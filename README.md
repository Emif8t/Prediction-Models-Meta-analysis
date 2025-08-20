# 📊Prediction-Models-Meta-analysis

This repository contains the materials, data, and code for our **systematic review and meta-analysis** on prediction models used in prostate cancer.  
The project follows **PRISMA guidelines** and evaluates methodological quality, the pooled predictive performances of these models using area under the curve (AUC) metrics across different prediction endpoints: overall survival (OS), progression-free survival (PFS), toxicity or quality of life (TQL), recurrence distance metastasis (RDM), and treatment response (TR).  


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

- **Databases searched:** PubMed & Scopus (up to 2024)
- **Protocol registration:** PROSPERO (CRD42025611480)
- **Inclusion criteria:** Prediction models for prostate cancer diagnosis/prognosis  
- **Quality assessment:** PROBAST framework and PMQS   
- **Meta-analysis method:** Random-effects (DerSimonian-Laird)  
- **Statistical software:** R (`metafor`)

---

## 📊 Results

- Number of studies included: **144**  
- Pooled AUC: **0.808, 0.792, 0.845, 0.835, and 0.805 for OS, PFS, RDM, TR, and TQL, respectively**  
- Funnel plot showed **showed no significant asymmetry**  

Example output:  
![Forest Plot](results/forest_plot.png)

---

## 📜 Citation

If you use this repository, please cite:  

**[Emmanuel N. Israel], et al.** *Systematic Review and Meta-Analysis of Prediction Models in Prostate Cancer.* (2025)  

---

👥 Contributors
Emmanuel N. Israel – Project Lead / Data Scientist
Prof. Israel S. Afolabi - Supervisor
Oluwakemi A. Rotimi - Co-supervisor
Kaze N. Niels - Co-author 
Omobolanle O. Makanjuola¶ - Co-authour


## 🔗 Related Project

This review provides the research foundation for our  
[Machine Learning Model for Prostate Cancer Prediction](https://github.com/Emif8t/Prostate-Cancer-ML-Model).
