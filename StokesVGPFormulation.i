%module StokesVGPFormulation
%{
#include "StokesVGPFormulation.h"
%}

class StokesVGPFormulation {
public:
  StokesVGPFormulation(int spaceDim, bool useConformingTraces, double mu = 1.0);
  
  BFPtr bf();
  
  // field variables:
  VarPtr sigma(int i);
  VarPtr u(int i);
  VarPtr p();
  
  // traces:
  VarPtr tn_hat(int i);
  VarPtr u_hat(int i);
  
  // test variables:
  VarPtr tau(int i);
  VarPtr v(int i);
};
