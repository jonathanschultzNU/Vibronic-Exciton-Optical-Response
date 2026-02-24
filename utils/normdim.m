% NORMDIM  Normalize a 1D or 2D array by its absolute maximum value.
%
%   OUT = NORMDIM(DATA) divides DATA by its maximum absolute value, such
%   that the output ranges from -1 to 1 (for signed data) or 0 to 1
%   (for non-negative data).
%
%   Supports:
%     - 1D vectors: normalized by max(abs(DATA))
%     - 2D matrices: normalized by max(max(abs(DATA)))
%
%   Input:
%     DATA - numeric vector or matrix (1D or 2D)
%
%   Output:
%     OUT  - normalized array of the same size as DATA
%
%   Note: DATA with more than 2 dimensions is not supported and will
%   return an empty output.
%
%   See also: MDPLOT

function out = normdim(data)

%	Author: Jonathan D. Schultz
%	Email: jonathanschultz2022@u.northwestern.edu
%	Last revision date: February 1st, 2021
%
%	Copyright: Jonathan D. Schultz, 2021

%   Please see readme file for information about this package

d = ndims(data);

out = [];

if d == 1
    out = data./max(abs(data));
end

if d == 2
    out = data./max(max((abs(data))));
end

end
