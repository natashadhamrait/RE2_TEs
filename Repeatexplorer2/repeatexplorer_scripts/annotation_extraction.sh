
#####scrupt to extract custom annotations from all clusters (across directories) and sort by rel abundance. Used to  analyse if RE2 is annotating well using the custom TE library from EDTA


find -type d -exec sh -c 'cd "{}" && cut -f 2 custom_db_NAM_EDTA_annotation.csv | tail +2 | sort -n | uniq -c | cut -f 1' \; | cat > collected_NAM_annotations.txt

sort -n | uniq -c | cut -f 1 collected_NAM_annotations.txt | cat > EDTA_relabundance.txt
