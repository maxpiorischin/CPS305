(defvar *DISCIPULUS-STATES* 
    '((sleeping . eating)
    (eating . (waiting texting blogging)) 
    (texting . programming)
    (waiting . programming)
    (blogging . programming)
    (programming . debugging)
    (debugging . (watching-Utube working-out)) 
    (watching-Utube . sleeping)
    (working-out . sleeping)))



(defun discipulus (state)
    (let ((vals (cdr(assoc state *DISCIPULUS-STATES*))))
        (if (listp vals)
            (elt vals (random (length vals)))
            vals)))

(defun sleepless (state)
    (let ((vals (cdr(assoc state *DISCIPULUS-STATES*)))
          (value nil))
        (if (listp vals)
            (:= value (elt vals (random (length vals))))
            (:= value vals))
        (if (eq value 'sleeping)
            'eating
            value)))

(defun discipulus-on-caffeine (state)
    (let ((vals (cdr(assoc state *DISCIPULUS-STATES*))))
        (if (listp vals)
            (discipulus (elt vals (random (length vals))))
            (discipulus vals))))

(defun my-append (list1 list2)
    (if (null list2)
        list1
        (progn
            (:= list1 (cons (car list2) (reverse list1)))
            (my-append (reverse list1) (cdr list2)))))

(defun power (num power &optional acc neg)
    (when (null acc) (:= acc num))
    (when (< power 0) (progn (:= power (abs power)) (:= neg 1)))
    (cond ((zerop num) nil) 
        ((zerop power) 1) 
        ((and (equal power 1) (null neg)) acc)
        ((and (equal power 1) (not(null neg))) (/ 1 acc))
        ((> power 1) (power num (:= power (- power 1)) (* acc num) neg))))

(defun COMB (n k)
    (cond 
        ((or (< n 0) (< k 0) (< n k)) nil)
        ((zerop k) 1)
        ((equal n k) 1)
        ((> k 0) (+ (COMB (- n 1) k) (COMB (- n 1) (- k 1))))))



