![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 촌수 계산

### 문제풀이

깊이/너비 우선 탐색(DFS/BFS) 문제가 드디어 나왔다.. 아직 DFS/BFS에 대해 잘 알지 못해서 문제 풀기가 어려웠다. chatGPT에게 도움을 요청해 문제를 풀긴 했지만 무슨 말인지 아직 잘 이해가 가지 않아 주말에 DFS/BFS에 대해 더 공부해야 될 것 같다.

```java
import java.util.*;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Read the total number of people
        int n = scanner.nextInt();
        
        // Read the two people's numbers whose chonsu is to be calculated
        int personA = scanner.nextInt();
        int personB = scanner.nextInt();
        
        // Read the number of relationships
        int m = scanner.nextInt();
        
        // Adjacency list to represent the graph
        List<Integer>[] familyGraph = new ArrayList[n + 1];
        for (int i = 1; i <= n; i++) {
            familyGraph[i] = new ArrayList<>();
        }
        
        // Read the parent-child relationships
        for (int i = 0; i < m; i++) {
            int parent = scanner.nextInt();
            int child = scanner.nextInt();
            familyGraph[parent].add(child);
            familyGraph[child].add(parent); // Since relationship is bidirectional
        }
        
        // Calculate chonsu using BFS
        int chonsu = calculateChonsu(familyGraph, personA, personB, n);
        
        // Print the result
        System.out.println(chonsu);
    }

    private static int calculateChonsu(List<Integer>[] familyGraph, int start, int end, int n) {
        boolean[] visited = new boolean[n + 1];
        Queue<int[]> queue = new LinkedList<>();
        
        // Start from the first person with distance 0
        queue.offer(new int[]{start, 0});
        visited[start] = true;
        
        while (!queue.isEmpty()) {
            int[] current = queue.poll();
            int currentNode = current[0];
            int currentDistance = current[1];
            
            // If we reached the target person, return the distance
            if (currentNode == end) {
                return currentDistance;
            }
            
            // Visit all unvisited neighbors
            for (int neighbor : familyGraph[currentNode]) {
                if (!visited[neighbor]) {
                    visited[neighbor] = true;
                    queue.offer(new int[]{neighbor, currentDistance + 1});
                }
            }
        }
        
        // If no relationship is found, return -1
        return -1;
    }
}
```


### 촌수 계산 문제 해결 방법(chatGPT)

#### 문제 개요

이 문제는 촌수를 계산하는 것으로, 그래프 탐색 기법을 사용하여 두 사람 사이의 촌수를 찾는 문제다. 주어진 입력은 사람의 관계를 나타내는 쌍으로 주어지고, 이들을 이용해 두 사람 사이의 최소 촌수를 계산해야 한다.

#### 문제 해결 방법

1. 그래프 모델링

	- 각 사람을 노드로, 부모-자식 관계를 간선으로 표현하여 그래프로 모델링한다.

	- 관계는 양방향으로 표현하여 탐색할 수 있도록 한다.

2. BFS 탐색

	- BFS(너비 우선 탐색)를 사용하여 시작 노드에서 목표 노드까지의 최단 경로를 찾는다.

	- BFS는 주로 큐를 이용해 구현하며, 각 노드를 방문할 때마다 해당 노드까지의 거리를 기록한다.

3. 촌수 계산

	- 목표 노드에 도달하면 현재까지의 거리를 촌수로 반환한다.

	- 두 노드가 연결되어 있지 않으면 -1을 반환하여 촌수가 계산되지 않음을 나타낸다.

#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
