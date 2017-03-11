%Fitting a curve to a piecewise linear function using least square method
%with the fixed start and end points

%clear command windows
clc;

%clear workspace
clear all;
%--------------------------------------------------------------------------
%Read curves
load Curve.dat;

%find lower left and upper right corners 
xD=Curve(1,:);
yD=Curve(2,:);
x0=min(xD); x1=max(xD); 
y0=min(yD);  y1=max(yD);
n=5;%order n i.e, the number of segments
FS=x1-x0;
global xs;
global yB;
global yE;
xs=(0:FS/n:FS);
yB=y0;
yE=y1;
%initialize coefficients (y values) to find 
%excluding the first and the last one
ys_initial=xs(2:n);
% options = optimset('MaxFunEvals',1000,'MaxIter',1000);
% LowerBoundC=y0;
% UpperBoundC=y1;
% ys =lsqcurvefit(@LineSeg,ys_initial,xD,yD,LowerBoundC,UpperBoundC,options);
ys =lsqcurvefit(@LineSeg,ys_initial,xD,yD);
%fixed start and end points
ys=[y0 ys y1];
%--------------------------------------------------------------------------
%Plot 
hFig1 = figure(1);
set(hFig1, 'Position', [600 100 500 300])
plot(xD,yD,':g','LineWidth',3,...
                'MarkerEdgeColor','b',...
                'MarkerFaceColor','b',...
                'MarkerSize',2)
hold on;             
plot(xs,ys,'-rs','LineWidth',1,...
     'MarkerEdgeColor','r',...
     'MarkerFaceColor','r',...
     'MarkerSize',4)
hold off;        
grid on;
%--------------------------------------------------------------------------