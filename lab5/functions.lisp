;;part 2 - ;Helper functions not included, as it was provided by Ryerson and not permitted for distribution
(defstruct deque front back)

(defun push-front (item deq)
    (push item (deque-front deq)))

(defun push-back (item deq)
    (push item (deque-back deq)))

(defun pop-front (deq)  
    (let ((item nil))
         
         (if (> (length (deque-front deq)) 0)
             (:= item (pop (deque-front deq)))   
                
            (progn 
            (:= (deque-back deq) (reverse (deque-back deq))) 
            (:= item (pop (deque-back deq)))    
            (:= (deque-back deq) (reverse (deque-back deq)))))  
            item))
    

(defun pop-back (deq)
    (let ((item nil))
         
         (if (> (length (deque-back deq)) 0)
             (:= item (pop (deque-back deq)))   
                
            (progn 
            (:= (deque-front deq) (reverse (deque-front deq))) 
            (:= item (pop (deque-front deq)))    
            (:= (deque-front deq) (reverse (deque-front deq)))))  
            item))