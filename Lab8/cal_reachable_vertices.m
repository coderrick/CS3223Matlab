%change code in the explore
function res = cal_reachable_vertices(edges, idx_start)
% @ get the reachable vertices of one given vertex 
% @ Params:
% @     edges: adjacent matrix of one graph, 
%              n x n matrix, graph has n vertices
%              edges(i,j) = 1 means there is an edge between vertex i and j
%              edges(i,j) = 0: there is no edge between vertex i and j
%              also diagnal is 0, edges(i, i) = 0
%        
%       idx_start: index of starting vertex
% @ Return: 
% @     res = index of vertices can be reached by vertex idx_start
% @ Usage example:
% @    res = explore_recursive(edges, 4)
% @ Author: Erkang Cheng
% @ Date: 10/10/2013

% hint: implement a recursive function "explore" in Figure 3.3

%% number of nodes in the graph
n = size(edges, 1);

%% define global variables and initialize values for them
% other function then can use them and set values for them
global visited;
visited = zeros(1, n);

global res_vec;
res_vec = [];

%% call explore to visit all the reachable vertices from node idx_start
explore(edges, idx_start);

%% get the result
res = res_vec;

end


%% helper function
%% non-recursive explore
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
% @ Date: 10/10/2013

% hint: implement a non-recursive function "explore"

%% declare global variables and do not intialize them agian
% only set values for them
global visited;
global res_vec;

%%
n = size(edges, 1);

%% maintain a stack:
S = [];
S = [S idx_start]; % push start vertex into S

%% dfs
while ( ~isempty(S) ) % while S is not empty
    v = S(1);
    
    if visited(v) == 0
        visited(v) = 1;
        res_vec = [res_vec v];
        
        %% pre visit
        % you can add pre visit codes here
        str = ['---- previsit: We are exploring node ', num2str(v)];
        disp(str);     
    end
    
       
    %% find non-visited neighbors of v
    neighbors_v = find(edges(v, :)==1);
    flag_neighbors_visted = visited(neighbors_v);
    
    idx_non_visited_neigbor = neighbors_v(find(flag_neighbors_visted==0));
    
    %% if v has neighbors, pick one to visit
    if (length(idx_non_visited_neigbor)~=0) 
        
        %% just pick one neighbor out and go deeper 
        idx_neighbor = idx_non_visited_neigbor(1);
        if ( edges(v, idx_neighbor)==1 ) % there is an edge
            if (visited(idx_neighbor) == 0)
                S = [idx_neighbor S];
            end
        end
        
    else %% no neighbors
        % pop stack
        S(1) = [];
        
        %% post vist
        % you can add post visit here
        str = ['**** postvisit We finish exploring node ', num2str(v)];
        disp(str);
        
    end
    
end

%%
end