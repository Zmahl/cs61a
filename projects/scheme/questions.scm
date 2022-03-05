(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement

(define (zip pairs)
  'replace-this-line)


;; Problem 16
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  ;;helper function to add in a count
  (define (enum s count)
      (if (null? s)
          nil
          ;; if there is still an element, add the count and car s to the list
          ;; call enum with the next element in s and count + 1
          (cons (list count (car s)) (enum (cdr s) (+ count 1))))
      )
  ;; Calls enum within enumerate definition to start function
  (enum s 0)
  )
  ; END PROBLEM 15

;; Problem 17

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
    ; BEGIN PROBLEM 16
    (cond
        ((eqv? list1 nil) list2)
        ((eqv? list2 nil) list1)
        ((comp (car list1) (car list2))
               (cons (car list1) 
                     (merge comp (cdr list1) list2)))
        (else
            (cons (car list2)
                     (merge comp list1 (cdr list2)))))
)
  ; END PROBLEM 16


;; Problem 18

;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 17
         expr
         ; END PROBLEM 17
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 17
         expr
         ; END PROBLEM 17
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 17
           (cons form (cons (map let-to-lambda params) (map let-to-lambda body)))
           ; END PROBLEM 17
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 17
           (cons (cons 'lambda
                       (cons (car (zip (let-to-lambda value)))(let-to-lambda body)))
                   (cadr (zip (let-to-lambda))))
           ; END PROBLEM 17
           ))
        (else
         ; BEGIN PROBLEM 17
         (map let-to-lambda expr)
         ; END PROBLEM 17
         )))

