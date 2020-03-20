clear all
close all
noice_map=0.05;
noice_camera = 2;
cx=384.65;%6.018873000000000e+02;%u0
cy=236.28;%1.831104000000000e+02;%v0
fx=424.58;%7.070912000000000e+02;%f/dx sx\
fy=425.00;%7.070912000000000e+02;%f/dy sy
Inter_Para_real=[fx 0 cx; 0 fy cy; 0 0 1];
for num_tfs = 2:1:5
%% 场景定义
%灯杆
% lamps_pole = load_lamps();
lamps_pole = load_lamps_1234(2);
lanes_line = load_lanes_1234(2);
traffic_signs = load_tfs(num_tfs);
%轨迹定义`
trajectory_tru=load_trj_1234();
%%
for run_time =1:1:200
    run_time
    %%生成带噪声数据
    %生成感知、生成地图
    perception_bag = generate_perception(trajectory_tru,lamps_pole,lanes_line,traffic_signs,noice_camera);%加噪声
%     for i=1:1:length(perception_bag)
%        show_me_the_image (perception_bag{i});
%     end
%     show_me_the_image (perception_bag{92});
    MAP = generate_map(lamps_pole,lanes_line,traffic_signs,noice_map);
    
    %% 位姿求解
    %优化
    % pose_initial=[-150 -11.75 0 -1.57 0 -1.57];
    position_result = [];
    % pose_initial = trajectory_tru(1,:);
    load('position_result_file.mat');
    steps = [39 56 73];%分别对应距离：75 60 45 30 15m
    for i_position = 1:1:length(steps)
        i_step = steps(i_position);
        if (1)
%             pose_initial =[-150 -11.75 0 -1.57 0 -1.57];
            pose_initial = trajectory_tru(i_step,:);
        else
%                     pose_initial = trajectory_tru(i_step,:);
%                    pose_initial= position_result_file(i_step-1,:);
            pose_initial = p_last_position;
        end
%         cost_for_check = norm (cost_function(trajectory_tru(i_step,:),trajectory_tru(i_step,:),perception_bag{i_step},MAP,Inter_Para_real,i_step),2);
        fun = @(pose)cost_function(pose,trajectory_tru(i_step,:),perception_bag{i_step},MAP,Inter_Para_real,i_step);
        options = optimoptions('lsqnonlin','Algorithm','levenberg-marquardt','Display','off');
        %     pose0 = [-150 -11.75 0 -1.57 0 -1.57];
        pose0 = pose_initial;%+[15 10 10 0.5  0.5 0.5];%trajectory_tru(i_step,:);
        [positions, rest]=lsqnonlin(fun,pose0,[],[],options);
%         position_result = [position_result; positions];
        p_last_position = positions;
        
%         image0 = zeros(resolution(2),resolution(1));
if(0)
        image1 = show_me_the_image(perception_bag{i_step});
        
        image2= show_reproj(image1,positions,pose_initial,perception_bag{i_step},MAP,Inter_Para_real,i_step);
        figure;imshow(image2);title('reproj');
        
         image1 = show_me_the_image(perception_bag{i_step});
        image2= show_reproj(image1,pose_initial,pose_initial,perception_bag{i_step},MAP,Inter_Para_real,i_step);
        figure;imshow(image2);title('gt');
        close all
end
    end
%     position_result_all{run_time} = position_result;
end
end