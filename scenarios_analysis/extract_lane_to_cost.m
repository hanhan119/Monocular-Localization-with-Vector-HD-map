function uv_lane_out = extract_lane_to_cost(lanes_line_points,initial_pose,pose,Inter_Para_real,resolution)
PIXEL_CANSEE=20;
lane_point_extracted=[];
uv_lane_out = [];
uv_lane = [];
R = eul2rotm(pose(4:6))';
R_i = eul2rotm(initial_pose(4:6))';

t = -R* (pose(1:3)');
t_i = -R_i* (initial_pose(1:3)');
for i_lane_point=1:1:size(lanes_line_points,1)
    
    cloud_c_i = R_i*lanes_line_points(i_lane_point,1:3)'+t_i;
   
    if (cloud_c_i(3)>5 && cloud_c_i(3)<35)
        lane_point_extracted = [lane_point_extracted; lanes_line_points(i_lane_point,1:3)];
    end
end

 cloud_c=R*lanes_line_points(i_lane_point,1:3)'+t;%列向量，很多列
lane_2_point = multi_point_2_point_lane(pointCloud(lane_point_extracted));
point1 = [lane_2_point(1,1:3) ]';
point2 = [lane_2_point(2,1:3) ]';

UVZ_i=Inter_Para_real*(R*point1+t);
u_1=(UVZ_i(1)/UVZ_i(3));
v_1=(UVZ_i(2)/UVZ_i(3));
UVZ_i_2=Inter_Para_real*(R*point2+t); 
u_2=(UVZ_i_2(1)/UVZ_i_2(3));
v_2=(UVZ_i_2(2)/UVZ_i_2(3));
uv_lane_out = [u_1 v_1 u_2 v_2 lanes_line_points(i_lane_point,4)];
end