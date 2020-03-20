function error_longitute = rms_of_raw (error_position_longitude)
for i_position = 1:1:size(error_position_longitude,1)
   for j_num_lamps = 1:1: size(error_position_longitude,2)
       error_longitute(i_position,j_num_lamps) = rms(error_position_longitude(i_position,j_num_lamps,:));
   end
end
