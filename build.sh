#!/bin/sh
CAMELLIA_INCLUDE="/source/ubuntu/csci335/include/Camellia"
CAMELLIA_LIB_DIR="/source/ubuntu/csci335/lib"
CPP="/source/ubuntu/csci335/local/openmpi-1.8.4/bin/mpic++"
PYTHON_INCLUDE="/usr/include/python2.7"
HDF5_INCLUDE="/source/ubuntu/csci335/local/hdf5/include"
OPEN_MPI_INCLUDE="/source/ubuntu/csci335/local/openmpi-1.8.4/include"

Trilinos_INCLUDE_DIRS="/source/ubuntu/csci335/local/trilinos/mpi-release-shared/include"
Trilinos_LIBRARY_DIRS="/source/ubuntu/csci335/local/trilinos/mpi-release-shared/lib"

Trilinos_LIBRARIES="pytrilinos;locathyra;locaepetra;localapack;loca;noxepetra;noxlapack;nox;intrepid;stratimikos;stratimikosbelos;stratimikosaztecoo;stratimikosamesos;stratimikosml;stratimikosifpack;anasazitpetra;ModeLaplace;anasaziepetra;anasazi;belostpetra;belosepetra;belos;ml;komplex;ifpack;pamgen_extras;pamgen;amesos;galeri-xpetra;galeri;aztecoo;dpliris;isorropia;thyraepetraext;thyraepetra;thyracore;thyraepetraext;thyraepetra;thyracore;xpetra-sup;xpetra-ext;xpetra;epetraext;tpetraext;tpetrainout;tpetra;triutils;shards;zoltan;epetra;sacado;kokkoslinalg;kokkosnodeapi;kokkos;kokkoslinalg;kokkosnodeapi;kokkos;rtop;tpi;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore"
Trilinos_LIBRARIES_LINK_LINE="-lpytrilinos -llocathyra -llocaepetra -llocalapack -lloca -lnoxepetra -lnoxlapack -lnox -lintrepid -lstratimikos -lstratimikosbelos -lstratimikosaztecoo -lstratimikosamesos -lstratimikosml -lstratimikosifpack -lanasazitpetra -lModeLaplace -lanasaziepetra -lanasazi -lbelostpetra -lbelosepetra -lbelos -lml -lkomplex -lifpack -lpamgen_extras -lpamgen -lamesos -lgaleri-xpetra -lgaleri -laztecoo -ldpliris -lisorropia -lthyraepetraext -lthyraepetra -lthyracore -lthyraepetraext -lthyraepetra -lthyracore -lxpetra-sup -lxpetra-ext -lxpetra -lepetraext -ltpetraext -ltpetrainout -ltpetra -ltriutils -lshards -lzoltan -lepetra -lsacado -lkokkoslinalg -lkokkosnodeapi -lkokkos -lkokkoslinalg -lkokkosnodeapi -lkokkos -lrtop -ltpi -lteuchosremainder -lteuchosnumerics -lteuchoscomm -lteuchosparameterlist -lteuchoscore -lteuchosremainder -lteuchosnumerics -lteuchoscomm -lteuchosparameterlist -lteuchoscore"

INCLUDE_ALL="-I$PYTHON_INCLUDE -I$CAMELLIA_INCLUDE -I$Trilinos_INCLUDE_DIRS -I$HDF5_INCLUDE"
LINK_ALL="-lpython2.7 -L$Trilinos_LIBRARY_DIRS $Trilinos_LIBRARIES_LINK_LINE -L$CAMELLIA_LIB_DIR -lCamellia"
#echo $LINK_ALL

#swig -Wall -c++ -python -I$CAMELLIA_INCLUDE Var.i
#$CPP -c -Wall -fpic Var_wrap.cxx $INCLUDE_ALL
#$CPP -shared Var_wrap.o -o _Var.so $LINK_ALL

#swig -Wall -c++ -python -I$CAMELLIA_INCLUDE VarFactory.i
#$CPP -c -Wall -fpic VarFactory_wrap.cxx $INCLUDE_ALL
#$CPP -shared VarFactory_wrap.o -o _VarFactory.so $LINK_ALL

#swig -Wall -c++ -python -I$CAMELLIA_INCLUDE Function.i
#$CPP -c -Wall -fpic Function_wrap.cxx $INCLUDE_ALL
#$CPP -shared Function_wrap.o -o _Function.so $LINK_ALL

#swig -Wall -c++ -python -I$CAMELLIA_INCLUDE LinearTerm.i
#$CPP -c -Wall -fpic LinearTerm_wrap.cxx $INCLUDE_ALL
#$CPP -shared LinearTerm_wrap.o -o _LinearTerm.so $LINK_ALL

#swig -Wall -c++ -python -I$CAMELLIA_INCLUDE IP.i
#$CPP -c -Wall -fpic IP_wrap.cxx $INCLUDE_ALL
#$CPP -shared IP_wrap.o -o _IP.so $LINK_ALL

#swig -Wall -c++ -python -I$CAMELLIA_INCLUDE BF.i
#$CPP -c -Wall -fpic BF_wrap.cxx $INCLUDE_ALL
#$CPP -shared BF_wrap.o -o _BF.so $LINK_ALL

#swig -Wall -c++ -python -I$CAMELLIA_INCLUDE SpatialFilter.i
#$CPP -c -Wall -fpic SpatialFilter_wrap.cxx $INCLUDE_ALL
#$CPP -shared SpatialFilter_wrap.o -o _SpatialFilter.so $LINK_ALL

#swig -Wall -c++ -python -I$CAMELLIA_INCLUDE BC.i
#$CPP -c -Wall -fpic BC_wrap.cxx $INCLUDE_ALL
#$CPP -shared BC_wrap.o -o _BC.so $LINK_ALL

#swig -Wall -c++ -python -I$CAMELLIA_INCLUDE RHS.i
#$CPP -c -Wall -fpic RHS_wrap.cxx $INCLUDE_ALL
#$CPP -shared RHS_wrap.o -o _RHS.so $LINK_ALL

#swig -Wall -c++ -python -I$CAMELLIA_INCLUDE Mesh.i
#$CPP -c -Wall -fpic Mesh_wrap.cxx $INCLUDE_ALL
#$CPP -shared Mesh_wrap.o -o _Mesh.so $LINK_ALL

#swig -Wall -c++ -python -I$CAMELLIA_INCLUDE MeshFactory.i
#$CPP -c -Wall -fpic MeshFactory_wrap.cxx $INCLUDE_ALL
#$CPP -shared MeshFactory_wrap.o -o _MeshFactory.so $LINK_ALL

#swig -Wall -c++ -python -I$CAMELLIA_INCLUDE Solution.i
#$CPP -c -Wall -fpic Solution_wrap.cxx $INCLUDE_ALL
#$CPP -shared Solution_wrap.o -o _Solution.so $LINK_ALL

#swig -Wall -c++ -python -I$CAMELLIA_INCLUDE HDF5Exporter.i
#$CPP -c -Wall -fpic HDF5Exporter_wrap.cxx $INCLUDE_ALL
#$CPP -shared HDF5Exporter_wrap.o -o _HDF5Exporter.so $LINK_ALL

