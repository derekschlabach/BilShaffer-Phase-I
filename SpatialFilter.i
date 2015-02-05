%module SpatialFilter
%{
#include "SpatialFilter.h"
  %}



class SpatialFilter {

 public:

  bool matchesPoint(double x, double y); //Overloaded

  SpatialFilterPtr allSpace();
  SpatialFilterPtr unionFilter(SpatialFilterPtr a, SpatialFilterPtr b);