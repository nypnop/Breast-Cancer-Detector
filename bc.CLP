  (defrule system-banner ""
    (declare (salience 10))
    =>
    (printout t crlf crlf)
    (printout t "Tugas Besar II IF3170")
    (printout t crlf "Memprediksi breast cancer dengan menggunakan CLIPS berdasarkan decision tree yang kami miliki." crlf)
    (printout t crlf crlf))

  (defrule mean-concave-q
  =>
  (printout t "Berapa nilai mean concave point anda ? ")
  (assert (mean-concave-pt (read))))

  ;Cabang Kanan

  (defrule worst-perimeter-q
  (and (mean-concave-pt ?value&:(> ?value 0.05)))
  =>
  (printout t "Berapa nilai worst perimeter anda ?")
  (assert (worst-perimeter-pt(read))))

  (defrule diagnosa-1
  (and (mean-concave-pt ?value&:(> ?value 0.05))
  (worst-perimeter-pt ?value2&:(> ?value2 114.45)))
  =>
  (printout t "Anda tidak beresiko kanker payudara !" crlf))

  (defrule worst-texture-q
  (and (mean-concave-pt ?value&:(> ?value 0.05))
  (worst-perimeter-pt ?value2&:(<= ?value2 114.45)))
  =>
  (printout t "Berapa nilai worst texture anda ?")
  (assert (worst-texture-pt(read))))

  (defrule worst-concave-q
  (and (mean-concave-pt ?value&:(> ?value 0.05))
  (worst-perimeter-pt ?value2&:(<= ?value2 114.45))
  (worst-texture-pt ?value3&:(<= ?value3 25.65)))
  =>
  (printout t "Berapa nilai worst concave anda ?")
  (assert (worst-concave-pt(read))))

  (defrule diagnosa-2
  (and (mean-concave-pt ?value&:(> ?value 0.05))
  (worst-perimeter-pt ?value2&:(<= ?value2 114.45))
  (worst-texture-pt ?value3&:(<= ?value3 25.65))
  (worst-concave-pt ?value4&:(<= ?value4 0.17)))
  =>
  (printout t "Anda beresiko terkena kanker payudara" crlf))

  (defrule diagnosa-3
  (and (mean-concave-pt ?value&:(> ?value 0.05))
  (worst-perimeter-pt ?value2&:(<= ?value2 114.45))
  (worst-texture-pt ?value3&:(<= ?value3 25.65))
  (worst-concave-pt ?value4&:(> ?value4 0.17)))
  =>
  (printout t "Anda tidak beresiko terkena kanker payudara" crlf))

  (defrule perimeter-error-q
  (and (mean-concave-pt ?value&:(> ?value 0.05))
  (worst-perimeter-pt ?value2&:(<= ?value2 114.45))
  (worst-texture-pt ?value3&:(> ?value3 25.65)))
  =>
  (printout t "Berapa nilai perimeter error anda ?")
  (assert (perimeter-error-pt(read))))

  (defrule mean-radius-q
  (and (mean-concave-pt ?value&:(> ?value 0.05))
  (worst-perimeter-pt ?value2&:(<= ?value2 114.45))
  (perimeter-error-pt ?value3&:(<= ?value3 1.56)))
  =>
  (printout t "Berapa nilai worst concave anda ?")
  (assert (mean-radius-pt(read))))

  (defrule diagnosa-4
  (and (mean-concave-pt ?value&:(> ?value 0.05))
  (worst-perimeter-pt ?value2&:(<= ?value2 114.45))
  (perimeter-error-pt ?value3&:(<= ?value3 1.56))
  (mean-radius-pt ?value4&:(<= ?value4 13.34)))
  =>
  (printout t "Anda tidak beresiko terkena kanker payudara" crlf))

  (defrule diagnosa-5
  (and (mean-concave-pt ?value&:(> ?value 0.05))
  (worst-perimeter-pt ?value2&:(<= ?value2 114.45))
  (perimeter-error-pt ?value3&:(<= ?value3 1.56))
  (mean-radius-pt ?value4&:(> ?value4 13.34)))
  =>
  (printout t "Anda beresiko terkena kanker payudara" crlf))

  (defrule diagnosa-6
  (and (mean-concave-pt ?value&:(> ?value 0.05))
  (worst-perimeter-pt ?value2&:(<= ?value2 114.45))
  (perimeter-error-pt ?value3&:(> ?value3 1.56)))
  =>
  (printout t "Anda tidak beresiko terkena kanker" crlf))

  ;Cabang Kiri

  (defrule worst-radius-q
  (and (mean-concave-pt ?value&:(<= ?value 0.05)))
  =>
  (printout t "Berapa nilai worst radius anda ?")
  (assert (worst-radius-pt(read))))

  (defrule mean-texture-q
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value2&:(> ?value2 16.83)))
  =>
  (printout t "Berapa nilai mean texture anda ?")
  (assert (mean-texture-pt(read))))

  (defrule diagnosa-7
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value2&:(> ?value2 16.83))
  (mean-texture-pt ?value3&:(<= ?value3 16.19)))
  =>
  (printout t "Anda beresiko terkena kanker payudara" crlf))

  (defrule concave-points-error-q
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value2&:(> ?value2 16.83))
  (mean-texture-pt ?value3&:(> ?value3 16.19)))
  =>
  (printout t "Berapa nilai concave points error anda ?")
  (assert (concave-points-error-pt(read))))

  (defrule diagnosa-8
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value2&:(> ?value2 16.83))
  (mean-texture-pt ?value3&:(> ?value3 16.19))
  (concave-points-error-pt ?value4&:(<= ?value4 0.01)))
  =>
  (printout t "Anda tidak beresiko terkena kanker" crlf))

  (defrule diagnosa-9
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value2&:(> ?value2 16.83))
  (mean-texture-pt ?value3&:(> ?value3 16.19))
  (concave-points-error-pt ?value4&:(> ?value4 0.01)))
  =>
  (printout t "Anda beresiko terkena kanker payudara" crlf))


  (defrule radius-error-q
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value1&:(<= ?value1 16.83)))
  =>
  (printout t "Berapa nilai radius error anda ?")
  (assert (radius-error-pt(read))))

  (defrule mean-s-q
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value1&:(<= ?value1 16.83))
  (radius-error-pt ?value2&:(> ?value2 0.63)))
  =>
  (printout t "Berapa nilai mean smoothness anda ?")
  (assert (mean-s-pt(read))))

  (defrule diagnosa-10
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value1&:(<= ?value1 16.83))
  (radius-error-pt ?value2&:(> ?value2 0.63))
  (mean-s-pt ?value3&:(> ?value3 0.09)))
  =>
  (printout t "Anda tidak beresiko terkena kanker payudara" crlf))

  (defrule diagnosa-11
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value1&:(<= ?value1 16.83))
  (radius-error-pt ?value2&:(> ?value2 0.63))
  (mean-s-pt ?value3&:(<= ?value3 0.09)))
  =>
  (printout t "Anda beresiko terkena kanker payudara" crlf))

  (defrule worst-texture-q1
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value1&:(<= ?value1 16.83))
  (radius-error-pt ?value2&:(<= ?value2 0.63)))
  =>
  (printout t "Berapa nilai worst texture anda ?")
  (assert (worst-texture-pt1(read))))

  (defrule diagnosa-12
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value1&:(<= ?value1 16.83))
  (radius-error-pt ?value2&:(<= ?value2 0.63))
  (worst-texture-pt1 ?value3&:(<= ?value3 30.15)))
  =>
  (printout t "Anda beresiko terkena kanker payudara" crlf))

  (defrule worst-area-q
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value1&:(<= ?value1 16.83))
  (radius-error-pt ?value2&:(<= ?value2 0.63))
  (worst-texture-pt1 ?value3&:(> ?value3 30.15)))
  =>
  (printout t "Berapa nilai worst area anda ?")
  (assert (worst-area-pt(read))))

  (defrule diagnosa-13
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value1&:(<= ?value1 16.83))
  (radius-error-pt ?value2&:(<= ?value2 0.63))
  (worst-texture-pt1 ?value3&:(> ?value3 30.15))
  (worst-area-pt ?value4&:(<= ?value4 641.60)))
  =>
  (printout t "Anda beresiko terkena kanker payudara" crlf))

  (defrule mean-radius-q1
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value1&:(<= ?value1 16.83))
  (radius-error-pt ?value2&:(<= ?value2 0.63))
  (worst-texture-pt1 ?value3&:(> ?value3 30.15))
  (worst-area-pt ?value4&:(> ?value4 641.60)))
  =>
  (printout t "Berapa nilai mean radius anda ?")
  (assert (mean-radius-pt1(read))))

  (defrule diagnosa-14
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value1&:(<= ?value1 16.83))
  (radius-error-pt ?value2&:(<= ?value2 0.63))
  (worst-texture-pt1 ?value3&:(> ?value3 30.15))
  (worst-area-pt ?value4&:(> ?value4 641.60))
  (mean-radius-pt1 ?value5&:(> ?value5 13.45)))
  =>
  (printout t "Anda beresiko terkena kanker payudara" crlf))

  (defrule mean-texture-q1
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value1&:(<= ?value1 16.83))
  (radius-error-pt ?value2&:(<= ?value2 0.63))
  (worst-texture-pt1 ?value3&:(> ?value3 30.15))
  (worst-area-pt ?value4&:(> ?value4 641.60))
  (mean-radius-pt1 ?value5&:(<= ?value5 13.45)))
  =>
  (printout t "Berapa nilai mean texture anda ?")
  (assert (mean-texture-pt1(read))))

  (defrule diagnosa-15
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value1&:(<= ?value1 16.83))
  (radius-error-pt ?value2&:(<= ?value2 0.63))
  (worst-texture-pt1 ?value3&:(> ?value3 30.15))
  (worst-area-pt ?value4&:(> ?value4 641.60))
  (mean-radius-pt1 ?value5&:(<= ?value5 13.45))
  (mean-texture-pt1 ?value6&:(<= ?value6 28.79)))
  =>
  (printout t "Anda tidak beresiko kanker payudara" crlf))

  (defrule diagnosa-16
  (and (mean-concave-pt ?value&:(<= ?value 0.05))
  (worst-radius-pt ?value1&:(<= ?value1 16.83))
  (radius-error-pt ?value2&:(<= ?value2 0.63))
  (worst-texture-pt1 ?value3&:(> ?value3 30.15))
  (worst-area-pt ?value4&:(> ?value4 641.60))
  (mean-radius-pt1 ?value5&:(<= ?value5 13.45))
  (mean-texture-pt1 ?value6&:(> ?value6 28.79)))
  =>
  (printout t "Anda beresiko kanker payudara" crlf))