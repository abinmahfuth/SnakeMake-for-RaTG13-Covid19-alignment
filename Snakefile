rule ref_index:
    input:
        "RaTG13_ref.fasta"
    output:
        "RaTG13_ref.fasta.ann"
    shell:
        "bwa index {input}"
rule trimming:
    input:
        "RaTG13_R1.fastq.gz",
        "RaTG13_R2.fastq.gz"
    output:
        "Trim_RaTG13_R1_paired.fastq.gz",
        "Trim_RaTG13_R1_unpaired.fastq.gz",
        "Trim_RaTG13_R2_paired.fastq.gz",
        "Trim_RaTG13_R2_unpaired.fastq.gz"
    shell:
        "trimmomatic PE {input} {output} ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:36 SLIDINGWINDOW:4:20"

rule bwa_map:
    input:
        ind="RaTG13_ref.fasta.ann",
        R1="Trim_RaTG13_R1_paired.fastq.gz",
        R2="Trim_RaTG13_R2_paired.fastq.gz",
        ref="RaTG13_ref.fasta"
    output:
        "mapped_RaTG13.bam"
    shell:
        "bwa mem {input.ref} {input.R1} {input.R2} | samtools view -Sb - > {output}"

rule samtools_sort:
    input:
        "mapped_RaTG13.bam"
    output:
        "sorted_RaTG13.bam"
    shell:
        "samtools sort -O bam {input} > {output}"

rule samtools_index:
    input:
        "sorted_RaTG13.bam"
    output:
        "sorted_RaTG13.bam.bai"
    shell:
        "samtools index {input}"

rule bcftools_call:
    input:
        fa="RaTG13_ref.fasta",
        bam="sorted_RaTG13.bam",
        bai="sorted_RaTG13.bam.bai"
    output:
        "calls.vcf.gz"
    shell:
        "bcftools mpileup -Ou -f {input.fa} {input.bam} | "
        "bcftools call -Oz -mv > {output}"

rule vcf_index:
    input:
        "calls.vcf.gz"
    output:
        "calls.vcf.gz.csi"
    shell:
        "bcftools index {input}"

rule consensus:
    input:
        fa="RaTG13_ref.fasta",
        cal="calls.vcf.gz",
        ind="calls.vcf.gz.csi"
    output:
        "consensus.fa"
    shell:
        "cat {input.fa} | bcftools consensus {input.cal} > {output}"