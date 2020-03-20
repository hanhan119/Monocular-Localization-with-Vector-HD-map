function lamps = load_lamps()
lamps=[];
y =0:15:50;
x = zeros(1,length(y));
lamps = [lamps;x' y'];


x = x+20;
lamps = [lamps;x' y'];

y =60:30:150;
x = zeros(1,length(y));
lamps = [lamps;x' y'];


x = x+20;
lamps = [lamps;x' y'];



x=-15:-15:-50;
y = zeros(1,length(x));
lamps = [lamps;x' y'];

y=y-20;
lamps = [lamps;x' y'];

x=-60:-30:-150;
y = zeros(1,length(x));
lamps = [lamps;x' y'];

y=y-20;
lamps = [lamps;x' y'];

x=0:10:20;
y = zeros(1,length(x))-20;
lamps = [lamps;x' y'];

y=-10:-10:-10;
x = zeros(1,length(y))+20;

lamps = [lamps;x' y'];

% scatter(lamps(:,1),lamps(:,2));
lamps = [lamps zeros(size(lamps,1),1)];
%ÃÌº””Ô“Â Ù–‘
lamps = lamps + round(rand(size(lamps,1),size(lamps,2)));
lamps = [lamps (1:1:size(lamps,1))'];
% scatter(lamps(:,1),lamps(:,2));
for i=1:1:size(lamps,1)
    lamp_two_points{i} = [lamps(i,:);lamps(i,:)+[0 0 3.5 0]];
end
lamps = lamp_two_points; 
