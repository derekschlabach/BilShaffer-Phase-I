%module VarFactory
%{
#include "VarFactory.h"
%}

%include "std_string.i"

class VarFactory {
public:
  VarFactory();
  VarPtr testVar(std::string name, Space fs, int ID = -1);
  VarPtr fieldVar(std::string name, Space fs = L2, int ID = -1);
  
  // fluxes are trace variables which trace a term involving a normal (and which therefore
  // need to be multiplied by a sgn(n) term; i.e. the two cells which see a side will see opposite
  // values of the flux variable).
  VarPtr fluxVar(std::string name, LinearTermPtr termTraced, Space fs = L2, int ID = -1);
  VarPtr fluxVar(std::string name, VarPtr termTraced, Space fs = L2, int ID = -1);
  VarPtr fluxVar(std::string name, Space fs = L2, int ID = -1);
  
  VarPtr traceVar(std::string name, LinearTermPtr termTraced, Space fs = HGRAD, int ID = -1);
  VarPtr traceVar(std::string name, VarPtr termTraced, Space fs = HGRAD, int ID = -1);
  VarPtr traceVar(std::string name, Space fs = HGRAD, int ID = -1);

%extend {
  VarPtr testVar(std::string name, int fs, int ID = -1) {
    return self->testVar(name, (Space)fs, ID);
  }
  VarPtr fieldVar(std::string name, int fs, int ID = -1) {
    return self->fieldVar(name,(Space)fs,ID);
  }
  VarPtr traceVar(std::string name, LinearTermPtr termTraced, int fs, int ID = -1) {
    return self->traceVar(name, termTraced, (Space)fs, ID);
  }
  VarPtr traceVar(std::string name, VarPtr termTraced, int fs, int ID = -1) {
    return self->traceVar(name, termTraced, (Space)fs, ID);
  }
  VarPtr traceVar(std::string name, int fs, int ID = -1) {
    return self->traceVar(name, (Space)fs, ID);
  } 
}
};
