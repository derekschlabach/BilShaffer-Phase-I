%module MeshFactory
%{
#include "MeshFactory.h"
%}

%include "std_string.i"
%include "std_vector.i"

namespace std {
  %template(vectori) vector<int>;
   %template(vectord) vector<double>;
 }

%nodefaultctor MeshFactory;  // Disable the default constructor for class MeshFactory

class MeshFactory {
public:
  static MeshPtr loadFromHDF5(BFPtr bf, string filename);
  static MeshPtr rectilinearMesh(BFPtr bf, std::vector<double> dimensions, std::vector<int> elementCounts, int H1Order, int pToAddTest=-1, std::vector<double> x0 = std::vector<double>());
  static MeshPtr readTriangle(string filePath, BFPtr bilinearForm, int H1Order, int pToAdd);
};
