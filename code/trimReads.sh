#!/bin/bash
FILES1=/projectFolder/rawReads/*R1*.fastq
for f in $FILES1
do
	f2=${f//R1/R2} 
	f_trimmed=${f//.fastq/_trimmed.fastq}
	f_trimmed=${f_trimmed//rawReads/trimmedReads}
	f2_trimmed=${f2//.fastq/_trimmed.fastq}
	f2_trimmed=${f2_trimmed//rawReads/trimmedReads}
	cutadapt -q 20 -m 20 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -o $f_trimmed -p $f2_trimmed $f $f2
done

