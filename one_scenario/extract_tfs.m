function uv_tfs_out = extract_lane(tfs_points,pose,Inter_Para_real,resolution)
uv_tfs_out = [];
    R = eul2rotm(pose(4:6))';
    t = -R* (pose(1:3)');
    cloud_c=R*tfs_points(1:3)'+t;%列向量，很多列
    if (cloud_c(3)>5 && cloud_c(3)<30)
%         lane_point_extracted = [lane_point_extracted; lanes_line_points(i_lane_point,:)];
        UVZ=Inter_Para_real*cloud_c;
        u=(UVZ(1)/UVZ(3));
        v=(UVZ(2)/UVZ(3));
        if is_in_view ([u v],resolution)
            uv_tfs_out=[uv_tfs_out; u v tfs_points(4)] ;
        end
    end
    

end