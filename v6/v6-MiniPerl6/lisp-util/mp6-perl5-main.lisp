
(defun slurp (filename) 
  (format nil "~{~a~%~}" 
    (with-open-file (s filename)
      (loop for line = (read-line s nil nil)
            while line
            collect line into lines
            finally (return lines)))))

(let (source (pos 0) p)
    (if (sv-eq (elt COMMON-LISP-USER::*posix-argv* 1) "-e")
        (setf source (elt COMMON-LISP-USER::*posix-argv* 2))
        (setf source (slurp (elt COMMON-LISP-USER::*posix-argv* 1))))
    ;; (format t "~a" source)

    (sv-say (list "# Do not edit this file - Generated by MiniPerl6" ))
    (sv-say (list "use v5;" ))
    (sv-say (list "use strict;" ))
    (sv-say (list "use MiniPerl6::Perl5::Runtime;" ))
    (sv-say (list "use MiniPerl6::Perl5::Match;" ))

    (loop while (< pos (length source)) 
          do (progn
             (setf p (sv-comp_unit (proto-mp-MiniPerl6-Grammar) source pos))
             ;; (format t "~a~%" (sv-perl p))
             (format t "~a~%" (sv-emit (sv-capture p)))
             ;; (sv-say (list ";; at source pos: " (sv-to p) " source end: " (length source)))
             (setf pos (sv-to p)))))


