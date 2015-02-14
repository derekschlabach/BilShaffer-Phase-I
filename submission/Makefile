CAMELLIA_INCLUDE=/source/ubuntu/csci335/include/Camellia
CAMELLIA_LIB_DIR=/source/ubuntu/csci335/lib
CPP=g++
PYTHON_INCLUDE=/usr/include/python2.7
HDF5_INCLUDE=/source/ubuntu/csci335/local/hdf5-serial/include

Trilinos_INCLUDE_DIRS=/source/ubuntu/csci335/local/trilinos/serial-release-shared/include
Trilinos_LIBRARY_DIRS=/source/ubuntu/csci335/local/trilinos/serial-release-shared/lib

Trilinos_LIBRARIES=pytrilinos;locathyra;locaepetra;localapack;loca;noxepetra;noxlapack;nox;intrepid;stratimikos;stratimikosbelos;stratimikosaztecoo;stratimikosamesos;stratimikosml;stratimikosifpack;anasazitpetra;ModeLaplace;anasaziepetra;anasazi;belostpetra;belosepetra;belos;ml;komplex;ifpack;pamgen_extras;pamgen;amesos;galeri-xpetra;galeri;aztecoo;dpliris;isorropia;thyraepetraext;thyraepetra;thyracore;thyraepetraext;thyraepetra;thyracore;xpetra-sup;xpetra-ext;xpetra;epetraext;tpetraext;tpetrainout;tpetra;triutils;shards;zoltan;epetra;sacado;kokkoslinalg;kokkosnodeapi;kokkos;kokkoslinalg;kokkosnodeapi;kokkos;rtop;tpi;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore
Trilinos_LIBRARIES_LINK_LINE=-lpytrilinos -llocathyra -llocaepetra -llocalapack -lloca -lnoxepetra -lnoxlapack -lnox -lintrepid -lstratimikos -lstratimikosbelos -lstratimikosaztecoo -lstratimikosamesos -lstratimikosml -lstratimikosifpack -lanasazitpetra -lModeLaplace -lanasaziepetra -lanasazi -lbelostpetra -lbelosepetra -lbelos -lml -lkomplex -lifpack -lpamgen_extras -lpamgen -lamesos -lgaleri-xpetra -lgaleri -laztecoo -ldpliris -lisorropia -lthyraepetraext -lthyraepetra -lthyracore -lthyraepetraext -lthyraepetra -lthyracore -lxpetra-sup -lxpetra-ext -lxpetra -lepetraext -ltpetraext -ltpetrainout -ltpetra -ltriutils -lshards -lzoltan -lepetra -lsacado -lkokkoslinalg -lkokkosnodeapi -lkokkos -lkokkoslinalg -lkokkosnodeapi -lkokkos -lrtop -ltpi -lteuchosremainder -lteuchosnumerics -lteuchoscomm -lteuchosparameterlist -lteuchoscore -lteuchosremainder -lteuchosnumerics -lteuchoscomm -lteuchosparameterlist -lteuchoscore

INCLUDE_ALL=-I${PYTHON_INCLUDE} -I${CAMELLIA_INCLUDE} -I${Trilinos_INCLUDE_DIRS} -I${HDF5_INCLUDE}
LINK_ALL=-lpython2.7 -L${Trilinos_LIBRARY_DIRS} ${Trilinos_LIBRARIES_LINK_LINE} -L${CAMELLIA_LIB_DIR} -lCamellia
#echo ${LINK_ALL}

%_wrap.cxx : %.i
	swig -Wall -c++ -python -I${CAMELLIA_INCLUDE} $< 

%_wrap.o : %_wrap.cxx
	${CPP} -c -Wall -fpic $< ${INCLUDE_ALL}

_%.so : %_wrap.o
	${CPP} -shared $< -o $@ ${LINK_ALL}

% : _%.so ;

all : Var VarFactory Function LinearTerm IP BF SpatialFilter BC RHS PoissonFormulation Mesh MeshFactory Solution HDF5Exporter StokesVGPFormulation

.PRECIOUS : _%.so
