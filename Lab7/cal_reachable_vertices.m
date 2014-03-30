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
n = size(edges, 1); %G.a = [...]

%% define global variables and initialize values for them
% other function then can use them and set values for them
global visited;
visited = zeros(1, n);%1xn matrix of 0 elements to mark that node has not been visited.

global res_vec;%result vector tht will be output.
res_vec = [];

%% call explore to visit all the reachable vertices from node idx_start
explore(edges, idx_start);

%% get the result
res = res_vec;

end

%% helper function
%% recursive explore
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

% hint: implement a recursive function "explore" in Figure 3.3

%% declare global variables and do not intialize them agian
% only set values for them
global visited;
global res_vec;

%%
n = size(edges, 1);%getting size of the matrix

visited(idx_start) = 1;%setting initial node to vist
res_vec = [res_vec, idx_start];%adding visited node to vector

%increase clock
%% pre visit
% you can add pre visit codes here
str = ['---- previsit: We are exploring node ', num2str(idx_start)];
disp(str);
%% 

%% go deeper to check idx_start's neighbors
for idx_neighbor = 1:n
    if (edges(idx_start, idx_neighbor)==1) % there is an edge
        if (visited(idx_neighbor) == 0)
            explore(edges, idx_neighbor);
        end
    end
end
%increase clock here too
%% post vist
% you can add post visit here
str = ['**** postvisit We finish exploring node ', num2str(idx_start)];
disp(str);
%% 
end
