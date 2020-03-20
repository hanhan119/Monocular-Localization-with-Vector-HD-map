function MAP = generate_map(lamps_pole,lanes_line,traffic_signs,noise_map)
m_lamps = [];
m_lanes = [];
m_tfs = [];
for i=1:1:length(lamps_pole)
    m_lamps = [m_lamps; lamps_pole{i} + [noise_map * randn(2,3) zeros(2,1)]];
%     m_lamps{i} = lamps_pole{i} + [noise_map * randn(2,3) zeros(2,1)];
end
for i=1:1:length(lanes_line)
    m_lanes = [m_lanes; lanes_line{i} + [noise_map * randn(size(lanes_line{i},1),size(lanes_line{i},2)-1) zeros(size(lanes_line{i},1),1)]];
%     m_lanes{i} = lanes_line{i} + [noise_map * randn(size(lanes_line{i},1),size(lanes_line{i},2)-1) zeros(size(lanes_line{i},1),1)];
end
m_tfs = traffic_signs + [noise_map * randn(size(traffic_signs,1),size(traffic_signs,2)-1) zeros(size(traffic_signs,1),1) ];
MAP = {m_lamps,m_lanes,m_tfs};
end