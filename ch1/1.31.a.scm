(define (product term start step stop)
  (if (> start stop)
    1
    (* (term start)
       (product term (step start) step stop))))

(define (square x) (* x x))
(define (inc n) (+ n 1))
(product square 2 inc 5) ; 2^2 * 3^2 * 4^2 * 5^2 = 14400

(define (fact n)
  (define (identity x) x)
    (product identity 1 inc n))

(fact 5) ; 1 * 2 * 3 * 4 * 5 = 120
