function trj = load_trj()
trj = [];
Num_step = 200;

x1 = linspace(-150,0,90);
y1 = zeros(size(x1,1),size(x1,2))-11.75;
t = linspace(pi/2/20,pi/2-pi/2/20,18);
x2 = 11.75*sin(t);
y2 = -11.75*cos(t);
y3 = linspace(0, 150, 90);
x3 = zeros(size(y3,1),size(y3,2))+11.75;
trj = [x1',y1';x2',y2';x3',y3'];

R_initial = [0 0 1;-1 0 0;0 -1 0];
t_initial = [-150, -11.75, 1.8]';
angles = [];
for i = 1:1:size(trj,1)-1
    if (i==89)
        pause = 1;
    end
    sita = atan2(trj(i+1,2)-trj(i,2),trj(i+1,1)-trj(i,1));
    R = [ cos(sita) 0 -sin(sita); 0 1 0; sin(sita) 0 cos(sita)];
    t = [-trj(i,2)-11.75 0 trj(i,1)+150 ]';
    R_c2w = R_initial * R;
    t_c2w = R_initial * t +t_initial;%Xw = R_initial*(R*Xc+t)+t_initial
    eulZYX = rotm2eul(R_c2w);
    angles = [angles; eulZYX];
%     R = eul2rotm(eulZYX);
%     R = R - R_c2w
   
    
end
angles =[angles; eulZYX];
z = zeros(size(trj,1),1)+1.8;
trj=[trj z angles];
 %用x,y,z,yaw,pitch,roll描述车辆位姿。xyz是相机原点在大地下的坐标，yaw,pitch,roll算出的R是从相机坐标到大地坐标的旋转矩阵.满足Xw = R(yaw,pitch,roll)Xc+t
