clear all
close all
noice_map=0.05;
noice_camera = 2;
cx=384.65;%6.018873000000000e+02;%u0
cy=236.28;%1.831104000000000e+02;%v0
fx=424.58;%7.070912000000000e+02;%f/dx sx
fy=425.00;%7.070912000000000e+02;%f/dy sy
Inter_Para_real=[fx 0 cx; 0 fy cy; 0 0 1];
%% 场景定义
lamps_pole = load_lamps_large_scale();%30
lanes_line = load_lanes();
traffic_signs = load_tfs(54);
%轨迹定义`
trajectory_tru=load_trj();
%%
for run_time =1:1:1
    perception_bag = generate_perception_bias_and_angle(trajectory_tru,lamps_pole,lanes_line,traffic_signs,noice_camera);%加噪声
    MAP = generate_map(lamps_pole,lanes_line,traffic_signs,noice_map);
    position_result = [];
    load('position_result_file.mat');
    for i_step = 1:1:length(perception_bag)
        if i_step ==1
%             pose_initial =[-150 -11.75 0 -1.57 0 -1.57];
            pose_initial = trajectory_tru(i_step,:);
        else
            pose_initial = p_last_position;
        end
        fun = @(pose)cost_function(pose,trajectory_tru(i_step,:),perception_bag{i_step},MAP,Inter_Para_real,i_step);
        options = optimoptions('lsqnonlin','Algorithm','levenberg-marquardt','Display','off');
        pose0 = pose_initial;%trajectory_tru(i_step,:);
        [positions, rest]=lsqnonlin(fun,pose0,[],[],options);
        position_result = [position_result; positions];
        p_last_position = positions;
    end
    position_result_all{run_time} = position_result;
    
end