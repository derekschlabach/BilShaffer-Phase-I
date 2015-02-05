%module RHS
%{
#include "RHS.h"
%}

%nodefaultctor RHS;
class RHS {
public:
  bool nonZeroRHS(int testVarID);
  void addTerm(LinearTermPtr rhsTerm);
  void addTerm(VarPtr v);
  LinearTermPtr linearTerm();
  LinearTermPtr linearTermCopy();

  static RHSPtr rhs();

};

class RHSPtr {
public: 
  RHS* operator->();
};
