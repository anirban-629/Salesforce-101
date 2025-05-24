public class L02String{
    public static void main(){
        
        String s1='Anirban';
        String s2='Mishra';
        // System.debug('s1=='+s1);
        // System.debug('s2=='+s2);
        // System.debug(s1+' '+s2);
        // System.debug(s1.equals(s2));
        // System.debug(s1.equals('Anirban'));
        // String s3='Anirban ';
        // System.debug(s1.equals(s3));
        
        // * compareTo is for comparing two strings lexicographically (dictonary order)
        // ? - Positive Number -If the string that called the method lexicographically preceds second String
        // ? - Negative Number -If the string that called the method lexicographically follows second String
        
        String s4='abcde';
        String s5='efghi';
        
        // System.debug(s4.compareTo(s5));
        // System.debug(s5.compareTo(s4));
        
        switch on s5 {
            when 'efghi' {
                System.debug('adsfasdfasdf');
            }
            when else {
                System.debug('1111111111111111111adsfasdfasdf');
                
            }
        }
    }
}