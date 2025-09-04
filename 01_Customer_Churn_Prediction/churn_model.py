# Minimal starter for a churn training script
import argparse, pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, roc_auc_score

def main(train_path, test_path=None, target='churn'):
    df = pd.read_csv(train_path)
    X = df.drop(columns=[target])
    y = df[target].astype(int)
    X_train, X_val, y_train, y_val = train_test_split(X, y, test_size=0.2, random_state=42)
    model = LogisticRegression(max_iter=1000)
    model.fit(X_train, y_train)
    preds = model.predict(X_val)
    proba = model.predict_proba(X_val)[:,1]
    print('Accuracy:', round(accuracy_score(y_val, preds), 4))
    print('ROC AUC:', round(roc_auc_score(y_val, proba), 4))

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--train', required=True)
    ap.add_argument('--test', required=False)
    ap.add_argument('--target', default='churn')
    args = ap.parse_args()
    main(args.train, args.test, args.target)
