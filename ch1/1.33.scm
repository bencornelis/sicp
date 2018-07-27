(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
    null-value
    (let ((cur-term (term a))
          (next-accum (filtered-accumulate filter combiner null-value term (next a) next b)))
      (if (filter cur-term)
        (combiner cur-term next-accum)
        next-accum))))

; (define (sum-prime a b) (filtered-accumulate prime? + 0 identity a inc b))

(define (sum-even a b)
  (define (even? n) (= (remainder n 2) 0))
  (define (identity n) n)
  (define (inc n) (+ n 1))
  (filtered-accumulate even? + 0 identity a inc b))

(sum-even 3 7) ; 4 + 6 = 10
