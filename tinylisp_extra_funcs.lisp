
;;list
(define make-list-1 (lambda (k v l) (if (= k 0) l (make-list-1 (- k 1) v (append (list v) l)))))
(define make-list (lambda (k v) (let* (l (list)) (make-list-1 k v l))))
(define linspace-1
  (lambda (x d x1 l)
	(cond
	  ((<= x x1) (linspace-1 (+ x d) d x1 (append l (list x))))
	  (t l))))
(define linspace-2
  (lambda (x d x1 l)
	(cond
	  ((>= x x1) (linspace-2 (+ x d) d x1 (append l (list x))))
	  (t l))))
(define linspace
  (lambda (x0 d x1)
	(cond
	  ((and (> x1 x0) (> d 0)) (linspace-1 x0 d x1 (list)))
	  ((and (< x1 x0) (< d 0)) (linspace-2 x0 d x1 (list)))
	  ((= x1 x0) (list x0))
	  (t <err>))))

;;binary
(define nthb (lambda (k n) (ash (logand n (ash 1 k)) (* -1 k))))
(define setb (lambda (k n) (logor n (ash 1 k))))
(define rstb (lambda (k n) (logand n (lognot(ash 1 k)))))

;verilog print
(define verilog:l2b
  (lambda (l k i)
	(let*
	  (r (car l))
	  (n 1)
	  (progn
		(mapcar 
		  (lambda (e) 
			(progn
			  (setq r (s+ r ',))
			  (if (= (rem n k) 0) (setq r (s+ r i)))
			  (setq r (s+ r '%t e))
			  (setq n (+ n 1))
			  )) 
		  (cdr l))
		r))))
