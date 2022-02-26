(define-macro (def func args body)
    `(define ,func (lambda ,args ,body)))

(define (tail-replicate x n) 
    (define (g x n x_list)
        (if (zero? n)
            x_list
            (g x (- n 1) (cons x x_list))
        )
    
    )
    (g x n '())
)

(define (exp b n)
    
    (if (= n 0)
        1
        (if (= n 1)
            b
            (if (= b 1)
                1
                (if (even? n)
                    (exp (* b b) (/ n 2))
                    (exp (* b b) (- n 1))
)))))

