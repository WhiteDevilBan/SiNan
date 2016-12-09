package nagao;

/**
 * Created by Administrator on 2016/6/15.
 */
import java.util.HashMap;
import java.util.Map;

public class TFNeighbor {

    private int tf;
    private Map<Character, Integer> leftNeighbor;
    private Map<Character, Integer> rightNeighbor;

    TFNeighbor(){
        leftNeighbor = new HashMap<Character, Integer>();
        rightNeighbor = new HashMap<Character, Integer>();
    }
    //add word to leftNeighbor
    public void addToLeftNeighbor(char word){
        //leftNeighbor.put(word, 1 + leftNeighbor.getOrDefault(word, 0));
        Integer number = leftNeighbor.get(word);
        leftNeighbor.put(word, number == null? 1: 1+number);
    }
    //add word to rightNeighbor
    public void addToRightNeighbor(char word){
        //rightNeighbor.put(word, 1 + rightNeighbor.getOrDefault(word, 0));
        Integer number = rightNeighbor.get(word);
        rightNeighbor.put(word, number == null? 1: 1+number);
    }
    //increment tf
    public void incrementTF(){
        tf++;
    }
    public int getLeftNeighborNumber(){
        return leftNeighbor.size();
    }
    public int getRightNeighborNumber(){
        return rightNeighbor.size();
    }
    public double getLeftNeighborEntropy(){
        double entropy = 0;
        int sum = 0;
        for(int number : leftNeighbor.values()){
            entropy += number*Math.log(number);
            sum += number;
        }
        if(sum == 0)  return 0;
        return Math.log(sum) - entropy/sum;
    }
    public double getRightNeighborEntropy(){
        double entropy = 0;
        int sum = 0;
        for(int number : rightNeighbor.values()){
            entropy += number*Math.log(number);
            sum += number;
        }
        if(sum == 0)  return 0;
        return Math.log(sum) - entropy/sum;
    }
    public int getTF(){
        return tf;
    }
}
