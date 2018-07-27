(define (horner-eval x coefficient-sequence)
  (+ (car coefficient-sequence)
     (accumulate (lambda (this-coeff higher-terms) (* x (+ higher-terms this-coeff)))
                 0
                 (cdr coefficient-sequence))))
