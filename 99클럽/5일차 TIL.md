![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 전화번호 목록

### 문제풀이
```java
class Solution {
    public boolean solution(String[] phone_book) {
        boolean answer = true;

        for(int i = 0; i < phone_book.length; i++) {
            for (int j = 0; j < phone_book.length; j++) {
                if (i != j) {
                    if (phone_book[j].contains(phone_book[i])) {
                        answer = false;
                    }
                }
            }
        }
        return answer;
    }
}
```
내가 처음 생각했던 풀이법은 `완전탐색(Brute Force)`이었다. <br>

첫 번째 인덱스를 같은 인덱스가 아닌 경우에만 `contains`를 사용해서 포함이 되는지 확인을 하려고 했는데, <br>
다시 문제를 읽어보니 포함이 되는지를 확인하는 게 아니라 `접두어(prefix)`인지 확인하는 문제였다. <br>

`startWith`으로 바꾸어 다시 제출했을 때 테스트 케이스는 다 통과가 되었지만 효율성 테스트에서 **모두 실패**가 떴다. <br>
이유를 분석했을 때 `answer`가 이미 `false`임에도 불필요한 비교가 이루어지기 때문이라는 것을 알게 되었다. <br>
```java
class Solution {
    public boolean solution(String[] phone_book) {
        for(int i = 0; i < phone_book.length; i++) {
            for (int j = 0; j < phone_book.length; j++) {
                if (i != j) {
                    if (phone_book[j].startsWith(phone_book[i])) {
                        return false;
                    }
                }
            }
        }
        return true;
    }
}
```
다시 문제되는 부분을 수정하여 제출했지만 여전히 효율성 테스트에서 실패(시간 초과)가 떴다. <br>
`이중 for문`이 문제라는 것을 직감했다. 시간 복잡도가 `O(n^2)` 이기 때문이다.<br>
하지만 `이중 for문`을 사용하지 않고 푸는 풀이법이 마땅히 떠오르지 않아 chatGPT에게 도움을 요청했다.

```java
import java.util.Arrays;

class Solution {
    public boolean solution(String[] phone_book) {
        // 전화번호를 사전순으로 정렬
        Arrays.sort(phone_book);

        for (int i = 0; i < phone_book.length - 1; i++) {
            // 현재 번호가 다음 번호의 접두사인지 확인
            if (phone_book[i + 1].startsWith(phone_book[i])) {
                return false;
            }
        }

        return true;
    }
}
```
chatGPT가 만든 코드인데 이 코드를 보고 머리가 멍했다. <br>
전화번호를 사전순으로 정렬할 생각을 전혀 못했는데..

### 새로 알게된 내용

1. `contains`


    ```java
    String str = "Hello, world!";
    boolean result = str.contains("world"); // true
    ```
    `contains` 메서드는 특정 문자열이 `다른 문자열 안에 포함되어 있는지 확인`할 때 사용된다. <br>
    보통 `boolean` 값을 반환하며, 해당 문자열이 포함되어 있으면 `true`, 그렇지 않으면 `false`를 반환한다.
    
<br>

2. `startsWith`

    ```java
    String str = "Hello, world!";
    boolean result = str.startsWith("Hello"); // true
    ```
    `startsWith` 메서드는 특정 문자열이 `다른 문자열의 시작 부분과 일치`하는지 확인할 때 사용된다. <br>
    `boolean` 값을 반환하며, 시작 부분이 일치하면 `true`, 그렇지 않으면 `false`를 반환한다.
    

### 이전풀이
```java
class Solution {
    public boolean solution(String[] phone_book) {
        boolean answer = true;
        int i_index = 0;
        int j_index = 0;

        for (int i=0; i<phone_book.length; i++) {
            i_index++;
            for (int j=1; j<phone_book.length; j++) {
                j_index++;
                if (i != phone_book.length-1) {
                    if (i_index != j_index && phone_book[j].contains(phone_book[i])) {
                        answer = false;
                    }
                }
            }
            j_index = 1;
        }

        return answer;
    }
}
```
2년 전에 제출한 내역이 있어 확인해보니 이전에도 이번에 푼 방식과 비슷하게 풀었던 것 같다. <br>
당연하게도 이전에도 통과되진 못했다. 😂


#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
