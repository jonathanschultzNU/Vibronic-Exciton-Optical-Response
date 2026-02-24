% VIBRON_DOUBLE_EXC  Generate the double-excitation vibronic basis.
%
%   BASIS = VIBRON_DOUBLE_EXC(V_MAX) generates all basis states for the
%   double-excitation manifold of a vibronic dimer, where both molecules
%   are simultaneously in their electronic excited states.
%
%   Each basis state is a row vector [1, v1, 1, v2], where v1 and v2 are
%   the vibrational quantum numbers for molecules 1 and 2. All states with
%   v1 + v2 <= V_MAX are included.
%
%   The number of states is (V_MAX^2 + 3*V_MAX + 2) / 2.
%
%   Input:
%     V_MAX  - maximum total vibrational quanta (scalar integer)
%
%   Output:
%     BASIS  - (N x 4) matrix of double-excitation basis vectors
%
%   See also: VIBRON_ZERO_EXC, VIBRON_SINGLE_EXC, DIMHAMGEN

function output = vibron_double_exc(v_max)

%	Author: Jonathan D. Schultz
%	Email: jonathanschultz2022@u.northwestern.edu
%	Last revision date: February 1st, 2021
%
%	Copyright: Jonathan D. Schultz, 2021

%   Please see readme file for information about this package

n_basis = (v_max^2 + 3*v_max+2)/2;
basis = zeros(n_basis,4);

k = 1;
for v_1 = 0:v_max
    for v_2 = 0:v_max-v_1
        basis(k,:) = [1, v_1, 1, v_2];
        k = k+1;
    end
end

output = basis;
