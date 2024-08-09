![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 단지번호 붙이기

### 문제풀이

오늘도 깊이/너비 우선 탐색(DFS/BFS) 문제가 나왔지만 아직 문제를 풀기에는 어렵다고 느꼈다. <br>
그래도 긍정적인 신호는 DFS/BFS를 어떻게 푸는지 대강 이해는 했다는 것.. 코드를 좀 더 익숙하게 본다면 문제도 풀 수 있을 것 같다는 생각이 들었다. <br>
주말에 BFS와 비교하여 차이점을 더 공부할 예정이다.

```java
import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class Main {
    static int n; // 지도의 크기
    static int[][] map; // 지도 정보
    static boolean[][] visited; // 방문 여부
    static int[] dx = {0, 0, -1, 1}; // 상하좌우 이동
    static int[] dy = {-1, 1, 0, 0};
    static int currentCount; // 현재 단지의 집 수

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        n = scanner.nextInt();
        map = new int[n][n];
        visited = new boolean[n][n];

        for (int i = 0; i < n; i++) {
            String line = scanner.next();
            for (int j = 0; j < n; j++) {
                map[i][j] = line.charAt(j) - '0';
            }
        }

        ArrayList<Integer> complexSizes = new ArrayList<>();
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (map[i][j] == 1 && !visited[i][j]) {
                    currentCount = 0; // 새로운 단지를 발견했을 때 초기화
                    dfs(i, j);
                    complexSizes.add(currentCount);
                }
            }
        }

        Collections.sort(complexSizes); // 단지의 크기를 오름차순으로 정렬

        System.out.println(complexSizes.size());
        for (int size : complexSizes) {
            System.out.println(size);
        }
    }

    public static void dfs(int x, int y) {
        visited[x][y] = true;
        currentCount++;

        for (int i = 0; i < 4; i++) {
            int nx = x + dx[i];
            int ny = y + dy[i];

            if (nx >= 0 && ny >= 0 && nx < n && ny < n) {
                if (map[nx][ny] == 1 && !visited[nx][ny]) {
                    dfs(nx, ny);
                }
            }
        }
    }
}

```


### 단지번호 붙이기 문제 해결 방법(chatGPT)

#### 문제 개요

이 문제는 2차원 격자에서 연결된 집들을 단지로 묶고, 각 단지에 속한 집의 수를 계산하는 것이다. 이를 위해 그래프 탐색 기법을 사용하여 연결 요소를 찾고 크기를 계산한다.

#### 문제 해결 방법

1. 그래프 모델링

	- 2차원 배열을 이용해 지도 정보를 저장하고, 각 좌표의 집(1로 표시)을 노드로 간주한다.

2. DFS 탐색

	- DFS(깊이 우선 탐색)를 사용하여 연결된 집들을 탐색한다.

	- 각 단지를 탐색할 때마다 새로운 단지의 크기를 초기화하고, 연결된 모든 집을 방문하면서 크기를 누적한다.

3. 단지 크기 계산 및 출력

	- 모든 단지를 탐색한 후, 각 단지의 크기를 리스트에 저장하고 오름차순으로 정렬하여 출력한다.

	- 단지 수와 각 단지의 집의 수를 출력한다.

#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
