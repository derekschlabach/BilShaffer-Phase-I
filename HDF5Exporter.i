%module HDF5Exporter
%{
#include "HDF5Exporter.h"
%}

%include "std_string.i"
%include "std_vector.i"

%nodefaultctor HDF5Exporter;  // Disable the default constructor for class HDF5Exporter

class HDF5Exporter {
public:
  HDF5Exporter(MeshPtr mesh, string outputDirName="output", string outputDirSuperPath = ".");
  void exportFunction(FunctionPtr function, string functionName="function", double timeVal=0);
  void exportFunction(vector<FunctionPtr> functions, vector<string> functionNames, double timeVal=0);
  void exportSolution(SolutionPtr solution, VarFactory varFactory, double timeVal=0);
};
