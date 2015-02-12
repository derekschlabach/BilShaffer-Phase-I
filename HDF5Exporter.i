%module HDF5Exporter
%{
#include "HDF5Exporter.h"
%}

%include "std_string.i"
%include "std_vector.i"

namespace std {
  %template(FunctionVector) vector<FunctionPtr>;
   %template(StringVector) vector<string>;
 }

%nodefaultctor HDF5Exporter;  // Disable the default constructor for class HDF5Exporter

using namespace std;

class HDF5Exporter {
public:
  HDF5Exporter(MeshPtr mesh, std::string outputDirName="output", std::string outputDirSuperPath = ".");
  void exportFunction(FunctionPtr function, std::string functionName="function", double timeVal=0);
  void exportFunction(vector<FunctionPtr> functions, vector<string> functionNames, double timeVal=0);
  void exportSolution(SolutionPtr solution, VarFactory varFactory, double timeVal=0);
};
