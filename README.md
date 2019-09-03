# Data set Report 1

I feel like these 3 data sets are quite complex or abstract, and might not have obvious questions to ask like ‘how does the avg. rainfall per month change with the year, or how does the gdp of a country change in response to trade treaties’, but if I am able to make what we are doing in this class connect with my research or even benefit it, then the time and effort I am able to put in will grow exponentially, which is what I am striving for.

## Set 1 - Energy eigenvalues
This data set is the eigenvalue solutions to the schrodinger wave equation describing a four-body interaction. This data was entirely calculated by me using self written Fortran code. Both the size (number of eigenvalues) and their accuracy are only limited by the available RAM on what computer or server the program is run on, so throughout this semester I hope to learn ways to do more intensive calculations to benefit my physics research. The eigenvalues are dependent on many variables, but the most prominent is D, the strength of the interparticle interactions, or ‘Depth’ of the potential well. As D increases, the particles interact more strongly and subsequently have more ‘bound states’ which are identified by the eigenvalues. By varying D, many data sets can be made. 
An important feature of a Quantum System is the Density of Bound States. How does this value change when D changes?
Another feature is how much chaos the system expresses. This is measured by making a probability histogram of the spacings between bound states energy eigenvalues and fitting it to the Brody Distribution, which gives a brody parameter from 0.0 to 1.0 of how chaotic the system is. How does the chaos expressed in the system changes with respect to D?
Are there any other patterns to be found from this data? 
What other variables can I change that will affect the energy levels?

The current model for the pair-wise particle interaction is the Morse model, defined as U(r)=D[(1-e^{-a(r-r0)})^2-1]. But, there are at least two other interaction models, naimly the Poschl-Teller, U(r)=-D/cosh(r/r0)^2, and the VanderWalls potential. 
Does changing which interaction model used affect any of the statistic found or answers to the questions?

The structure of this data set is just a sorted list of energy values.

## Set 2 - Adiabatic Eigenvectors
This data set is the eigenvector solutions to the adiabatic hamiltonian. Adiabatic separation is a technique used to help numerically approximate the solutions to the analytically unsolvable schrodinger wave equations for a four-body particle collision. The adiabatic subproblem incorporates all the hyper-angular dependencies as well as the interparticle interactions, leaving out the hyper-radial kinetic energy components. This data shows the potential energy channels available to the system, and each curve is a solution to one of the infinite set of 1st order linear differential equations that describe the adiabatic states of the system. Like the eigenvalue data, this data is dependent on D, the Depth of the potential that models the strength of the interparticle interactions. Also like the eigenvalues, this data can benefit in accuracy and sheer size with the ability to do more intensive calculations.
The chaos of this adiabatic system can also be statistically analyzed using a probability histogram of the spacings between each curve at EACH radial point. Does the chaos at any given hyper-radius change as D changes?
Does the density of states change as D changes and does this value mean anything physically?
If you zoom in on these curves, you will find ‘avoided crossings’ where the curves swap trajectories to avoid crossing each other. Do the radial location of these avoided crossing change as D changes?
Because of the avoided crossings, the curves tend to group up. Do these groupings change as D changes?
These questions about the avoided crossing are highly relevant to the issue that Dr. Mehta and I are currently trying to resolve.

Idealilly, analysis of both of these data sets would be beneficial and they are very intertwined. The adiabatic eigenvector potential curves can be graphed showing the potential ‘well’ that the particles fall into as the hyper-radius shrinks as well as the different energy channels the complex can ‘fall down’ as the collision progresses. The energy eigenvalues can be graphed on top of these curves so show where the bound state energy levels live within the ‘well’.
Are there any correlations to be found between which or how many states exist in each potential ‘well’?

Another variable that can affect both of these data sets is breaking the mass symmetry. If the program is run with the particles mass/spin m1=m2=m3=m4, then there are multiple ways to represent the same molecular complex because the particles are indistinguishable. This leads to degeneracy in the system states, causing there to be multiple eigenvalues of almost exactly the same value, or multiple adiabatic curves that are nearly ontop of eachother. This leads to different statistics and data then if we set m1=m2 /= m3=m4 where some particles are distinguishable, which will reduce the degeneracy in the data sets.
How does breaking this mass symmetry affect any of the questions previously asked?
There are many other symmetries that we have enforced in the effort to reduce the number of nearly degenerate results, but there still remains 1 hidden symmetry leading to just a few degenerate results. Can I find any insight into where, what, or why we are still getting this degeneracy?
Another option would be to reinstate all symmetries, leading highly degenerate states. Are there any interesting aspects or variances between these degenerate states?

Yet another variable that can be analysed for either of these datasets is the size of the basis approximation. This program uses two main approximation theorems, Quadrature Rule and Basis Expansion, to represent the wavefunctions and their interactions as data vectors and matrices allowing for linear algebra calculations. These theorems converge to being exact as the size of Quadrature Nodes and Basis Point reaches infinity.
By what factor does the accuracy of the results of these approximations change as subsequent basis points or quadrature nodes are added?

The structure of this data is 

R1-value {set of energy points at R1}

R2-value {set of energy points at R2}

...

There is a file AdiabaticPotCurves.jpg in the top level of this repository that is these adiabatic curves graphed Vs the hyper-radius. The energy eigenvalues would be horizontal lines at different levels showing whene in the 'well' that state lives.

## Set 3 - Complete eigenvectors
I know you asked for 3 data sets, but the first 2 are what I am really interested in and what hold the most important physically relevant data for quantum system analysis. But, there is a third set, the eigenvectors of the complete schrodinger equation, which when graphed show the wave-form of the colliding complex. I am not sure if there are many interesting or important physical properties within this data, but it could be fun to analyse features like the wavelength or frequency of each state as the interaction strength varies, or how many intersections or couplings between each state exist with each setup.

Also, I will confer with my mentor to see if there are any major quantities that we could find in any of these datasets that would benefit the research and paper we are writing. 

