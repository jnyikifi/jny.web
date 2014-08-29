OUT_DIR=../html
# Using GNU Make-specific functions here
FILES=$(patsubst %.org,$(OUT_DIR)/%.html,$(wildcard *.org))

.PHONY: all clean install-doc

all: install-doc

install-doc: $(OUT_DIR) $(FILES)

$(OUT_DIR):
        mkdir -v -p $(OUT_DIR)

%.html: %.org
        emacs $< --batch -f org-export-as-html --kill

$(OUT_DIR)/%.html: %.html
        install -v -m 644 -t $(OUT_DIR) $<
        rm $<

clean:
        rm *.html
