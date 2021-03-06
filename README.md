# SnakeMake-for-RaTG13-Covid19-alignment
A comprehensive, easy to deal with SnakeMake workflow for processing a paired sequence of bat's faecal swap collected from Yunnan province in China. The input files are raw FASTQ files and a FASTA reference sequence.  The workflow output is a consensused sequence in FASTA format which can then be used in online alignment softwares such as BLAST to be compared to other organisms.

The RaTG13 virus's data was collected from NCBI SRA, accession number: SRR11085797, availabe on https://www.ncbi.nlm.nih.gov/sra/?term=SRR11085797

The RaTG13 reference sequence is avaiable on Genebank, accession number: MN996532.1, available on https://www.ncbi.nlm.nih.gov/nucleotide/MN996532.1?report=genbank&log$=nucltop&blast_rank=1&RID=DPH0927Z016

## Setup 
To run the workflow, it is essential to have anaconda or miniconda installed on the commandline on a Unix bases machine. Then create a virtual environment with the neccessary dependencies, but first, create a new directory anywhere on your system:

```
mkdir RaTG13Align
cd ./RaTG13Align
```
Now that we have made a new directory, dowanload the content of this repository there, then go ahead and create a new conda environment with the dependecies necessary using the .yaml file included:

```
conda env create --name RaTG13Align --file virus.yaml
```
then activating the environment: 

```
conda activate RaTG13Align
```

One thing remains is to download the FASTQ files, the download links are written in the Data_Extract.sh file included. First, make sure to change the mode of the file to executable:

```
chmod +x Data_Extract.sh
```
Then simply run it:

```
./Data_Extract.sh
```

Everything is set to run the workflow. The default name for the final output is called consesus.fa, so by typying the following on the commandline we will get the aforementioned output:

```
snakemake consensus.fa
```

This FASTA output is BLASTable, i.e. can be aligned in the NCBI database to be campered to other organisms:
https://blast.ncbi.nlm.nih.gov/blast/Blast.cgi


The Workflow can be summarised below:

![](out.png)
