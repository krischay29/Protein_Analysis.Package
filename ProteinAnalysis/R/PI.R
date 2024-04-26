#' Calculate protein sequence isoelectric point (pI)
#'
#' This function calculates the isoelectric point (pI) of a given protein sequence.
#'
#' @param protein_sequence A character string representing the protein sequence.
#' @return Isoelectric point (pI) of the protein sequence.
#' @examples
#' protein_sequence <- "MAEGEITTFTALTEKFNLPPGNYKKPKLLYCSNGGHFLRILPDGTVDGTRDRSDQHIQLQLSAESVGEVYIKSTETGQYLAMDTSGLLYGSQTPSEECLFLERLEENHYNTYTSKKHAEKNWFVGLKKNGSCKRGPRTHYGQKAILFLPLPV"
#' calculate_protein_pI(protein_sequence)
#' @export
setClass("Protein",
         slots = c(sequence = "character"))

calculate_protein_pI <- function(protein_sequence) {
  # Amino acid pKa values
  pKa <- c(
    "C" = 8.18, "D" = 3.65, "E" = 4.25, "H" = 6.00,
    "K" = 10.53, "R" = 12.48, "Y" = 10.07, "C-term" = 3.55, "N-term" = 7.50
  )

  # Create an object of class Protein
  protein <- new("Protein", sequence = protein_sequence)

  # Get unique amino acids in the sequence
  unique_aa <- unique(strsplit(protein@sequence, "")[[1]])

  # Filter out non-existent amino acids in the pKa table
  aa_to_consider <- unique_aa[unique_aa %in% names(pKa)]

  # Calculate pI
  pI <- optimize(function(pH) {
    charge <- sum(10^(-pKa[aa_to_consider] / (1 + 10^(-pKa[aa_to_consider] + pH))))
    return(charge)
  }, interval = c(0, 14))$minimum

  return(pI)
}

#' @examples
#' protein_sequence <- "MAEGEITTFTALTEKFNLPPGNYKKPKLLYCSNGGHFLRILPDGTVDGTRDRSDQHIQLQLSAESVGEVYIKSTETGQYLAMDTSGLLYGSQTPSEECLFLERLEENHYNTYTSKKHAEKNWFVGLKKNGSCKRGPRTHYGQKAILFLPLPV"
#' calculate_protein_pI(protein_sequence)

