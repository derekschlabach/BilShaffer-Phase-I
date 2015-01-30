%module BC
%{
#include "BC.h"
%}

%include "std_string.i"

%nodefaultctor BC;  // Disable the default constructor for class BC

class BC {
public:
  void addDirichlet( VarPtr traceOrFlux, SpatialFilterPtr spatialPoints, FunctionPtr valueFunction );
  static BCPtr bc();
};

class BCPtr {
public:
  BC* operator->();
};
