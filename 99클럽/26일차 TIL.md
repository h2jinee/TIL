![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 달리기 경주

### 문제풀이

어려운 문제는 아니지만 자료구조에 대해서 학습하기 좋은 문제인 것 같다. <br>
처음 문제를 보자마자 당연하게 정렬 문제처럼 swap을 이용해서 풀면 되겠다 생각하고 `ArrayList`로 문제를 풀었다. 하지만 시간 초과로 몇 개의 테스트 케이스를 통과하지 못해 chatGPT에게 힌트를 요청하였고, `ArrayList`대신 `HashMap`으로 문제를 푸는 것을 추천하였다.

#### 처음 제출한 코드

```java
import java.util.ArrayList;
import java.util.Arrays;

class Solution {
    public String[] solution(String[] players, String[] callings) {
        String[] answer = {};
        ArrayList<String> list = new ArrayList<>(Arrays.asList(players));

        for (int i=0; i<callings.length; i++) {
            String temp = list.get(list.indexOf(callings[i]) - 1);
            int num = list.indexOf(callings[i]);
            list.set(num - 1, callings[i]);
            list.set(num, temp);
        }
        
        return list.toArray(new String[0]);
    }
}
```


#### 최종 제출한 코드
```java
import java.util.*;


class Solution {
    public String[] solution(String[] players, String[] callings) {
        HashMap<String, Integer> map = new HashMap<>();

        for (int i = 0; i < players.length; i++) {
            map.put(players[i], i);
        }

        for (String calling : callings) {
            int index = map.get(calling);

            if (index > 0) { // 첫 번째 인덱스가 아니어야 스왑 가능
                // 현재 calling의 이전 플레이어를 찾음
                String prevPlayer = players[index - 1];

                // players 배열에서 두 플레이어의 위치를 스왑
                players[index - 1] = calling;
                players[index] = prevPlayer;

                // map에서 두 플레이어의 인덱스를 업데이트
                map.put(calling, index - 1);
                map.put(prevPlayer, index);
            }

        }

        // map을 values 값에 따라 정렬
        List<Map.Entry<String, Integer>> entryList = new ArrayList<>(map.entrySet());
        entryList.sort(Map.Entry.comparingByValue());

        // 정렬된 key들을 배열로 변환하여 반환
        String[] result = new String[players.length];
        for (int i = 0; i < entryList.size(); i++) {
            result[i] = entryList.get(i).getKey();
        }

        return result;
    }
}
```

### 새로 알게된 내용

1.	`HashMap`을 `values` 값에 따라 정렬하는 방법

    - `HashMap`은 기본적으로 순서를 보장하지 않는 자료구조이기 때문에, 저장된 값들을 특정 순서로 정렬하고자 할 때 별도의 처리가 필요하다. 이 코드에서는 `HashMap`을 `values` 값에 따라 정렬하기 위해 다음과 같은 방법을 사용했다.

    -	먼저, `map.entrySet()`을 이용해 `Map.Entry` 객체들의 리스트를 얻는다. 이 리스트는 map에 저장된 키-값 쌍을 포함한다.

    - 그 다음, `entryList.sort(Map.Entry.comparingByValue());`를 사용하여 리스트를 `value`에 따라 오름차순으로 정렬한다. `Map.Entry.comparingByValue()` 메소드는 `Entry` 객체의 값(value)을 기준으로 비교하는 `Comparator`를 제공한다.

    -	마지막으로, 정렬된 리스트에서 `key`들을 추출하여 최종 결과 배열에 저장한다.

이 과정에서 `HashMap`을 `List`로 감싸는 이유는, 기본적으로 `HashMap`에는 **정렬 기능이 없기 때문**이다. `HashMap`은 순서가 없는 자료구조이므로, 정렬이 필요한 경우 `List`로 변환한 후 정렬해야만 원하는 순서대로 데이터를 다룰 수 있다.

#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
