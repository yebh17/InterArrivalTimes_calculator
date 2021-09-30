#Help text to display make goals
help:
		@echo ""
		@echo "make" - calculates all the IAT\'s and IDT\'s then plots all the graphs and saved in their respective directories.
		@echo ""
		@echo "make calculate" - Only calculates all the IAT\'s, IDT\'s and saved as a files as results_\<day_hour_min\>.csv
		@echo ""
		@echo "make ipd_plots" - Only plots graphs for the percentiles\(0, 25, 50, 75\) of IAT\'s and IDT\'s, the images will be saved as results_\<day_hour_min\>.csv_percentile.png
		@echo ""
		@echo "make cdf_plots" - Only plots graphs for the "seq no. Vs IAT's" and "seq no. Vs IDT's" the images will be saved as results_\<day_hour_min\>.csv.png
		@echo ""
		@echo "make sub_plots" - makes all the plots in one image.
		@echo ""
		@echo "make clean" - cleans all the unwanted images.
		@echo ""
		@echo "make fresh" - cleans all the files, graph images. Simply gives you a clean repo.
		@echo ""

.PHONY: calculate cdf_plots ipd_plots sub_plots ipd_plots_semilog all
.SILENT: fresh clean

.DEFAULT_GOAL := all

#Goal for plotting IAT's, IDT's percentiles
cdf_plots:
	@./cdf_plots

#Goal for plotting "seq no. Vs IAT's" and "seq no. Vs IDT's"
ipd_plots:
	@./ipd_plots

#Goal for calculating all IAT's and IDT's
calculate:
	@./calculate

#Goal for final plots
sub_plots:
	@./sub_plots

#Goal for plotting "seq no. Vs IAT's" and "seq no. Vs IDT's" with semilog type
ipd_plots_semilog:
	@./ipd_plots_semilog

#Goal for deleting all temporarily created images
convShaper2_cerberus_temp = $(filter-out ./convShaper2_cerberus/*/exclude_%,$(wildcard ./convShaper2_cerberus/*/*.plot.*))
convShaper2_convSrc3_temp = $(filter-out ./convShaper2_convSrc3/*/exclude_%,$(wildcard ./convShaper2_convSrc3/*/*.plot.*))
convSrc3_cerberus_temp = $(filter-out ./convSrc3_cerberus/*/exclude_%,$(wildcard ./convSrc3_cerberus/*/*.plot.*))
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
all: fresh calculate cdf_plots ipd_plots sub_plots
