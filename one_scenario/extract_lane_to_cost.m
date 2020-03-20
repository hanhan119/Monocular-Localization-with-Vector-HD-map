function uv_lane_out = extract_lane_to_cost(lanes_line_points,initial_pose,pose,Inter_Para_real,resolution)
PIXEL_CANSEE=20;
lane_point_extracted=[];
uv_lane_out = [];
uv_lane = [];
for i_lane_point=1:1:size(lanes_line_points,1)
    R = eul2rotm(pose(4:6))';
    R_i = eul2rotm(initial_pose(4:6))';
    
    t = -R* (pose(1:3)');
    t_i = -R_i* (initial_pose(1:3)');
    cloud_c_i = R_i*lanes_line_points(i_lane_point,1:3)'+t_i;
    cloud_c=R*lanes_line_points(i_lane_point,1:3)'+t;%列向量，很多列
    if (cloud_c_i(3)>5 && cloud_c_i(3)<35)
        %         lane_point_extracted = [lane_point_extracted; lanes_line_points(i_lane_point,:)];
        UVZ_i=Inter_Para_real*cloud_c_i;
        u_i=(UVZ_i(1)/UVZ_i(3));
        v_i=(UVZ_i(2)/UVZ_i(3));
        

        if is_in_view_rough ([u_i v_i],resolution)
            UVZ=Inter_Para_real*cloud_c;
            u=(UVZ(1)/UVZ(3));
            v=(UVZ(2)/UVZ(3));
            uv_lane=[uv_lane; u v lanes_line_points(i_lane_point,4)] ;
        end
    end
end
if size(uv_lane,1) >1
    uv_lane_sorted = sortrows(uv_lane,1);
        uv_lane_out = [uv_lane_sorted(1,1:2)  uv_lane_sorted(end,:)];
end