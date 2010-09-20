#include <math.h>
#include <stdio.h>
#include "Clib/fail.h"
#include "Clib/mlvalues.h"
#include "Clib/value-bigloo.h"

value format_float(fmt, arg)    /* ML */
     value fmt, arg;
{
  char format_buffer[64];
  int prec, i;
  char * p;
  char * dest;
  obj_t res;

  prec = 64;
  for (p = String_of_val(fmt); *p != 0; p++) {
    if (*p >= '0' && *p <= '9') {
      i = atoi(p) + 15;
      if (i > prec) prec = i;
      break;
    }
  }
  for( ; *p != 0; p++) {
    if (*p == '.') {
      i = atoi(p+1) + 15;
      if (i > prec) prec = i;
      break;
    }
  }
  if (prec <= sizeof(format_buffer)) {
    dest = format_buffer;
  } else {
    dest = stat_alloc(prec);
  }
  sprintf(dest, String_of_val(fmt), Double_of_val(arg));
  res = copy_string(dest);
  if (dest != format_buffer) {
    stat_free(dest);
  }
  return res;
}
