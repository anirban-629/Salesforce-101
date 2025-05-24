@isTest
private class TestVerifyDate {
    
    @isTest
    static void testCheckDates() {
        Date date1=Date.newInstance( 2024,10, 10);
        Date date2=Date.newInstance( 2024,11, 8);
        Date result1 = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(result1, date2, 'RESULT 1');
        
        date1=Date.newInstance(2024,10, 10);
        date2=Date.newInstance(2025, 8, 11);
        Date result2= VerifyDate.CheckDates(date1, date2);
        Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
        Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
        System.assertEquals(result2, lastDay, 'RESULT 2');
        
    }
}