function is = is_in_view_rough (uv,resolution)
is = 0;
if ~isnan(uv)
    if uv(1)>=0 && uv(1)<= resolution(1)+0
        if uv(2)>=0 && uv(2)<= resolution(2)+0
            is =1;
        end
    end
%     if uv(1)>=-100 && uv(1)<= resolution(1)+100
%         if uv(2)>=-100 && uv(2)<= resolution(2)+100
%             is =1;
%         end
%     end
end
