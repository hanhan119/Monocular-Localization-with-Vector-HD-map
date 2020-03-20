function iamge2= show_reproj(image1,pose,pose_gt,perception_bag_i,MAP,Inter_Para_real,i_step)

resolution=[768,480];
cost = [];
%µÆ¸ËµÄÔ¼Êø
for i=1:1:size(perception_bag_i{1},1)
     id_lamp= find(MAP{1}(:,4)==perception_bag_i{1}(i,5));
     map_lane_points = MAP{1}(id_lamp,1:3);
     uv_lamp1 = threeD2image_cost(map_lane_points(1,:)',pose,Inter_Para_real);
     uv_lamp2 = threeD2image_cost(map_lane_points(2,:)',pose,Inter_Para_real);
     image1=insertShape(image1,'line',[uv_lamp1(1) uv_lamp1(2) uv_lamp2(1) uv_lamp2(2)], 'LineWidth', 3,'Color','blue');
end


for i=1:1:size(perception_bag_i{2},1)
    %extract_lane
    lane_point_index = find(MAP{2}(:,4)==perception_bag_i{2}(i,5));
    uv_lane = extract_lane_to_cost(MAP{2}(lane_point_index,:),pose_gt,pose,Inter_Para_real,resolution);
    image1=insertShape(image1,'line',[uv_lane(1) uv_lane(2) uv_lane(3) uv_lane(4)], 'LineWidth', 3,'Color','blue');
end
iamge2=image1;