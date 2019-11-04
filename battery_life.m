close all
load('B0007.mat')

% figure()
% plot(B0005.cycle(5).data.Voltage_measured)
% hold on
% plot(B0005.cycle(5).data.Temperature_measured)
% legend('Voltage','Temperature')

for r = 1:616
    if strcmp(B0007.cycle(r).type,'charge')
        v_charge(r) = mean(B0007.cycle(r).data.Voltage_charge);
        cur_charge(r) = mean(B0007.cycle(r).data.Current_charge);
        timee_c(r)=max(B0007.cycle(r).data.Time);
    elseif strcmp(B0007.cycle(r).type,'discharge')
        v_discharge(r) = mean(B0007.cycle(r).data.Voltage_load);
        cur_discharge(r) = mean(B0007.cycle(r).data.Current_load);
        capacity(r)=(B0007.cycle(r).data.Capacity);
        timee_d(r)=max(B0007.cycle(r).data.Time);
    end
end

figure()
plot(v_charge)
hold on 
plot(v_discharge)
legend('charge','discharge')
ylabel('Average Voltage')
xlabel('time step')
title('Effect of Battery Degredation on Charge/Load Voltage')

figure()
plot(capacity)
ylabel('Capacity')
xlabel('Time step')
title('Battery Capacity Degredation')

figure()
plot(cur_charge)
hold on 
plot(cur_discharge)
legend('charge','discharge')
ylabel('Average Voltage')
xlabel('time step')
title('Effect of battery Degredation')

figure()
plot(timee_c)
hold on 
plot(timee_d)
legend('charge','discharge')
ylabel('Max time')
xlabel('time step')
title('Effect of battery Degredation')

