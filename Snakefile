subworkflow genes:
    workdir: "genes"

rule create_bigbed_for_mRNA:
    input: genes("mRNA.named.bed"), genes("bacs.chromInfo")
    output: "genes.bb"
    params: sge_opts=""
    shell: "bedToBigBed {input} {output}"""
