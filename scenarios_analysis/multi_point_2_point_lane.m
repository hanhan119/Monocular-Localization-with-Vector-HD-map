function point2=multi_point_2_point_lane(pc)
%输入一堆三维点，拟合一条直线，输出为空间两个端点x1,y1,z1,x2,y2,z2
% pc=pcread('D:\project\data\feature_piece\000001.pcd');
num = pc.Count;
Point1 = double([pc.Location(:,1) pc.Location(:,2) pc.Location(:,3)]);  
p0 = fitLine3d(Point1);
F1=@(p)costfunction_3dfit(p,Point1);
options = optimoptions('lsqnonlin','Algorithm','levenberg-marquardt','Display','off');
p= lsqnonlin(F1,p0,[],[],options);  
main_direction = find(abs(p(4:6)) == max(abs(p(4:6))));
switch main_direction
    case{1}
        t11=(min(Point1(:,1))-p(1))/p(4);
        t12=(max(Point1(:,1))-p(1))/p(4);
    case{2}
        t11=(min(Point1(:,2))-p(2))/p(5);
        t12=(max(Point1(:,2))-p(2))/p(5);
    case{3}
        t11=(min(Point1(:,3))-p(3))/p(6);
        t12=(max(Point1(:,3))-p(3))/p(6);
end
point2=[p(1)+t11*p(4),p(2)+t11*p(5),p(3)+t11*p(6);p(1)+t12*p(4),p(2)+t12*p(5),p(3)+t12*p(6)];