function uv_lane_out = extract_lane(lanes_line_points,pose,Inter_Para_real,resolution)
PIXEL_CANSEE=20;
lane_point_extracted=[];
uv_lane_out = [];
uv_lane = [];
for i_lane_point=1:1:size(lanes_line_points,1)
    R = eul2rotm(pose(4:6))';
    t = -R* (pose(1:3)');
    cloud_c=R*lanes_line_points(i_lane_point,1:3)'+t;%列向量，很多列
    if (cloud_c(3)>5 && cloud_c(3)<35)
        %         lane_point_extracted = [lane_point_extracted; lanes_line_points(i_lane_point,:)];
        UVZ=Inter_Para_real*cloud_c;
        u=(UVZ(1)/UVZ(3));
        v=(UVZ(2)/UVZ(3));
        if is_in_view ([u v],resolution)
            uv_lane=[uv_lane; u v lanes_line_points(i_lane_point,4)] ;
        end
    end
end
if size(uv_lane,1) >1
    uv_lane_sorted = sortrows(uv_lane,1);
    if norm(uv_lane_sorted(1,1:2)-uv_lane_sorted(end,1:2),2)>PIXEL_CANSEE
        uv_lane_out = [uv_lane_sorted(1,1:2)  uv_lane_sorted(end,:)];
    end
    
    
end