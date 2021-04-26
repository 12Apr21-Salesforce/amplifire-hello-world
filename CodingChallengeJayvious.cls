    //Lead off your class with the following comment, filled out with 
    //your information.

    /////////////////////////////////////////////////////////////////
    //
    // Name: Coding Challenges
    // Author: Jayvious (JayviousWilliams@gmail.com)
    // Date: 04/23/2021
    // Description: Series of apex methods to demonstrate
    // basic understanding of coding concepts.
    //
    /////////////////////////////////////////////////////////////////

    //Write the following methods in a class called P0B. 
    //Note: The method signatures are given.s
public class CodingChallengeJayvious{
    /*
     * 1. Return the nth Fibonacci number
     * Test Cases:
     * Input: 0     Output: 0
     * Input: 1    Output: 1
     * Input: 2     Output: 1
     * Input: 10    Output: 55
    */
    public static Integer nFibonacci( Integer n ){
        if(n == 1){ //Two base cases which is basically the starting point of each fib sequence
            return 1;
        }
        if(n == 0){
            return 0;
        }
        return nFibonacci(n-1) + nFibonacci(n-2);
    }

    /*
     * 2. Sort a list of integers.
     * Test Cases:
     * Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5]
     * Input: [5,4,3,2,1]     Output: [1,2,3,4,5]
     *
     * Don't use the sort() method... that would be lame.
    */
    public static List<Integer> sortList( List<Integer> intList ) {
        List<Integer> sorted = new List<Integer>();
        while(intList.size() != 0){ //while the given list is not empty
            if(intList.size() == 1){//base case of if the given list only has one item left in list
            //then we can just add that last item to our sorted list assuming that everything inside is correct
                sorted.add(intList.get(0));
                break;
            }
            Integer indexH = 0; //index holder
            Integer min  = intList.get(0); //current min
            for(Integer i = 0; i < intList.size(); i++){//looping through the given list
                Integer tester = intList.get(i);
                if(tester < min){//testing against min to see if there is a smaller number; change min if true
                    indexH = i;//assign the index of the new min for removal later
                    min = tester;
                }
            }
            intList.remove(indexH);//remove new min
            sorted.add(min);//adding min to sorted list
        }
        return sorted;
    }

    /*
     * 3. Return the factorial of n.
     * Test Cases:
     * Input: 0    Output: 1
     * Input: 1    Output: 1
     * Input: 3    Output: 6
    */
    public static Integer nFactorial( Integer n) {
        if (n < 2){ 
            return 1; //anything less than 2 will be equla to 1 e.g 1! = 1 and 0! = 1
        }
        return nFactorial(n-1) * n; //whatever is returned will be multipled by what n is currently
    }

    /*
     * 4. Rotate left
     * Given a list, list, and an integer, n, rotate the values in list left n times and return list
     * Test Cases:
     * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
    */
    public static List<Integer> rotateLeftNTimes( List<Integer> nList, Integer n) {
        while(n != 0){
            List<Integer> holder =  new List<Integer>(); //holder for new list rotations 
            for(Integer i = 1; i < nList.size(); i++){
                holder.add(nList.get(i));//adding from the second point of our list
            }
            holder.add(nList.get(0));//adding what was in the beginning of the list to the back of holder
            //channging the value of nList for return purposes and 
            //for the next iteration of the while loop
            nList = holder;
            n = n - 1;
        }
        return nList;
    }

    /*
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
        List<String> holder = new List<String>();//holds every open bracket that we have not found a closer for 
        String hString = null;//is out open bracket
        Boolean balanced = false;
        if(s.length() <= 1){//base case: if string is less than one then there is no way it would be balanced
            return false;
        }
     	String base = s.substring(s.length()-1);
     	if(base == '{' || base == '(' || base == '['){//base case: if the string ends with a open bracket not balanced
            return false;
     	}

        for(Integer i = 0; i < s.length(); i++){
            String test = null;
            if(i+1 == s.length()){
                test = s.substring(i);
            }else{
                test = s.substring(i, i+1);
            }

            switch on test {
                when '(', '{', '[' {
                    if(hString != null){
                        holder.add(hString);
                        hString = test;
                    }else{
                        hString = test;
                    }
                }
                when ')'{
                    if(hString == '('){
                        if(!holder.isEmpty()){
                        	hString = holder.get(holder.size()-1);
                        	holder.remove(holder.size()-1);
                        }else{
                            hString = null;
                        }
                        balanced = true;
                    }else{
                        return false;
                        //break;
                    }
                }
                when ']'{
                    if(hString == '['){
                       if(!holder.isEmpty()){
                        	hString = holder.get(holder.size()-1);
                        	holder.remove(holder.size()-1);
                        }else{
                            hString = null;
                        }
                        balanced = true;
                    }else{
                        return false;
                        //break;
                    }
                }
                when '}'{
                    if(hString == '{'){
                        if(!holder.isEmpty()){
                        	hString = holder.get(holder.size()-1);
                        	holder.remove(holder.size()-1);
                        }else{
                            hString = null;
                        }
                        balanced = true;
                    }else{
                        return false;
                        //break;
                    }
                }
                }
            }
     if(!holder.isEmpty()){
         return false;
     }
     switch on hString{//final test: if we make it here then there may be case where the string is false but has yet to been caught. we use this switch statment to ensure that hstring does have a closer, if not return false
         when '['{
             if(base != ']'){
                 return false;
             }
         }
         when '{'{
             if(base != '{'){
                 return false;
             }
         }
         when '('{
             if(base != ')'){
                 return false;
             }
         }
     }
     return balanced;

  }


    /* You should NOT be submitting answers that you find online. You will be expected to be able to defend any of these solutions without notice. */

    /*
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
        List<Account> aSize = [SELECT Size__c, NumberOfEmployees FROM Account];
        for(Integer i = 0; i < aSize.size(); i++){
            Account aH = aSize.get(i);
            Integer numE = aH.NumberOfEmployees;
            if(numE == null){
                continue;
            }
            else if(numE >= 1 && numE <= 1000){
                aH.Size__c = 'small';
            }
            else if(numE >= 1001 && numE <= 10000){
                aH.Size__c = 'medium';
            }
            else{
                aH.Size__c = 'large';
            }
        }
        update aSize;

    }

    /* 
     * 7. Create a method that will find all leads that contain 'ca' in their fields. 
     *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
     * Converted' and their description should display the message, "We are no longer doing 
     * business in California."
     */
     public static void updateCALeads( ) {
         List<Lead> caLead = [SELECT Address, Status, Description FROM Lead WHERE DISTANCE(Address, GEOLOCATION(37.0321592,-123.7983497), 'mi') = 1];
         for (Lead l : caLead){
             l.Status = 'Closed - Not Converted';
             l.Description = 'We are no longer doing business in California.';
         }
         update caLead;
    }
    /*
     * 8. Create a method that will find all Opportunities which have already passed their Close Date 
     * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
     * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
     */
      public static void closePastDueOpportunities( ) {
           List<Opportunity> opps = [SELECT CloseDate, StageName FROM Opportunity WHERE StageName != 'Closed Won' AND CloseDate < TODAY];
    		for(Opportunity o : opps){
        		o.StageName = 'Closed Lost';
    		}
         update opps;
    } 

    /*  
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
        Integer cnt = 0; // cretaing a counter to check each '?' in the string
        Integer fNum = 0;
        Integer lNum = 0;
        Boolean fPick = false;
        Boolean lPick = false;
        Boolean allG = false;

          for(Integer i = 0; i < str.length(); i++){ 
            String holder = null;
            if(i+1 == str.length()){
                holder = str.substring(i);
            }else{
                holder = str.substring(i, i+1);
            }
            
            if(holder.isNumeric() && fPick != true){
                fPick = true;
                fNum  = Integer.valueOf(holder);
            }
            else if(holder.isNumeric() && lPick != true){
                lPick = true;
                lNum = Integer.valueOf(holder);
                
            }
            if(holder == '?' && fPick == true){
                cnt = cnt + 1;
            }
            if(fPick == true && lPick == true){
                Integer s = fNum + lNum;
                if(s == 10 && cnt == 3){
                    allG = true;
                    //break;
                }else{
                    cnt = 0;
                    fPick = false;
                    lPick =  false;
                    fNum = 0;
                    lNum = 0;
                }
            }
        }
      return allG;
    }


    /*
     *   10. multipleCounter returns the number of multiples of the Integer n that exist in the inclusive range [firstNum, secondNum].
     *   You can assume that firstNum < secondNum in all cases.
     *
     *   Examples:
     *       firstNum = 1, secondNum = 6, n = 5 => multipleCounter returns 1 because there is one multiple of 5 in the range [1, 6] (which is 5)
     *       firstNum = 2, secondNum = 12, n = 2 => multipleCounter returns 6 because there are 6 multiples of 2 in the range [2, 12] 
     *          (which are 2, 4, 6, 8, 10, and 12)
    */
    public static Integer multipleCounter(Integer firstNum, Integer secondNum, Integer n) {
        Integer i = firstNum;
        Integer ctr = 0;
        while(i <= secondNum){
            if(Math.mod(i, n) == 0){
                ctr = ctr + 1;
            }
            i = i + 1;
        }
        return ctr;
    }
    
    /*
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

    }
}