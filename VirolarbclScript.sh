# SCRIPT PARA DESCARGAR, ALINEAR Y EJECUTAR FILOGENIA DE VIROLA. POR FAVOR REVISAR README.md PARA COMPRENDER PASOS INTERMEDIOS NO ESPECÍFICADOS

/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "rbcl [GENE] AND Virola[ORGN]" | efetch -format fasta > rbcl-Virola.fasta

/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "rbcl [GENE] AND Osteophloeum[ORGN]" | efetch -format fasta > rbcl-Osteophloeum.fasta

/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "rbcl [GENE] AND Compsoneura[ORGN]" | efetch -format fasta > rbcl-Compsoneura.fasta

cat rbcl-Compsoneura.fasta rbcl-Duguetia.fasta rbcl-Osteophloeum.fasta rbcl-Virola.fasta > MatrizMagnoliales.fasta

./muscle3.8.31_i86linux64 -in MatrizMagnoliales.fasta -out MatrizMagnolialesALN.fasta

module load iqtree/2.2.2.6

iqtree -s MatrizMagnolialesALN.fasta -o AY738160.1_Duguetia_guianensis -m HKY+I+G4 -bb 1000 -minsup 0.5
