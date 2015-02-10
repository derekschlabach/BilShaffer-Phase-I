%module BF
%{
#include "BF.h"
%}

%include "std_string.i"

class BF {
 public:
   BF( VarFactory varFactory );
   void addTerm( LinearTermPtr trialTerm, LinearTermPtr testTerm );
   void addTerm( VarPtr trialVar, LinearTermPtr testTerm );
   void addTerm( VarPtr trialVar, VarPtr testVar );
   void addTerm( LinearTermPtr trialTerm, VarPtr testVar);

   const std::string & testName(int testID);
   const std::string & trialName(int trialID);

   Camellia::EFunctionSpace functionSpaceForTest(int testID);
   Camellia::EFunctionSpace functionSpaceForTrial(int trialID);

   IPPtr graphNorm(double weightForL2TestTerms = 1.0);
   IPPtr naiveNorm(int spaceDim);

   bool isFluxOrTrace(int trialID);

   std::string displayString();
   LinearTermPtr testFunctional(SolutionPtr trialSolution);

   VarFactory varFactory();
   %extend {
     static BFPtr bf(VarFactory vf) {
       return Teuchos::rcp(new BF(vf));
     }
   }
 };

class BFPtr {
public:
  BF* operator->();

};
