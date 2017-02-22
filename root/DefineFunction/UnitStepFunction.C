#include <UnitStepFunction.h>

#include <TF1.h>

Int_t UnitStepFunction(){
  TF1 *func = new TF1("func", unitstepfunc, -10, 10, 1);
  func->SetParName(0, "Step threshold");
  func->SetParameter(0, 0);
  func->Draw();

  return 0;
}
