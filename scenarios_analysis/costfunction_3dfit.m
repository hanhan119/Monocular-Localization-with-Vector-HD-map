function out=costfunction_3dfit(p,Point1)
for i=1:1:size(Point1,1)
    out(i)=norm(cross(Point1(i,:)-[p(1) p(2) p(3)],[p(4) p(5) p(6)]),2)/norm([p(4) p(5) p(6)],2);
end