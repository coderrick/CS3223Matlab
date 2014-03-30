function res = bfs(edges)
% @ return the order of vertices visted by breadth-first-search
%     start from the 1st vertex
% @ Params:
% @     edges: adjacent matrix of one graph,
%              n x n matrix, graph has n vertices
%              edges(i,j) = 1 means there is an edge between vertex i and j
%              edges(i,j) = 0: there is no edge between vertex i and j
%              also diagnal is 0, edges(i, i) = 0
%
% @ Return:
% @     res = the order of vertices visted by breadth-first-search
% @ Usage example:
% @    res = bfs(edges)
% @ Author: Erkang Cheng
% @ Date: 10/24/2013

% hint: call explore for each vertex in the graph
% Figure 4.3


%% number of nodes in the graph
n = size(edges, 1);

%% define global variables and initialize values for them
% other function then can use them and set values for them
global visited;
visited = zeros(1, n);

global colors;
init -1: not colored

global res_vec;
res_vec = [];

for i=1:n
    if (visited(i)==0)
        explore(edges, i);
    end
end

res = res_vec;

end



%% helper function
%% non-recursive explore breadth-first-search
function explore(edges, idx_start)
% @ explore node idx_start in the graph
% @ Params:
% @     edges: adjacent matrix of one graph,
%              n x n matrix, graph has n vertices
%              edges(i,j) = 1 means there is an edge between vertex i and j
%              edges(i,j) = 0: there is no edge between vertex i and j
%              also diagnal is 0, edges(i, i) = 0
%
%       idx_start: index of starting vertex
% @ Return:
% @
% @ Usage example:
% @     explore(edges, 4)
% @ Author: Erkang Cheng
% @ Date: 10/24/2013

% hint: implement a non-recursive function "explore" breadth-first-search

%% declare global variables and do not intialize them agian
% only set values for them
global visited;
global res_vec;

%%
n = size(edges, 1);

%% maintain a stack:
Q = [];
Q = [Q idx_start]; % push start vertex into S

visited(idx_start) = 1;

color idx_start to white

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
            
            if v is not colored, color v to u's opposite color
                if u's color is white, color v to black
                if u's color is black, color v to white
           end if
            if v is colored
                if v's color is the same as u's color
                    done. this is not a bipartite grap
                end
            end
            
            if (visited(v) == 0)
                % inject v into Q
                visited(v) = 1;
                res_vec = [res_vec v];
                Q = [Q v];
            end
        end
    end
end
end

