% Flybox
% Fabrice Daian - CNRS - IBDM
% 2019
% License: GPL


%% --- Preliminary : Choose a Video to analyze
close all
[FileName,PathName,FilterIndex] = uigetfile({'*.avi','*.mp4'},'Choose a film to analyze:')

v=VideoReader(fullfile(PathName,FileName));

debut=inputdlg('FROM which second TO which second do you want to analyze ? FROM :');
debut=str2num(debut{1});

fin=inputdlg('FROM which second TO which second do you want to analyze ? TO   :');
fin=str2num(fin{1});

tim = linspace(debut,fin,100);

v.CurrentTime=debut;

% --- Extract Video Framerate to keep only ONE image per second
FR = round(v.FrameRate);


%% --- Step1: Threshold the first frame to extract droplets
IDX = 1;

A=readFrame(v);
h_im = imshow(A,[]);

B = rgb2hsv(A);
C = B(:,:,2);
F = imclearborder(bwareaopen(C>0.5,50));
s = regionprops(F,'Centroid');
c = round(cat(1,s.Centroid));

% --- Step1.2: Calculate the droplet radius 
Radius = 10;
[columnsInImage,rowsInImage] = meshgrid(1:size(A,2), 1:size(A,1));
M=zeros(size(A,1),size(A,2));
for i=1:size(c,1)
    centerX=c(i,1);
    centerY=c(i,2);
    radius = 30;
    circlePixels = (rowsInImage - centerY).^2 + (columnsInImage - centerX).^2 <= radius.^2;
    M=M+circlePixels;
end

% --- Step 1.3: User select exactly 6 Boxes (arenas)
imshow(A,[]);
COND={};
LM={};
RM={};
% --- --- Box n°1
h=imrect();
position = wait(h);
cond=inputdlg('Which condition (Box) ?');
COND{1}=cond{1};
lm = inputdlg('Left most drop contains ?');
LM{1}=strcat(COND{1},'_',lm{1});
rm = inputdlg('Right most drop contains ?');
RM{1}=strcat(COND{1},'_',rm{1});
b1 = createMask(h);
a = regionprops(logical(b1.*M),'Centroid');
if (numel(a)==2)
b1g1 = a(1).Centroid;
b1g2 = a(2).Centroid;
hold on;
plot(b1g1(1),b1g1(2),'or','LineWidth',20);
plot(b1g2(1),b1g2(2),'ob','LineWidth',20);
p1=h.getPosition;
end

% --- --- Box n°2
h=imrect();
position = wait(h);
cond=inputdlg('Which conditions ?');
COND{2}=cond{1};
lm = inputdlg('Left most drop contains ?');
LM{2}=strcat(COND{2},'_',lm{1});
rm = inputdlg('Right most drop contains ?');
RM{2}=strcat(COND{2},'_',rm{1});
b2 = createMask(h);
a = regionprops(logical(b2.*M),'Centroid');
if (numel(a)==2)
b2g1 = a(1).Centroid;
b2g2 = a(2).Centroid;
hold on;
plot(b2g1(1),b2g1(2),'or','LineWidth',20);
plot(b2g2(1),b2g2(2),'ob','LineWidth',20);
p2=h.getPosition;
end

% --- --- Box n°3
h=imrect();
position = wait(h);
cond=inputdlg('Which conditions ?');
COND{3}=cond{1};
lm = inputdlg('Left most drop contains ?');
LM{3}=strcat(COND{3},'_',lm{1});
rm = inputdlg('Right most drop contains ?');
RM{3}=strcat(COND{3},'_',rm{1});
b3 = createMask(h);
a = regionprops(logical(b3.*M),'Centroid');
if (numel(a)==2)
b3g1 = a(1).Centroid;
b3g2 = a(2).Centroid;
hold on;
plot(b3g1(1),b3g1(2),'or','LineWidth',20);
plot(b3g2(1),b3g2(2),'ob','LineWidth',20);
p3=h.getPosition;
end

% --- --- Box n°4
h=imrect();
position = wait(h);
cond=inputdlg('Which conditions ?');
COND{4}=cond{1};
lm = inputdlg('Left most drop contains ?');
LM{4}=strcat(COND{4},'_',lm{1});
rm = inputdlg('Right most drop contains ?');
RM{4}=strcat(COND{4},'_',rm{1});
b4 = createMask(h);
a = regionprops(logical(b4.*M),'Centroid');
if (numel(a)==2)
b4g1 = a(1).Centroid;
b4g2 = a(2).Centroid;
hold on;
plot(b4g1(1),b4g1(2),'or','LineWidth',20);
plot(b4g2(1),b4g2(2),'ob','LineWidth',20);
p4=h.getPosition;
end

% --- --- Box n°5
h=imrect();
position = wait(h);
cond=inputdlg('Which conditions ?');
COND{5}=cond{1};
lm = inputdlg('Left most drop contains ?');
LM{5}=strcat(COND{5},'_',lm{1});
rm = inputdlg('Right most drop contains ?');
RM{5}=strcat(COND{5},'_',rm{1});
b5 = createMask(h);
a = regionprops(logical(b5.*M),'Centroid');
if (numel(a)==2)
b5g1 = a(1).Centroid;
b5g2 = a(2).Centroid;
hold on;
plot(b5g1(1),b5g1(2),'or','LineWidth',20);
plot(b5g2(1),b5g2(2),'ob','LineWidth',20);
p5=h.getPosition;
end

% --- --- Box n°6
h=imrect();
position = wait(h);
cond=inputdlg('Which conditions ?');
COND{6}=cond{1};
lm = inputdlg('Left most drop contains ?');
LM{6}=strcat(COND{6},'_',lm{1});
rm = inputdlg('Right most drop contains ?');
RM{6}=strcat(COND{6},'_',rm{1});
b6 = createMask(h);
a = regionprops(logical(b6.*M),'Centroid');
if (numel(a)==2)
b6g1 = a(1).Centroid;
b6g2 = a(2).Centroid;
hold on;
plot(b6g1(1),b6g1(2),'or','LineWidth',20);
plot(b6g2(1),b6g2(2),'ob','LineWidth',20);
p6=h.getPosition;
end


%% --- Step 2: Acquiring statistics for every frames within every boxes

GOUTTE = F; 
IDX=1;
B1=[]; B1g1=[]; B1g2=[]; %Stat Box1
B2=[]; B2g1=[]; B2g2=[]; %Stat Box2
B3=[]; B3g1=[]; B3g2=[]; %Stat Box3
B4=[]; B4g1=[]; B4g2=[]; %Stat Box4
B5=[]; B5g1=[]; B5g2=[]; %Stat Box5
B6=[]; B6g1=[]; B6g2=[]; %Stat Box6

while (hasFrame(v) && v.CurrentTime<=fin)
    
    A=readFrame(v);
    G=imgaussfilt(A(:,:,1),2)-imgaussfilt(A(:,:,1),1);
    
    cla;
    imshow(A,[]);
    drawnow;
    hold on;
    
    % --- Box n°1
    image = logical(double(G>mean2(G)+11.*std2(G)).*double(~GOUTTE).*double(b1)); 
    if (sum(sum(image)))==0
        image = logical(double(G>mean2(G)+9.*std2(G)).*double(~GOUTTE).*double(b1));
    end
    s=regionprops(image,'Centroid');
    c=cat(1,s.Centroid);
    plot(c(:,1),c(:,2),'.r');
    a=mean(pdist2(cat(1,s.Centroid),b1g1,'euclidean'));
    b=mean(pdist2(cat(1,s.Centroid),b1g2,'euclidean'));
    B1g1(IDX)=a;B1g2(IDX)=b;B1(IDX)=a./b;

    % --- Box n°1
    image2 = logical(double(G>mean2(G)+11.*std2(G)).*double(~GOUTTE).*double(b2)); 
    if (sum(sum(image2)))==0
        image2 = logical(double(G>mean2(G)+9.*std2(G)).*double(~GOUTTE).*double(b1));
    end
    s=regionprops(image2,'Centroid');
    c=cat(1,s.Centroid);
    plot(c(:,1),c(:,2),'.g');
    a=mean(pdist2(cat(1,s.Centroid),b2g1,'euclidean'));
    b=mean(pdist2(cat(1,s.Centroid),b2g2,'euclidean'));
    B2g1(IDX)=a;B2g2(IDX)=b;B2(IDX)=a./b;

    % --- Box n°3
    image3 = logical(double(G>mean2(G)+11.*std2(G)).*double(~GOUTTE).*double(b3)); 
    if (sum(sum(image3)))==0
        image3 = logical(double(G>mean2(G)+9.*std2(G)).*double(~GOUTTE).*double(b1));
    end
    s=regionprops(image3,'Centroid');
    c=cat(1,s.Centroid);
    plot(c(:,1),c(:,2),'.m');
    a=mean(pdist2(cat(1,s.Centroid),b3g1,'euclidean'));
    b=mean(pdist2(cat(1,s.Centroid),b3g2,'euclidean'));
    B3g1(IDX)=a;B3g2(IDX)=b;B3(IDX)=a./b;

    % --- Box n°4
    image4 = logical(double(G>mean2(G)+11.*std2(G)).*double(~GOUTTE).*double(b4)); 
    if (sum(sum(image4)))==0
        image4 = logical(double(G>mean2(G)+9.*std2(G)).*double(~GOUTTE).*double(b1));
    end
    s=regionprops(image4,'Centroid');
    c=cat(1,s.Centroid);
    plot(c(:,1),c(:,2),'.w');
    a=mean(pdist2(cat(1,s.Centroid),b4g1,'euclidean'));
    b=mean(pdist2(cat(1,s.Centroid),b4g2,'euclidean'));
    B4g1(IDX)=a;B4g2(IDX)=b;B4(IDX)=a./b;

    % --- Box n°5
    image5 = logical(double(G>mean2(G)+11.*std2(G)).*double(~GOUTTE).*double(b5));
    if (sum(sum(image5)))==0
        image5 = logical(double(G>mean2(G)+9.*std2(G)).*double(~GOUTTE).*double(b1));
    end
    s=regionprops(image5,'Centroid');
    c=cat(1,s.Centroid);
    plot(c(:,1),c(:,2),'.c');
    a=mean(pdist2(cat(1,s.Centroid),b5g1,'euclidean'));
    b=mean(pdist2(cat(1,s.Centroid),b5g2,'euclidean'));
    B5g1(IDX)=a;B5g2(IDX)=b;B5(IDX)=a./b;
    
    % --- Box n°6
    image6 = logical(double(G>mean2(G)+11.*std2(G)).*double(~GOUTTE).*double(b6));
    if (sum(sum(image6)))==0
        image6 = logical(double(G>mean2(G)+9.*std2(G)).*double(~GOUTTE).*double(b1));
    end
    s=regionprops(image6,'Centroid');
    c=cat(1,s.Centroid);
    plot(c(:,1),c(:,2),'.y');
    a=mean(pdist2(cat(1,s.Centroid),b6g1,'euclidean'));
    b=mean(pdist2(cat(1,s.Centroid),b6g2,'euclidean'));
    B6g1(IDX)=a;B6g2(IDX)=b;B6(IDX)=a./b;
    
    drawnow;
    
    IDX=IDX+1;
    IDX
end

%% --- Step 3: Making Figures
%Figures
[a_b1g1,a_b1g2,ar_b1g1,ar_b1g2] = flybox_figures(B1,B1g1,B1g2,'Box1');
[a_b2g1,a_b2g2,ar_b2g1,ar_b2g2] = flybox_figures(B2,B2g1,B2g2,'Box2');
[a_b3g1,a_b3g2,ar_b3g1,ar_b3g2] = flybox_figures(B3,B3g1,B3g2,'Box3');
[a_b4g1,a_b4g2,ar_b4g1,ar_b4g2] = flybox_figures(B4,B4g1,B4g2,'Box4');
[a_b5g1,a_b5g2,ar_b5g1,ar_b5g2] = flybox_figures(B5,B5g1,B5g2,'Box5');
[a_b6g1,a_b6g2,ar_b6g1,ar_b6g2] = flybox_figures(B6,B6g1,B6g2,'Box6');

%% --- Step 4: Making Stat File

filename = strcat('stats_',strrep(FileName,'.avi',''),'___',num2str(debut),'_',num2str(fin),'.csv')

T=array2table([a_b1g1 a_b1g2 ar_b1g1 ar_b1g2
    a_b2g1 a_b2g2 ar_b2g1 ar_b2g2
    a_b3g1 a_b3g2 ar_b3g1 ar_b3g2
    a_b4g1 a_b4g2 ar_b4g1 ar_b4g2
    a_b5g1 a_b5g2 ar_b5g1 ar_b5g2
    a_b6g1 a_b6g2 ar_b6g1 ar_b6g2
    ])
T=[COND' LM' RM' T];
T.Properties.VariableNames={'Condition','LeftMost','RightMost','AUC_LeftMost','AUC_RightMost','AUC_Norm_RightMost','AUC_Norm_LeftMost'}
T.Properties.RowNames={'Box1','Box2','Box3','Box4','Box5','Box6'};

%% --- Step 5: Saving Figures and Files

save_directory = strcat('stats_',strrep(FileName,'.avi',''),'___',num2str(debut),'_',num2str(fin));
mkdir(save_directory)
cd(save_directory)
% --- Step 5.1: saving statistics
writetable(T,filename,'WriteRowNames',true);

% --- Step 5.2: saving figures
imagewd = getframe(gcf); 
imwrite(imagewd.cdata, 'box6.tiff');
close gcf

imagewd = getframe(gcf); 
imwrite(imagewd.cdata, 'box5.tiff');
close gcf

imagewd = getframe(gcf); 
imwrite(imagewd.cdata, 'box4.tiff');
close gcf

imagewd = getframe(gcf); 
imwrite(imagewd.cdata, 'box3.tiff');
close gcf

imagewd = getframe(gcf); 
imwrite(imagewd.cdata, 'box2.tiff');
close gcf

imagewd = getframe(gcf); 
imwrite(imagewd.cdata, 'box1.tiff');
close gcf

saveas(gcf,'Boxes_Images.png');
close gcf

% --- Step 5.3: saving Fly positions

F = array2table([B1g1' B1g2' B1' B2g1' B2g2' B2' B3g1' B3g2' B3' B4g1' B4g2' B4' B5g1' B5g2' B5' B6g1' B6g2' B6']);
F.Properties.VariableNames={'Box1_LM','Box1_RM','Box1_r','Box2_LM','Box2_RM','Box2_r','Box3_LM','Box3_RM','Box3_r','Box4_LM','Box4_RM','Box4_r','Box5_LM','Box5_RM','Box5_r','Box6_LM','Box6_RM','Box6_r'}
filename=strcat('Distances_',strrep(FileName,'.avi',''),'___',num2str(debut),'_',num2str(fin),'.csv')
writetable(F,filename);

%file has been saved in ....
cd('..')

strcat('File has been saved into:',{' '},fullfile(pwd,save_directory),'\')

