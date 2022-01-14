;Helper functions not included, as it was provided by Ryerson and not permitted for distribution
(defun cr-list (&rest v)
  (if (equal v NIL) (make-my-list)
    (my-cons (first v) (apply 'cr-list (rest v)))
    ))

(defun my-remove (list in)
  (when (and (>= in 0) (< in (my-list-size list)))
    (labels ((remove-aux (list i)
  (if (= i 0) (my-cdr list)
    (my-cons (my-car list) (remove-aux (my-cdr list) (1- i))))))
  (remove-aux list in))))
