include: "rules/sequences/Snakefile"
include: "rules/tandem_repeats/Snakefile"
include: "rules/segmental_duplications/Snakefile"
include: "rules/genes/Snakefile"
include: "rules/wssd/Snakefile"

rule all:
    input: "annotations_per_accession.tab", "duplicated_genes_per_accession.tab"
    params: sge_opts=""

rule combine_reports:
    input: "clone_ids_summary.txt", "gaps_for_all_accessions.tab", "tandem_repeats_for_all_accessions.tab", "segmental_duplications_for_all_accessions.tab", "genes_for_all_accessions.tab", "wssd_for_all_accessions.tab"
    output: "annotations_per_accession.tab"
    params: sge_opts=""
    shell: "paste {input} > {output}"

rule build_clone_ids_column:
    input: config["clone_ids"]
    output: "clone_ids_summary.txt"
    params: sge_opts=""
    shell: """awk '{{ if (NR == 1) {{ print "clone_id" }} print }}' {input} > {output}"""

rule clean:
    params: sge_opts=""
    shell: "rm -rf all_masked annotations_per_accession.tab bac* clones.* dotplot duplicated* error* fasta_index gaps* genes* gmap* liftover* mask mega64_out merged* mRNA* norptgap.tab post_mega rawFA ref* rmsk* segmental_duplications* tandem_repeats* wins wmsk* wssd*"
