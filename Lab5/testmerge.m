%% testmerge

%% test case 0
res = slow_k_merge([1 2],[2 4 5],[6 7],[ 8 9 10], [5 6 7]);
res = k_fastmerge([1 2],[2 4 5],[6 7],[ 8 9 10], [5 6 7]);

%% test case 1
% 10 sorted array, each has 1000 elements, element in [1 1000]
n = 1000;
k = 10;
for i=1:k
    a = randi([1 1000], 1, n);
    b = sort(a);
    arg_in{i} = b;
end

tic
res = slow_k_merge(arg_in{1:k});
toc

tic
res = k_fastmerge(arg_in{1:k});
toc


%% test case 2
% increase k

% you can change kk=10:1:20 and for k = 10:1:20 to large number
% ex. kk=10:2:50 and k = 10:2:50, but it takes loog time to get the result

kk = 10:1:20;
num = length(kk);

t_slow_kk = zeros(1, num); % record time
t_fast_kk = zeros(1, num); % record time

idx_k = 1;
for k = 10:1:20
    
    % generate k sorted array
    for i=1:k
        a = randi([1 1000], 1, n);
        b = sort(a);
        arg_in{i} = b;
    end

    tic
    res = slow_k_merge(arg_in{1:k});
    t_slow = toc;
    t_slow_kk(idx_k) = t_slow;

    tic
    res = k_fastmerge(arg_in{1:k});
    t_fast = toc;
    t_fast_kk(idx_k) = t_fast;
    
    idx_k = idx_k + 1;
    clear arg_in;
end

%% save image
figure;
plot(kk, t_slow_kk, 'r*-', kk, t_fast_kk, 'b*-');
grid on;
title('time comparison of testmerge')
xlabel('k');
ylabel('time');

tmpName{1} = ['slow_k_merge'];
tmpName{2} = ['k_fastmerge'];
legend1=legend(tmpName,'Interpreter', 'none','fontsize',16,'Location', 'NorthWest');

saveas(gcf, 'time_compare.png')

