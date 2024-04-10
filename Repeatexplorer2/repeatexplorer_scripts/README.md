seqclust  [-h] [-p] [-A] [-t] [-l LOGFILE] [-m {float range 0.0..100.0}] [-M {0,float range 0.1..1}] [-o {float range 30.0..80.0}] [-c CPU]
                [-s SAMPLE] [-P PREFIX_LENGTH] [-v OUTPUT_DIR] [-r MAX_MEMORY] [-d DATABASE DATABASE] [-C] [-k] [-a {2,3,4,5}]
                [-tax {VIRIDIPLANTAE3.0,VIRIDIPLANTAE2.2,METAZOA2.0,METAZOA3.0}]
                [-opt {ILLUMINA,ILLUMINA_DUST_OFF,ILLUMINA_SENSITIVE_MGBLAST,ILLUMINA_SENSITIVE_BLASTPLUS,OXFORD_NANOPORE}]
                [-D {BLASTX_W2,BLASTX_W3,DIAMOND}]
                sequences

RepeatExplorer:
    Repetitive sequence discovery and clasification from NGS data

  

positional arguments:
  sequences

optional arguments:
  -h, --help            show this help message and exit
  -p, --paired
  -A, --automatic_filtering
  -t, --tarean_mode     analyze only tandem reapeats without additional classification
  -l LOGFILE, --logfile LOGFILE
                        log file, logging goes to stdout if not defines
  -m {float range 0.0..100.0}, --mincl {float range 0.0..100.0}
  -M {0,float range 0.1..1}, --merge_threshold {0,float range 0.1..1}
                        threshold for mate-pair based cluster merging, default 0 - no merging
  -o {float range 30.0..80.0}, --min_lcov {float range 30.0..80.0}
                        minimal overlap coverage - relative to longer sequence length, default 55
  -c CPU, --cpu CPU     number of cpu to use, if 0 use max available
  -s SAMPLE, --sample SAMPLE
                        use only sample of input data[by default max reads is used
  -P PREFIX_LENGTH, --prefix_length PREFIX_LENGTH
                        If you wish to keep part of the sequences name,
                         enter the number of characters which should be 
                        kept (1-10) instead of zero. Use this setting if
                         you are doing comparative analysis
  -v OUTPUT_DIR, --output_dir OUTPUT_DIR
  -r MAX_MEMORY, --max_memory MAX_MEMORY
                        Maximal amount of available RAM in kB if not set
                        clustering tries to use whole available RAM
  -d DATABASE DATABASE, --database DATABASE DATABASE
                        fasta file with database for annotation and name of database
  -C, --cleanup         remove unncessary large files from working directory
  -k, --keep_names      keep sequence names, by default sequences are renamed
  -a {2,3,4,5}, --assembly_min {2,3,4,5}
                        Assembly is performed on individual clusters, by default 
                        clusters with size less then 5 are not assembled. If you 
                        want need assembly of smaller cluster set *assmbly_min* 
                        accordingly
  -tax {VIRIDIPLANTAE3.0,VIRIDIPLANTAE2.2,METAZOA2.0,METAZOA3.0}, --taxon {VIRIDIPLANTAE3.0,VIRIDIPLANTAE2.2,METAZOA2.0,METAZOA3.0}
                        Select taxon and protein database version
  -opt {ILLUMINA,ILLUMINA_DUST_OFF,ILLUMINA_SENSITIVE_MGBLAST,ILLUMINA_SENSITIVE_BLASTPLUS,OXFORD_NANOPORE}, --options {ILLUMINA,ILLUMINA_DUST_OFF,ILLUMINA_SENSITIVE_MGBLAST,ILLUMINA_SENSITIVE_BLASTPLUS,OXFORD_NANOPORE}
                        ILLUMINA : standard option, all-to-all similarity search is
                        performed using mgblast, threshold for hits is 90 percent identity over
                        55 percent of the sequence length, word size is 18
                      
                        ILLUMINA_SENSITIVE_MGBLAST : all-to-all search is performed using mgblast,
                        with  word size 8 and threshold for hits is 80 percent identity over 55 percent of the sequence length
                      
                        ILLUMINA_SENSITIVE_BLASTPLUS : all-to-all search is performed using blastn,
                        with  word size 6 and threshold for hits is 80 percent identity over 55 percent of the sequence length
                      
                        OXFORD_NANOPORE: experimental option, all-to-all search is performed using lastal program
  -D {BLASTX_W2,BLASTX_W3,DIAMOND}, --domain_search {BLASTX_W2,BLASTX_W3,DIAMOND}
                        Detection of protein domains can be performed by either blastx or
                         diamond" program. options are:
                          BLASTX_W2 - blastx with word size 2 (slowest, the most sesitive)
                          BLASTX_W3 - blastx with word size 3 (default)
                          DIAMOND   - diamond program (significantly faster, less sensitive)
                        To use this option diamond program must be installed in your PATH

