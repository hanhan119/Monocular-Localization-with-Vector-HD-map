function show_lane_debug (uv_lane1,uv_lane2)
resolution=[1226,370];
image0 = zeros(resolution(2),resolution(1));

     image0=insertShape(image0,'line',[uv_lane1(1) uv_lane1(2) uv_lane1(3) uv_lane1(4)], 'LineWidth', 3,'Color','red');
     image0=insertShape(image0,'line',[uv_lane2(1) uv_lane2(2) uv_lane2(3) uv_lane2(4)], 'LineWidth', 3,'Color','blue');


imshow(image0);