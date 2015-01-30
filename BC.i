%module BC
%{
#include "BC.h"
%}

%include "std_string.i"
%include "std_pair.i"

%nodefaultctor BC;  // Disable the default constructor for class BC

class BC {
public:
  BC(bool legacySubclass);
  virtual bool bcsImposed(int varID);
  virtual bool singlePointBC(int varID);
  virtual double valueForSinglePointBC(int varID);
  virtual GlobalIndexType vertexForSinglePointBC(int varID);
  virtual bool imposeZeroMeanConstraint(int varID);
  void addDirichlet( VarPtr traceOrFlux, SpatialFilterPtr spatialPoints, FunctionPtr valueFunction );
  void addSinglePointBC( int fieldID, double value, GlobalIndexType meshVertexNumber = -1 );
  void addZeroMeanConstraint( VarPtr field );
  void removeZeroMeanConstraint( int fieldID );
  pair< SpatialFilterPtr, FunctionPtr > getDirichletBC(int varID);
  FunctionPtr getSpatiallyFilteredFunctionForDirichletBC(int varID); 
  static BCPtr bc();
};

class BCPtr {
public:
  BC* operator->();
};
