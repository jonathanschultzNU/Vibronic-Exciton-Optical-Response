% CMAP2D  Generate a diverging blue-white-red colormap for 2D spectra.
%
%   MAP = CMAP2D(NRB) creates a diverging colormap with NRB color levels
%   on each side of the white center, suitable for displaying signed 2D
%   spectral data (e.g., ground state bleach and excited state absorption).
%
%   The colormap transitions from blue (negative) through white (zero)
%   to red (positive), with NRB levels per half.
%
%   Input:
%     NRB  - number of color levels per half of the colormap (e.g., 10)
%
%   Output:
%     MAP  - ((8*NRB+2) x 3) RGB colormap array
%
%   See also: MDPLOT

function map2d=cmap2d(nrb);

rbmap = zeros(nrb*8-1,3);
rbmap(1:nrb,3) = (0.5+1/2/nrb:1/nrb/2:1)';
rbmap(nrb+1:4*nrb+1,3) = 1;
rbmap(nrb+1:3*nrb,2) = (1/2/nrb:1/nrb/2:1)';
rbmap(3*nrb+1:4*nrb,2) = 1;
rbmap(3*nrb+1:4*nrb,1) = rbmap(1:nrb,3);
rbmap(4*nrb+1:8*nrb-1,:)=fliplr(flipud(rbmap(1:4*nrb-1,:)));

a=(size(rbmap,1)-1)/2;

wones=ones(3,3);
rbmap2(1:a,:)=rbmap(1:a,:);
rbmap2(a+1:a+3,:)=wones;
rbmap2(a+4:2*a+4,:)=rbmap(a+1:end,:);


map2d=rbmap2;
