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

.DEFAULT_GOAL := all

#Goal for plotting all data rates
plot:
	@./plot

#Goal for calculating all data rates
calculate:
	@./calculate

#Goal for doing both
all: calculate plot