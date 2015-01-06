subworkflow tandem_repeats:
    workdir: "tandem_repeats"

subworkflow segmental_duplications:
    workdir: "segmental_duplications"

subworkflow genes:
    workdir: "genes"

rule all:
    input: "tandem_repeats.bed", "segmental_duplications_in_bacs.bed" #, "genes.bb"

rule genes:
    input: genes("mRNA.named.bed"), genes("bacs.chromInfo")
    output: "genes.bb"
    params: sge_opts=""
    shell: "bedToBigBed {input} {output}"""

rule segmental_duplications:
    input: segmental_duplications("segmental_duplications_in_bacs.bed")
    output: "segmental_duplications_in_bacs.bed"
    params: sge_opts=""
    shell: "ln -s {input} {output}"

rule tandem_repeats:
    input: tandem_repeats("tandem_repeats.bed")
    output: "tandem_repeats.bed"
    shell: "ln -s {input} {output}"
