import pandas as pd

# Reload all files after code execution state reset
gene_df = pd.read_excel("/mnt/data/First10Codons.xlsx")
gene_df["First10Codons"] = gene_df["First10Codons"].str.strip().str.upper()

# File paths for each stage
stage_files = {
    "Stage1": "/mnt/data/codons_and_average_time_rp75.csv",
    "Stage2": "/mnt/data/codons_and_average_time_rp76.csv",
    "Stage3": "/mnt/data/codons_and_average_time_rp77.csv",
    "Stage4": "/mnt/data/codons_and_average_time_rp78.csv",
    "Stage5": "/mnt/data/codons_and_average_time_rp79.csv",
    "Stage6": "/mnt/data/codons_and_average_time_rp80.csv",
}

# Function to calculate average translation time
def calc_avg_translation_time(seq, codon_time_dict):
    codons = [seq[i:i+3] for i in range(0, len(seq), 3)]
    times = [codon_time_dict.get(codon) for codon in codons if codon in codon_time_dict]
    return sum(times) / len(times) if times else None

# Process each stage
for stage, file_path in stage_files.items():
    codon_df = pd.read_csv(file_path)
    codon_df.columns = codon_df.columns.str.strip()
    codon_df.rename(columns={"Codons": "codon", "Average translation value": "average_time"}, inplace=True)
    codon_df["codon"] = codon_df["codon"].str.strip().str.upper()
    codon_time_dict = dict(zip(codon_df["codon"], codon_df["average_time"]))
    gene_df[stage] = gene_df["First10Codons"].apply(lambda seq: calc_avg_translation_time(seq, codon_time_dict))

# Save the final dataframe to Excel
output_path = "/mnt/data/AverageTranslationRates_6Stages.xlsx"
gene_df.to_excel(output_path, index=False)

output_path
