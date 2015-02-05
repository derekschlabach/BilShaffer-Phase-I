%module Var
%{
#include "Var.h"
#include "LinearTerm.h"
%}

%include "std_string.i"

%nodefaultctor Var;  // Disable the default constructor for class Var


using namespace std;

// need if a type is Space
namespace Camellia {
  enum Space { HGRAD, HCURL, HDIV, HGRAD_DISC, HCURL_DISC, HDIV_DISC, HDIV_FREE, L2, CONSTANT_SCALAR, VECTOR_HGRAD, VECTOR_HGRAD_DISC, VECTOR_L2, UNKNOWN_FS };

  // for op()
  enum EOperator { OP_VALUE = 0,
    OP_GRAD,      // 1
    OP_CURL,      // 2
    OP_DIV,       // 3
    OP_D1,        // 4
    OP_D2,        // 5
    OP_D3,        // 6
    OP_D4,        // 7
    OP_D5,        // 8
    OP_D6,        // 9
    OP_D7,        // 10
    OP_D8,        // 11
    OP_D9,        // 12
    OP_D10,       // 13
    OP_X,         // 14 (pick up where EOperator left off...)
    OP_Y,         // 15
    OP_Z,         // 16
    OP_DX,        // 17
    OP_DY,        // 18
    OP_DZ,        // 19
    OP_CROSS_NORMAL,    // 20
    OP_DOT_NORMAL,      // 21
    OP_TIMES_NORMAL,    // 22
    OP_TIMES_NORMAL_X,  // 23
    OP_TIMES_NORMAL_Y,  // 24
    OP_TIMES_NORMAL_Z,  // 25
    OP_TIMES_NORMAL_T,  // 26
    OP_VECTORIZE_VALUE  // 27
  };

enum VarType { TEST, FIELD, TRACE, FLUX, UNKNOWN_TYPE, MIXED_TYPE };

}

using namespace Camellia;

class Var {
 public:
  //Var();
  int ID();
  const string & name();
  string displayString();
  int rank();
  Space space();
  VarType varType();
  Camellia::EOperator op();
  LinearTermPtr termTraced();
  VarPtr grad();
  VarPtr div();
  VarPtr curl(int spaceDim);
  VarPtr dx();
  VarPtr dy();
  VarPtr x();
  VarPtr y();
};

class VarPtr {
public:
  Var* operator->();

  %extend {
    LinearTermPtr __mul__(double w) {
      return *self * w;
    }

    LinearTermPtr __rmul__(double w) {
      return *self * w;
    }

    LinearTermPtr __mul__(vector<double> w) {
      return *self * w;
    }

    LinearTermPtr __rmul__(vector<double> w) {
      return *self * w;
    }

    LinearTermPtr __add__(VarPtr v) {
      return *self + v;
    }

    LinearTermPtr __div__(double w) {
      return *self / w;
    }

    LinearTermPtr __div__(FunctionPtr f) {
      return *self / f;
    }

    LinearTermPtr __sub__(VarPtr v) {
      return *self - v;
    }

    LinearTermPtr __sub__() {
      return - *self;
    }
  }
};
