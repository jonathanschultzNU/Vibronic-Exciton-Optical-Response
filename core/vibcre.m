% VIBCRE  Vibrational annihilation operator in the composite vibronic Fock basis.
%
%   B = VIBCRE(BASIS, N_STATES, MOLNUM) constructs the matrix representation
%   of the bosonic annihilation operator for molecule MOLNUM acting on the
%   composite vibronic Fock space.
%
%   Each basis state is a row vector [elec1, vib1, elec2, vib2]. The operator
%   lowers the vibrational quantum number of molecule MOLNUM by 1, with the
%   appropriate sqrt(v) prefactor from the harmonic oscillator ladder algebra.
%
%   Inputs:
%     BASIS    - (N_STATES x 4) matrix of basis state vectors
%     N_STATES - total number of states in the Fock space
%     MOLNUM   - molecule index (1 or 2)
%
%   Output:
%     B        - (N_STATES x N_STATES) vibrational annihilation operator matrix
%
%   See also: ELCRE, DIMHAMGEN

function b = vibcre(basis,n_states,molnum)

%	Author: Jonathan D. Schultz
%	Email: jonathanschultz2022@u.northwestern.edu
%	Last revision date: February 1st, 2021
%
%	Copyright: Jonathan D. Schultz, 2021

%   Please see readme file for information about this package

b = zeros(n_states);

for i = 1:n_states
    for j = 1:n_states
        bra = basis(i,:);
        ket = basis(j,:);
        
        if ket(molnum*2) > 0
           ket(molnum*2) = ket(molnum*2)-1; 

           if bra == ket
              b(i,j) = sqrt(ket(molnum*2)+1);      
           end  
        end    
    end
end
