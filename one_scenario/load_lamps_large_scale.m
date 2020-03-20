function lamps = load_lamps_large_scale()
lamps=[];
scale =  5;
x=[-15:-15:-150 -170:-20:-310 -330:-30:-450 -490:-40:-610 -650:-50:-750 30:15:75];
y = zeros(1,length(x));
lamps = [lamps;x' y'];

y=y-20;
lamps = [lamps;x'+15 y'];



y=-x;
x = zeros(1,length(y));
lamps = [lamps;x' y'];
x = x+20;
lamps = [lamps;x' y'+15];


lamps = [lamps zeros(size(lamps,1),1)];
%ÃÌº””Ô“Â Ù–‘
lamps = lamps + round(rand(size(lamps,1),size(lamps,2)));
lamps = [lamps (1:1:size(lamps,1))'];
scatter(lamps(:,1),lamps(:,2));
for i=1:1:size(lamps,1)
    lamp_two_points{i} = [lamps(i,:);lamps(i,:)+[0 0 3.5 0]];
end
lamps = lamp_two_points; 
