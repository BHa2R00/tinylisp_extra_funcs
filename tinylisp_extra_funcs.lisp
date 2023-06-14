
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
