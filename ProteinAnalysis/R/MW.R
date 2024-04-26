#' Calculate protein sequence molecular weight
#'
#' This function calculates the molecular weight of a given protein sequence.
#'
#' @param protein_sequence A character string representing the protein sequence.
#' @return Molecular weight of the protein sequence in Daltons (Da).
#' @examples
#' protein_sequence <- "MAEGEITTFTALTEKFNLPPGNYKKPKLLYCSNGGHFLRILPDGTVDGTRDRSDQHIQLQLSAESVGEVYIKSTETGQYLAMDTSGLLYGSQTPSEECLFLERLEENHYNTYTSKKHAEKNWFVGLKKNGSCKRGPRTHYGQKAILFLPLPV"
#' calculate_protein_molecular_weight(protein_sequence)
#' @export
setClass("Protein",
         slots = c(sequence = "character"))

calculate_protein_molecular_weight <- function(protein_sequence) {
  # Amino acid molecular weights
  aa_weights <- c(
    A = 71.0788, R = 156.1875, N = 114.1038, D = 115.0886, C = 103.1388,
    Q = 128.1307, E = 129.1155, G = 57.0519, H = 137.1411, I = 113.1594,
    L = 113.1594, K = 128.1741, M = 131.1926, F = 147.1766, P = 97.1167,
    S = 87.0782, T = 101.1051, W = 186.2132, Y = 163.1760, V = 99.1326
  )

  # Create an object of class Protein
  protein <- new("Protein", sequence = protein_sequence)

  # Calculate molecular weight
  mw <- sum(aa_weights[unlist(strsplit(protein@sequence, ""))])

  return(mw)
}

#' @examples
#' protein_sequence <- "MAEGEITTFTALTEKFNLPPGNYKKPKLLYCSNGGHFLRILPDGTVDGTRDRSDQHIQLQLSAESVGEVYIKSTETGQYLAMDTSGLLYGSQTPSEECLFLERLEENHYNTYTSKKHAEKNWFVGLKKNGSCKRGPRTHYGQKAILFLPLPV"
#' calculate_protein_molecular_weight(protein_sequence)

