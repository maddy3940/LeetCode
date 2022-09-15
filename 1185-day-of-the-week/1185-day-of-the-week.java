class Solution {
    public String dayOfTheWeek(int day, int month, int year) {
      String[] days = new String[]{"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
        int[] months = new int[]{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        //1971-1-1 is Friday
      int dayCount = 0;
        //deal with year
    for(int i = 1971; i < year; i++) {
          boolean isLeap = isLeapYear(i);
          if(isLeap) {
              dayCount += 366;
          } else {
              dayCount += 365;
          }
      }
      //deal with month
     for(int m = 1; m < month; m++) {
         dayCount += months[m-1];
         if(isLeapYear(year) && m == 2) {
             dayCount += 1;
         }
     }  
        //deal with day
        dayCount += day - 1;
        
        //start from Friday
        return days[(dayCount + 5) % 7];
    }
    
    private boolean isLeapYear(int year) {
        if(year % 400 == 0) return true;
        if(year % 100 == 0) return false;
        if(year % 4 == 0) return true;
        return false;
    }}