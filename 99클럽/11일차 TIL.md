![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 카드 뭉치

### 문제풀이

```java
class Solution {
    public String solution(String[] cards1, String[] cards2, String[] goal) {
        String answer = "No";

        LinkedList<String> array1 = new LinkedList<>(Arrays.asList(cards1));
        LinkedList<String> array2 = new LinkedList<>(Arrays.asList(cards2));
        LinkedList<String> array3 = new LinkedList<>(Arrays.asList(goal));

        for (int i = 0; i < array3.size(); i++) {
            if (array3.get(i).equals(array1.peek())) {
                array1.remove();
            } else if (array3.get(i).equals(array2.peek())) {
                array2.remove();
            }
        }

        if (array1.isEmpty() && array2.isEmpty()) {
            answer = "Yes";
        }

        return answer;
    }
}
```
처음 제출한 코드. 88.0점이 나왔고 가장 좋은 코드라고는 할 수 없겠지만 문제가 없다고 생각했는데 질문하기에 나와 같은 사람들이 종종 있었다. 특정 테스트 케이스만 통과하지 못하였고 

    String[] cards1 = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j"};
    String[] cards2 = {"string", "or", "integer"};
    String[] goal = {"string", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j"};

    // 기대값 -> Yes
반례 예시는 이러했다. 반례 예시로 다시 확인을 해보니 `card1`이나 `card2`가 `empty`가 아닌 케이스도 있기 때문에 이를 위해서 `count` 변수를 추가해 `goal`의 사이즈와 비교하게끔 다시 코드를 수정하였고 100점으로 통과가 됐다.

```java
class Solution {
    public String solution(String[] cards1, String[] cards2, String[] goal) {
        String answer = "No";
        int count = 0;

        LinkedList<String> array1 = new LinkedList<>(Arrays.asList(cards1));
        LinkedList<String> array2 = new LinkedList<>(Arrays.asList(cards2));
        LinkedList<String> array3 = new LinkedList<>(Arrays.asList(goal));

        for (int i = 0; i < array3.size(); i++) {
            if (array3.get(i).equals(array1.peek())) {
                array1.remove();
                count++;
            } else if (array3.get(i).equals(array2.peek())) {
                array2.remove();
                count++;
            }
        }

        if (array3.size() == count) {
            answer = "Yes";
        }

        return answer;
    }
}
```
비교적 많은 시간을 들이지 않고 푼 문제라고 생각했다.


### 새로 알게된 내용

1. `LinkedList<String> array1 = new LinkedList<>(Arrays.asList(cards1));`

    * `Arrays.asList()`를 사용한 초기화

        * Java에서는 배열을 리스트로 변환할 때 `Arrays.asList()` 메소드를 사용하여 간편하게 초기화할 수 있으며 원본 배열의 순서가 리스트에 그대로 유지된다. <br>
        이전에는 계속 `for문`을 사용해 배열을 리스트에 추가했었는데 `asList()`에 대해서 알게 되었고 실제로 사용해보니 간단하고 더 효율적으로 문제를 풀 수 있었다.
    <br>
2. `array1.peek()`

    * `peek()`
        * `LinkedList` 클래스에서 `peek()` 메소드는 리스트의 맨 앞에 있는 요소를 확인할 때 사용된다. <br>
        `peek()` 메소드는 리스트에서 첫 번째 요소를 반환하지만, 리스트에서 제거하지는 않는다. <br>
        `LinkedList`에서도 `peek()`를 사용할 수 있는지 몰랐는데 이번 기회에 알게 되었고 덕분에 쉽게 문제를 풀 수 있었다.
<br>

#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
