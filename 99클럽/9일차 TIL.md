![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 더 맵게

### 문제풀이

```java
class Solution {
    public int solution(int[] scoville, int K) {
        int answer = 0;
        Arrays.sort(scoville);
        ArrayList<Integer> list = new ArrayList<>();
        for (int i = 0; i < scoville.length; i++) {
            list.add(scoville[i]);
        }

        while (!list.isEmpty()) {
            int i = 0;

            if (list.get(i) <= K) {
                list.add(i,list.get(i) + (list.get(i+1) * 2));
                list.remove(i+1);
                list.remove(i+1);
                list.sort(Comparator.naturalOrder());
                answer++;
            }

            if (list.get(0) >= K) {
                return answer;
            }
        }
        return answer;
    }
}
```
먼저 `scoville[]`를 정렬한 후 `ArrayList`에 값을 다 담아서 `list`의 현재 인덱스가 `K`보다 작다면 `i+1`를 이용해 스코빌 지수를 계산한다. <br>
그리고 기존에 있던 `i`와 `i+1`의 값을 제거한 후 다시 정렬을 반복한다. 사실 여기서 간과한 것이 모든 음식의 스코빌 지수를 `K` 이상으로 만들 수 없는 경우에는 `-1`를 리턴해야 하는데 그 부분을 추가하지 않았다.


문제 자체가 `heap`을 사용하지 않고도 풀 수 있을 거라고 생각해 `ArrayList`를 사용했다. <br>
어려운 문제가 아니라고 생각했지만 67점이 나와서 무엇이 문제인지 AI에게 물어봤는데 효율성이 문제라고 지적했다. <br>
`ArrayList`의 `sort`를 반복적으로 사용하면 시간 복잡도가 올라간다는 것이다. <br>
따라서 `ArrayList` 대신 `PriorityQueue`를 사용하는 방법으로 변경했다.


```java
class Solution {
    public int solution(int[] scoville, int K) {
        PriorityQueue<Integer> pq = new PriorityQueue<>();
        for (int s : scoville) {
            pq.offer(s);
        }

        int answer = 0;

        while (pq.size() > 1 && pq.peek() < K) {
            int first = pq.poll();
            int second = pq.poll();
            int mixed = first + (second * 2);
            pq.offer(mixed);
            answer++;
        }

        return pq.peek() >= K ? answer : -1;
    }
}
```
내가 `ArrayList`로 구현한 코드와 사실 크게 다르지 않아 `PriorityQueue`를 활용하는 방법을 몰랐을 뿐 접근 자체는 잘하고 있다는 생각에 기분이 좋았다.


### 새로 알게된 내용

1. `PriorityQueue`

    `PriorityQueue`는 자바에서 제공하는 우선순위 큐로 기본적으로 작은 값이 우선순위를 가지는 `최소 힙(Min Heap)` 구조로 작동한다. <br>
    즉, 값이 작은 요소가 우선적으로 큐에서 나오는 구조이다. <br>
    `PriorityQueue`를 사용하면 `ArrayList`처럼 매번 정렬할 필요 없이 자동으로 우선순위에 따라 요소들이 정렬되기 때문에 시간 복잡도를 줄일 수 있다.

   ```java
    import java.util.PriorityQueue;

    public class Main {
        public static void main(String[] args) {
            PriorityQueue<Integer> pq = new PriorityQueue<>();

            // 값 추가
            pq.offer(5);
            pq.offer(1);
            pq.offer(3);

            // 값 출력 (제일 작은 값부터)
            while (!pq.isEmpty()) {
                System.out.println(pq.poll());
            }
        }
    }
   ```

    **주요 메서드 설명**

        offer(E e): 지정된 요소를 이 큐에 추가한다. 큐의 규칙에 따라 요소가 적절한 위치에 삽입된다.
        poll(): 큐의 헤드를 제거하고 반환한다. 큐가 비어 있는 경우 null을 반환한다.
        peek(): 큐의 헤드를 제거하지 않고 반환한다. 큐가 비어 있는 경우 null을 반환한다.

<br>


#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
