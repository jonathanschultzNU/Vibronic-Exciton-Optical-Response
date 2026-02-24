% VIBRON_SINGLE_EXC  Generate the single-excitation vibronic basis.
%
%   BASIS = VIBRON_SINGLE_EXC(V_MAX) generates all basis states for the
%   single-excitation manifold of a vibronic dimer, where exactly one
%   molecule is in its electronic excited state.
%
%   Each basis state is a row vector [e1, v1, e2, v2], where exactly one
%   of e1 or e2 equals 1 (and the other 0). All states with v1 + v2 <= V_MAX
%   are included for each electronic configuration.
%
%   The number of states is V_MAX^2 + 3*V_MAX + 2.
%
%   Input:
%     V_MAX  - maximum total vibrational quanta (scalar integer)
%
%   Output:
%     BASIS  - (N x 4) matrix of single-excitation basis vectors
%
%   See also: VIBRON_ZERO_EXC, VIBRON_DOUBLE_EXC, DIMHAMGEN

function output = vibron_single_exc(v_max)

%	Author: Jonathan D. Schultz
%	Email: jonathanschultz2022@u.northwestern.edu
%	Last revision date: February 1st, 2021
%
%	Copyright: Jonathan D. Schultz, 2021

%   Please see readme file for information about this package

n_basis = v_max^2 + 3*v_max+2;
basis = zeros(n_basis,4);

k = 1;
for n = 0:1    %index over ground and singly excited state
    m = not(n);
    for v_1 = 0:v_max
        for v_2 = 0:v_max-v_1
            basis(k,:) = [n, v_1, m, v_2];
            k = k+1;
        end
    end
end

output = basis;
