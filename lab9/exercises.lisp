;Helper functions not included, as it was provided by Ryerson and not permitted for distribution
(defun tr-delete(key root)
    (when (tr-lookup key root) ;Check if deleted item is in list
        (if (children root)
            (let ((child (assoc (elt key 0) (children root))) (newstr (subseq key 1))) ; searches children for a key match, set it to child + get a slice of the key string for recursion
                (tr-delete newstr (cdr child)) ; Recursively call back with a slice of first letter
                (when (and (null (val (cdr child))) (null (children (cdr child)))) ; Check if no children and val is nil, from lecture
                    (:= (children root) (remove child (children root))))) ; Set the children of root to the return value of the child deletion.         
            (:= (val root) NIL)))) ; If no children, set value of the root to nil;
