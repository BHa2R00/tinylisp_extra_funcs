
;;binary
(define nthb (lambda (k n) (ash (logand n (ash 1 k)) (* -1 k))))
(define setb (lambda (k n) (logor n (ash 1 k))))
(define rstb (lambda (k n) (logand n (lognot(ash 1 k)))))
