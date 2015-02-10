%module Mesh
%{
#include "Mesh.h"
%}

%include "std_string.i"
%include "std_vector.i"
%include "std_set.i"

namespace std {
  %template(IntVector) vector<int>;
  %template(UnsignedSet) set<unsigned>;
 }

%nodefaultctor Mesh;  // Disable the default constructor for class Mesh

typedef unsigned GlobalIndexType;

using namespace std;

class Mesh {
public:
  void saveToHDF5(string filename);
  int cellPolyOrder(GlobalIndexType cellID);
  set<GlobalIndexType> getActiveCellIDs();
  int getDimension();
  void hRefine(const set<GlobalIndexType> &cellIDs);
  GlobalIndexType numActiveElements();
  GlobalIndexType numFluxDofs();
  GlobalIndexType numFieldDofs();
  GlobalIndexType numGlobalDofs();
  GlobalIndexType numElements();
  void pRefine(const set<GlobalIndexType> &cellIDsForPRefinments);
  void registerSolution(SolutionPtr solution);
  vector<unsigned> vertexIndicesForCell(GlobalIndexType cellID);
  vector< vector<double> > verticesForCell(GlobalIndexType cellID);
};

class MeshPtr {
public:
  Mesh* operator->();
};
