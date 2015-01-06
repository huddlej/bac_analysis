subworkflow sequences:
    workdir: "sequences"

rule prepare_sequences:
    input: sequences("all_masked.fasta")
    output: "bacs.fasta"
    params: sge_opts=""
    shell: "cat {input} > {output}"""
