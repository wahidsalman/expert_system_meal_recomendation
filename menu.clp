(deffunction beri-pertanyaan (?pertanyaan $?ambiljawaban)
   (printout t ?pertanyaan crlf)
   (bind ?jawaban (read))
   (if (lexemep ?jawaban) 
       then (bind ?jawaban (lowcase ?jawaban)))
   (while (not (member$ ?jawaban ?ambiljawaban)) do
      (printout t ?pertanyaan)
      (bind ?jawaban (read))
      (if (lexemep ?jawaban) 
          then (bind ?jawaban (lowcase ?jawaban))))
   ?jawaban)

(deffunction getjawaban (?pertanyaan)
   (bind ?respon (beri-pertanyaan ?pertanyaan yes no y n))
   (if (or (eq ?respon yes) (eq ?respon y))
       then yes 
       else no))

(defrule judul ""
  (declare (salience 10))
  =>
  (printout t "Sistem Pakar Rekomendasi Menu Berdasar Ketersediaan Bumbu" crlf crlf)
  )

(defrule punya-bawangputih
    (not (bawangputih ?))
    (not (menu ?))
=>
    (assert (bawangputih (getjawaban "apakah kamu punya bawah putih? (yes/no)")))
)

(defrule belanja-dulu-bos
    (bawangputih no)
    (not (menu ?))
=>
    (assert (menu ga-ada))
)

(defrule punya-jahe
    (bawangputih yes)
    (not (menu ?))
=>
    (assert (jahe (getjawaban "apakah kamu punya jahe? (yes/no)")))
)

(defrule punya-bawangmerah
    (bawangputih ?)
    (jahe ?)
    (not (menu ?))
=>
    (assert (bawangmerah (getjawaban "apakah kamu punya bawang merah? (yes/no)?")))
)

(defrule punya-daunsalam
    (bawangputih ?)
    (jahe ?)
    (bawangmerah ?)
    (not (menu ?))
=>
    (assert (daunsalam (getjawaban "apakah kamu punya daun salam? (yes/no)")))
)

(defrule punya-serai
    (bawangputih ?)
    (jahe ?)
    (bawangmerah ?)
    (daunsalam ?)
    (not (menu ?))
=>
    (assert (serai (getjawaban "apakah kamu punya serai?(yes/no)")))
)

(defrule punya-merica
    (bawangputih ?)
    (jahe ?)
    (bawangmerah ?)
    (daunsalam ?)
    (serai ?)
    (not (menu ?))
=>
    (assert (merica (getjawaban "apakah kamu punya merica?(yes/no)")))
)

(defrule punya-ketumbar
    (bawangputih ?)
    (jahe ?)
    (bawangmerah ?)
    (daunsalam ?)
    (serai ?)
    (merica ?)
    (not (menu ?))
=>
    (assert (ketumbar (getjawaban "apakah kamu punya ketumbar?(yes/no)")))
)

(defrule punya-kol
    (bawangputih ?)
    (jahe ?)
    (bawangmerah ?)
    (daunsalam ?)
    (serai ?)
    (merica ?)
    (ketumbar ?)
    (not (menu ?))
=>
    (assert (kol (getjawaban "apakah kamu punya kol?(yes/no)")))
)

(defrule soto-ayam
    (bawangputih yes)
    (jahe yes)
    (bawangmerah yes)
    (daunsalam yes)
    (serai yes)
    (merica yes)
    (ketumbar yes)
    (kol yes)
    (not (menu ?))
=>
    (assert (menu "Kamu bisa belanja ayam kemudian masak soto ayam"))
)

(defrule kare-ayam
    (bawangputih yes)
    (jahe yes)
    (bawangmerah yes)
    (daunsalam yes)
    (serai yes)
    (merica yes)
    (ketumbar yes)
    (kol no)
    (not (menu ?))
=>
    (assert (menu "Kamu bisa belanja ayam kemudian masak Kare ayam"))
)

(defrule kare-ayam-sederhana
    (bawangputih yes)
    (jahe yes)
    (bawangmerah yes)
    (daunsalam yes)
    (serai yes)
    (merica no)
    (ketumbar yes)
    (kol no)
    (not (menu ?))
=>
    (assert (menu "Kamu bisa belanja ayam kemudian masak Kare ayam sederhana"))
)

(defrule tongseng
    (bawangputih yes)
    (jahe yes)
    (bawangmerah yes)
    (daunsalam yes)
    (serai yes)
    (merica no)
    (ketumbar yes)
    (kol no)
    (not (menu ?))
=>
    (assert (menu "Kamu bisa belanja daging sapi kemudian masak tongseng daging sapi"))
)

(defrule soto-ayam-lamongan
    (bawangputih yes)
    (jahe yes)
    (bawangmerah yes)
    (daunsalam yes)
    (serai no)
    (merica yes)
    (ketumbar no)
    (kol no)
    (not (menu ?))
=>
    (assert (menu "Kamu bisa belanja daging ayam kemudian masak soto ayam lamongan"))
)

(defrule sayur-sop-ayam
    (bawangputih yes)
    (jahe yes)
    (bawangmerah yes)
    (daunsalam no)
    (serai no)
    (merica yes)
    (ketumbar no)
    (kol yes)
    (not (menu ?))
=>
    (assert (menu "Kamu bisa belanja daging ayam kemudian masak sayur sop ayam"))
)

(defrule pesmol-ikan-bumbu
    (bawangputih yes)
    (jahe yes)
    (bawangmerah yes)
    (daunsalam no)
    (serai yes)
    (merica no)
    (ketumbar no)
    (kol no)
    (not (menu ?))
=>
    (assert (menu "Kamu bisa belanja ikan kemudian masak pesmol ikan bumbu kuning"))
)

(defrule sop-ayam-pak-min
    (bawangputih yes)
    (jahe yes)
    (bawangmerah no)
    (daunsalam yes)
    (serai yes)
    (merica yes)
    (ketumbar no)
    (kol no)
    (not (menu ?))
=>
    (assert (menu "Kamu bisa belanja daging ayam kemudian masak sop ayam ala pak min"))
)

(defrule beef-teriyaki
    (bawangputih yes)
    (jahe yes)
    (bawangmerah no)
    (daunsalam no)
    (serai no)
    (merica no)
    (ketumbar no)
    (kol no)
    (not (menu ?))
=>
    (assert (menu "Kamu bisa belanja daging sapi kemudian masak beef teriyaki"))
)

(defrule gurame
    (bawangputih yes)
    (jahe no)
    (bawangmerah no)
    (daunsalam no)
    (serai no)
    (merica no)
    (ketumbar no)
    (kol no)
    (not (menu ?))
=>
    (assert (menu "Kamu bisa belanja ikan gurame kemudian masak gurame asam manis"))
)

(defrule no-menu
  (declare (salience -10))
  (not (menu ?))
  =>
  (assert (menu "Maaf tidak ada menu yang tersedia.")))

(defrule tampilkan-hasil
    (menu ?saran)
=>
    (printout t ?saran crlf)
)