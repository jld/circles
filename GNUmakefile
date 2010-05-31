LARGE=512
SMALL=128
ANTIALIAS=16
PNGDEPTH=8

all: large small
large: sc1.png sc2.png sc3.png sc4.png sc5.png sc6.png sc7.png sc8.png sc9.png
small: ssc1.png ssc2.png ssc3.png ssc4.png ssc5.png ssc6.png ssc7.png ssc8.png ssc9.png	

CONVERT=convert -comment "`cat LICENSE`" -depth $(PNGDEPTH)

%.png: %.pgm
	$(CONVERT) $< $@

%.pgm: %
	time ./$< $(LARGE) $(ANTIALIAS) > $@

sc%: sc%.c
	$(CC) -O3 $< -o $@

%.c: %.c.m4 sqcirc.m4
	m4 $< > $@

clean:
	-rm -f *.png

ssc%.png: sc%.png
	$(CONVERT) -geometry $(SMALL)x$(SMALL) -filter box $< $@
