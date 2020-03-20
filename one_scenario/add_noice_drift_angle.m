function uv_out = add_noice_drift_angle(uv_lamp,noice,noice_angle)
uv_out=[];
j=1;
for i=1:1:size(uv_lamp,1)
    x1 = uv_lamp(i,1);
    y1 = uv_lamp(i,2);
    x2 = uv_lamp(i,3);
    y2 = uv_lamp(i,4);
    id = uv_lamp(i,5);
    x11 = x1+noice*randn();
    y11 = y1+noice*randn();
    sita = atan2(y2-y1,x2-x1);
    sita1 = sita+noice_angle*randn();
    y21 = y2;
    x21 = (y21-y1)/tan(sita1)+x11;
    if norm([y11-y21, x11-x21],2)>15
        uv_out(j,:) = [x11 y11 x21 y21 id];
        j=j+1;
    end
end

end