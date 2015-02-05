%module IP
%{
#include "IP.h"
%}

%include "std_string.i"

class IP{
public:
IP();
void addTerm(LinearTermPtr a);
void addTerm(VarPtr v);
LinearTermPtr evaluate(map< int, FunctionPtr> &varFunctions);
};

class IPPtr {
public:
  IP* operator->();
};
