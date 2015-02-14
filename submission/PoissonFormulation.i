%module PoissonFormulation
%{
#include "PoissonFormulation.h"
%}

class PoissonFormulation {
public:
  PoissonFormulation(int spaceDim, bool useConformingTraces);
  
  BFPtr bf();
  
  // field variables:
  VarPtr phi();
  VarPtr psi();
  
  // traces:
  VarPtr psi_n_hat();
  VarPtr phi_hat();
  
  // test variables:
  VarPtr q();
  VarPtr tau();
};
