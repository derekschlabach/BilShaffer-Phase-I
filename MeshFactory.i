%module MeshFactory
%{
#include "MeshFactory.h"
%}

%include "std_string.i"
%include "std_vector.i"

%nodefaultctor MeshFactory;  // Disable the default constructor for class MeshFactory

class MeshFactory {
public:
  static MeshPtr loadFromHDF5(BilinearFormPtr bf, string filename);
  static MeshPtr rectilinearMesh(BilinearFormPtr bf, vector<double> dimensions, vector<int> elementCounts, int H1Order, int pToAddTest=-1, vector<double> x0 = vector<double>());
  static MeshPtr readTriangle(string filePath, Teuchos::RCP< BilinearForm > bilinearForm, int H1Order, int pToAdd);
};
