OUT_DIR=../html
# Using GNU Make-specific functions here
FILES=$(patsubst %.org,$(OUT_DIR)/%.html,$(wildcard *.org))
PUBLISH_TARGET=lokala@grid1.sigmatic.fi:jny.web

.PHONY: all clean install-doc

all: install-doc

install-doc: $(OUT_DIR) $(FILES)

$(OUT_DIR):
	mkdir -v -p $(OUT_DIR)

%.html: %.org
	echo $<

$(OUT_DIR)/%.html: %.html
	install -v -m 644 -t $(OUT_DIR) $<
	rm $<

clean:
	rm *.html

publish:
	scp $(OUT_DIR)/* lokala@grid1.sigmatic.fi:jny.web
