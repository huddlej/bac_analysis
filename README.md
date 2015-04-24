# BAC analysis pipeline(s)

## Usage

Check out the code into your working directory.

```bash
git clone git@github.com:huddlej/bac_analysis.git .
```

Create a list of clone ids to analyze. If the clones are already present in GenBank with an accession (e.g., AC202642.3), create a list of accessions with one per line in a single text file and move on to modifying `config.json` below.

If the clones are not in GenBank and are only available locally, create a list of the original clone ids (e.g., CH259-157F4) with one id per line. Additionally, create a separate tab-delimited file with the clone id in the first column and the absolute path to the clone FASTA sequence in the second column.

Copy `config.template.json` to `config.json` and modify the settings in `config.json` for your organism and clones. If you have local clones, add a configuration setting called `clone_paths` with the absolute path to the tab-delimited list of clone paths.

```json
{
    "clone_paths": "/path/to/clone_paths.tab",
    "clone_ids": "/path/to/clone_ids.txt",
}
```

Setup the environment for the pipeline.

```bash
. config.sh
```

Run the pipeline.

```bash
snakemake
```

Alternately, the pipeline can be run on a grid engine cluster (e.g., UGE) with as many processes as you like as specified by the `-j` flag. The following example runs at most 10 simultaneous jobs on an SGE cluster.

```bash
snakemake --cluster "qsub {params.sge_opts}" -j 10 -w 30
```
