#include <TROOT.h>

Double_t heavstepfunc(Double_t *x, Double_t *par){
  return ( x==0 ? 0.5 : x[0]>par[0] );
}
