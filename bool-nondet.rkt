#lang racket
(require redex)

(define-language bool-lang
  [B true false (or B B)]
  [C (or C B) (or B C) hole])

(define bool-red
  (reduction-relation bool-lang
    (--> (in-hole C (or true  B))  (in-hole C true) or-true)
    (--> (in-hole C (or false B))  (in-hole C B)    or-false)))

(define B2 (term (or (or true false) (or false true))))

(traces bool-red B2)
