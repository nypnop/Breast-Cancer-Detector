(defrule system-banner ""
  (declare (salience 10))
  =>
  (printout t crlf crlf)
  (printout t "Coba-coba program CLIPS")
  (printout t crlf crlf))

(defrule mean-concave-question
=>
(printout t "Berapa nilai mean concave point anda ? ")
(assert (mean-concave-point (read))))

(defrule worst-perimeter-question
    (mean-concave-point ?value&:(>= ?value 0.5))
=>
(printout t "lebih besar")
(printout t crlf crlf))

(defrule worst22-question
    (mean-concave-point ?value&:(< ?value 0.5))
=>
(printout t "berapa nilai concave point?")
(assert (concave-point (read))))

(defrule worst-question-2
(mean-concave-point ?value1&:(< ?value1 0.5))
(concave-point ?value&:(< ?value 0.5))
=>
(printout t "masuk sini")
(printout t crlf crlf))
