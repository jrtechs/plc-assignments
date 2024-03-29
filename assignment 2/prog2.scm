#lang racket

; PLC assignment 2
; @author Jeffery Russell 10-15-19

(define (list1 x)
  (cons x '())
)

(define (>= x y)
  (not (< x y))
)


(define (<= x y)
  (not (> x y))
)


(define (!= x y)
  (not (= x y))
)



; Finds the modulus value of a number
; w/o using built in modulus operator % 
; @param num: number to take modulus of
; @param mod: number to mod by
(define (myMod num mod)
  (if (< num mod)
      num
      (myMod (- num mod) mod)
  )
)


(define (sqrtRec i n)
  (if (>= (* i i) n)
      (if (= (* i i) n)
          ; found it
          i
          ;finds previous square
          (mySqrt (* (- i 1) (- i 1))) 
      )
      (sqrtRec (+ i 1) n)
  )
)


; Function to take the square root of a positive
; @param n: positive number to take square root of
(define (mySqrt n)
 (sqrtRec 0 n)
)


(define (cube n)
  (* n (* n n))
)


(define (abs n)
  (if (>= n 0)
      n
      (* n -1)
  )
)


(define (cbrtRec i n)
  (if (<= (cube i) n)
      (if (< n (cube (+ 1 i)))
          i
          (cbrtRec (+ i 1) n)
      )
      (cbrtRec (+ i 1) n)
  )
)


; Similare to square root but can do negatives
; when n < 0:
;   -s is the cubred root of n, iff s^3 <= -n < (s + 1)^3
; else:
;   s is cubred root of n, iff s^3 <= n < (s + 1)^3
(define (myCbrt n)
  (if (> n 0)
      (cbrtRec 0 n)
      (*
         -1
         (cbrtRec 0 (abs n))
      )
  )
)


; Finds the GCD between two numbers
(define (myGcd a b)
  (if (= a 0)
      b
      (myGcd (myMod b a) a)
  )
)


; Finds the least common multiple of two numbers
(define (myLcm a b)
   (/
    (* a b)
    (myGcd a b)
   )
)



(define (insert x xs op)
      (if (null? xs)
        (cons x '())
        (if (op x (car xs))
            (cons x xs)
            (cons (car xs) (insert x (cdr xs) op))
        )
    )
)

(define (insertion-sort xs op)
    (if (null? xs)
        '()
        (insert (car xs) (insertion-sort (cdr xs) op) op)
    )
)


; Finds min of list w/o modifying the list
(define (myMin lst)
 (car (insertion-sort lst <))
)


; Finds the max of the list w/o modifying the list
(define (myMax lst)
 (car (insertion-sort lst >))
)


; determines if something is in the list
; returns:
;   1 if true(in list)
;   0 if not in list
(define (inList lst n)
 (if (null? lst)
     0
     (if (= n (car lst))
         1
         (inList (cdr lst) n)
     )
 ) 
)


; finds the sum of the list
(define (sumList lst)
  (if (null? lst)
      0 ; empty list
      (+
         (car lst)
         (sumList (cdr lst))
      )
  )
)


; Computes length of list
(define (length lst)
  (if (null? lst)
     0
     (+
       1
       (length (cdr lst))
     )
  )
)


(define (getElementRec lst n i)
  (if (= n i)
      (car lst)
      (getElementRec (cdr lst) n (+ i 1))
  )
)


; gets the nth zero indexed item from the list
(define (getElement lst n)
  (getElementRec lst n 0)
)


; Finds the average of the list
(define (avgList lst)
 (/ (sumList lst) (length lst))
)


; Finds the medium of the list
(define (medList lst)
  (if (= (myMod (length lst) 2) 0)
    ; even length
    (floor
     (/
      (+
        (getElement
         (insertion-sort lst <)
         (floor (/ (length lst) 2))
        )
        (getElement
         (insertion-sort lst <)
         (- (floor (/ (length lst) 2)) 1)
        )
      )
      2
     )
    )
    ; odd length
    (getElement
     (insertion-sort lst <)
     (floor (/ (length lst) 2)
    )
   )
  )
)