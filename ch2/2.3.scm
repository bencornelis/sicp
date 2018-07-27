; points
(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))
(define (distance p1 p2)
  (let ((x1 (x-point p1))
        (y1 (y-point p1))
        (x2 (x-point p2))
        (y2 (y-point p2))
        (sq (lambda (a) (* a a))))
    (sqrt (+ (sq (- x1 x2)) (sq (- y1 y2))))))

; segments
(define (make-segment start-point end-point) (cons start-point end-point))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))
(define (length-segment segment)
  (distance (start-segment segment) (end-segment segment)))

; rectangles
(define (make-rect left-seg top-seg right-seg bottom-seg)
  (cons
    (cons left-seg right-seg)
    (cons bottom-seg top-seg)))

(define (top-rect rect) (cdr (cdr rect)))
(define (bottom-rect rect) (car (cdr rect)))
(define (left-rect rect) (car (car rect)))
(define (right-rect rect) (cdr (car rect)))

(define (width-rect rect)
  (length-segment (top-rect rect)))
(define (height-rect rect)
  (length-segment (left-rect rect)))

(define (area-rect rect)
  (let ((w (width-rect rect))
        (h (height-rect rect)))
    (* w h)))

(define (perimeter-rect rect)
  (let ((w (width-rect rect))
        (h (height-rect rect)))
      (+ (* 2 w) (* 2 h))))

(define p1 (make-point 0 0))
(define p2 (make-point 0 3))
(define p3 (make-point 2 3))
(define p4 (make-point 2 0))

(define left (make-segment p1 p2))
(define top (make-segment p2 p3))
(define right (make-segment p3 p4))
(define bottom (make-segment p4 p1))

(define rectangle (make-rect left top right bottom))
(define area (area-rect rectangle))
(define perimeter (perimeter-rect rectangle))
