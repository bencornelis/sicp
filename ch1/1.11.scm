; recursive process
; (define (f n)
;   (if (< n 3)
;       n
;       (+ (f (- n 1))
;          (* 2 (f (- n 2)))
;          (* 3 (f (- n 3))))))

; iterative process
(define (f n)
        (if (< n 3)
             n
            (f-iter (- n 2) 2 1 0)))

(define (next a b c) (+ a (* 2 b) (* 3 c)))
(define (f-iter count a b c)
        (if (= 0 count)
            a
            (f-iter (- count 1) (next a b c) a b)))
