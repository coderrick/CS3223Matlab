function expl(edges, idx_start)
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
global previsit_vector;% will contain solution set for previsit
global postvisit_vector;%will contain solution set for postvisit
global clock;%counter to update pre and post vector indexes
%%
n = size(edges, 1);

%% maintain a stack:
S = [];%
S = [S idx_start]; % push start vertex into S

%% dfs
while ( ~isempty(S) ) % while S is not empty
    v = S(1);
    
    if visited(v)==0
        visited(v) = 1;
        res_vec = [res_vec v];
        
        %% pre visit
        % you can add pre visit codes here
        previsit_vector(v) = clock;
        clock = clock + 1 ;
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
        postvisit_vector(v) = clock;  
        clock = clock + 1;
        str = ['**** postvisit We finish exploring node ', num2str(v)];
        disp(str);
        
    end
    
end

%%
end