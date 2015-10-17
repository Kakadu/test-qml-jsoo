OCAMLC=ocamlfind c -g -package js_of_ocaml.ppx
JSOO_OPTS=--no-inline --pretty #--source-map-inline --sourcemap #--debug=SECTION

all: jscode.js

jscode.byte: main.cmo
	$(OCAMLC) -linkpkg $< -o $@

jscode.js: jscode0.js
	echo -e ".pragma library\n\n" > $@
	#echo -e "" > $@
	cat $< >> $@

jscode0.js: jscode.byte
	js_of_ocaml $(JSOO_OPTS) $< -o $@

main.cmo: main.ml
	$(OCAMLC) -c $<

clean:
	$(RM) jscode.byte *.cm[ioxa] *.cmxa *.js

run:
	qmlscene Root.qml
