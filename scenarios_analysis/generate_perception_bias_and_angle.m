function perception_bag = generate_perception_bias_and_angle(trajectory_tru,lamps_pole,lanes_line,traffic_signs,noice)
PIXEL_CANSEE=15;
cx=384.65;%6.018873000000000e+02;%u0
cy=236.28;%1.831104000000000e+02;%v0
fx=424.58;%7.070912000000000e+02;%f/dx sx
fy=425.00;%7.070912000000000e+02;%f/dy sy
Inter_Para_real=[fx 0 cx; 0 fy cy; 0 0 1];
resolution=[768,480];%480 768
for i=1:1:size(trajectory_tru,1)
    %µÆ¸Ë
    uv_lamp = [];
    uv_lane = [];
    uv_tfs = [];
    pose = trajectory_tru(i,:);
    for i_lamp = 1:1:length(lamps_pole)
        uv_lamp1 = threeD2image((lamps_pole{i_lamp}(1,1:3))',pose,Inter_Para_real);
        uv_lamp2 = threeD2image((lamps_pole{i_lamp}(2,1:3))',pose,Inter_Para_real);
        
        if(is_in_view (uv_lamp1,resolution) && is_in_view (uv_lamp2,resolution) && norm(uv_lamp1-uv_lamp2,2)>PIXEL_CANSEE)
            uv_lamp =[uv_lamp; uv_lamp1 uv_lamp2 lamps_pole{i_lamp}(1,4)];
        end
    end
    for i_lane = 1:1:length(lanes_line)
        uv_lane = [uv_lane; extract_lane(lanes_line{i_lane},pose,Inter_Para_real,resolution)];%u1 v1 u2 v2 id
        %              uv_lane
    end 
    for i_tfs = 1:1:size(traffic_signs,1)
        uv_tfs= [uv_tfs; extract_tfs(traffic_signs(i_tfs,:),pose,Inter_Para_real,resolution)];
    end
    uv_lamp = add_noice_drift_angle(uv_lamp,noice,noice/100);
%     for i_lamp=1:1:size(uv_lamp)
%         uv_lamp(i_lamp,:) = uv_lamp (i_lamp,:) + norm(uv_lamp(i_lamp,1:2)-uv_lamp(i_lamp,3:4))/100*noice* [randn(1,4) 0];
%     end
%     uv_lamp = uv_lamp + noice * [randn(size(uv_lamp,1),size(uv_lamp,2)-1) zeros(size(uv_lamp,1),1)];
    uv_lane = add_noice_drift_angle(uv_lane,noice,noice/100);

%     uv_lane = uv_lane + noice * [randn(size(uv_lane,1),size(uv_lane,2)-1) zeros(size(uv_lane,1),1)];
    uv_tfs = uv_tfs + noice * [randn(size(uv_tfs,1),size(uv_tfs,2)-1) zeros(size(uv_tfs,1),1)];
    
    perception_bag{i}={uv_lamp,uv_lane,uv_tfs};
end