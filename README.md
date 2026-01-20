# Caulobacter
Analysis of differential translation control in Caulobacter crescentus across six cell cycle stages. Includes RNA-seq/Ribo-seq processing, A-site assignment (fixed offset &amp; Scikit-ribo), codon dwell time calculation, tAI estimation, TE computation, and functional category analysis.<br>
# Objective
The primary aim of this study was to explore the mechanisms of translational regulation in Caulobacter crescentus across its cell cycle. Specifically, the objectives were:<br>
1.	To investigate the dynamics of translational control across six distinct cell cycle stages<br>
– By integrating RNA-seq and Ribo-seq data to quantify gene-specific translational efficiency (TE), and determine how translation output varies independent of transcript levels.<br>
2.	To identify and evaluate molecular factors that influence translation efficiency, and analyse their stage-wise patterns
– Including codon-specific translation time (dwell time), tRNA Adaptation Index (tAI), and mRNA secondary structure (predicted via minimum free energy, MFE), and to correlate these features with TE at each stage.<br>
3.	To assess functional category-specific regulation of translation<br>
– By grouping genes based on biological roles (e.g., motility, membrane proteins, cell wall synthesis) and analysing how TE and its influencing factors vary across these categories, highlighting selective translation of genes according to cellular needs.<br>

# Workflow
This study explored how gene translation is regulated during the six cell cycle stages of Caulobacter crescentus. We started by processing RNA-seq and Ribo-seq data to measure mRNA levels and ribosome activity. Ribosome A-site positions—where the ribosome reads the mRNA—were identified using both a simple fixed-offset approach and a machine learning tool called Scikit-ribo. These positions helped calculate how long ribosomes spend on each codon, giving codon-specific translation times.
Next, we used tRNA expression data to calculate the tRNA Adaptation Index (tAI), which shows how well codons match the available tRNAs. We also predicted RNA secondary structures near the start of genes using RNAfold, since folding can affect how efficiently translation begins. Translational Efficiency (TE) for each gene was then calculated by comparing Ribo-seq and RNA-seq values. Finally, we examined how TE is influenced by tAI, codon translation speed, and RNA folding patterns through correlation analysis.<br>
# Summary
•	RNA-seq & Ribo-seq: Processed to measure gene expression and translation activity.<br>
•	Ribosome A-site: Identified using fixed offset and Scikit-ribo.<br>
•	Codon Translation Time: Calculated from ribosome occupancy data.<br>
•	tAI Calculation: Based on tRNA expression and codon–tRNA matching.<br>
•	RNA Folding: Predicted minimum free energy (MFE) using RNAfold.<br>
•	TE Estimation: TE = Ribo-seq TPM / RNA-seq TPM.<br>
•	Correlation Analysis: Linked TE with tAI, codon speed, and RNA structure.<br>

