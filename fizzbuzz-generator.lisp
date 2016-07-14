(defun fizzbuzz (x)
  (let ((result))
    (cond ((and (= (mod x 3) 0) (= (mod x 5) 0))
	   (setf result "FizzBuzz"))
	  ((and (= (mod x 3) 0) (not (= (mod x 5) 0)))
	   (setf result "Fizz"))
	  ((and (not (= (mod x 3) 0)) (= (mod x 5) 0))
	   (setf result "Buzz"))
	  (t (setf result x)))
    result))

(defparameter clas "class FizzBuzz {")
(defparameter main "public static void main(String[] args) {")
(defparameter prnt "System.out.println")
(defparameter ind4 "    ")
(defparameter ind8 "        ")

(defun generate-fizzbuzz (x &optional firstrund)
  (if (not firstrund)
      (progn (princ clas)(terpri)
	     (princ ind4)(princ main)(terpri)
	     (princ ind8)(princ "int x = Integer.parseInt(args[0]);")(terpri)
	     (princ ind8)(princ "switch (x) {")(terpri)))
  (format t "~acase ~s: ~a(~s);~%~a~abreak;" ind8 x prnt (fizzbuzz x) ind8 ind8)
  (terpri)
  (if (> x 0)
      (generate-fizzbuzz (1- x) t)
      (format t "~a}~%~a}~%}" ind8 ind4))
  t)
