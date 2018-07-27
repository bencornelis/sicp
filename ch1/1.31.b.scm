(define (product term start step stop)
  (define (iter x prod)
    (if (> x stop)
      prod
      (iter (step x) (* (term x) prod))))
  (iter start 1))

(define (square x) (* x x))
(define (inc n) (+ n 1))
(product square 2 inc 5) ; 2^2 * 3^2 * 4^2 * 5^2 = 14400
