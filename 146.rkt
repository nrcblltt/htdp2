;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |146|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; An NEList-of-temperatures is one of: 
; – (cons CTemperature '())
; – (cons CTemperature NEList-of-temperatures)
; interpretation non-empty lists of Celsius temperatures

(define ABSOLUTE0 -272)
; A CTemperature is a Number greater than ABSOLUTE0.

; NEList-of-temperatures -> Number
; computes the average temperature 
(check-expect (average (cons 1 (cons 2 (cons 3 '())))) 2)
(check-expect (average (cons 3 '())) 3)
(define (average ne-l)
  (/ (sum ne-l)
     (how-many ne-l)))

; NEList-of-temperatures -> Number
; computes the sum of the given temperatures 
(check-expect
  (sum (cons 1 (cons 2 (cons 3 '())))) 6)
(define (sum ne-l)
  (cond
    [(empty? (rest ne-l)) (first ne-l)]
    [else (+ (first ne-l) (sum (rest ne-l)))]))

; NEList-of-temperatures -> Number
; counts the temperatures on the given list
(check-expect
 (how-many (cons 5 (cons 16 (cons 3 '())))) 3)
(check-expect
 (how-many (cons 3 '())) 1)
(define (how-many ne-l)
  (cond
    ((empty? (rest ne-l)) 1)
    (else (+ 1 (how-many (rest ne-l))))))