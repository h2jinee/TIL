![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 하노이의 탑

### 문제풀이

```java
class Solution {
    public int[][] solution(int n) {
        List<int[]> moves = new ArrayList<>();
        
        // 하노이의 탑 재귀 호출
        hanoi(n, 1, 3, 2, moves);
        
        return moves.toArray(new int[moves.size()][]);
    }
    
    // 재귀 함수
    private void hanoi(int n, int from, int to, int via, List<int[]> moves) {
        if (n == 1) {
            // 기본 케이스: 원반이 하나일 때
            moves.add(new int[]{from, to});
        } else {
            // 1. n-1개의 원반을 from에서 via로 옮김
            hanoi(n - 1, from, via, to, moves);
            
            // 2. 가장 큰 원반을 from에서 to로 옮김
            moves.add(new int[]{from, to});
            
            // 3. n-1개의 원반을 via에서 to로 옮김
            hanoi(n - 1, via, to, from, moves);
        }
    }
}
```
처음엔 입출력을 보고 전날과 똑같이 `조합 (Combinations)`으로 접근하는 문제라 생각했다. <br>
막상 구현을 하려고 보니 어떻게 접근해야 할지 하나도 감이 오지 않았다. <br>
chatGPT한테 힌트를 달라고 하니 조합이 아닌 `재귀 (recursion)`로 접근하라고 했다. <br>
재귀?.. 재귀로 `from`, `to`를 만들어 푸는 문제이구나! 까지는 이해했지만 시간을 아무리 써도 접근하는 방법이 떠오르지 않아 이번에는 문제를 풀지 못했다. <br>
재귀는 코드를 보고 손코딩을 하면서 푼 적은 있어도 주어진 문제를 재귀로 직접 구현해본 적은 없어서 비슷한 문제를 더 풀어봐야 재귀에 대해서 익힐 수 있을 것 같다.


하노이의 탑.. 문제 이름은 낯이 많이 익었는데 제출 내역이 없어서 왜 안 풀었을까? 생각했다. <br>
막상 문제를 읽어보니 왜 여태 안 풀었는지 알겠다. 너무 어려웠다. 점점 갈수록 난이도가 어려워지고 있는 게 느껴졌다!

#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
