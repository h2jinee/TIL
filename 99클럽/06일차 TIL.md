![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 의상

### 문제풀이

```java
class Solution {
    public int solution(String[][] clothes) {
        int answer = clothes.length;

        Arrays.sort(clothes, new Comparator<String[]>() {
            public int compare(String[] o1, String[] o2) {
                // 두 번째 기준 오름차순
                return o2[1].compareTo(o1[1]);
            }
        });

        for (int i = 0; i < clothes.length - 1; i++) {
            if (clothes[i][1].equals(clothes[i+1][1])) {
                answer += 1;
            }
        }
        return answer;
    }
}
```
처음 생각했던 풀이법은 전화번호 목록 문제의 풀이처럼 두 번째 인덱스 기준으로 오름차순 하여 인접한 인덱스의 데이터가 i와 같을 경우에는 건너뛰고 같지 않을 경우에는 경우의 수를 계산하는 것이었다. <br>

이때 각 종류의 의상은 1번씩은 미리 `loop`를 돌기 전에 `count`하고 나머지 경우의 수만 따로 `loop`에서 계산하는 풀이를 생각했다. `loop` 안에서는 **각 의상 종류별로 몇 가지 의상이 있는지 세어보고, 이들을 조합하여 가능한 모든 경우의 수를 계산하는 방법**이 가장 베스트일 거라 생각했는데 경우의 수를 어떻게 계산해야 할지 떠오르지 않았다. <br>

경우의 수를 계산하는 능력이 부족해 앞으로 연습이 더 많이 필요하다고 느꼈다. <br>

chatGPT에게 경우의 수를 계산하는 방법에 대해 힌트를 요청했는데 `HashMap`을 사용하여 의상 종류별로 그룹화 한 뒤 <br>
경우의 수를 계산하여 총 조합의 수를 구한 뒤 아무 것도 입지 않는 경우의 수를 제외하기 위해 `-1`를 해야 한다고 했다.

안 그래도 경우의 수에 많이 약한 터라 왜 경우의 수를 계산할 때 `해당 종류 의상의 수 + 1`를 한 상태에서 곱해야 하고 마지막에 `-1`를 해야 하는지 도저히 이해가 가지 않았다.

애초에 경우의 수를 계산할 때는 공식처럼 모든 경우의 수를 포함하여 계산을 한 뒤 문제에서 요구하는 경우의 수를 제거해야 하는 듯하다.


```java
class Solution {
    public int solution(String[][] clothes) {
        int answer = 1;
        Map<String, Integer> clothingCount = new HashMap<>();

        for (int i = 0; i < clothes.length; i++) {
            String type = clothes[i][1];
            clothingCount.put(type, clothingCount.getOrDefault(type, 0) + 1);
        }

        for (int count : clothingCount.values()) {
            answer *= (count + 1);
        }
        answer -= 1;

        return answer;
    }
}
```


### 새로 알게된 내용

1. `getOrDefault()`

    `getOrDefault()`는 `Java`의 `HashMap`에서 제공하는 메서드로, 특정 키의 값이 존재하면 그 값을 반환하고, 그렇지 않으면 기본값을 반환한다. 이를 통해 코드의 안정성을 높이고, 키가 존재하지 않을 때 발생할 수 있는 `null`을 처리할 수 있다.

    ```java
    Map<String, Integer> fruitMap = new HashMap<>();
    fruitMap.put("apple", 3);
    fruitMap.put("banana", 2);

    // "apple" 키의 값 반환
    int appleCount = fruitMap.getOrDefault("apple", 0); // 결과: 3

    // "orange" 키는 존재하지 않으므로 기본값 반환
    int orangeCount = fruitMap.getOrDefault("orange", 0); // 결과: 0
    ```
    위 예시에서 `fruitMap.getOrDefault("apple", 0)`는 `"apple"` 키가 존재하므로 그 값을 반환하고, `fruitMap.getOrDefault("orange", 0)`는 `"orange"` 키가 존재하지 않으므로 기본값 `0`을 반환한다.

    만약

    ```java
    clothingCount.put(type, clothingCount.getOrDefault(type, 0) + 1);
    ```
    이렇게 사용했다면 `clothingCount.getOrDefault(type, 0) + 1` 는 `HashMap`에 `type`이 존재하면 기존에 저장되어 있던 값을 반환하고 없다면 기본 값으로 `0`을 반환해 각각 `1`을 더한다는 의미다.

    이 메서드를 사용하면 키가 존재하지 않을 때 발생할 수 있는 `NullPointerException`을 방지할 수 있다.
    
<br>

2. `values()`

    `values()`는 `HashMap`의 모든 값을 포함하는 `Collection`을 반환하는 메서드로 `HashMap`에 저장된 모든 값들을 순회한다. <br>
    `Collection`은 `for-each 문`을 통해 순회할 수 있다.

    ```java
    Map<String, Integer> fruitMap = new HashMap<>();
    fruitMap.put("apple", 3);
    fruitMap.put("banana", 2);
    fruitMap.put("orange", 5);

    // 모든 값들을 Collection 형태로 반환
    Collection<Integer> values = fruitMap.values();
    for (int value : values) {
        System.out.println(value);
    }
    // 출력: 3, 2, 5
    ```
    
    
3. `순열 (Permutations)`

    순열은 주어진 항목들을 순서대로 배열하는 모든 가능한 방법으로 `순서가 필요할 때 사용`한다. <br>

    예를 들어 `[1, 2, 3]`의 순열은 다음과 같다.
    ```
    [1, 2, 3]
    [1, 3, 2]
    [2, 1, 3]
    [2, 3, 1]
    [3, 1, 2]
    [3, 2, 1]
    ```

4. `조합 (Combinations)`

    조합은 주어진 항목들 중에서 순서에 상관없이 선택하는 모든 가능한 방법으로 `순서가 중요하지 않다`는 특징이 있다. <br>
    
    예를 들어 `[1, 2, 3]` 중에서 2개를 선택하는 조합은 다음과 같다.
    ```
    [1, 2]
    [1, 3]
    [2, 3]
    ```

5. `중복 조합 (Combinations with Repetition)`

    중복 조합은 주어진 항목들 중에서 `중복을 허용`하여 선택하는 모든 가능한 방법으로 `순서는 중요하지 않다`는 특징이 있다. <br>

    예를 들어 `[1, 2, 3]` 중에서 2개를 선택하는 중복 조합은 다음과 같다.
    ```
    [1, 1]
    [1, 2]
    [1, 3]
    [2, 2]
    [2, 3]
    [3, 3]
    ```

6. `중복 순열 (Permutations with Repetition)`

    중복 순열은 주어진 항목들 중에서 `중복을 허용`하여 순서대로 배열하는 모든 가능한 방법으로 `순서가 필요할 때 사용`한다. <br>

    예를 들어 `[1, 2]`의 중복 순열은 다음과 같다.
    ```
    [1, 1]
    [1, 2]
    [2, 1]
    [2, 2]
    ```
<br>

`getOrDefault()`의 경우 2년 전 알고리즘 문제를 풀 때 종종 사용을 했어서 메서드 자체는 알고 있었지만 오랜만에 문제를 풀어서 그런지 떠오르지 않았다. <br>
앞으로 자주 사용하여 익숙하게 응용할 수 있도록 연습을 많이 해야겠다고 느꼈다.

#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
