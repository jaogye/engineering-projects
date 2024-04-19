from collections import defaultdict, deque

class Graph:
    def __init__(self):
        # Dictionary containing adjacency List
        self.graph = defaultdict(list)

    # Function to add an edge to the graph
    def addEdge(self, u, v):
        self.graph[u].append(v)
        if v not in self.graph:
            self.graph[v] = []  # Ensure v is in the graph even if it has no outgoing edges

    # A recursive function used by topologicalSort
    def topologicalSortUtil(self, v, visited, stack):
        # Mark the current node as visited
        visited.add(v)

        # Recur for all the vertices adjacent to this vertex
        for i in self.graph[v]:
            if i not in visited:
                self.topologicalSortUtil(i, visited, stack)

        # Push current vertex to stack which stores the result
        stack.appendleft(v)

    # The function to do Topological Sort.
    def topologicalSort(self):
        # Set to keep track of visited nodes
        visited = set()
        stack = deque()  # Use deque for efficient appendleft operation

        # Call the recursive helper function to store Topological Sort starting from all vertices one by one
        for v in self.graph:
            if v not in visited:
                self.topologicalSortUtil(v, visited, stack)

        # Print contents of the stack
        return list(stack)

if  __name__  == '__main__':
    # Create a graph with string identifiers
    g = Graph()
    g.addEdge('shirt', 'tie')
    g.addEdge('shirt', 'belt')
    g.addEdge('tie', 'jacket')
    g.addEdge('belt', 'jacket')
    g.addEdge('pants', 'belt')
    g.addEdge('pants', 'shoes')
    g.addEdge('undershorts', 'pants')
    g.addEdge('undershorts', 'shoes')
    g.addEdge('socks', 'shoes')

    print("Following is a Topological Sort of the given graph:")
    print(g.topologicalSort())


