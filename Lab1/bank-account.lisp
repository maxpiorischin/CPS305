;; Function only I created

(defvar *balance* 100)

(defun deposit (amount)
  (if (and (>= amount 0) (<= amount 10000))
  (progn
    (:= *balance* (+ *balance* amount))
    *balance*)(format t "Deposit between 0 and 10000")))