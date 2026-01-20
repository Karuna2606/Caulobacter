import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_excel("TE_Merged_With_TR_Groupings.xlsx")

# Calculate average TR
df["Avg_TR_Stages"] = df[["Stage1", "Stage2", "Stage3", "Stage4", "Stage5", "Stage6"]].mean(axis=1, skipna=True)
df_valid = df.dropna(subset=["Avg_TR_Stages"])

# Define TR bins
bins = [0, 0.25, 0.5, 0.75, 1.0, 1.5, 2.0, max(2.01, df_valid["Avg_TR_Stages"].max() + 0.01)]
labels = ["0–0.25", "0.25–0.5", "0.5–0.75", "0.75–1.0", "1.0–1.5", "1.5–2.0", ">2.0"]
df_valid["TR_Bin"] = pd.cut(df_valid["Avg_TR_Stages"], bins=bins, labels=labels, right=False)

# Select TE columns
te_cols = ["TE_5_y", "TE_30_y", "TE_60_y", "TE_90_y", "TE_120_y", "TE_150"]

# Melt to long format
df_long = df_valid[["TR_Bin"] + te_cols].melt(id_vars="TR_Bin", var_name="TE_Stage", value_name="TE_Value")
df_long["TE_Stage"] = df_long["TE_Stage"].str.replace("_y", "")

# Group and summarize
df_summary = df_long.groupby(["TR_Bin", "TE_Stage"])["TE_Value"].sum().reset_index()

# Plot
plt.figure(figsize=(12, 6))
sns.barplot(data=df_summary, x="TR_Bin", y="TE_Value", hue="TE_Stage")

plt.title("Stacked Barplot of Translational Efficiency by Avg TR Group")
plt.xlabel("Average Translational Rate (Stage 1–6)")
plt.ylabel("Total Translational Efficiency")
plt.legend(title="TE Stage", bbox_to_anchor=(1.05, 1), loc='upper left')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
