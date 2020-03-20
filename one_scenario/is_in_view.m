function is = is_in_view (uv,resolution)
is = 0;
if ~isnan(uv)
    if uv(1)>=0 && uv(1)<= resolution(1)
        if uv(2)>=0 && uv(2)<= resolution(2)
            is =1;
        end
    end
end
