import PoissonFormulation
import StokesVGPFormulation
import Var
import Solution
import MeshFactory
import Mesh
import BF
import Function

spaceDim = 2
useConformingTraces  = True
poissonForm = PoissonFormulation.PoissonFormulation(spaceDim, useConformingTraces)
stokesForm = StokesVGPFormulation.StokesVGPFormulation(spaceDim, useConformingTraces)
stokesBF = stokesForm.bf()
poissonBF = poissonForm.bf()

u1 = stokesForm.u(1) # VarPtr for x component of velocity
p = stokesForm.p()   # VarPtr for pressure

phi = poissonForm.phi() # VarPtr for main, scalar-valued variable in Poisson problem
psi = poissonForm.psi() # VarPtr for gradient of psi, vector-valued

elems = MeshFactory.IntVector(2,2) # 2 entries, both initialized to 2
dims = MeshFactory.DoubleVector(2,1.0) # 2 entries, both initialized to 1.0

polyOrder = 3
H1Order = polyOrder + 1

mesh = MeshFactory.MeshFactory_rectilinearMesh(poissonBF,dims,elems,H1Order)
mesh2 = MeshFactory.MeshFactory_rectilinearMesh(poissonBF,[1.0,1.0],[2,3],H1Order)

print("Before refinement, mesh2 has %i active elements" % mesh2.numActiveElements())

mesh2.hRefine([0])

print("After refinement, mesh2 has %i active elements" % mesh2.numActiveElements())

x = Function.Function_xn(1)
y = Function.Function_yn(1)
one = Function.Function_constant(1);
zero = Function.Function_constant(0);

s = Solution.Solution_solution(mesh2)
s.projectOntoMesh({
    phi.ID() : x,
    psi.ID() : Function.Function_vectorize(one,zero)
  })
s.addSolution(s,1.0,[phi.ID()])
