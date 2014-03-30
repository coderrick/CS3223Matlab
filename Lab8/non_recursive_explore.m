function non_recursive_explore(edges, idx_start)

% only set values for them
global visited;
global res_vec;

%Get size of graph
n = size(edges, 1);

%% maintain a stack:
stackQ = [];
stackQ = [stackQ idx_start]; % push start vertex into stack

visited(idx_start) = 1;
res_vec = [res_vec idx_start];

%% dfs
while ( ~isempty(stackQ) ) % while Stack is not empty
    %% visiting unode
    curr_node = stackQ(1);
    str = ['---- bfs: We are visiting node ', num2str(curr_node)];
    disp(str);
    
    % Pop value out of stack
    stackQ(1) = [];
    
    for v = 1:n
        if (edges(curr_node, v)==1) % there is an edge
            if (visited(v) == 0)
                % push v into stack
                visited(v) = 1;
                res_vec = [res_vec v];
                stackQ = [stackQ v];
            end
        end
    end
end
stackQ
end