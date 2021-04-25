@IsTest
public class P0BTest {
    public P0BTest() {
        Integer result = 4;
        Test.startTest();
        result = P0B.multipleCounter(1,10,2);
        Test.stopTest();
        System.assert(result==3);
    }
}
