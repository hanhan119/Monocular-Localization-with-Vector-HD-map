function image_out = show_me_the_image (perception_bag_i)
% resolution=[1226,370];
resolution=[768,480];
image0 = zeros(resolution(2),resolution(1));
for i=1:1:size(perception_bag_i{1},1)
     image0=insertShape(image0,'line',[perception_bag_i{1}(i,1) perception_bag_i{1}(i,2) perception_bag_i{1}(i,3) perception_bag_i{1}(i,4)], 'LineWidth', 3,'Color','red');
end
for i=1:1:size(perception_bag_i{2},1)
     image0=insertShape(image0,'line',[perception_bag_i{2}(i,1) perception_bag_i{2}(i,2) perception_bag_i{2}(i,3) perception_bag_i{2}(i,4)], 'LineWidth', 3,'Color','red');
end
% imshow(image0);
image_out = image0;