function pathVisualizer(datasetname)
    % load the data file
    f = load(datasetname);
    
    % subtract our the first sample point in order to reference the first
    % set as zero
    dataset = f.dataset;
    data = dataset - dataset(1,:);
    
    figure()
    
    % plot encoder locations
    subplot(2,2,1)
    plot(data(:,1),data(:,2)), hold on
    plot(data(:,1),data(:,3)), hold off
    legend('left', 'right');
    xlabel('time (s)')
    ylabel('distance moved (m)')
    title('encoder location versus time')

    % plot encoder velocities
    subplot(2,2,2)
    vel = diff(data);
    vel(:,2) = vel(:,2) ./ vel(:,1);
    vel(:,3) = vel(:,3) ./ vel(:,1);
    veltimes = data(:,1);
    veltimes(end) = [];
    plot(veltimes(:,1),vel(:,2)), hold on
    plot(veltimes(:,1),vel(:,3)), hold off
    legend('left','right');
    xlabel('time (s)')
    ylabel('linear velocity (m/s)')
    title('encoder velocities')

    % plot angular acceleration of neato
    subplot(2,2,3)
    w = (vel(:,3) - vel(:,2)) ./ 0.24;
    plot(veltimes(:,1),w)
    xlabel('time (s)')
    ylabel('angular velocity (rads/s)')
    title('angular velocity versus time of neato')
 end