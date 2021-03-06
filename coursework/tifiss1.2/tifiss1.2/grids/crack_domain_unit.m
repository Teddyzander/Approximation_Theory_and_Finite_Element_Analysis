%CRACK_DOMAIN_UNIT unit crack domain (crack on the right) structured grid generator
%
% Crack domain generated: (0,1)^2 \ (1/2,1)x{1/2}.
% Grid defining data is saved to the file: /datafiles/crack_grid.mat
%
%   TIFISS scriptfile: LR; 22 June 2018
% Copyright (c) 2018 A. Bespalov, L. Rocchi

% Global variables
  global slope1crack
  global slope2crack

% Fixed point of the slit Pf=(0.5,0.5) (the origin)  
  xf = 0.5;
  yf = 0.5;
  
% The following variable 'yPstar' is half of the "height" of the slit occurring 
% on the line (1/2,1)x{1/2}. The slit is then created by defining two points
% (see below)
% - P1 = (xP1,yP1) = (1,0.5-yPstar) 
% - P2 = (xP2,yP2) = (1,0.5+yPstar)
% which are connected with the "fixed" point of the crack Pf=(xf,yf)=(0.5,0.5), 
% i.e., the origin in this case. Hence: 
% - smaller values of yPstar -> smaller slit (default=0.005)
% - larger values of yPstar  -> large slit 
  yPstar = 0.005;   
    
% Point P1 on the right vertical boundary (below)
  xP1 = +1.0;
  yP1 = yf - yPstar;  
  
% Point P2 on the right vertical boundary (above)
  xP2 = +1.0;
  yP2 = yf + yPstar;
 
% Slopes  
  slope1crack = yPstar / (-0.5);
  slope2crack = yPstar / (+0.5);
  
% Point along line (xf,yf)--(xP1,yP1)
  xP3 = 0.7500;
  yP3 = slope1crack * (xP3 - xf) + yf;
  
% Point along line (xf,yf)--(xP2,yP2)  
  xP4 = 0.7500;
  yP4 = slope2crack * (xP4 - xf) + yf;

% -------------------------------------------------------------------------
% Mesh
% -------------------------------------------------------------------------
% Vertices coordinates map
  xy = [ 0.0000    0.0000; ...
         0.2500    0.0000; ...
         0.5000    0.0000; ...
         0.7500    0.0000; ...
         1.0000    0.0000; ...
         0.0000    0.2500; ...
         0.2500    0.2500; ...
         0.5000    0.2500; ...
         0.7500    0.2500; ...
         1.0000    0.2500; ... 
         0.0000    0.5000; ...
         0.2500    0.5000; ... 
             xf        yf; ...
            xP3       yP3; ...
            xP1       yP1; ...
            xP4       yP4; ...
            xP2       yP2; ...
         0.0000    0.7500; ...  
         0.2500    0.7500; ...
         0.5000    0.7500; ...
         0.7500    0.7500; ...
         1.0000    0.7500; ...
         0.0000    1.0000; ...
         0.2500    1.0000; ...
         0.5000    1.0000; ...
         0.7500    1.0000; ...
         1.0000    1.0000]; 
    
% Elements map
  evt = [ 7     6     1; ...
          1     2     7; ...
          7     2     3; ...
          3     8     7; ...
          7     8    13; ...
         13    12     7; ...
          7    12    11; ...
         11     6     7; ...
          9     8     3; ...
          3     4     9; ...
          9     4     5; ...
          5    10     9; ...
          9    10    15; ...
         15    14     9; ...
          9    14    13; ...
         13     8     9; ...
         19    18    11; ...
         11    12    19; ...
         19    12    13; ...
         13    20    19; ...
         19    20    25; ...
         25    24    19; ...
         19    24    23; ...
         23    18    19; ...
         21    20    13; ...
         13    16    21; ...
         21    16    17; ...
         17    22    21; ...
         21    22    27; ...
         27    26    21; ...
         21    26    25; ...
         25    20    21];   

% Boundary elements/edges
  eboundt = [  1    1; ...
               2    3; ...
               3    1; ...
               8    3; ...
              10    3; ...
              11    1; ...
              12    3; ...
              13    1; ...
              14    3; ...
              15    1; ...
              17    1; ...
              22    3; ...
              23    1; ...
              24    3; ...
              26    3; ...
              27    1; ...    
              28    3; ...
              29    1; ...
              30    3; ...
              31    1];
              
% Interior nodes
  interior = [7 8 9 12 19 20 21]';
  
% Boundary nodes
  totalnodes = 1:size(xy,1);
  bound = totalnodes(~ismember(totalnodes,interior))';

% How coarse the mesh has to be?
  nc = default('\nCoarse grid parameter: 2 for underlying 8x4 grid (default is 3 for 16x8)',3);
  if nc<1, error('Illegal parameter choice, try again.'); end
  
% Uniform refinements (if any)  
  for i = 2:(nc-1)
      [xy,evt,bound,interior,eboundt] = uniform_refinement(xy,evt,bound,eboundt,2);
  end
  
% Save data
  gohome; cd datafiles;
  save crack_grid.mat xy evt bound interior eboundt xP1 yP1 xP2 yP2 xf yf; 
  
% end scriptfile