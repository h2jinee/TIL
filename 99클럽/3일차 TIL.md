![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 문자열 내 마음대로 정렬하기
```java
class Solution {
    public String[] solution(String[] strings, int n) {
        String temp = "";

        for (int i=0; i<strings.length-1; i++) {
            int minIdx = i;
            for (int j=i+1; j<strings.length; j++) {
                if ((int) strings[minIdx].charAt(n) > (int)strings[j].charAt(n)) {
                    minIdx = j;
                } else if ((int) strings[minIdx].charAt(n) == (int)strings[j].charAt(n)) {
                    if (strings[minIdx].compareTo(strings[j]) > 0) {
                        minIdx = j;
                    }
                }
            }
            temp = strings[i];
            strings[i] = strings[minIdx];
            strings[minIdx] = temp;
        }
        return strings;
    }
}
```
### 문제풀이
`for문`으로 `loop`를 돌려서 `i`의 문자열 `n`번째 인덱스를 `i+1` 문자열 `n`번째 인덱스와 비교해 정렬을 사용하는 방법이 가장 먼저 떠올랐다. <br>
하지만 문제를 막상 풀어보니 테스트 케이스는 통과했지만 **시간복잡도도 좋지 않고 가독성이 너무 안 좋다고 생각했다.**


### 새로 알게된 내용

1. `charAt`

    오랜만에 푸는 문제라 `charAt` 대신 `indexOf`를 사용했다가 내가 원하는 결과를 얻기 위해서는 `indexOf`대신 `charAt`을 사용해야 된다는 것을 알게 되었다. <br>

    ```java
    String s = "hello";
    char c = s.charAt(1); // 'e'를 반환
    ```
    `charAt` 메서드는 문자열에서 특정 인덱스에 위치한 문자를 반환한다. <br><br>

2. `indexOf`

    ```java
    String s = "hello";
    int index1 = s.indexOf('e'); // 1을 반환
    int index2 = s.indexOf("lo"); // 3을 반환
    int index3 = s.indexOf('x'); // -1을 반환 (문자가 없는 경우)
    ```
    `indexOf` 메서드는 주어진 문자나 문자열이 처음으로 등장하는 위치(인덱스)를 반환한다. <br>
    찾고자 하는 문자가 문자열에 존재하지 않으면 `-1`을 반환하며, `특정 문자나 문자열이 어디에 위치해 있는지 찾을 때 사용`한다. <br><br>


3. 선택 정렬 (Selection Sort)

    `선택 정렬`은 정렬 알고리즘 중 하나로, 배열을 반복하면서 가장 작은 (또는 가장 큰) 요소를 찾아 `맨 앞의 요소와 교환하는 방식`이다. 시간 복잡도는 `O(n^2)`이다. <br><br>


4. `compareTo`

    `compareTo`를 2년 전에는 자주 썼던 것 같은데 오랜만에 문제를 푸니 이런 메서드가 있다는 것조차 까먹고 있었다. 🥹
    ```java
    String s1 = "apple";
    String s2 = "banana";
    int result = s1.compareTo(s2); // 음수를 반환
    ```
    `compareTo` 메서드는 두 문자열을 사전순으로 비교하는데, `음수, 0, 양수` 값을 반환하여 문자열의 순서를 결정한다. <br><br>

5. `Comparator`

    `Comparator` 인터페이스는 객체를 비교하는 방법을 정의하는 데 사용된다. <br>
    기본 정렬 순서를 제공하지 않는 객체를 정렬할 때 유용하며, `compare` 메서드를 `Override`해서 사용해야 한다.



### 문제해결
```java
class Solution {
    public String[] solution(String[] strings, int n) {
        // Comparator를 사용하여 n번째 문자를 기준으로 정렬
        Arrays.sort(strings, new Comparator<String>() {
            @Override
            public int compare(String s1, String s2) {
                // n번째 문자를 비교
                char c1 = s1.charAt(n);
                char c2 = s2.charAt(n);
                if (c1 == c2) {
                    // n번째 문자가 같으면 사전순으로 비교
                    return s1.compareTo(s2);
                } else {
                    return Character.compare(c1, c2);
                }
            }
        });
        return strings;
    }
}
```
더 좋은 풀이법이 있을 것 같아 chatGPT에게 물어보니 `Comparator`로 푸는 방법을 알려주었다. <br>
`Comparator`도 아는 내용이지만 막상 알고리즘 문제를 풀 때는 잘 활용을 하지 않게 되는 것 같다. <br>
앞으로 비교하는 문제가 나올 때는 `Comparator`로 푸는 연습을 해야할 것 같다.



#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
