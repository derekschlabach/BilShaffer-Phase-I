%module Var
%{
#include "Var.h"
%}

%include "std_string.i"

%nodefaultctor Var;  // Disable the default constructor for class Var

namespace Camellia {
  enum Space { HGRAD, HCURL, HDIV, HGRAD_DISC, HCURL_DISC, HDIV_DISC, HDIV_FREE, L2, CONSTANT_SCALAR, VECTOR_HGRAD, VECTOR_HGRAD_DISC, VECTOR_L2, UNKNOWN_FS };
}

class Var {
public:

};

class VarPtr {
public:
  Var* operator->();
};
