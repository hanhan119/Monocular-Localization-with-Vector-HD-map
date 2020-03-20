function lamps = load_lamps_batch(intensity)
lamps=[];
scale =  5;



y =[0:intensity:150 -20:-intensity:-150]+scale*randn();
x = zeros(1,length(y))+scale*randn();
lamps = [lamps;x' y'];


x = x+20+scale*randn();
lamps = [lamps;x' y'+15]+scale*randn();
% 
% y =60:intensity:150;
% x = zeros(1,length(y));
% lamps = [lamps;x' y'];
% 
% 
% x = x+20;
% lamps = [lamps;x' y'];



x=[-15:-intensity:-150 20+intensity:intensity:150]+scale*randn();
y = zeros(1,length(x))+scale*randn();
lamps = [lamps;x' y'];

y=y-20+scale*randn();
lamps = [lamps;x'+15 y']+scale*randn();
% 
% x=-60:-intensity:-150;
% y = zeros(1,length(x));
% lamps = [lamps;x' y'];
% 
% y=y-20;
% lamps = [lamps;x' y'];

% x=0:intensity:20;
% y = zeros(1,length(x))-20;
% lamps = [lamps;x' y'];

% y=-10:-10:-10;
% x = zeros(1,length(y))+20;

% lamps = [lamps;x' y'];


lamps = [lamps zeros(size(lamps,1),1)];
%ÃÌº””Ô“Â Ù–‘
lamps = lamps + round(rand(size(lamps,1),size(lamps,2)));
lamps = [lamps (1:1:size(lamps,1))'];%id
scatter(lamps(:,1),lamps(:,2));
for i=1:1:size(lamps,1)
    lamp_two_points{i} = [lamps(i,:);lamps(i,:)+[0 0 3.5 0]];
end
lamps = lamp_two_points; 
