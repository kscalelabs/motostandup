scads := $(patsubst %.py,out/%.stl,$(wildcard *.scad))
pys := $(patsubst %.py,out/%.stl,$(wildcard *.py))

ALL: $(pys) $(scads)

out/%.scad : %.py
	python3 $< > $@

out/%.scad: %.2dpy
	python3 $< > $@

out/%.stl : %.scad
	openscad -o $@ $<

out/%.stl : out/%.scad
	openscad -o $@ $<

%.dxf: %.scad
	openscad -o $@ $<

out/%.pdf: %.scad
	openscad -o $@ $<

clean: 
	rm -f $(pys) $(scads) $(py2ds)
