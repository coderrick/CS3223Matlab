%This is a modification of bfs
function res = simplecyc(edges)
n = size(edges, 1);
global visited;
visited = zeros(1, n);
global distance;
distance = Inf(1,n);%Set all nodes to Infinity 
global res_vec;
res_vec = [];

%explore(edges, 1);
 for i=1:n
    % distance(i) = 0;
     if (visited(i)==0)
         explore(edges, i);
     end  
 end
%{
modifcation starts here
res = distance;
%}
 if (find(distance == 2))
     res = 'd = 2';
 else
     res = 'There is no simple cycle';
 end
distance
res_vec
end



function explore(edges, idx_start)

global visited;
global res_vec;
global distance;

%%
n = size(edges, 1);
%distance = Inf(1,n); this gives a vector of 5 Inf
% distance(u) = Inf;
distance(idx_start) = 0;
%% maintain a stack:
Q = [];
Q = [Q idx_start]; % push start vertex into S

visited(idx_start) = 1;
res_vec = [res_vec idx_start];

%% dfs
while ( ~isempty(Q) ) % while S is not empty
    %% visiting u
    u = Q(1);
    str = ['---- bfs: We are visiting node ', num2str(u)];
    disp(str);
    
    % eject Q
    Q(1) = [];
    
    for v = 1:n
        if (edges(u, v)==1) % there is an edge
            if (visited(v) == 0 && distance(v) == Inf)%use && of || ?
                % inject v into Q
                visited(v) = 1;
                res_vec = [res_vec v];
                Q = [Q v];
                distance(v) = distance(u) + 1;
            end
        end
    end
end
end