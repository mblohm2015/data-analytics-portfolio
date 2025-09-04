# 01 — Customer Churn Prediction (Python + Tableau)

**Goal:** Predict which customers are likely to churn and explain drivers behind churn.

**Tech:** Python (pandas, scikit-learn, matplotlib), Tableau

## Steps
1. Data cleaning & feature engineering
2. Train/test split and model training (Logistic Regression or XGBoost)
3. Evaluation (accuracy, ROC AUC, confusion matrix)
4. Tableau dashboard for stakeholder insights

## Files
- `notebook.ipynb` — main analysis (add later)
- `churn_model.py` — training script (starter below)
- `data/` — place raw/cleaned CSVs here
- `README.md` — this file

## Quick Start
```bash
python churn_model.py --train data/churn_train.csv --test data/churn_test.csv
```
