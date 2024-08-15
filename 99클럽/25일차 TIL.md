![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 399. Evaluate Division

### 문제풀이

여태 푼 문제 중 가장 어려웠던 문제.. 영어로 되어있어 문제를 한국어로 번역했는데 그럼에도 문제가 이해되지 않아 chatGPT한테 해석을 요청했다. 푸는 방법도 힌트를 달라고 했는데 간선과 노드가 나오는 순간 멘붕이 되어서 결국 chatGPT에게 풀어달라고 했다. 알고보니 DFS문제였는데 map안에 map을 사용하는 것도 신선하면서 어려움을 느꼈다. 😭

```java
import java.util.*;

class Solution {
    public double[] calcEquation(List<List<String>> equations, double[] values, List<List<String>> queries) {
        // 그래프를 만들기 위한 맵
        Map<String, Map<String, Double>> graph = new HashMap<>();
        
        // 그래프 생성
        for (int i = 0; i < equations.size(); i++) {
            String dividend = equations.get(i).get(0);
            String divisor = equations.get(i).get(1);
            double quotient = values[i];
            
            graph.putIfAbsent(dividend, new HashMap<>());
            graph.putIfAbsent(divisor, new HashMap<>());
            
            graph.get(dividend).put(divisor, quotient);
            graph.get(divisor).put(dividend, 1.0 / quotient);
        }
        
        // 결과 저장을 위한 배열
        double[] results = new double[queries.size()];
        
        // 각 쿼리에 대해 계산
        for (int i = 0; i < queries.size(); i++) {
            String dividend = queries.get(i).get(0);
            String divisor = queries.get(i).get(1);
            
            if (!graph.containsKey(dividend) || !graph.containsKey(divisor)) {
                results[i] = -1.0;
            } else if (dividend.equals(divisor)) {
                results[i] = 1.0;
            } else {
                Set<String> visited = new HashSet<>();
                results[i] = dfs(graph, dividend, divisor, 1.0, visited);
            }
        }
        
        return results;
    }
    
    // DFS로 그래프 탐색
    private double dfs(Map<String, Map<String, Double>> graph, String current, String target, double value, Set<String> visited) {
        visited.add(current);
        
        if (graph.get(current).containsKey(target)) {
            return value * graph.get(current).get(target);
        }
        
        for (Map.Entry<String, Double> neighbor : graph.get(current).entrySet()) {
            if (!visited.contains(neighbor.getKey())) {
                double result = dfs(graph, neighbor.getKey(), target, value * neighbor.getValue(), visited);
                if (result != -1.0) {
                    return result;
                }
            }
        }
        
        return -1.0;
    }
}
```

#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
