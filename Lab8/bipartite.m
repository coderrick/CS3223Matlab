function [isit,A,B]=bipartite(edges)

isit=true; % default
A=[]; B=[];

queue=[1]; % initialize to first vertex arbitrarily
visited=[]; % initilize to empty
A=[1]; % put the first node on the queue in A, arbitrarily

while not(isempty(queue))
  
  i=queue(1);
  visited=[visited, i];
  
  if length(find(A==i))>0
    for j=1:length(edges{i})
      B=[B,edges{i}(j)];
      if length(find(visited==edges{i}(j)))==0; queue=[queue, edges{i}(j)]; end
    end
      
  elseif length(find(B==i))>0
   
    for j=1:length(edges{i})
      A=[A,edges{i}(j)];
      if length(find(visited==edges{i}(j)))==0; queue=[queue, edges{i}(j)]; end
    end
  
  end
  
  queue=queue(2:length(queue)); % remove the visited node
  
  % if A and B overlap, return false, [],[] ====
  A=unique(A); B=unique(B);
  if not(isempty(intersect(A,B))); isit=false; A=[]; B=[]; return; end
  % ============================================
  
end
