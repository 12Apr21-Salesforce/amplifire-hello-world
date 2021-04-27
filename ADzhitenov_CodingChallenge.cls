
    /////////////////////////////////////////////////////////////////
    //
    // Name: Coding Challenges
    // Author: Alexander Dzhitenov (alexander.dzhitenov@revature.net)
    // Date: 04/23/2021
    // Description: Series of apex methods to demonstrate
    // basic understanding of coding concepts.
    //
    /////////////////////////////////////////////////////////////////

public class ADzhitenov_CodingChallenge{

    /*
     * 1. Return the nth Fibonacci number
     * Test Cases:
     * Input: 0     Output: 0
     * Input: 1    Output: 1
     * Input: 2     Output: 1
     * Input: 10    Output: 55
    */
    public static Integer nFibonacci( Integer n ){

    integer x1=0;
    integer x2=1;

    for (integer iii=0; iii<n; ++iii){
        integer temp = x1+x2;
        x1 = x2;
        x2 = temp;
    }

    return x1;

    }

    /*
System.debug(ADzhitenov_CodingChallenge.nFibonacci(0));
System.debug(ADzhitenov_CodingChallenge.nFibonacci(1));
System.debug(ADzhitenov_CodingChallenge.nFibonacci(2));
System.debug(ADzhitenov_CodingChallenge.nFibonacci(10));
    */

    /*
     * 2. Sort a list of integers.
     * Test Cases:
     * Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5]
     * Input: [5,4,3,2,1]     Output: [1,2,3,4,5]
     *
     * Don't use the sort() method... that would be lame.
    */

    private static void swap(List<integer> intList, integer coord1, integer coord2){
        integer temp = intList[coord1];
        intList[coord1] = intList[coord2];
        intList[coord2] = temp;
    }

    public static List<Integer> sortList( List<Integer> intList ) {

        for (integer jjj=intList.size()-1; jjj>0; --jjj){

            for (integer iii=0; iii<jjj; ++iii){
                if (intList[iii] > intList[iii+1]){
                    swap(intList, iii, iii+1);
                }
            }
        }
        return intList;
    }

    /*
List<Integer> newList = new List<Integer>{2,4,5,1,3,1};
System.debug(ADzhitenov_CodingChallenge.sortList(newList));
List<Integer> newList = new List<Integer>{5,4,3,2,1};
System.debug(ADzhitenov_CodingChallenge.sortList(newList));
List<Integer> newList3 = new List<Integer>{2164,6,7,81,92,54,605,0,121,567};
System.debug(ADzhitenov_CodingChallenge.sortList(newList3));
    */

    /*
     * 3. Return the factorial of n.
     * Test Cases:
     * Input: 0    Output: 1
     * Input: 1    Output: 1
     * Input: 3    Output: 6
    */
    public static Integer nFactorial( Integer n) {
        if (n==0){
            return 1;
        }
        else{
            return (n*nFactorial(n-1));
        }
    }

    /*
     * 4. Rotate left
     * Given a list, list, and an integer, n, rotate the values in list left n times and return list
     * Test Cases:
     * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
    */

/*
List<integer> testList = new List<integer>{1,2,3,4,5};
System.debug(ADzhitenov_CodingChallenge.rotateLeftNTimes(testList, 1));
List<integer> testList2 = new List<integer>{1,2,3,4,5};
System.debug(ADzhitenov_CodingChallenge.rotateLeftNTimes(testList2, 6));
List<integer> testList3 = new List<integer>{1,2,3,4,5};
System.debug(ADzhitenov_CodingChallenge.rotateLeftNTimes(testList3, 3));
*/


    public static List<Integer> rotateLeftNTimes( List<Integer> nList, Integer n) {
        integer last = nList.size()-1;
        for (integer iii=0; iii<n; ++iii){
            integer temp = nList[0];
            for (integer jjj=1; jjj<nList.size(); ++jjj){
                nList[jjj-1] = nList[jjj];
            }
            nList[last] = temp;
        }
        return nList;
    }

    /*
     * 5. Balanced Brackets
     * A bracket is any one of the following: (, ), {, }, [, or ]
     * 
     * The following are balanced brackets:
     *    ( )
     *    ( ) ( )
     *    ( ( ) )
     *    ( { [ ] } )
     *
     * The following are NOT balanced brackets:
     *   (
     *   )
     *   ( ( )
     *   ( [ ) ]
     *
     * Return true if balanced
     * Return false if not balanced
    */

    public static Boolean bracketsAreBalanced( String s ) {
        boolean isBalanced;
        boolean finished = false;

        while(!finished){
            String s_current = s;
            s = s.remove('()');
            s = s.remove('[]');
            s = s.remove('{}');
            if (s.equals(s_current)){
                finished = true;
            }
            system.Debug(s);
        }
        
        system.Debug(s);
        if (s != '')
            return false;
        else
            return true;
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



    }

    /* 
     * 7. Create a method that will find all leads that contain 'ca' in their fields. 
     *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
     * Converted' and their description should display the message, "We are no longer doing 
     * business in California."
     */
    public static void updateCALeads( ) {

        List<Lead> leadList = [SELECT State FROM Lead WHERE State = 'CA'];
        System.debug(leadList);

    }

    /*
     * 8. Create a method that will find all Opportunities which have already passed their Close Date 
     * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
     * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
     */
    public static void closePastDueOpportunities( ) {

        Date today = Date.today();

        List<Opportunity> newList = [SELECT StageName FROM Opportunity WHERE StageName != 'Closed Won' AND CloseDate < :today];
        for (Opportunity o: newList){
            o.StageName = 'Closed Lost';
        }


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

/*
    System.debug(ADzhitenov_CodingChallenge.questionMarks('aa6?9'));
    System.debug(ADzhitenov_CodingChallenge.questionMarks('a?7??s?3r1?????5'));
    System.debug(ADzhitenov_CodingChallenge.questionMarks('ade0f7???y9v???p9q4???3th'));
    System.debug(ADzhitenov_CodingChallenge.questionMarks('a???3q7??asdf3'));
    System.debug(ADzhitenov_CodingChallenge.questionMarks('3qy7++??3???725'));

*/


    /*
        1.) Convert input string to char using getChars(), then iterate through the resulting integer list
        2.) Every time a number is found (ASCII [48-57]), store that number
        3.) For every subsequent character, check if it is a question mark (ASCII 63). If yes, ++qCount
        4.) If another number is found, check if the sum is 10. If yes, and if (qCount == 3), return true. If not, store the new
            number in place of the old one and reset qCount = 0. Continue iterating through the list.
        5.) When the end of the string is reached, return false.
    */

    private static integer convertCharCode(integer intIn){
        return intIn-48;
    }

    public static Boolean questionMarks(String str) {

        List<integer> charCodeList = new List<integer>();
        charCodeList = str.getChars();
        integer lastInt = -1;
        integer qCount = 0;

        for (integer current : charCodeList){

            if ((current >= 48) && (current <= 57)){
                if ((lastInt + convertCharCode(current) == 10) && (qCount==3))
                    return true;
                else{
                    lastInt = convertCharCode(current);
                    qCount = 0;
                }
            }
            else if (current == 63)
                ++qCount;
        }

        return false;        
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

/*
    System.debug(ADzhitenov_CodingChallenge.multipleCounter(1,6,5));
    System.debug(ADzhitenov_CodingChallenge.multipleCounter(2,12,2));
*/

    public static Integer multipleCounter(Integer firstNum, Integer secondNum, Integer n) {
        integer multipleCount = 0;
        for (integer iii=firstNum; iii<=secondNum; ++iii){
//            System.debug(firstNum + ' ' + secondNum + ', ' + iii);
//            System.debug(math.mod(iii, n));
            if (math.mod(iii, n) == 0 && iii!=0){
                ++multipleCount;
            }
//            System.debug(multipleCount);
        }
        return multipleCount;
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

//  Define 'range' as the distance, in number of characters, a palindrome expands outwards to either side of its midpoint
//  Define the 'midpoint' as a palindrome as either the centermost character (odd palindrome) or the left-most of the two centermost
//  characters (even)

    public static integer scanPalindrome(List<integer> charCodes, integer startIndex, boolean even){

        integer upperBound;
        integer range = 0;

        if (charCodes.size()-startIndex > startIndex)
            upperBound = startIndex;
        else
            upperBound = charCodes.size()-startIndex;
        
        if (even){
            integer iii = 0;
            while ( (startIndex-iii >= 0) && (startIndex+iii+1 < charCodes.size()) ){
                if (charCodes[startIndex-iii] == charCodes[startIndex+iii+1])
                    ++range;
                else 
                    break;
                ++iii;
            }
        }
        else{
            integer iii = 1; //Odd palindromes have a center character; start counting away from it (difference in size accounted for later)
            while ( (startIndex-iii >= 0) && (startIndex+iii < charCodes.size()) ){
                if (charCodes[startIndex-iii] == charCodes[startIndex+iii])
                    ++range;
                else
                    break;
                ++iii;
            }
        }

        /*
        if (even){
            for (integer iii=1; iii<upperBound; ++iii){
                if (charCodes[startIndex-iii] == charCodes[startIndex+iii+1])
                    ++range;
                else{
                    break;
                }
            }      
        }
        else{
            for (integer iii=1; iii<upperBound; ++iii){
                if (charCodes[startIndex-iii] == charCodes[startIndex+iii])
                    ++range;
                else{
                    break;
                }   
            }      
        }
        */

        return range;
    }

    private static List<integer> largestPalindrome(List<integer> charCodes){
        integer largestIndex = 0;
        integer largestRange = 0;
        integer largestEven = 0;
        integer largestSize = 0;


        for (integer iii=1; iii<CharCodes.size()-1; ++iii){

            boolean evenFound = false;
            boolean oddFound = false;

            if (CharCodes[iii] == CharCodes[iii+1]){
                evenFound = true;
                integer currentRange = scanPalindrome(CharCodes, iii, true);
                integer currentSize = currentRange*2;
                if (currentSize > largestSize){
                    largestIndex = iii;
                    largestRange = currentRange;
                    largestEven = 1;
                    largestSize = currentSize;
                }
            }
            if (CharCodes[iii-1] == CharCodes[iii+1]){
                oddFound = true;
                integer currentRange = scanPalindrome(CharCodes, iii, false);
                integer currentSize = currentRange*2 + 1;
                if (currentSize > largestSize){
                    largestIndex = iii;
                    largestRange = currentRange;
                    largestEven = 0;
                    largestSize = currentSize;
                }
            }
            if (!evenFound && !oddFound){
                integer currentSize = 1;
                if (currentSize > largestSize){
                    largestIndex = iii;
                    largestRange = 0;
                    largestEven = 0;
                    largestSize = currentSize;
                }
            }

            
        }

        List<integer> palindromeIndexRangeEven = new List<integer>{largestIndex, largestRange, largestEven};
        System.debug(palindromeIndexRangeEven);
        return palindromeIndexRangeEven;
    }

    private static List<integer> splitPalindrome(List<integer> charCodes, integer index, integer range, integer even){
    // Removes a found palindrome from the list of char codes, replacing it with a single '-1' value to denote the boundary
    // between the two new lists to be searched
        integer startIndex;
        integer endIndex;

        List<integer> palindrome = new List<integer>();

        if (even == 1){
            startIndex = index - range + 1; // Counting range is not entirely consistent across even and odd palindromes
            endIndex = index + range;
        }
        else if (even == 0) {
            startIndex = index - range;
            endIndex = index + range;
        }
        System.debug('Start Index: ' + startIndex);
        for (integer iii = startIndex; iii <= endIndex; ++iii){
            palindrome.add(charCodes.remove(startIndex));
        }
        System.debug(palindrome);
        if (charCodes.size() > 0 && (startIndex < charCodes.size()) )
            charCodes.add(startIndex, -1);
        else if (charCodes.size() > 0 && (startIndex >= charCodes.size()) )
            charCodes.add(-1);
        // Because the last sequence of characters is sometimes removed, and because startIndex is the index of the first character of
        // this sequence, this situation must be accounted for separately in order to avoid an out-of-bounds error
        System.debug('splitPalindrome: ' + charCodes);
        return palindrome;
    }

    //1.) Convert input string to lowercase
    //2.) Convert now-lowercase string into ASCII using 'getChar()'
    //3.) Search through ASCII list for mirrored patterns:
    //      -Create a list of values that have already been seen while iterating through the list
    //      -Check each new value against both the preceding value, and the value before it--if either matches, begin checking subsequent
    //       values against other, preceding values in the list; the point up to which all values match denotes a palindrome
    //      -Record the palindrome's length and location
    //      -Continue searching, up until the middle of the input string. Record all palindromes thus found
    //      -Remove the largest palindrome from the string, splitting the string into two segments
    //      -Search remaining segments for palindromes.

    private static List<integer> strWrite(List<integer> charCodes){
        System.debug('strWrite: Input string: ' + charCodes);
        List<integer> newCharCodes = new List<integer>();
        integer index = 0;

        integer inputListSize = charCodes.size();
        //charCodes shrinks in size when it is split into separate lists, so the size needs to be identified and fixed beforehand
//        System.debug(charCodes.size());
        for (integer iii = 0; iii < inputListSize; ++iii){
            if (charCodes[0] == -1){
                charCodes.remove(0);
                break;
            }
            newCharCodes.add(charCodes.remove(0));
        }
/*
        while (charCodes[index] != -1 && index < (charCodes.size()-2)){

            newCharCodes.add(charCodes.remove(index));
            ++index;
        }
        charCodes.remove(index);
*/

        return newCharCodes;
    }

    private static void palindromeRecurse(List<integer> charCodes, List<string> palindromes){

        //Overall, the recursion algorithm performs ONE largest-palindrome sequence, then calls itself to do the same on the two remaining
        //charCode segments (including calling itself again on the two resulting segments...). Each time, the 'palindromes' list is further
        //populated with palindrome sequences, which are correspondingly removed from the original sequence.
        
        //perform largest-palindrome sequence ONCE on the given char codes; this will result in the largest palindrome being added to
        //palindromes, with the original char code sequence containing it replaced with a '-1'

        List<integer> palindromeIndexRangeEven = new List<integer>();
        palindromeIndexRangeEven = largestPalindrome(charCodes);
        List<integer> temp = new List<integer>();
        temp = splitPalindrome(charCodes, palindromeIndexRangeEven[0], palindromeIndexRangeEven[1], palindromeIndexRangeEven[2]);
        System.debug(charCodes);
        palindromes.add(string.fromCharArray(temp));

        System.debug(palindromes);

        //strWrite stops each time it hits '-1', and then removes that '-1'. It needs to be called twice per recursion in order to guarantee
        //complete coverage.

        List<integer> newStrToOperateOn = strWrite(CharCodes);
        System.debug('newStrToOperateOn: ' + newStrToOperateOn);
        //A blank string is returned if a leftmost-largest palindrome was found. In this case, no further recursion is necessary on that half.
        if (newStrToOperateOn.size() > 0){
            System.debug('Recursing...');
            palindromeRecurse(newStrToOperateOn, palindromes);
        }

        List<integer> newStrToOperateOn2 = strWrite(CharCodes);
        System.debug('newStrToOperateOn2: ' + newStrToOperateOn2);
        if (newStrToOperateOn2.size() > 0){
            System.debug('Recursing...');
            palindromeRecurse(newStrToOperateOn2, palindromes);
        }

        System.debug('Exiting recursion.');

    }

    public static Integer palindromicity(String str) {

        str.toLowerCase();
        List<integer> strCharCodes = new List<integer>();
        strCharCodes = str.getChars();

        List<string> palindromes = new List<string>();


        /*
        List<integer> palindromeIndexRangeEven = new List<integer>();

        palindromeIndexRangeEven = largestPalindrome(strCharCodes);
        System.debug(palindromeIndexRangeEven);
        List<integer> temp = new List<integer>();
        temp = splitPalindrome(strCharCodes, palindromeIndexRangeEven[0], palindromeIndexRangeEven[1], palindromeIndexRangeEven[2]);

        System.debug(string.fromCharArray(temp));
        */

        palindromeRecurse(strCharCodes, palindromes);











        return NULL;        
    }
}