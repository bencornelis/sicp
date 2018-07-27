(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; a
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cadr mobile))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (cadr branch))

; b
(define (total-weight mobile)
  (if (not (pair? mobile))
    mobile ; in this case a weight, represented by a number
    (+ (total-weight (branch-structure (left-branch mobile)))
       (total-weight (branch-structure (right-branch mobile))))))

(define m1
  (make-mobile
    (make-branch 2 3)
    (make-branch 5 (make-mobile
                      (make-branch 3 (make-mobile
                                       (make-branch 1 2)
                                       (make-branch 4 9)))
                      (make-branch 2 (make-mobile
                                        (make-branch 3 7)
                                        (make-branch 6 2)))))))
; (+ 3 2 9 7 2) = 23

(define m2
  (make-mobile
    (make-branch 1 2)
    (make-branch 3 (make-mobile
                      (make-branch 4 (make-mobile
                                       (make-branch 3 5)
                                       (make-branch 3 (make-mobile
                                                        (make-branch 1 6)
                                                        (make-branch 1 7)))))
                      (make-branch 2 (make-mobile
                                        (make-branch 2 9)
                                        (make-branch 1 8)))))))
; (+ 2 5 6 7 9 8) = 37
; ((1 2) (3 ((4 ((3 5) (3 ((1 6) (1 7))))) (2 ((2 9) (1 8))))))

; c
(define (torque-branch branch) (* (branch-length branch) (total-weight (branch-structure branch))))
(define (balanced? mobile)
  (if (not (pair? mobile))
    true
    (and (= (torque-branch (left-branch mobile)) (torque-branch (right-branch mobile)))
         (balanced? (branch-structure (left-branch mobile)))
         (balanced? (branch-structure (right-branch mobile))))))

(define m3
  (make-mobile
    (make-branch 5 4)
    (make-branch 2 (make-mobile
                     (make-branch 3 3)
                     (make-branch 3 1)))))

; (balanced? m3) = false

(define m4
  (make-mobile
    (make-branch 5 4)
    (make-branch 2 (make-mobile
                     (make-branch 3 4)
                     (make-branch 3 6)))))

; (balanced? m4) = false

(define m5
  (make-mobile
    (make-branch 5 4)
    (make-branch 2 (make-mobile
                     (make-branch 3 4)
                     (make-branch 2 6)))))

; (balanced? m5) = true
