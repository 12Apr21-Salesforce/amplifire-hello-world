/////////////////////////////////////////////////////////////////
//
// Name: Coding Challenges
// Author: Name (Email)
// Date: 00/00/0000
// Description: Series of apex methods to demonstrate
// basic understanding of coding concepts.
//
/////////////////////////////////////////////////////////////////
public class P0B{
    /* DONE
     * 1. Return the nth Fibonacci number
     * Test Cases:
     * Input: 0     Output: 0
     * Input: 1    Output: 1
     * Input: 2     Output: 1
     * Input: 10    Output: 55
    */
    public static Integer nFibonacci( Integer n ){
        // 0,1,1,2,3,5,8
        if(n==0){
            return 0;
        }else if(n==1){
            return 1;
        }
        Integer lastLastNumber = 0;
        Integer number1 = 0;
        Integer lastNumber = 1;
        for(Integer i = n-1;i>0;i--){
            number1=lastNumber+lastLastNumber;
            lastLastNumber = lastNumber;
            lastNumber = number1;
        }
        return number1;
    }

    /* Done
     * 2. Sort a list of integers.
     * Test Cases:
     * Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5]
     * Input: [5,4,3,2,1]     Output: [1,2,3,4,5]
     *
     * Don't use the sort() method... that would be lame.
    */
    public static List<Integer> sortList( List<Integer> intList ) {
        Integer temp;
        for (Integer i = 0;i<intList.size()-1;i++){
            for(Integer j = i+1;j<intList.size();j++){
                if(intList[i]>intList[j]){
                	temp = intList[i];
                    intList[i] = intList[j];
                    intList[j] = temp;
                }
            }
        }	
        return intList;
    }

    /* DONE
     * 3. Return the factorial of n.
     * Test Cases:
     * Input: 0    Output: 1
     * Input: 1    Output: 1
     * Input: 3    Output: 6
    */
    public static Integer nFactorial( Integer n) {
        if(n==0){
            return 1;
        }
        for(Integer i = n-1;i>0;i--){ // Starts from n and goes down
            n*=i;
        }
       	return n;
    }

    /* DONE
     * 4. Rotate left
     * Given a list, list, and an integer, n, rotate the values in list left n times and return list
     * Test Cases:
     * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
    */
    public static List<Integer> rotateLeftNTimes( List<Integer> nList, Integer n) {
        List<Integer> tempList = new List<Integer>();
        for(Integer i = 0;i<n;i++){
            tempList = nList.clone();
            for(Integer j = 0;j<nList.size();j++){
                if(j==nList.size()-1){ //wrapper handler
                    nList[nList.size()-1] = tempList[0];
                }else{
                	nList[j] = tempList[j+1];
                }
            }
        }
        return nList;
    }

    /* Nope
     * 5. Balanced Brackets
     * A bracket is any one of the following: (, ), {, }, [, or ]
     * 
     * The following are balanced brackets:
     *    ( )
     *    ( ) ( )
     *    ( ( ) )
     *    ( { [ ] } )
     *
     * The following are NOT balanced brackets:
     *   (
     *   )
     *   ( ( )
     *   ( [ ) ]
     *
     * Return true if balanced
     * Return false if not balanced
    */
    public static Boolean bracketsAreBalanced( String s ) {
        s = s.replaceAll('\\s+', '');
        String brackets = '{}';
        String squareBrackets = '[]';
        String parenthesis = '()';
        
        String rightSides = ')]}';
        Integer i = 0;
        
        Boolean encounteredRight = false;
        while(i<s.length()){
            if(s.substring(i,i+1).containsAny(rightSides)&&i>0){
                Integer startInt = -1;
                while(i<s.length()&&s.substring(i,i+1).containsAny(rightSides)){
                    encounteredRight = true;
                    String charStr = s.substring(i,i+1); // right side a.k.a. curr character we are on as a whole
                    String compStr = s.substring(i+startInt,i+startInt+1); // left side
                    // The following check the character found for the relevant match
                    Boolean bracketsMatch = charStr==brackets.substring(1,2)&&compStr==brackets.substring(0,1);
                    Boolean squareBracketsMatch = charStr==squareBrackets.substring(1,2)&&compStr==squareBrackets.substring(0,1);
                    Boolean parenthesisMatch = charStr==parenthesis.substring(1,2)&&compStr==parenthesis.substring(0,1);
                    if(bracketsMatch||squareBracketsMatch||parenthesisMatch){
                        i++;
                        startInt -= 2; // -2 instead of -1 to offset the increase that i gets
                        continue;
                    }else
                        return false; // fails if there is no corresponding left side bracket for this right side one
                }
            }    
            i++;
        }
        return encounteredRight;
    }

    /* You should NOT be submitting answers that you find online. You will be expected to be able to defend any of these solutions without notice. */

    /* DONE?
     * 6. Create a method that retrieves a list of all accounts and updates those accounts.
     *      Create a custom field on the Account standard object called Size__c that will be a 
     * picklist containing small/medium/large.
     *     Create a method that retrieves a list of all accounts. 
     *         - If an account has between 1-1000 employees then it is classified as small.
     *         - If an account has between 1001-10000 employees it is classified as medium.
    *         - If an account has more than 10000 employees it is classified as large.
     *     Update the Size__c field on each account to reflect the amount of employees in the Account.
    */
    public static void updateAccountSize( ) {
        
		List<Account> Acc = [SELECT Name, NumberOfEmployees, Size__c FROM Account];
        for(Account tempAcc : Acc){
            if(tempAcc.NumberOfEmployees>10000){
                tempAcc.Size__c = 'Small';
            }else if(tempAcc.NumberOfEmployees<=1000){
                tempAcc.Size__c = 'Medium';
            }else{
                tempAcc.Size__c = 'Large';
            }
        }
        //System.debug(Acc[34].Name+' '+Acc[34].Size__c+' '+Acc[34].NumberofEmployees);
        //DML Insert statement here
    }

    /* Done
     * 7. Create a method that will find all leads that contain 'ca' in their fields. 
     *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
     * Converted' and their description should display the message, "We are no longer doing 
     * business in California."
     */
    public static void updateCALeads( ) {
		List<Lead> ld = [SELECT Name, State, Status, Description FROM Lead];
        Integer count = 0;
        for(Lead tempLd : ld){
            if(tempLd.State.contains('ca')){
                count++;
                tempLd.Status = ' Closed - Not Converted';
                tempLd.Description = 'We are no longer doing business in California.';
            }
        }
        //DML Insert statement here
    }

    /* Done?
     * 8. Create a method that will find all Opportunities which have already passed their Close Date 
     * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
     * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
     */
    public static void closePastDueOpportunities( ) {
		List<Opportunity> opp = [SELECT Id, CloseDate, StageName FROM Opportunity WHERE StageName != 'Closed Won'];
        for(Opportunity tempOpp : opp){
                if(Date.today()>tempOpp.CloseDate){
                    tempOpp.StageName = 'Closed Won';
                }
            }
        //System.debug(opp[4].StageName+' '+opp[4].CloseDate);
        ////DML Insert statement here
    }

    /*  Done
     *  9. questionMarks declares the str parameter, which can have numbers, letters, and question marks.
     *  It will then check str to see if there are exactly 3 question marks between every pair of two numbers that add up to 10.
     *   If there are, questionMarks returns true. In any other case (including the case where str doesn't contain any two numbers that sum to 10),
     *   questionMarks will return false.
     *
     *   For example, when given the String "arrb6???4b5???ef5", questionMarks returns true because there are 3 question marks between 6 and 4 and
     *   another 3 question marks between 5 and 5 (and both pairs of numbers sum to 10).
     *
     *  Other examples:
     *      str = "aa6?9" => questionMarks returns false
     *      str = "a?7??s?3r1?????5" => questionMarks returns true because there's at least one pair of numbers that sum to 10 (7 and 3) and 3
     *          question marks between those numbers
    */
    public static Boolean questionMarks(String str) {
    	// if we find a question mark that isn't at index 0, and check the number before it
    	// then do a second loop to go through the substring until you find a 3rd question mark
    	// Check the number to the right of that question mark, and add these values up
    	// if they equal 10, then return true
    	// else continue until the next question mark
    	// if the loop clears, then return false
        // Loop through string
        for(Integer i = 0;i<str.length();i++){
            if(str.charAt(i)==63){
                
                Integer firstNum = str.charAt(i-1) - 48; // normalizes ascii code. 
                if(firstNum>9||firstNum<0){
                    continue; // if the char to the left of the question mark is not a number, continue to the next "char"
                }
                Integer questionMarkCount = 1;
                for(Integer j = i;j<str.length()-2;j++){ // -2, because there can't be a number to the right of a question mark, and that's all this is loking for
                    if(str.charAt(j)==63) // 63 is the code for '?', instead of the char
                        questionMarkCount++;
                    if(questionMarkCount>=3){
                        Integer secondNum = str.charAt(j+1) - 48; // normalizes ascii code. 
                        if(secondNum>9||secondNum<0){
                            continue; // if the char to the left of the question mark is not a number, continue to the next char
                        }
                    	if(firstNum+secondNum==10)
                            return true;
                    }                    
                }
            }
        }
    	
    	return false;
    }

    /* DONE
     *   10. multipleCounter returns the number of multiples of the Integer n that exist in the inclusive range [firstNum, secondNum].
     *   You can assume that firstNum < secondNum in all cases.
     *
     *   Examples:
     *       firstNum = 1, secondNum = 6, n = 5 => multipleCounter returns 1 because there is one multiple of 5 in the range [1, 6] (which is 5)
     *       firstNum = 2, secondNum = 12, n = 2 => multipleCounter returns 6 because there are 6 multiples of 2 in the range [2, 12] 
     *          (which are 2, 4, 6, 8, 10, and 12)
    */
    public static Integer multipleCounter(Integer firstNum, Integer secondNum, Integer n) {
        Integer count = 0;
        for(integer i = firstNum;i<=secondNum;i++){
            if(math.mod(i,n)==0)
                count++;
        }
        return count;
    }
    
    /*	 Works for all cases except for the last one
     * 	 It recogizes the 'bab' as
     *   11. palindromicity declares a parameter str and returns the degree of palindromicity for that string - i.e. the smallest possible number
     *   of palindromes needed to construct the string.
     *
     *   Examples:
     *      str = "a" => palindromicity returns 1 because "a" backwards is "a"
     *      str = "b3b" => palindromicity returns 1 because "b3b" backwards is "b3b"
     *
     *      str = "ty" => palindromicity returns 2 because str can be broken into two 1 letter palindromes ("t" and "y")
     *      str = "343hmh" => palindromicity returns 2 because str can be broken into two 3 letter palindromes ("343" and "hmh")
     *
     *      str = "iotoihannahracecar" => palindromicity returns 3 because str can be broken into 3 palindromes ("iotoi", "hannah", and "racecar")
     *      str = "abcbabcbabab" => 2. pretty sure it's greedy
     *      str = "abcbabcbababa" => 3. both ways: "abcbabcba" "bab" "a" or "ababa" "bcbabcb" "a"
     *      str = "ababbbabbababa" => 4. NOT GREEDY. 'a' 'babbbab' 'b' 'ababa' is the answer. 
     *                                    'aba' 'bbb' 'abba' 'b' 'aba' is the greedy answer.
    */
    public static Integer palindromicity(String str) {
        // So take the first charater of the string.
        // From there, make a reverse list and check to see if each character in both matches.
        // If not, decrease how much you are checking the reversed list by
        // End once you are at a list size of one for the reversed one
        String reversedString;
        String subString;
        Boolean passed = true;
        Integer count = 0;
        for(Integer x = 0;x<str.length();x++){ // This loop goes from left to right, and that's it. Its index can be pushed forward due to the y Loop
            subString = str.substring(x);
            for(Integer y = str.length();y>x;y--){ // Decrements from the end all the way to the starting index given above
                reversedString = str.substring(x, y).reverse();   
                    for(Integer z = 0;z<reversedString.length();z++){ // compares the 2 substrings to check for failure
                            if(subString.charAt(z) != reversedString.charAt(z)){
                                passed = false;
                                continue;
                            }
                    }
                if(passed){
                    //System.debug('X: '+x+', Y: '+y +', Reverse String: '+reversedString+', String: '+subString);
                    count++;
                    x = y-1;
                    continue;
                }else{ // if this iteration failed the test, try the next iteration
                    passed = true; // weird logic ik, but setting it to true here because by default, it will be set to false above
                }
            }            
        }	
        //System.debug(count);
        return count;
    }
}