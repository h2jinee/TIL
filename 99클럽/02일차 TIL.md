![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## x만큼 간격이 있는 n개의 숫자
```java
class Solution {
    public long[] solution(int x, int n) {
        long[] answer = new long[n];

        for (int i=1; i<=n; i++) {
            answer[i-1] = (long) i * x;
        }

        return answer;
    }
}
```
### 문제풀이
`for`문으로 `n`의 `length`만큼 돌린 후 `idx`와 `x`를 곱하면 되는 문제라고 생각했다. <br>
처음에는 answer[i-1]가 아니라 answer[i]에 값을 대입하려고 해서 `ArrayIndexOutOfBoundsException`가 발생했다. <br>
문제가 통과가 되긴 하였으나 (long) 으로 캐스팅을 하는 방법이 썩 좋은 방법은 아니라는 생각이 들었다.




### 이전풀이
```java
class Solution {
    public long[] solution(int x, int n) {
        long[] answer = new long[n];
        long gob = x;

        for(int i=0; i<n; i++) {
            answer[i] = gob;
            gob += x;
        }

        return answer;
    }
}
```
2년 전에 이미 풀었던 문제였는지 기록이 남아있었다. <br>
기억은 잘 안 나지만 이전에는 `gob`이라는 변수에 `x`를 누적하여 각 값을 계산했고 이 방식이 더 좋은 것 같다.



#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
