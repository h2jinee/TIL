![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 기능개발

### 문제풀이

```java
import java.util.Arrays;
import java.util.*;

class Solution {
    public int[] solution(int[] progresses, int[] speeds) {
        TreeMap<Integer, Integer> map = new TreeMap<>();

        // 며칠 뒤 배포가 가능한지 계산
        for (int i = 0; i < progresses.length; i++) {
            progresses[i] = (int) Math.ceil((100 - (double) progresses[i]) / speeds[i]);
        }

        // 만약 현재 인덱스와 다음 인덱스의 값이 서로 같다면 다음 인덱스 값에 현재 인덱스 값을 대입
        for (int i = 0; i < progresses.length - 1; i++) {
            if (progresses[i] > progresses[i + 1]) {
                progresses[i + 1] = progresses[i];
            }
        }

        // loop를 돌려 같은 값이 있을 경우 getOrDefault()를 사용해 count
        for (int i = 0; i < progresses.length; i++) {
            map.put(progresses[i], map.getOrDefault(progresses[i], 0) + 1);
        }

        // 키의 작은 순서대로 map의 값을 출력
        int[] answer = new int[map.size()];
        int index = 0;
        for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
            answer[index++] = entry.getValue();
        }

        return answer;
    }
}
```
점점 갈수록 난이도가 어려워짐을 실감한 문제.. <br>
문제 푸는데 2시간 정도가 걸렸던 거 같다. 심지어 스택/큐로 푸는 방법은 도저히 떠오르지 않아 짱구를 굴려서 문제를 풀었다.<br>

처음에는 문제를 보고 입출력 예시 그대로 구현을 하려고 했다. <br>
`progresses`를 `loop`를 계속 돌리면서 `speeds` 값을 `+=` 하여 `100`이 넘었을 때 `count`를 해서 `answer`에 넣어야 하나? 생각했는데 <br>
페어프로그래밍을 통해 그럴 필요가 없음을 깨달았다. ~~내 페어프로그래밍 짝꿍은 진짜 천재인듯 하다.~~ <br>

다시 차근차근 문제를 보면서 규칙을 알아냈는데 <br>
최대가 100%이니 `100`에서 `progresses[i]`를 뺀 값을 다시 `speeds[i]`로 나눠 몫을 구하면 며칠 뒤 배포를 할 수 있는지 날짜를 알 수 있다. <br>

대신 여기서 중요한 포인트가 소수점이 나올 수도 있기 때문에 이때는 `버림(floor)`이 아니라 `올림(ceil)`을 해주어야 한다. <br>
만약 예시로 2.xxxx 일이 걸린다는 것은 곧 3일차에 배포를 할 수 있다는 뜻이기 때문이다.

따라서 입출력 예시 1번의 경우라면
```java
progresses = {93, 30, 55};
speeds = {1, 30, 5};

100 - 93 = 7이 남고 / 1을 하면 7이 나옴.
100 - 30을 하면 70이 남고 / 30을 하면 2.xxxx
100 - 55를 하면 45가 남고 / 5를 하면 9
```
이후 소수점을 올림 하고 나면 `[7, 3, 9]`가 대입이 된다.

여기서 어차피 같은 날에 배포를 해야 하면 `loop`를 돌려서 만약 `progresses[i]`보다 `progresses[i+1]`이 더 작다면 `progresses[i+1]`에 `progresses[i]`의 값으로 초기화 해도 되지 않을까? 하는 생각이 들었다.

그렇게 `[7, 7, 9]`를 만들고 나면 `map.getOrDefault()`를 사용해서 `7=2`, `9=1`를 만들 수 있으니 그대로 `value`만 출력하면 `[2,1]`을 뽑아낼 수 있는 것이다.

스택/큐를 사용해서 푼 문제는 아니였지만 2시간 동안 매달린 끝에 문제를 풀게 되어 기분이 좋았다.

### 새로 알게된 내용

1. `Math.floor()`

    ```java
    double value = 2.7;
    double result = Math.floor(value); // 2.0
    ```
    `Math.floor()` 메서드는 소수점 이하를 버림하여 가장 가까운 정수로 내림하는 함수이다. 값이 2.7이면 2.0으로 내림된다.
    
<br>

2. `Math.ceil()`
    ```java
    double value = 2.3;
    double result = Math.ceil(value); // 3.0
    ```
    `Math.ceil()` 메서드는 소수점 이하를 올림하여 가장 가까운 정수로 올림하는 함수이다. 값이 2.3이면 3.0으로 올림됩니다.

<br>

3. `TreeMap`

    ```java
    TreeMap<Integer, String> map = new TreeMap<>();
    map.put(3, "Three");
    map.put(1, "One");
    map.put(2, "Two");

    for (Map.Entry<Integer, String> entry : map.entrySet()) {
        System.out.println(entry.getKey() + ": " + entry.getValue());
    }
    // 1: One, 2: Two, 3: Three
    ```
    `TreeMap`은 `HashMap`과 다르게 **키를 자동으로 정렬하여 저장**한다. <br>
    `TreeMap`은 키의 자연 순서에 따라 정렬되며, `SortedMap` 인터페이스를 구현한다. <br>
    만약 **내림차순**으로 정렬하고 싶다면 `Comparator.reverseOrder()`를 사용하면 된다.


#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
