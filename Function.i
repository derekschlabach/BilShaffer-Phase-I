%module Function
%{
#include "Function.h"
%}

%include "std_string.i"

%nodefaultctor Function;  // Disable the default constructor for class Function

class Function {
public:
  virtual string displayString();
  double evaluate(double x);
  double evaluate(double x, double y);
  double evaluate(double x, double y, double z);
  
  // member functions for taking derivatives:
  FunctionPtr dx();
  FunctionPtr dy();

  FunctionPtr grad();

  // static methods:
  static double evaluate(FunctionPtr f, double x, double y); 
  
  static FunctionPtr xn(int n=1); // NOTE: important to have "FunctionPtr" here exactly as below; "Teuchos::RCP<Function>", though equivalent in C++, is not equivalent for SWIG
  static FunctionPtr yn(int n=1);

  // SWIG/Python extensions:
  %extend {
    std::string __str__() {
      return self->displayString();
    }
  }
};

//FunctionPtr operator*(double weight, FunctionPtr f);

class FunctionPtr {
public:
  Function* operator->();

  %extend {
    FunctionPtr __add__(FunctionPtr f2) {
      return *self + f2;
    }
    FunctionPtr __add__(double value) {
      return *self + value;
    }
    FunctionPtr __radd__(double value) {
      return *self + value;
    }
    FunctionPtr __mul__(double value) {
      return *self * value;
    }
    FunctionPtr __rmul__(double value) {
      return *self * value;
    }
    FunctionPtr __sub__(FunctionPtr f2) {
      return *self - f2;
    }
    FunctionPtr __sub__(double value) {
      return *self - value;
    }
    FunctionPtr __rsub__(double value) {
      return value - *self;
    }
  }
};
