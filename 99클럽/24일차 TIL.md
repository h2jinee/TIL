![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 대충 만든 자판

### 문제풀이

오늘은 오랜만에 GPT의 도움을 받지 않고 문제를 풀었다. 그리디라고는 하는데 문제 보자마자 map을 이용해서 푸는 방법이 떠올랐따. 처음에는 `getOrDefault()`를 이용해서 풀어야 하나? 했는데 현재 map에 저장된 값과 비교했을 때 더 작은 값을 저장하기 위해서는 `compute`를 이용해야 된다는 것을 알았다. 문제를 다 풀었다 생각하고 제출했을 때 테스트 케이스 14번부터 전부 실패해서 반례를 찾아보기도 했는데 원인은 `break;`였다. target의 나머지 부분은 볼 필요가 없기 때문에.. 앞으로 문제 풀 때 효율을 고려해야겠다는 생각이 들었다.

```java
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

class Solution {
    public int[] solution(String[] keymap, String[] targets) {
        ArrayList<Integer> answer = new ArrayList<>();
        HashMap<String, Integer> map = new HashMap<>();
        for (String key : keymap) {
            // keymap을 순찰하며 인덱스가 더 높은 것을 map에 저장
            for (int i = 0; i < key.length(); i++) {
                String currentKey = String.valueOf(key.charAt(i));
                int currentIndex = i + 1;  // 1-based index

                // 현재 map에 저장된 값과 비교하여 더 작은 값을 저장
                if (map.containsKey(currentKey)) {
                    map.compute(currentKey, (k, existingValue) -> Math.min(existingValue, currentIndex));
                } else {
                    map.put(currentKey, currentIndex);
                }
            }
        }

        for (String target : targets) {
            int count = 0;

            for (int i = 0; i < target.length(); i++) {
                String currentKey = String.valueOf(target.charAt(i));

                if (map.containsKey(currentKey)) {
                    count += map.get(currentKey);
                } else {
                    count = -1;
                    break; // target의 나머지 부분은 볼 필요가 없음
                }
            }

            if (count == 0) {
                answer.add(-1);
            } else {
                answer.add(count);
            }
        }

        return answer.stream().mapToInt(i -> i).toArray();
    }
}
```

#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
