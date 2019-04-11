%% Dataset plotting
clf
clear all
load forwardtest3.mat
data = dataset - dataset(1,:);
plot(data(:,1),data(:,2), 'o'), hold on
plot(data(:,1),data(:,3), 'o'), hold off
legend('left', 'right');

figure()
vel = diff(data);
vel(:,2) = vel(:,2) ./ vel(:,1);
vel(:,3) = vel(:,3) ./ vel(:,1);
veltimes = data(:,1);
veltimes(end) = [];
plot(veltimes(:,1),vel(:,2)), hold on
plot(veltimes(:,1),vel(:,3)), hold off
legend('left','right');

figure()
w = (vel(:,3) - vel(:,2)) ./ 0.24;
plot(veltimes(:,1),w)
legend('angular vel');

%% Robot Command experiment 1
pub = rospublisher('/raw_vel');
msg = rosmessage(pub);
V_R = 0.3
V_L = 0.3
msg.Data = [V_R, -V_L];
send(pub, msg);
prompt = 'Press Enter to Stop Robot';
str = input(prompt,'s');
if isempty(str)
    msg.Data=[0,0];
    send(pub,msg)
end
%% Robot command experiment 2
pub = rospublisher('/raw_vel');
msg = rosmessage(pub);
V_R = 0.3
V_L = 0.3
msg.Data = [V_R, V_L];
send(pub, msg);
prompt = 'Press Enter to Stop Robot';
str = input(prompt,'s');
if isempty(str)
    msg.Data=[0,0];
    send(pub,msg)
end