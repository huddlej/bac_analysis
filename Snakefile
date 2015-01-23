subworkflow sequences:
    workdir: "sequences"

subworkflow tandem_repeats:
    workdir: "tandem_repeats"

subworkflow segmental_duplications:
    workdir: "segmental_duplications"

subworkflow genes:
    workdir: "genes"

subworkflow wssd:
    workdir: "wssd"

rule all:
    input: "annotations_per_accession.tab", "duplicated_genes_per_accession.tab"
    params: sge_opts=""

rule combine_reports:
    input: sequences("gaps_for_all_accessions.tab"), wssd("wssd_for_all_accessions.tab"), tandem_repeats("tandem_repeats_for_all_accessions.tab"), genes("genes_for_all_accessions.tab"), segmental_duplications("segmental_duplications_for_all_accessions.tab")
    output: "annotations_per_accession.tab"
    shell: "paste {input} > {output}"

rule duplicated_genes:
    input: genes=genes("mRNA.named.bed"), wssd=wssd("wins/wssdGE10K_nogap.tab")
    output: "duplicated_genes_per_accession.tab"
    shell: "bedtools intersect -a {input.genes} -b {input.wssd} -wa | cut -f 1,4 | sort -k 1,1 -k 2,2 | uniq > {output}"
