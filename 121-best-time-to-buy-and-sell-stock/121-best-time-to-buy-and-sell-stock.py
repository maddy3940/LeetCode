class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        
        
        t_max=-math.inf
        min_buy=prices[0]
        
        for i in range(1,len(prices)):
            
            if prices[i]-min_buy>t_max:
                t_max= prices[i]-min_buy
                
            if prices[i]<min_buy:
                min_buy=prices[i]
    
        if t_max<0:
            return 0
        else:
            return t_max
                
            
            
            
            
            
        
        
        
        
        
        
        
        
        