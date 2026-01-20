import pandas as pd

# Load codon timing file
codon_df = pd.read_csv("codons_and_average_time_rp75.csv")
codon_df.rename(columns={
    "Codons": "codon",
    "Average translation value": "average_time"
}, inplace=True)
codon_df["codon"] = codon_df["codon"].str.strip().str.upper()

# Create a dictionary of codon → time
codon_time_dict = dict(zip(codon_df["codon"], codon_df["average_time"]))

# Function to calculate average time for codon sequence
def calc_avg_translation_time(seq):
    codons = [seq[i:i+3].upper() for i in range(0, len(seq), 3)]
    times = [codon_time_dict.get(c) for c in codons if c in codon_time_dict]
    return sum(times) / len(times) if times else None

# List of stage files and output sheet names
stage_files = {
    "Stage1": "codons_and_average_time_rp75.csv",
    "Stage2": "codons_and_average_time_rp76.csv",
    "Stage3": "codons_and_average_time_rp77.csv",
    "Stage4": "codons_and_average_time_rp78.csv",
    "Stage5": "codons_and_average_time_rp79.csv",
    "Stage6": "codons_and_average_time_rp80.csv",
}

# Create an Excel writer
with pd.ExcelWriter("CodonRates_6Stages.xlsx", engine="openpyxl") as writer:
    for sheet_name, filename in stage_files.items():
        # Read stage file
        df = pd.read_excel(filename)
        # Calculate avg translation time
        df["AverageTranslationTime"] = df["First10Codons"].apply(calc_avg_translation_time)
        # Write to separate sheet
        df.to_excel(writer, sheet_name=sheet_name, index=False)

print("✅ CodonRates_6Stages.xlsx created successfully.")
