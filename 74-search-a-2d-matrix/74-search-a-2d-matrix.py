class Solution(object):
    def searchMatrix(self, matrix, target):
        """
        :type matrix: List[List[int]]
        :type target: int
        :rtype: bool
        """
        
        
        for i in range(len(matrix)):
            #print(matrix[i][0])
            if matrix[i][-1]>=target:
                print(matrix[i][-1])
                if matrix[i][0]==target:
                    return True
                for j in range(len(matrix[0])):
             #       print(matrix[i-1][j])
                    if matrix[i][j]==target:
                        return True
                    
        return False