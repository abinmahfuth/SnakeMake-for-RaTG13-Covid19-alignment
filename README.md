# SnakeMake-for-RaTG13-Covid19-alignment
A comprehensive, easy to deal with SnakeMake workflow for processing a paired sequence of bat's faecal swap collected Yunnan province in China. The input files are raw FASTQ files and a FASTA reference sequence.  The workflow output is a consensused sequence in FASTA format which can then be used in online alignment softwares such as BLAST to be compared to other organisms.

The RaTG13 virus's data was collected from NCBI SRA, accession number: SRR11085797, availabe on https://www.ncbi.nlm.nih.gov/sra/?term=SRR11085797

The RaTG13 reference sequence is avaiable on Genebank, accession number: MN996532.1, available on https://www.ncbi.nlm.nih.gov/nucleotide/MN996532.1?report=genbank&log$=nucltop&blast_rank=1&RID=DPH0927Z016

## Setup 
To run the workflow, it is recommended to install anaconda or miniconda on the commandline on a Unix bases operating system. Then create a virtual environment with the neccessary dependencies, but first, create a new directory anywhere on your system:

```
mkdir RaTG13Align
cd RaTG13Align
```
Now that we have mae a new directory, we can go ahead and create a new conda environment with the dependecies necessary:

```
conda env create --name RaTG13Align --file virus.yaml
```
then activating the environment: 

```
conda activate RaTG13Align
```

Everything is set to run the workflow. The default name for the final output is called consesus.fa, so by typying the following on the commandline we will get the afromentioned output:

```
snakemake consensus.fa
```

This FASTA output can be used in BLAST to be search in the NCBI database to be campered to other organisms:
https://blast.ncbi.nlm.nih.gov/blast/Blast.cgi


The Workflow can be summarised below:

![](images/out.png)
