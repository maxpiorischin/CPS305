(defun filter-seq (s a)
    (let ((newstr ""))
    (progn
        (loop for x across s do (
            loop for y across a do (
                when (char= x y) (:= newstr (concatenate 'string newstr (string x))))))
        newstr)
    ))

