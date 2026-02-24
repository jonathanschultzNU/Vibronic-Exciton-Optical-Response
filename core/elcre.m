% ELCRE  Electronic annihilation operator in the composite vibronic Fock basis.
%
%   C = ELCRE(BASIS, N_STATES, MOLNUM) constructs the matrix representation
%   of the fermionic (two-level) electronic annihilation operator for molecule
%   MOLNUM acting on the composite vibronic Fock space.
%
%   Each basis state is a row vector [elec1, vib1, elec2, vib2]. The operator
%   lowers the electronic quantum number of molecule MOLNUM by 1 (i.e., maps
%   the excited state |1> to the ground state |0>), leaving vibrational quantum
%   numbers unchanged.
%
%   Inputs:
%     BASIS    - (N_STATES x 4) matrix of basis state vectors
%     N_STATES - total number of states in the Fock space
%     MOLNUM   - molecule index (1 or 2)
%
%   Output:
%     C        - (N_STATES x N_STATES) electronic annihilation operator matrix
%
%   See also: VIBCRE, DIMHAMGEN

function c = elcre(basis,n_states,molnum)

%	Author: Jonathan D. Schultz
%	Email: jonathanschultz2022@u.northwestern.edu
%	Last revision date: February 1st, 2021
%
%	Copyright: Jonathan D. Schultz, 2021

%   Please see readme file for information about this package

molnum = 2*(molnum-1)+1;
c = zeros(n_states);

for i = 1:n_states
    for j = 1:n_states
        bra = basis(i,:);
        ket = basis(j,:);
        
        if ket(molnum) > 0
           ket(molnum) = ket(molnum)-1; 
           if bra == ket
              c(i,j) = 1;
           end  
        end
        
    end
end 
