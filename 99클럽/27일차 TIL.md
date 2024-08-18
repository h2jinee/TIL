![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 할인 행사

### 문제풀이

```java
import java.util.HashMap;

class Solution {
    public int solution(String[] want, int[] number, String[] discount) {
        int answer = 0;

        // 원하는 물품과 그 수량을 저장하는 HashMap
        HashMap<String, Integer> wantMap = new HashMap<>();
        for (int i = 0; i < want.length; i++) {
            wantMap.put(want[i], number[i]);
        }

        // 슬라이딩 윈도우 방식으로 10일씩 확인
        for (int i = 0; i <= discount.length - 10; i++) {
            HashMap<String, Integer> discountMap = new HashMap<>();

            // 10일간의 할인 상품들을 확인하며 수량을 기록
            for (int j = i; j < i + 10; j++) {
                discountMap.put(discount[j], discountMap.getOrDefault(discount[j], 0) + 1);
            }

            // 원하는 모든 물품이 필요한 수량만큼 있는지 확인
            boolean match = true;
            for (String key : wantMap.keySet()) {
                if (discountMap.getOrDefault(key, 0) < wantMap.get(key)) {
                    match = false;
                    break;
                }
            }

            if (match) {
                answer++;
            }
        }

        return answer;
    }
}

```


### 문제 해결 방법(chatGPT)

1. **슬라이딩 윈도우 기법 사용**:
   - 주어진 할인 목록에서 연속된 10일 동안 원하는 모든 상품이 원하는 수량만큼 포함되어 있는지 확인하기 위해 슬라이딩 윈도우 기법을 사용했습니다.

   - 윈도우를 하루씩 이동하며 10일간의 할인 상품을 매번 새로 확인하는 대신, 윈도우의 첫 상품을 제거하고 마지막 상품을 추가하는 방식으로 효율적으로 처리했습니다.

2. **해시맵 활용**:
   - 원하는 물품과 그 수량을 해시맵에 저장하여, 각 물품에 대해 원하는 수량을 빠르게 조회할 수 있도록 했습니다.

   - 할인 기간 내의 상품도 해시맵에 저장하여 각 상품의 수량을 쉽게 관리할 수 있도록 했습니다.

3. **효율적인 탐색**:
   - 각 윈도우마다 해시맵을 사용해 원하는 물품들이 모두 필요한 수량만큼 포함되어 있는지를 확인했습니다.
   
   - 모든 조건이 만족되면 카운트를 증가시켜, 가능한 할인 기간의 수를 최종적으로 계산했습니다.

#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
