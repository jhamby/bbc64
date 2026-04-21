# BBC Micro OS for Commodore 64
# Copyright 2026, Jake Hamby

TARGETS = basic3.bin os120.bin

all:	$(TARGETS)

clean:
	rm -f $(TARGETS) basic3_report.txt os120_acme_report.txt

basic3.bin: basic3.asm basic_vars.asm
	acme --cpu 6510 -r basic3_report.txt -o basic3.bin basic3.asm

os120.bin:	os120_acme.asm
	acme --cpu 6510 -r os120_acme_report.txt -o os120.bin os120_acme.asm

.PHONY: all clean
