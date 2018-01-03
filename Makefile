# directory where html files are built
outdir = html
# source RST files
sources := $(wildcard *.rst)
# target html files
targets := $(foreach src, $(sources), $(patsubst %.rst, %.html, $(outdir)/$(src)))

all: $(targets)

$(outdir)/%.html: %.rst
	rst2html $< $@

# for making individual files
# $ make <filename without rst extension>
%: %.rst
	rst2html $< $(outdir)/$@.html
