%module SpatialFilter
%{
#include "SpatialFilter.h"
%}

%include "std_string.i"

%nodefaultctor SpatialFilter;  // Disable the default constructor for class SpatialFilter

class SpatialFilter {
public:
  virtual bool matchesPoint(double x, double y);

  // static methods:
  static SpatialFilterPtr unionFilter(SpatialFilterPtr a, SpatialFilterPtr b);
  static SpatialFilterPtr intersectionFilter(SpatialFilterPtr a, SpatialFilterPtr b);

  static SpatialFilterPtr matchingX(double x);
  static SpatialFilterPtr matchingY(double y);
};

//FunctionPtr operator*(double weight, FunctionPtr f);

class SpatialFilterPtr {
public:
  SpatialFilter* operator->();

  %extend {
    SpatialFilterPtr __or__(SpatialFilterPtr b) {
      return SpatialFilter::unionFilter(*self,b);
    }
    SpatialFilterPtr __and__(SpatialFilterPtr b) {
      return SpatialFilter::intersectionFilter(*self,b);
    }
  }
};
