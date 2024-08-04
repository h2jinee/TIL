![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## JadenCase 문자열 만들기
```java
class Solution {
    public String solution(String s) {
        s = s.toLowerCase();
        String[] array = s.split("");

        for (int i = 0; i < array.length - 1; i++) {
            if (array[i].equals(" ")) {
                array[i + 1] = array[i + 1].toUpperCase();
            }
        }
        array[0] = array[0].toUpperCase();

        return String.join("", array);
    }
}
```
### 문제풀이
처음 문제를 봤을 때, 공백을 기준으로 문자열로 잘라내서 공백 다음이 소문자이면 대문자로 변경 하는 로직을 생각했다. <br>
만약 마지막 인덱스라면 다음 인덱스가 없어 오류가 나기 때문에 for문에서 `array.length - 1` 까지로 범위를 제한했고, 배열을 다시 for문을 써서 문자열로 만들어야 되나? 생각을 했는데 페어프로그래밍을 통해 `String.join`이 있다는 것을 알게 되었다. <br>

하지만 여기서 문제였던 것이 `unFollowed`같은 경우 중간에 **대문자**가 있다는 것이었는데, <br>
처음에는 `for문` 안에서 `if문`을 처리하기 전에 `toLowerCase()`를 사용했다.
```java
class Solution {
    public String solution(String s) {
        String[] array = s.split("");

        for (int i = 0; i < array.length - 1; i++) {
            array[i] = array[i].toLowerCase(); // 각 문자가 공백인 경우 다음 문자를 대문자로 변환
            if (array[i].equals(" ")) {
                array[i + 1] = array[i + 1].toUpperCase();
            }
        }
        array[0] = array[0].toUpperCase();

        return String.join("", array);
    }
}
```
`toLowerCase()`가 `for문` 안에 있게 되면 각 문자를 순회할 때마다 소문자로 변환하기 때문에 **이미 대문자로 변환된 문자도 다시 소문자로 변환**된다. <br>
따라서 `toLowerCase()`를 `for문` 밖으로 이동하여 **문자열 전체를 미리 소문자로 변환**한 후, 필요한 위치에서만 대문자로 변환하도록 수정했다.

### 새로 알게된 내용

1. `String.join`


    ```java
    String[] words = {"Hello", "World", "Java"};
    String result = String.join(" ", words); // "Hello World Java"
    ```
    `String.join` 메서드는 여러 문자열을 특정 구분자로 결합하여 **하나의 문자열**로 만들어준다. <br>
    주로 배열이나 리스트의 요소들을 하나의 문자열로 합칠 때 유용하다. <br>
    파라미터에 구분자를 뒤가 아니라 앞에 넣어야 한다. <br><br>

2. `toCharArray`

    ```java
    String str = "Hello";
    char[] charArray = str.toCharArray(); // ['H', 'e', 'l', 'l', 'o']
    ```
    `toCharArray` 메서드는 문자열을 `문자 배열(char array)`로 변환한다. <br>
    이 메서드는 문자열을 개별 문자 단위로 처리해야 할 때 유용하다. <br><br>


### 이전풀이
```java
class Solution {
    public String solution(String s) {
        String answer = "";
        String[] arr = {};
        
        s = s.toLowerCase();

        for(int i=0; i<s.toCharArray().length; i++) {
            arr = s.split(" ", -1);
        }

        for(int j=0; j<arr.length; j++) {
            for(int k=0; k<arr[j].length(); k++){
                arr[j] = Character.toUpperCase(arr[j].charAt(0)) + arr[j].substring(1);
            }
        }

        for(int l=0; l<arr.length; l++) {
            if(l != arr.length-1) {
                answer += arr[l] + " ";
            } else {
                answer += arr[l];
            }

        }

        return answer;
    }
}
```
2년 전에 제출한 내역이 있어 확인해보니 이전에는 `Character`도 사용했고, `toCharArray()`를 사용해서 풀었다. <br>
단계 별로 나누어서 풀었기 때문에 이번에 푼 풀이법이 훨씬 효율이 좋다고 생각했다. <br>
마지막에 문자열 결합 부분에서 비효율성이 있기 때문에 시간 복잡도도 `O(n^2)`이다.


#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
