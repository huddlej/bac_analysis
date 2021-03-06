module load anaconda/2.3.0

. rules/genes/config.sh
. rules/liftover/config.sh
. rules/align_with_blasr/config.sh
. rules/segmental_duplications/config.sh
. rules/sequences/config.sh
. rules/tracks/config.sh
. rules/wssd/config.sh

export PATH=$PATH:/net/eichler/vol2/local/bin:/net/eichler/vol2/local/inhousebin
