# ==============================================================================
# Q1 Pipeline: Sequence Retrieval, Length, Substrings, Motif Highlighting, & RNA Conversion
# ==============================================================================

# 1. Fetch FASTA sequences using NCBI Entrez Direct (edirect) or curl/efetch
# Accession examples: Bundibugyo GP (FJ217161.1), Sudan GP (EU224256.1), Measles GP/H (NC_001498.1)
efetch -db nuccore -id FJ217161.1,EU224256.1,NC_001498.1 -format fasta > sequences.fasta

# --- How long is each gene? ---
# Calculate sequence length by stripping headers and counting characters excluding newlines
awk '/^>/{if (seq) print header "\t" length(seq); header=$0; seq=""; next} {seq=seq$0} END{print header "\t" length(seq)}' sequences.fasta

# --- Retrieve first 19 nt and last 7 nt ---
awk '/^>/{if (seq) {print header; print "First 19: " substr(seq,1,19); print "Last 7: " substr(seq, length(seq)-6, 7); print "---"}; header=$0; seq=""; next} {seq=seq$0} END{if (seq) {print header; print "First 19: " substr(seq,1,19); print "Last 7: " substr(seq, length(seq)-6, 7)}}' sequences.fasta

# --- Highlight patterns in visible color (AACACCACC in Red, GAATTC in Green) ---
# Using GREP_COLORS for ANSI terminal color highlighting
GREP_COLORS='ms=01;31:mc=01;32' grep --color=always -E "AACACCACC|GAATTC|$" sequences.fasta

# --- Replace every Thymine (T) with Uracil (U) ---
# Converts sequence lines from DNA (T) to RNA (U) while preserving headers
awk '/^>/{print $0; next} {gsub(/T/,"U"); print $0}' sequences.fasta > sequences_RNA.fasta