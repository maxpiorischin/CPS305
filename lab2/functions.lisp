; Helper functions omitted due to not being my work

(defun DNA-COUNT (str)
  (do ((i 0 (1+ i))
    (ng 0)
    (na 0)
    (nc 0)
    (nt 0)
    (len (length str)))
    ((= i len) (values ng na nc nt))

    (when (or (equal (aref str i) #\a) (equal (aref str i) #\A))
      (:= na (1+ na)))
    (when (or (equal (aref str i) #\g) (equal (aref str i) #\G))
      (:= ng (1+ ng)))
    (when (or (equal (aref str i) #\c) (equal (aref str i) #\C))
      (:= nc (1+ nc)))
    (when (or (equal (aref str i) #\t) (equal (aref str i) #\T))
      (:= nt (1+ nt)))))


(defun GC-RATIO (str)
  (when (> (length str) 0)
    (multiple-value-bind (ng na nc nt) (dna-count str)
    (/ (+ ng nc) (length str)))))


(defun NEXT-PRIME (n)
  (if (prime? n)
    (progn (:= n (+ 1 n))
    (do ((z n (+ 1 z))) ((prime? z) z))
    ) nil))

