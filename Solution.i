%module Var
%{
#include "Solution.h"
%}

// where are the .h files? swag

class Solution {
 public:
  Solution(MeshPtr mesh, BCPtr bc = Teuchos::null,
	   RHSPtr rhs = Teuchos::null, IPPtr ip = Teuchos::null );
  Solution(const Solution &soln);
  int solve();
  void addSolution(Teuchos::RCP<Solution> soln, double weight,
		 bool allowEmptyCells = false, bool replaceBoundaryTerms=false);
  void addSolution(Teuchos::RCP<Solution> soln, double weight,
		   set<int> varsToAdd, bool allowEmptyCells = false);
  void clear();
  int cubatureEnrichmentDegree();
  void setCubatureEnrichmentDegree(int value);
  double L2NormOfSolution(int trialID);
  void projectOntoMesh(const map<int, Teuchos::RCP<Function> > &functionMap);
  double energyErrorTotal();
  void setWriteMatrixToFile(bool value,const string &filePath);
  void setWriteMatrixToMatrixMarketFile(bool value,const string &filePath);
  void setWriteRHSToMatrixMarketFile(bool value, const string &filePath);
  Teuchos::RCP<Mesh> mesh();
  Teuchos::RCP<BC> bc();
  Teuchos::RCP<RHS> rhs();
  Teuchos::RCP<IP> ip();
  void setBC( Teuchos::RCP<BC> );
  void setRHS( Teuchos::RCP<RHS> );
  void setIP( Teuchos::RCP<IP> );
  void save(string meshAndSolutionPrefix);
  static SolutionPtr load(BFPtr bf, string meshAndSolutionPrefix);
  void saveToHDF5(string filename);
  void loadFromHDF5(string filename);
  void setUseCondensedSolve(bool value);
};
