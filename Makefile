#Help text to display make goals
help:
		@echo ""
	    @echo "make convert" - Converts all epoch times to microseconds
		@echo ""
	    @echo "make calculate" - Calculates all data rates
		@echo ""
		@echo "make" - Converts and calculates the data rates

.PHONY: convert calculate all

.DEFAULT_GOAL := all

#Goal for converting all epoch times to microseconds
convert:
	@./1_run

#Goal for calculating all data rates
calculate:
	@./2_run

#Goal for doing both
all: convert calculate