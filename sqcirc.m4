changequote({{,}})
define(do_test, if (d > $1))
define(do_body, 
{{ifelse($1,B, { a+=i^1; break; },
 {{ifelse($1,W, { a+=i; break; },
  {{ifelse($1,I, { i^=1; },
   {{ifelse($1,T, { },
      {{errprint(Action letter "$1" not in BWIT)}}dnl
      { abort(); })}})}})}})}})
define(do_stuff,
{{ifelse($2,, {{do_body($1)}},
   {{do_test($2) do_body($1)
            else do_stuff(shift(shift($@)))}})}})
define(sqcirc,
{{#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <math.h>
#include <time.h>

int main(int argc, char** argv)
{
  int x1, y1, x2, y2, l1, l2, ri;
  static double rnd[512];

  assert(l1=atoi(argv[1])); 
  assert(l2=atoi(argv[2]));
  srand48(time(0));
  for(ri=0; ri<512; ++ri)
    rnd[ri] = drand48();

  printf("P2\n%d %d %d\n",l1,l1,l2*l2);

  for(y1=0; y1<l1; ++y1) {
    for(x1=0; x1<l1; ++x1) {
      int a=0;
      for(y2=0; y2<l2; ++y2) {
	double yc=(y1+(y2+rnd[ri++%512])/l2)/l1;
	for(x2=0; x2<l2; ++x2) {
	  double x=(x1+(x2+rnd[ri++%512])/l2)/l1, y=yc; int i=1;
	  while(1) {
	    double d;
	    x=2*x-1; y=2*y-1;
	    d=x*x+y*y;
	    do_stuff($@)
	    x=fabs(x); y=fabs(y);
	  }
	}
      }
      printf(x1?" %d":"%d",a);
    }
    putchar('\n');
  }
  return 0;
}
}})
