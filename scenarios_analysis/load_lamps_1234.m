function lamps = load_lamps_1234(mood)
lamps=[];
% x=[0 0 20 20 40 40];
% y=[-20 0 -20 0 -20 0];
x=[5 5 2 2 0 0 ];
y=[-15 -5 -20 0 -25 5];

lamp_two_points=[];


lamps = [lamps;x' y'];

lamps = [lamps zeros(size(lamps,1),1)];
%ÃÌº””Ô“Â Ù–‘
lamps = [lamps (1:1:size(lamps,1))'];%id
lamps = lamps(1:mood,:);
% scatter(lamps(:,1),lamps(:,2));
for i=1:1:size(lamps,1)
    lamp_two_points{i} = [lamps(i,:);lamps(i,:)+[0 0 3.5 0]];
end
lamps = lamp_two_points; 
