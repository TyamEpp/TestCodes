#include <TROOT.h>

Double_t unitstepfunc(Double_t *x, Double_t *par){
  return (x[0]>=par[0]);
}
