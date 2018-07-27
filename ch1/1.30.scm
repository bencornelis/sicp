(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (inc n) (+ n 1))
(define (square x) (* x x))
(sum square 1 inc 4) ; 1^2 + 2^2 + 3^2 + 4^2 = 30

(define (inc-2 n) (+ n 2))
(define (cube x) (* x x x))
(sum cube 3 inc-2 7) ; 3^3 + 5^3 + 7^3 = 495
