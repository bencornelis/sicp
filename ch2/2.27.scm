(define (reverse items)
  (if (null? items)
    items
    (append (reverse (cdr items)) (list (car items)))))

(define (deep-reverse items)
  (if (not (pair? items))
    items
    (reverse (map deep-reverse items))))
