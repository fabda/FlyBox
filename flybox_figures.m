% Flybox
% Fabrice Daian - CNRS - IBDM
% 2019
% License: GPL

% Function to save one figures for one box
% 3 graphics are displayed for every boxes:
% -- 1: Mean distance to the leftmost and dropmost droplet
% -- 2: Log2 ratio between mean distance to the leftmost and dropmost
% droplet (droplet preference)
% -- 3: Distance coordinates to the droplets wrt. time

function [aucg1,aucg2,aucg1_r,aucg2_r] = flybox_figures(B1,B1g1,B1g2,boxn)

figure('units','normalized','outerposition',[0 0 1 1])
set(gcf,'Name',boxn)
title(boxn)

% --- 1: Mean distance to the leftmost and dropmost droplet
subplot(1,3,1);
hold on;
plot(B1g1,'-r');
plot(B1g2,'b');
legend('LeftMost drop','RightMost drop');
xlabel('Time(Frames)');
ylabel('Mean Eculidean distance to drops center (px)');
set(gcf,'Color','white');
axis square
title({boxn,'Flies distance to drops'});

% --- 2: Log2 ratio between mean distance to the leftmost and dropmost
% droplet (droplet preference)
subplot(1,3,2);
hold on;
y=log2(B1);
plot(y,'-k');
xL=[0 numel(y)];
line(xL, [0 0],'LineStyle','-','LineWidth',2);  %y-axis
xlabel('Time(Frames)');
ylabel('Log2 mean euclidean distance ratio');
set(gcf,'color','white');
aucg1 = abs(trapz(y(y<0))); %Trapezoidal Numerical Integration
aucg2 = abs(trapz(y(y>=0)));%Trapezoidal Numerical Integration
aucg1_r = aucg1/numel(find(y<0));
aucg2_r = aucg2/numel(find(y>=0));

title({boxn,strcat('AUC preference drop1=',num2str(aucg1)),strcat('AUC preference drop2=',num2str(aucg2))});
axis square

% --- 3: Distance coordinates to the droplets (wrt. time)
subplot(1,3,3);
scatter(B1g1,B1g2,[],[1:size(B1g1,2)],'Marker','.');
xlabel('Mean Euclidean Distance to LeftMost Drop');
ylabel('Mean Euclidean Distance to RightMost Drop');
h=colorbar
ylabel(h,'Frames');
set(gcf,'color','white')
title({boxn,'Flies Behavior'})
xL=xlim;
yL=ylim;
if (xL>=yL)
    xlim([0 xL(2)])
    ylim([0 xL(2)])
else
    xlim([0 yL(2)])
    ylim([0 yL(2)])
end
axis square