# knights_travails
A program that will show (one of) the shortest paths for a knight to get from one square to another square. 
My solution explained: 
In this program, we create an 8x8 grid of 64 Cells, representing a chess board. We initialize a Knight object, then place it somewhere on the board (on a Cell).
We use a Graph/Node data structure. For any given Node, it has a @position attribute, to represent the Knight's position on the board, and an array of @neighbours which represent the Knight's possible moves from its position. Moves that are illegal (ie. go off the board) are discarded. 

To find the shortest path from Cell A to Cell B, we use an implementation of Dijkstra's Algorithm, slightly modified: 
1) Assign a @distance value to each node, relative to the Knight's Initial (Source) Node. The source node will have distance = 0 and all others nodes will have a distance of Infinity initially.
1) Start from the Knight's source node and call it the current node.
2) If the current node's position is equal to Cell B, that means we have found our target node; we can then trace backwards from the target node to the source node to build an array of the path taken from Cell A to Cell B. 
3) Otherwise, iterate through each of the current node's possible neighbouring moves and calculate the 'tentative distance' from the source node. In this case, all moves cost the same (1 'move'). Update the current neighbour node's distance if the current node's distance from source, plus 1, is less than the current neighbour node's current distance from source.
4) When we have finished iterating through all neighbours of a given Node, mark that Node visited, and designate the next Node in the queue as the current node.
