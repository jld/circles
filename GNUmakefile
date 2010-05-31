all: sc1.png sc2.png sc3.png sc4.png sc5.png sc6.png sc7.png sc8.png sc9.png

%.png: %.pgm
	convert -depth 8 $< $@

%.pgm: %
	time ./$< 512 16 > $@

sc%: sc%.c
	$(CC) -O3 $< -o $@

%.c: %.c.m4
	m4 $< > $@

clean:
	-rm -f *.png
