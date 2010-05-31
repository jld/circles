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

ssc%.png: sc%.png
	convert -geometry 128x128 -depth 8 -filter box $< $@

small: ssc1.png ssc2.png ssc3.png ssc4.png ssc5.png ssc6.png ssc7.png ssc8.png ssc9.png	

both: all small
