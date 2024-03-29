clear
z=-10;
p=[0,(-23+sqrt(129))/4,(-23-sqrt(129))/4];

figure()
set(gcf, 'unit','centimeters','Position', [1 1 15 50]); %xmin,ymin,width,height
subplot(5,1,1)
hold on
grid on
plot([-50,50],[0,0],'k','linewidth',1.2)
plot([0,0],[-50,50],'k','linewidth',1.2)
plot(z,0,'or')
plot(p,zeros(3,1),'xr')
xlim([-15,5])
ylim([-10,10])
title('确定极点、零点')

subplot(5,1,2)
hold on
grid on
plot([-50,50],[0,0],'k','linewidth',1.2)
plot([0,0],[-50,50],'k','linewidth',1.2)
plot(z,0,'or')
plot(p,zeros(3,1),'xr')
plot([z,p(3)],[0,0],'r','linewidth',1.5)
plot([p(2),p(1)],[0,0],'r','linewidth',1.5)
xlim([-15,5])
ylim([-10,10])
title('确定实轴上的根轨迹')

subplot(5,1,3)
hold on
grid on
sigma=(sum(p)-sum(z))/(3-1);
plot([-50,50],[0,0],'k','linewidth',1.2)
plot([0,0],[-50,50],'k','linewidth',1.2)
plot(z,0,'or')
plot(p,zeros(3,1),'xr')
plot([z,p(3)],[0,0],'r','linewidth',1.5)
plot([p(2),p(1)],[0,0],'r','linewidth',1.5)
plot([sigma,sigma],[-50,50],'--b','linewidth',1.2)
xlim([-15,5])
ylim([-10,10])
title('找到渐近线')

subplot(5,1,4)
si=-1.43093028845;
hold on
grid on
sigma=(sum(p)-sum(z))/(3-1);
plot([-50,50],[0,0],'k','linewidth',1.2)
plot([0,0],[-50,50],'k','linewidth',1.2)
plot(z,0,'or')
plot(p,zeros(3,1),'xr')
plot([z,p(3)],[0,0],'r','linewidth',1.5)
plot([p(2),p(1)],[0,0],'r','linewidth',1.5)
plot([sigma,sigma],[-50,50],'--b','linewidth',1.2)
plot(si,0,'b+')
xlim([-15,5])
ylim([-10,10])
title('确定分离点')

subplot(5,1,5)
step=1;
syms K s
i=1;
for Ki=1.779:step:100
    zz=vpasolve([K*(0.1*s+1)/(s*(0.1*s^2+1.15*s+2.5))==-1,K==Ki],[s,K]);
    y1(i)=max(eval(imag(zz.s)));
    y2(i)=-y1(i);
    x1(i)=max(eval(real(zz.s)));
    x2(i)=x1(i);
    i=i+1;
end


hold on
grid on
plot([-50,50],[0,0],'k','linewidth',1.2)
plot([0,0],[-50,50],'k','linewidth',1.2)
plot(z,0,'or')
plot(p,zeros(3,1),'xr')
plot([z,p(3)],[0,0],'r','linewidth',1.5)
plot([p(2),p(1)],[0,0],'r','linewidth',1.5)
plot([sigma,sigma],[-50,50],'--b','linewidth',1.2)
plot(si,0,'b+')
plot(x1,y1,'r','linewidth',1.5)
plot(x2,y2,'r','linewidth',1.5)
xlim([-15,5])
ylim([-10,10])
title('绘制根轨迹图')

saveas(gcf,'./1.png')