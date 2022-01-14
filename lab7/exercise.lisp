;; Helper functions not included, as it was provided by Ryerson and not permitted for distribution

 (defun ht-delete (key ht)
     (when (or (equal (ht-get key ht) 'd) (not (ht-get key ht)) (null (ht-get key ht))) (return-from ht-delete nil))
     ( cdr( := (aref (ht-array ht) (mod (sxhash key) (length (ht-array ht)))) (cons key 'd)))