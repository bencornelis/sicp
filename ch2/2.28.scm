(define (fringe tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (list tree))
        (else (append (fringe (car tree))
                      (fringe (cdr tree))))))

(fringe (list 1 2 3 4)) ; (1 2 3 4)
(fringe (list (list 1 2) (list 3 4) 5)) ; (1 2 3 4 5)
