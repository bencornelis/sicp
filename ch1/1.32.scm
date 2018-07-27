(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b) (accumulate + 0 term a next b))

(define (sq n) (* n n))
(define (inc n) (+ n 1))
(sum sq 2 inc 5) ; 2^2 + 3^2 + 4^2 + 5^2 = 54

(define (product term a next b) (accumulate * 1 term a next b))
(product sq 2 inc 5) ; 2^2 * 3^2 * 4^2 * 5^2 = 14400
