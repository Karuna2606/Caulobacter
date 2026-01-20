import pandas as pd

tr_df = pd.read_excel("AverageTranslationRates_6Stages.xlsx")
te_df = pd.read_excel("pnas.1614795113.sd01.xlsx", skiprows=2, header=None)

# Set column names
columns_te = [
    "Num", "Tag", "Name", "Product", "OpID", "RS_5", "RS_30", "RS_60", "RS_90", "RS_120",
    "TE_5", "TE_30", "TE_60", "TE_90", "TE_120", "Avg_TE", "SD_TE", "Max_TE", "Min_TE",
    "Max/Min", "Cluster", "RNAseq", "TE", "Fig6", "0&30", "60&90", "Cut_level", "Cut_level.1",
    "Avg_RP", "MaxMin_Dup"
]
te_df = te_df.iloc[:, :len(columns_te)]
te_df.columns = columns_te

tr_df["GeneID"] = tr_df["GeneID"].astype(str).str.strip().str.upper()
te_df["GeneID"] = te_df["Tag"].astype(str).str.strip().str.upper()

merged_df = pd.merge(tr_df, te_df, on="GeneID", how="left")
print("Matched rows:", merged_df["Tag"].notna().sum(), "out of", len(merged_df))
