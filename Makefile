#Help text to display make goals
help:
		@echo ""
		@echo "make" - calculates and plots the data rates
		@echo ""
		@echo "make calculate" - calculates the data rates
		@echo ""
		@echo "make plot" - Plots garphs for the data rates
		@echo ""

.PHONY: calculate plot all
.SILENT:clean

.DEFAULT_GOAL := all

#Goal for plotting all data rates
plot:
	@./plot

#Goal for calculating all data rates
calculate:
	@./calculate

#Goal for cleaning
convShaper2_cerberus = $(filter-out ./convShaper2_cerberus/*/exclude_%,$(wildcard ./convShaper2_cerberus/*/*.csv*))
convShaper2_convSrc3 = $(filter-out ./convShaper2_convSrc3/*/exclude_%,$(wildcard ./convShaper2_convSrc3/*/*.csv*))
convSrc3_cerberus = $(filter-out ./convSrc3_cerberus/*/exclude_%,$(wildcard ./convSrc3_cerberus/*/*.csv*))
clean:
	for FILE in ${convShaper2_cerberus}; do rm $$FILE ; done 
	for FILE in ${convShaper2_convSrc3}; do rm $$FILE ; done
	for FILE in ${convSrc3_cerberus}; do rm $$FILE ; done

#Goal for doing both
all: clean calculate plot