function cost = cost_function(pose,pose_initial,perception_bag_i,MAP,Inter_Para_real,i_step)
resolution=[768,480];
cost = [];
%µÆ¸ËµÄÔ¼Êø
for i=1:1:size(perception_bag_i{1},1)
     id_lamp= find(MAP{1}(:,4)==perception_bag_i{1}(i,5));
     map_lane_points = MAP{1}(id_lamp,1:3);
     for i_p_l=1:1:2
         uv_lamp1 = threeD2image_cost(map_lane_points(1,:)',pose,Inter_Para_real);
         uv_lamp2 = threeD2image_cost(map_lane_points(2,:)',pose,Inter_Para_real);
     end
     dis_1 = dis_p2l(uv_lamp1,perception_bag_i{1}(i,1:2),perception_bag_i{1}(i,3:4));
     dis_2 = dis_p2l(uv_lamp2,perception_bag_i{1}(i,1:2),perception_bag_i{1}(i,3:4));
     if dis_1 >10 || dis_2 >10
         aa=1;
     end
     cost = [cost dis_1 dis_2];
end

for i=1:1:size(perception_bag_i{2},1)
    %extract_lane
    lane_point_index = find(MAP{2}(:,4)==perception_bag_i{2}(i,5));
    uv_lane = extract_lane_to_cost(MAP{2}(lane_point_index,:),pose_initial,pose,Inter_Para_real,resolution);
    if length(uv_lane) >1
        
        dis_1 = dis_p2l(uv_lane(1:2),perception_bag_i{2}(i,1:2),perception_bag_i{2}(i,3:4));
        dis_2 = dis_p2l(uv_lane(3:4),perception_bag_i{2}(i,1:2),perception_bag_i{2}(i,3:4));
        if dis_1 >10 || dis_2 >10
            aa=1;
        end
        cost = [cost dis_1 dis_2];
    else
%         disp(['wrong: lane not extracted!']);
    end
end
for i=1:1:size(perception_bag_i{3},1)
    index = find(MAP{3}(:,4)==perception_bag_i{3}(i,3));
    uv_p = threeD2image_cost(MAP{3}(index,1:3)',pose,Inter_Para_real);
    if norm(uv_p - perception_bag_i{3}(i,1:2)) >10 
        aa=1;
    end
    cost = [cost norm(uv_p - perception_bag_i{3}(i,1:2))];


end