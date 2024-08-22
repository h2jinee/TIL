![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 백준 14248번 점프 점프

### 문제풀이

```java
import java.util.Scanner;

public class Main {

    static int n;
    static int[] stones;
    static boolean[] visited;
    
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        n = sc.nextInt(); // 돌의 개수
        stones = new int[n + 1];
        visited = new boolean[n + 1];
        
        for (int i = 1; i <= n; i++) {
            stones[i] = sc.nextInt();
        }
        
        int start = sc.nextInt(); // 시작점 (1부터 시작)
        
        int result = dfs(start);
        System.out.println(result);
        
        sc.close();
    }
    
    static int dfs(int current) {
        visited[current] = true;
        int count = 1; // 현재 위치도 방문했으므로 1을 셉니다.
        
        int left = current - stones[current];
        int right = current + stones[current];
        
        if (left >= 1 && !visited[left]) {
            count += dfs(left);
        }
        
        if (right <= n && !visited[right]) {
            count += dfs(right);
        }
        
        return count;
    }
}
```


### 문제 해결 방법(chatGPT)

1. **DFS를 활용한 방문 가능한 위치 계산**:
   - 주어진 배열에서 각 돌의 점프 범위를 바탕으로 DFS(깊이 우선 탐색)를 사용하여 방문 가능한 위치들을 탐색했습니다.
     
   - 시작점에서 출발하여, 점프 범위 내에서 왼쪽과 오른쪽으로 이동하며 방문 가능한 위치의 개수를 계산했습니다.

2. **방문 여부 체크**:
   - `visited` 배열을 사용하여 이미 방문한 위치는 재탐색하지 않도록 하여 중복 계산을 방지했습니다. 이를 통해 불필요한 연산을 줄이고 효율적인 탐색을 구현했습니다.

3. **시간 복잡도**:
   - 이 접근법의 시간 복잡도는 DFS를 사용하는 특성상 `O(n)`입니다. 방문 가능한 위치만을 탐색하므로, 문제의 요구사항을 효과적으로 충족시킬 수 있습니다.

#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
