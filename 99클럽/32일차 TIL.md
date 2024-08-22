![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 무인도 여

### 문제풀이

```java
import java.util.*;

class Solution {
    private int[] dx = {1, -1, 0, 0}; // 방향 벡터 (상, 하, 좌, 우)
    private int[] dy = {0, 0, 1, -1};

    public int[] solution(String[] maps) {
        int rows = maps.length;
        int cols = maps[0].length();
        boolean[][] visited = new boolean[rows][cols];
        List<Integer> islandSizes = new ArrayList<>();
        
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (!visited[i][j] && maps[i].charAt(j) != 'X') {
                    int size = bfs(maps, visited, i, j, rows, cols);
                    islandSizes.add(size);
                }
            }
        }
        
        if (islandSizes.isEmpty()) {
            return new int[]{-1};
        }
        
        Collections.sort(islandSizes);
        return islandSizes.stream().mapToInt(Integer::intValue).toArray();
    }
    
    private int bfs(String[] maps, boolean[][] visited, int x, int y, int rows, int cols) {
        Queue<int[]> queue = new LinkedList<>();
        queue.offer(new int[]{x, y});
        visited[x][y] = true;
        int size = 0;
        
        while (!queue.isEmpty()) {
            int[] current = queue.poll();
            int cx = current[0];
            int cy = current[1];
            size += maps[cx].charAt(cy) - '0'; // 현재 위치의 값을 숫자로 변환 후 더함
            
            for (int i = 0; i < 4; i++) {
                int nx = cx + dx[i];
                int ny = cy + dy[i];
                
                if (nx >= 0 && nx < rows && ny >= 0 && ny < cols && !visited[nx][ny] && maps[nx].charAt(ny) != 'X') {
                    queue.offer(new int[]{nx, ny});
                    visited[nx][ny] = true;
                }
            }
        }
        
        return size;
    }
}
```


### 문제 해결 방법(chatGPT)

1. **BFS를 활용한 섬 크기 계산**:
   - 주어진 지도에서 X가 아닌 영역을 섬으로 간주하고, BFS(너비 우선 탐색)를 통해 각 섬의 크기를 계산했습니다.
     
   - 섬의 크기는 섬의 각 부분에 적힌 숫자 값을 합산하여 구합니다.

2. **방문 여부 체크**:
   - `visited` 배열을 사용하여 이미 방문한 위치는 다시 탐색하지 않도록 설정하여 중복 탐색을 방지했습니다. 이를 통해 탐색 효율성을 높였습니다.

3. **섬 크기 정렬 및 반환**:
   - 모든 섬의 크기를 계산한 후, 크기 순으로 정렬하여 결과를 반환했습니다. 만약 섬이 없다면 `-1`을 반환합니다.
   
4. **시간 복잡도**:
   - BFS를 사용한 탐색은 최대 `O(n*m)`의 시간 복잡도를 가집니다. 이 접근법은 지도에서 모든 섬을 효율적으로 탐색하여 문제의 요구사항을 충족시킵니다.

#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
