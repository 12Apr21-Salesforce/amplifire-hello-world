System.debug(multipleCounter(1,10,2));
public static Integer multipleCounter(Integer firstNum, Integer secondNum, Integer n) {
    Integer count = 0;
    for(integer i = firstNum;i<=secondNum;i++){
        if(math.mod(i,n)==0)
            count++;
    }
    return count;
}