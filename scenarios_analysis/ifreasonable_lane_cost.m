function out = ifreasonable_lane_cost(uv_lamp1,uv_lamp2,line)
%line是识别的
out = 1;
P1=[uv_lamp1(1); uv_lamp1(2)];
P2=[uv_lamp2(1); uv_lamp2(2)];
Q1=[line(1); line(2)];
Q2=[line(3); line(4)];
if max(Q1(2),Q2(2)) - min(P1(2),P2(2)) <2 || min(Q1(2),Q2(2)) - max(P1(2),P2(2)) > -2
    out = 0;
    return
end
end