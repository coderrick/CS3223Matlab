%Add distance to algorithm
function res = bfs(edges)
% @ return the order of vertices visted by breadth-first-search
%     start from the 1st vertex

%% number of nodes in the graph
n = size(edges, 1);

%% define global variables and initialize values for them
% other function then can use them and set values for them
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
         explore(edges, 1);
     end  
 end

res = distance;

end



%% helper function
%% non-recursive explore breadth-first-search
function explore(edges, idx_start)


% hint: implement a non-recursive function "explore" breadth-first-search

%% declare global variables and do not intialize them agian
% only set values for them
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