%module MeshFactory
%{
#include "MeshFactory.h"
%}

%include "std_string.i"
%include "std_vector.i"

%nodefaultctor MeshFactory;  // Disable the default constructor for class MeshFactory

class MeshFactory {
public:
  static MeshPtr loadFromHDF5(BFPtr bf, string filename);
  static MeshPtr rectilinearMesh(BFPtr bf, vector<double> dimensions, vector<int> elementCounts, int H1Order, int pToAddTest=-1, vector<double> x0 = vector<double>());
  static MeshPtr readTriangle(string filePath, BFPtr bilinearForm, int H1Order, int pToAdd);
};
