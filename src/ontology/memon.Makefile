## Customize Makefile settings for memon
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile



#use MIREOT method to import all subclasses from GO term list
imports/go_import.owl: mirror/go.owl imports/go_terms_combined.txt
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
		extract --branch-from-terms imports/go_terms_combined.txt --force true --copy-ontology-annotations true --individuals include --method MIREOT \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru --update ../sparql/postprocess-module.ru \
		$(ANNOTATE_CONVERT_FILE); fi

