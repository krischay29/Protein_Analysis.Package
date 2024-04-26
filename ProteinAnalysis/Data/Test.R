library(ProteinAnalysis)

# Test the functions

# Calculate molecular weight of protein sequence
protein_sequence <- "MAEGEITTFTALTEKFNLPPGNYKKPKLLYCSNGGHFLRILPDGTVDGTRDRSDQHIQLQLSAESVGEVYIKSTETGQYLAMDTSGLLYGSQTPSEECLFLERLEENHYNTYTSKKHAEKNWFVGLKKNGSCKRGPRTHYGQKAILFLPLPV"
mw <- calculate_protein_molecular_weight(protein_sequence)
cat("Molecular weight of protein sequence:", mw, "Da\n")

# Test the function with a protein sequence
protein_sequence <- "MAEGEITTFTALTEKFNLPPGNYKKPKLLYCSNGGHFLRILPDGTVDGTRDRSDQHIQLQLSAESVGEVYIKSTETGQYLAMDTSGLLYGSQTPSEECLFLERLEENHYNTYTSKKHAEKNWFVGLKKNGSCKRGPRTHYGQKAILFLPLPV"
pI <- calculate_protein_pI(protein_sequence)
cat("Isoelectric point (pI) of protein sequence:", pI, "\n")
