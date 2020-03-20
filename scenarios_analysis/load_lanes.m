function lanes = load_lanes()
scale =0;
lanes =[];
x = linspace(-150, 0, 80);
y = zeros(1,length(x))-10 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-1;
lanes{1} = [x',y',z',s'];


x = linspace(-150, 0, 80);
y = zeros(1,length(x))-10+3.5 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-2;
lanes{2} = [x',y',z',s'];


x = linspace(-150, 0, 80);
y = zeros(1,length(x))-10+3.5+3.5 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-3;
lanes{3} = [x',y',z',s'];


x = linspace(-150, 0, 80);
y = zeros(1,length(x))-10-3.5 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-4;
lanes{4} = [x',y',z',s'];



x = linspace(-150, 0, 80);
y = zeros(1,length(x))-10-3.5-3.5 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-5;
lanes{5} = [x',y',z',s'];


y = linspace(0, 150, 80);
x = zeros(1,length(x))+10 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-6;
lanes{6} = [x',y',z',s'];

y = linspace(0, 150, 80);
x = zeros(1,length(x))+10+3.5 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-7;
lanes{7} = [x',y',z',s'];


y = linspace(0, 150, 80);
x = zeros(1,length(x))+10+3.5+3.5 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-8;
lanes{8} = [x',y',z',s'];


y = linspace(0, 150, 80);
x = zeros(1,length(x))+10-3.5 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-9;
lanes{9} = [x',y',z',s'];


y = linspace(0, 150, 80);
x = zeros(1,length(x))+10-3.5-3.5 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-10;
lanes{10} = [x',y',z',s'];


x = linspace(20, 70, 30);
y = zeros(1,length(x))-10 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-11;
lanes{11} = [x',y',z',s'];


x = linspace(20, 70, 30);
y = zeros(1,length(x))-10+3.5 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-12;
lanes{12} = [x',y',z',s'];


x = linspace(20, 70, 30);
y = zeros(1,length(x))-10+3.5+3.5 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-13;
lanes{13} = [x',y',z',s'];


x = linspace(20, 70, 30);
y = zeros(1,length(x))-10-3.5 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-14;
lanes{14} = [x',y',z',s'];



x = linspace(20, 70, 30);
y = zeros(1,length(x))-10-3.5-3.5 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-15;
lanes{15} = [x',y',z',s'];


y = linspace(-20, -70, 30);
x = zeros(1,length(x))+10 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-16;
lanes{16} = [x',y',z',s'];

y = linspace(-20, -70, 30);
x = zeros(1,length(x))+10+3.5 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-17;
lanes{17} = [x',y',z',s'];


y = linspace(-20, -70, 30);
x = zeros(1,length(x))+10+3.5+3.5 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-18;
lanes{18} = [x',y',z',s'];


y = linspace(-20, -70, 30);
x = zeros(1,length(x))+10-3.5 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-19;
lanes{19} = [x',y',z',s'];


y = linspace(-20, -70, 30);
x = zeros(1,length(x))+10-3.5-3.5 + scale*randn(1,length(x));
z = zeros(1,length(x));
s = zeros(1,length(x))-20;
lanes{20} = [x',y',z',s'];