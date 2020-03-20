function uv = threeD2image(point,pose,Inter_Para_real)%pose:x,y,z,yaw,pitch,roll
uv = [];
R = eul2rotm(pose(4:6))';
t = -R* (pose(1:3)');
cloud_c=R*point+t;%列向量，很多列
UVZ=Inter_Para_real*cloud_c;%按行排
j=1;
if cloud_c(3)>0
    u=(UVZ(1)/UVZ(3));
    v=(UVZ(2)/UVZ(3));
    uv=[u v];
end

end