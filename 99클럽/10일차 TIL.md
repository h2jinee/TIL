![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 이중우선순위큐

### 문제풀이

```java
class Solution {
    public int[] solution(String[] operations) {
        int[] answer = {};

        PriorityQueue<Integer> pq = new PriorityQueue<>();
        int max = Integer.MIN_VALUE;
        int min = Integer.MAX_VALUE;

        for (String operation : operations) {

            if (operation.split(" ")[0].equals("I")) {
                pq.add(Integer.parseInt(operation.split(" ")[1]));

                if (max < Integer.parseInt(operation.split(" ")[1])) {
                    max = Integer.parseInt(operation.split(" ")[1]);
                } else if (min > Integer.parseInt(operation.split(" ")[1])) {
                    min = Integer.parseInt(operation.split(" ")[1]);
                }
            }

            if (operation.equals("D -1")) {
                pq.remove();
            }

            if (!pq.isEmpty() && operation.equals("D 1")) {
                max = Collections.max(pq);
                pq.remove(max);
            }
        }

        if (pq.isEmpty()) {
            answer = new int[]{0, 0};
        } else {
            answer = new int[]{max, pq.poll()};
        }

        return answer;
    }
}
```
처음 제출한 코드. 엉터리로 `PriorityQueue`를 썼다. 예제는 통과하였으나 실제 제출 시 50점을 받았다. <br>
chatGPT에게 무엇을 놓치고 있는지 힌트를 알려달라고 얘기했을 때 중요한 포인트를 알게 되었다.

    PriorityQueue는 최소 힙으로 구현되어 있어서 최댓값을 삭제하려면 모든 요소를 확인해야 하며, 최댓값 삭제 후 PriorityQueue의 상태를 다시 맞추어야 합니다.
    이를 위해 별도의 최대 힙을 관리하지 않으면 복잡성과 버그가 발생할 수 있습니다.

따라서 최소 힙, 최대 힙을 따로 사용하는 것을 추천하였다. <br>
2개의 `PriorityQueue`를 사용해서 어떻게 풀어야 할지 감이 잘 오지 않았는데 1시간 정도 부여잡은 끝에 풀 수 있었다.

```java
class Solution {
    public int[] solution(String[] operations) {
        int[] answer = {};

        PriorityQueue<Integer> maxQueue = new PriorityQueue<>(Collections.reverseOrder());
        PriorityQueue<Integer> minQueue = new PriorityQueue<>();

        for (String operation : operations) {
            if (operation.split(" ")[0].equals("I")) {
                maxQueue.offer(Integer.parseInt(operation.split(" ")[1]));
                minQueue.offer(Integer.parseInt(operation.split(" ")[1]));
            }

            if (operation.equals("D 1")) {
                minQueue.remove(maxQueue.poll());
            }

            if (operation.equals("D -1")) {
                maxQueue.remove(minQueue.poll());
            }
        }

        if (minQueue.isEmpty() && maxQueue.isEmpty()) {
            answer = new int[]{0, 0};
        } else {
            answer = new int[]{maxQueue.peek(), minQueue.peek()};
        }
        return answer;
    }
}
```
처음 작성했던 코드와 같이 `max`, `min`을 따로 구할 필요도 없고 간단하게 풀 수 있는 문제였다.


### 새로 알게된 내용

1. `new PriorityQueue<>(Collections.reverseOrder());`

    일반적으로 `PriorityQueue`는 최소 힙으로 동작하여 항상 최소값이 먼저 나오는 구조이지만 `Collections.reverseOrder()`를 사용하면 최대 힙으로 변환할 수 있다. <br>
    이를 통해 **최대값을 먼저 처리**할 수 있어, 이중 우선순위 큐 문제를 해결하는데 유용합니다.

    <br>
2. `minQueue.remove(maxQueue.poll());`

    최대 힙에서 최대값을 꺼낸 후, 최소 힙에서도 해당 값을 제거하는 동작을 수행한다. 이중 우선순위 큐 문제에서 최댓값을 삭제할 때, 최소 힙에서도 동일한 값을 제거하여 두 힙의 동기화를 유지한다.
<br>


#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
