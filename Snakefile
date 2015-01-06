subworkflow segmental_duplications:
    workdir: "segmental_duplications"

subworkflow genes:
    workdir: "genes"

rule all:
    input: "segmental_duplications_in_bacs.bed", "genes.bb"

rule create_bigbed_for_mRNA:
    input: genes("mRNA.named.bed"), genes("bacs.chromInfo")
    output: "genes.bb"
    params: sge_opts=""
    shell: "bedToBigBed {input} {output}"""

rule liftover_segmental_duplications:
    input: segmental_duplications("segmental_duplications_in_bacs.bed")
    output: "segmental_duplications_in_bacs.bed"
    params: sge_opts=""
    shell: "ln -s {input} {output}"
