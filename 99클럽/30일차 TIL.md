![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 436. Find Right Interval

### 문제풀이

```java
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

class Solution {
    public int[] findRightInterval(int[][] intervals) {
        int n = intervals.length;
        int[] result = new int[n];
        int[][] starts = new int[n][2];

        // 시작 지점과 인덱스를 저장
        for (int i = 0; i < n; i++) {
            starts[i][0] = intervals[i][0];
            starts[i][1] = i;
        }

        // 시작 지점을 기준으로 정렬
        Arrays.sort(starts, (a, b) -> a[0] - b[0]);

        // 각 인터벌의 끝 지점에 대해 이진 탐색으로 적절한 시작 지점을 찾음
        for (int i = 0; i < n; i++) {
            int end = intervals[i][1];
            int left = 0, right = n - 1;
            int index = -1;

            while (left <= right) {
                int mid = left + (right - left) / 2;
                if (starts[mid][0] >= end) {
                    index = starts[mid][1];
                    right = mid - 1;
                } else {
                    left = mid + 1;
                }
            }

            result[i] = index;
        }

        return result;
    }
}
```


### 문제 해결 방법(chatGPT)

1. **이진 탐색을 활용한 효율적인 해결**:
   - 각 인터벌의 시작 지점과 해당 인덱스를 저장한 `starts` 배열을 생성하였습니다. 이 배열은 시작 지점을 기준으로 정렬되며, 이진 탐색을 통해 빠르게 탐색할 수 있습니다.
     
   - 주어진 인터벌의 끝 지점에 대해, `starts` 배열에서 가장 가까운 시작 지점을 이진 탐색으로 찾아내어 결과 배열에 저장하였습니다.

2. **정렬과 이진 탐색의 조합**:
   - 먼저 `starts` 배열을 정렬한 후, 각 인터벌의 끝 지점에 대해 이진 탐색을 수행하여 효율적으로 가장 가까운 시작 지점을 찾았습니다. 이로 인해 시간 복잡도는 `O(n log n)`으로 최적화되었습니다.

3. **시간 복잡도**:
   - 이 접근법의 시간 복잡도는 `O(n log n)`입니다. 정렬과 이진 탐색을 활용하여 문제를 효율적으로 해결할 수 있었습니다.

#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
