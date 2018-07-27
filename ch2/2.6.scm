(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; one = (lambda (f) (lambda (x) (f x))) = f => f
; two = f => f^2
; n = f => f^n
(define (plus n m)
  (lambda (f) (lambda (x) ((n f) ((m f) x)))))

; digression
(define (apply f x n)
  (if (= n 0)
    x
    (apply f (f x) (- n 1))))
