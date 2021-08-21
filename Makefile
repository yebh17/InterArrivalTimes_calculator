#Help text to display make goals
help:
		@echo ""
		@echo "make" - calculates all the IAT\'s and IDT\'s then plots all the graphs and saved in their respective directories.
		@echo ""
		@echo "make calculate" - Only calculates all the IAT\'s, IDT\'s and saved as a files as results_\<day_hour_min\>.csv
		@echo ""
		@echo "make percentile_plot" - Only plots graphs for the percentiles\(0, 25, 50, 75\) of IAT\'s and IDT\'s, the images will be saved as results_\<day_hour_min\>.csv_percentile.png
		@echo ""
		@echo "make accuracy_plot" - Only plots graphs for the "seq no. Vs IAT's" and "seq no. Vs IDT's" the images will be saved as results_\<day_hour_min\>.csv.png
		@echo ""
		@echo "make plot" - makes all the plots in one image.
		@echo ""
		@echo "make clean" - cleans all the unwanted images.
		@echo ""
		@echo "make fresh" - cleans all the files, graph images. Simply gives you a clean repo.
		@echo ""

.PHONY: calculate percentile_plot accuracy_plot plots all
.SILENT: fresh clean

.DEFAULT_GOAL := all

#Goal for plotting IAT's, IDT's percentiles
percentile_plot:
	@./percentile_plot

#Goal for plotting "seq no. Vs IAT's" and "seq no. Vs IDT's"
accuracy_plot:
	@./accuracy_plot

#Goal for calculating all IAT's and IDT's
calculate:
	@./calculate

#Goal for final plots
plots:
	@./plots

#Goal for deleting all temporarily created images
convShaper2_cerberus_temp = $(filter-out ./convShaper2_cerberus/*/exclude_%,$(wildcard ./convShaper2_cerberus/*/*.abc.*))
convShaper2_convSrc3_temp = $(filter-out ./convShaper2_convSrc3/*/exclude_%,$(wildcard ./convShaper2_convSrc3/*/*.abc.*))
convSrc3_cerberus_temp = $(filter-out ./convSrc3_cerberus/*/exclude_%,$(wildcard ./convSrc3_cerberus/*/*.abc.*))
clean:
	for FILE_temp in ${convShaper2_cerberus_temp}; do rm $$FILE_temp ; done 
	for FILE_temp in ${convShaper2_convSrc3_temp}; do rm $$FILE_temp ; done
	for FILE_temp in ${convSrc3_cerberus_temp}; do rm $$FILE_temp ; done

#Goal for getting a fresh environment
convShaper2_cerberus = $(filter-out ./convShaper2_cerberus/*/exclude_%,$(wildcard ./convShaper2_cerberus/*/*.csv*))
convShaper2_convSrc3 = $(filter-out ./convShaper2_convSrc3/*/exclude_%,$(wildcard ./convShaper2_convSrc3/*/*.csv*))
convSrc3_cerberus = $(filter-out ./convSrc3_cerberus/*/exclude_%,$(wildcard ./convSrc3_cerberus/*/*.csv*))
fresh:
	for FILE in ${convShaper2_cerberus}; do rm $$FILE ; done 
	for FILE in ${convShaper2_convSrc3}; do rm $$FILE ; done
	for FILE in ${convSrc3_cerberus}; do rm $$FILE ; done

#Goal for running all goals
all: fresh calculate percentile_plot accuracy_plot plots
