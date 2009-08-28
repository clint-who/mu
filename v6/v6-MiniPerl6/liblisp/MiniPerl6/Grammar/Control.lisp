;; Do not edit this file - Generated by MiniPerl6
;; class MiniPerl6::Grammar
(defpackage mp-MiniPerl6-Grammar
  (:use common-lisp mp-Main))
;; (in-package mp-MiniPerl6-Grammar)
(if (not (ignore-errors (find-class 'mp-MiniPerl6-Grammar)))
  (defclass mp-MiniPerl6-Grammar () ()))

(let (x) 
  (setq x (make-instance 'mp-MiniPerl6-Grammar))
  (defun proto-mp-MiniPerl6-Grammar () x))
;; method control
(if (not (ignore-errors (find-method 'sv-control () ())))
  (defgeneric sv-control (sv-grammar &optional sv-str sv-pos)
      (:documentation "a method")))
(defmethod sv-control ((sv-grammar mp-MiniPerl6-Grammar) &optional sv-str sv-pos)
  (block mp6-function
    (let ((sv-MATCH (sv-undef))) (setf sv-MATCH (let ((m (make-instance 'mp-MiniPerl6-Match))) (setf (sv-str m) sv-str)(setf (sv-from m) sv-pos)(setf (sv-to m) sv-pos)(setf (sv-bool m) 1) m))(setf (sv-bool sv-MATCH ) (let ((sv-pos1 (sv-undef))) (setf sv-pos1 (sv-to sv-MATCH ))(sv-or (progn (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-ctrl_return sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "ctrl_return" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (let ((sv-ret (sv-undef))) (setf sv-ret ((lambda  ()
  (block mp6-function (progn (progn (return-from mp6-function (sv-scalar (gethash "ctrl_return" (sv-hash sv-MATCH)))))"974^213")))
 ))(if (sv-bool (not (sv-eq sv-ret "974^213"))) (progn (setf (sv-capture sv-MATCH ) sv-ret)(setf (sv-bool sv-MATCH ) 1)(return-from mp6-function sv-MATCH)) nil)1))) (sv-or (progn (setf (sv-to sv-MATCH ) sv-pos1)(sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-ctrl_leave sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "ctrl_leave" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (let ((sv-ret (sv-undef))) (setf sv-ret ((lambda  ()
  (block mp6-function (progn (progn (return-from mp6-function (sv-scalar (gethash "ctrl_leave" (sv-hash sv-MATCH)))))"974^213")))
 ))(if (sv-bool (not (sv-eq sv-ret "974^213"))) (progn (setf (sv-capture sv-MATCH ) sv-ret)(setf (sv-bool sv-MATCH ) 1)(return-from mp6-function sv-MATCH)) nil)1))) (sv-or (progn (setf (sv-to sv-MATCH ) sv-pos1)(sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-if sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "if" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (let ((sv-ret (sv-undef))) (setf sv-ret ((lambda  ()
  (block mp6-function (progn (progn (return-from mp6-function (sv-scalar (gethash "if" (sv-hash sv-MATCH)))))"974^213")))
 ))(if (sv-bool (not (sv-eq sv-ret "974^213"))) (progn (setf (sv-capture sv-MATCH ) sv-ret)(setf (sv-bool sv-MATCH ) 1)(return-from mp6-function sv-MATCH)) nil)1))) (sv-or (progn (setf (sv-to sv-MATCH ) sv-pos1)(sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-when sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "when" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (let ((sv-ret (sv-undef))) (setf sv-ret ((lambda  ()
  (block mp6-function (progn (progn (return-from mp6-function (sv-scalar (gethash "when" (sv-hash sv-MATCH)))))"974^213")))
 ))(if (sv-bool (not (sv-eq sv-ret "974^213"))) (progn (setf (sv-capture sv-MATCH ) sv-ret)(setf (sv-bool sv-MATCH ) 1)(return-from mp6-function sv-MATCH)) nil)1))) (sv-or (progn (setf (sv-to sv-MATCH ) sv-pos1)(sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-for sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "for" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (let ((sv-ret (sv-undef))) (setf sv-ret ((lambda  ()
  (block mp6-function (progn (progn (return-from mp6-function (sv-scalar (gethash "for" (sv-hash sv-MATCH)))))"974^213")))
 ))(if (sv-bool (not (sv-eq sv-ret "974^213"))) (progn (setf (sv-capture sv-MATCH ) sv-ret)(setf (sv-bool sv-MATCH ) 1)(return-from mp6-function sv-MATCH)) nil)1))) (sv-or (progn (setf (sv-to sv-MATCH ) sv-pos1)(sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-while sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "while" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (let ((sv-ret (sv-undef))) (setf sv-ret ((lambda  ()
  (block mp6-function (progn (progn (return-from mp6-function (sv-scalar (gethash "while" (sv-hash sv-MATCH)))))"974^213")))
 ))(if (sv-bool (not (sv-eq sv-ret "974^213"))) (progn (setf (sv-capture sv-MATCH ) sv-ret)(setf (sv-bool sv-MATCH ) 1)(return-from mp6-function sv-MATCH)) nil)1))) (progn (setf (sv-to sv-MATCH ) sv-pos1)(sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-apply sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "apply" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (let ((sv-ret (sv-undef))) (setf sv-ret ((lambda  ()
  (block mp6-function (progn (progn (return-from mp6-function (sv-scalar (gethash "apply" (sv-hash sv-MATCH)))))"974^213")))
 ))(if (sv-bool (not (sv-eq sv-ret "974^213"))) (progn (setf (sv-capture sv-MATCH ) sv-ret)(setf (sv-bool sv-MATCH ) 1)(return-from mp6-function sv-MATCH)) nil)1)))))))))))(return-from mp6-function sv-MATCH))))

;; method if
(if (not (ignore-errors (find-method 'sv-if () ())))
  (defgeneric sv-if (sv-grammar &optional sv-str sv-pos)
      (:documentation "a method")))
(defmethod sv-if ((sv-grammar mp-MiniPerl6-Grammar) &optional sv-str sv-pos)
  (block mp6-function
    (let ((sv-MATCH (sv-undef))) (setf sv-MATCH (let ((m (make-instance 'mp-MiniPerl6-Match))) (setf (sv-str m) sv-str)(setf (sv-from m) sv-pos)(setf (sv-to m) sv-pos)(setf (sv-bool m) 1) m))(setf (sv-bool sv-MATCH ) (let ((sv-pos1 (sv-undef))) (setf sv-pos1 (sv-to sv-MATCH ))(progn (sv-and (if (sv-bool (sv-eq "i" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "f" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-exp sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "exp" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-opt_ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (if (sv-bool (sv-eq "{" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-opt_ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-exp_stmts sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "exp_stmts" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-opt_ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (if (sv-bool (sv-eq "}" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (let ((sv-pos1 (sv-undef))) (setf sv-pos1 (sv-to sv-MATCH ))(sv-or (progn (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-opt_ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (if (sv-bool (sv-eq "e" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "l" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "s" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "e" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-opt_ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (if (sv-bool (sv-eq "{" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-opt_ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-exp_stmts2 sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "exp_stmts2" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-opt_ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (if (sv-bool (sv-eq "}" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (let ((sv-ret (sv-undef))) (setf sv-ret ((lambda  ()
  (block mp6-function (progn (progn (return-from mp6-function (let ((m (make-instance 'mp-If))) (setf (sv-cond m) (sv-scalar (gethash "exp" (sv-hash sv-MATCH))))(setf (sv-body m) (sv-scalar (gethash "exp_stmts" (sv-hash sv-MATCH))))(setf (sv-otherwise m) (sv-scalar (gethash "exp_stmts2" (sv-hash sv-MATCH)))) m)))"974^213")))
 ))(if (sv-bool (not (sv-eq sv-ret "974^213"))) (progn (setf (sv-capture sv-MATCH ) sv-ret)(setf (sv-bool sv-MATCH ) 1)(return-from mp6-function sv-MATCH)) nil)1))))))))))))) (progn (setf (sv-to sv-MATCH ) sv-pos1)(let ((sv-ret (sv-undef))) (setf sv-ret ((lambda  ()
  (block mp6-function (progn (progn (return-from mp6-function (let ((m (make-instance 'mp-If))) (setf (sv-cond m) (sv-scalar (gethash "exp" (sv-hash sv-MATCH))))(setf (sv-body m) (sv-scalar (gethash "exp_stmts" (sv-hash sv-MATCH))))(setf (sv-otherwise m) nil) m)))"974^213")))
 ))(if (sv-bool (not (sv-eq sv-ret "974^213"))) (progn (setf (sv-capture sv-MATCH ) sv-ret)(setf (sv-bool sv-MATCH ) 1)(return-from mp6-function sv-MATCH)) nil)1)))))))))))))))))(return-from mp6-function sv-MATCH))))

;; method when
(if (not (ignore-errors (find-method 'sv-when () ())))
  (defgeneric sv-when (sv-grammar &optional sv-str sv-pos)
      (:documentation "a method")))
(defmethod sv-when ((sv-grammar mp-MiniPerl6-Grammar) &optional sv-str sv-pos)
  (block mp6-function
    (let ((sv-MATCH (sv-undef))) (setf sv-MATCH (let ((m (make-instance 'mp-MiniPerl6-Match))) (setf (sv-str m) sv-str)(setf (sv-from m) sv-pos)(setf (sv-to m) sv-pos)(setf (sv-bool m) 1) m))(setf (sv-bool sv-MATCH ) (let ((sv-pos1 (sv-undef))) (setf sv-pos1 (sv-to sv-MATCH ))(progn (sv-and (if (sv-bool (sv-eq "w" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "h" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "e" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "n" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-exp_seq sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "exp_seq" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-opt_ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (if (sv-bool (sv-eq "{" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-opt_ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-exp_stmts sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "exp_stmts" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-opt_ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (if (sv-bool (sv-eq "}" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (let ((sv-ret (sv-undef))) (setf sv-ret ((lambda  ()
  (block mp6-function (progn (progn (return-from mp6-function (let ((m (make-instance 'mp-When))) (setf (sv-parameters m) (sv-scalar (gethash "exp_seq" (sv-hash sv-MATCH))))(setf (sv-body m) (sv-scalar (gethash "exp_stmts" (sv-hash sv-MATCH)))) m)))"974^213")))
 ))(if (sv-bool (not (sv-eq sv-ret "974^213"))) (progn (setf (sv-capture sv-MATCH ) sv-ret)(setf (sv-bool sv-MATCH ) 1)(return-from mp6-function sv-MATCH)) nil)1))))))))))))))))(return-from mp6-function sv-MATCH))))

;; method for
(if (not (ignore-errors (find-method 'sv-for () ())))
  (defgeneric sv-for (sv-grammar &optional sv-str sv-pos)
      (:documentation "a method")))
(defmethod sv-for ((sv-grammar mp-MiniPerl6-Grammar) &optional sv-str sv-pos)
  (block mp6-function
    (let ((sv-MATCH (sv-undef))) (setf sv-MATCH (let ((m (make-instance 'mp-MiniPerl6-Match))) (setf (sv-str m) sv-str)(setf (sv-from m) sv-pos)(setf (sv-to m) sv-pos)(setf (sv-bool m) 1) m))(setf (sv-bool sv-MATCH ) (let ((sv-pos1 (sv-undef))) (setf sv-pos1 (sv-to sv-MATCH ))(progn (sv-and (if (sv-bool (sv-eq "f" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "o" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "r" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-exp sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "exp" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-opt_ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (if (sv-bool (sv-eq "->" (sv-substr sv-str (sv-to sv-MATCH ) 2))) (+ 1 (setf (sv-to sv-MATCH ) (+ 2 (sv-to sv-MATCH )))) nil) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-opt_ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-var_ident sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "var_ident" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (if (sv-bool (sv-eq "{" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-opt_ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-exp_stmts sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "exp_stmts" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-opt_ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (if (sv-bool (sv-eq "}" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (let ((sv-ret (sv-undef))) (setf sv-ret ((lambda  ()
  (block mp6-function (progn (progn (return-from mp6-function (let ((m (make-instance 'mp-For))) (setf (sv-cond m) (sv-scalar (gethash "exp" (sv-hash sv-MATCH))))(setf (sv-topic m) (sv-scalar (gethash "var_ident" (sv-hash sv-MATCH))))(setf (sv-body m) (sv-scalar (gethash "exp_stmts" (sv-hash sv-MATCH)))) m)))"974^213")))
 ))(if (sv-bool (not (sv-eq sv-ret "974^213"))) (progn (setf (sv-capture sv-MATCH ) sv-ret)(setf (sv-bool sv-MATCH ) 1)(return-from mp6-function sv-MATCH)) nil)1)))))))))))))))))))(return-from mp6-function sv-MATCH))))

;; method while
(if (not (ignore-errors (find-method 'sv-while () ())))
  (defgeneric sv-while (sv-grammar &optional sv-str sv-pos)
      (:documentation "a method")))
(defmethod sv-while ((sv-grammar mp-MiniPerl6-Grammar) &optional sv-str sv-pos)
  (block mp6-function
    (let ((sv-MATCH (sv-undef))) (setf sv-MATCH (let ((m (make-instance 'mp-MiniPerl6-Match))) (setf (sv-str m) sv-str)(setf (sv-from m) sv-pos)(setf (sv-to m) sv-pos)(setf (sv-bool m) 1) m))(setf (sv-bool sv-MATCH ) (let ((sv-pos1 (sv-undef))) (setf sv-pos1 (sv-to sv-MATCH ))(progn (sv-and (if (sv-bool (sv-eq "w" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "h" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "i" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "l" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "e" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-exp sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "exp" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (if (sv-bool (sv-eq "{" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-opt_ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-exp_stmts sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "exp_stmts" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-opt_ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (if (sv-bool (sv-eq "}" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (let ((sv-ret (sv-undef))) (setf sv-ret ((lambda  ()
  (block mp6-function (progn (progn (return-from mp6-function (let ((m (make-instance 'mp-While))) (setf (sv-cond m) (sv-scalar (gethash "exp" (sv-hash sv-MATCH))))(setf (sv-body m) (sv-scalar (gethash "exp_stmts" (sv-hash sv-MATCH)))) m)))"974^213")))
 ))(if (sv-bool (not (sv-eq sv-ret "974^213"))) (progn (setf (sv-capture sv-MATCH ) sv-ret)(setf (sv-bool sv-MATCH ) 1)(return-from mp6-function sv-MATCH)) nil)1)))))))))))))))))(return-from mp6-function sv-MATCH))))

;; method ctrl_leave
(if (not (ignore-errors (find-method 'sv-ctrl_leave () ())))
  (defgeneric sv-ctrl_leave (sv-grammar &optional sv-str sv-pos)
      (:documentation "a method")))
(defmethod sv-ctrl_leave ((sv-grammar mp-MiniPerl6-Grammar) &optional sv-str sv-pos)
  (block mp6-function
    (let ((sv-MATCH (sv-undef))) (setf sv-MATCH (let ((m (make-instance 'mp-MiniPerl6-Match))) (setf (sv-str m) sv-str)(setf (sv-from m) sv-pos)(setf (sv-to m) sv-pos)(setf (sv-bool m) 1) m))(setf (sv-bool sv-MATCH ) (let ((sv-pos1 (sv-undef))) (setf sv-pos1 (sv-to sv-MATCH ))(progn (sv-and (if (sv-bool (sv-eq "l" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "e" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "a" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "v" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "e" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (let ((sv-ret (sv-undef))) (setf sv-ret ((lambda  ()
  (block mp6-function (progn (progn (return-from mp6-function (make-instance 'mp-Leave)))"974^213")))
 ))(if (sv-bool (not (sv-eq sv-ret "974^213"))) (progn (setf (sv-capture sv-MATCH ) sv-ret)(setf (sv-bool sv-MATCH ) 1)(return-from mp6-function sv-MATCH)) nil)1)))))))))(return-from mp6-function sv-MATCH))))

;; method ctrl_return
(if (not (ignore-errors (find-method 'sv-ctrl_return () ())))
  (defgeneric sv-ctrl_return (sv-grammar &optional sv-str sv-pos)
      (:documentation "a method")))
(defmethod sv-ctrl_return ((sv-grammar mp-MiniPerl6-Grammar) &optional sv-str sv-pos)
  (block mp6-function
    (let ((sv-MATCH (sv-undef))) (setf sv-MATCH (let ((m (make-instance 'mp-MiniPerl6-Match))) (setf (sv-str m) sv-str)(setf (sv-from m) sv-pos)(setf (sv-to m) sv-pos)(setf (sv-bool m) 1) m))(setf (sv-bool sv-MATCH ) (let ((sv-pos1 (sv-undef))) (setf sv-pos1 (sv-to sv-MATCH ))(sv-or (progn (sv-and (if (sv-bool (sv-eq "r" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "e" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "t" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "u" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "r" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "n" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-ws sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))1) (progn nil))) (sv-and (let ((sv-m2 (sv-undef))) (setf sv-m2 (sv-exp sv-grammar sv-str (sv-to sv-MATCH )))(if (sv-bool sv-m2) (progn (setf (sv-to sv-MATCH ) (sv-to sv-m2 ))(setf (gethash "exp" (sv-hash sv-MATCH)) sv-m2)1) (progn nil))) (let ((sv-ret (sv-undef))) (setf sv-ret ((lambda  ()
  (block mp6-function (progn (progn (return-from mp6-function (let ((m (make-instance 'mp-Return))) (setf (sv-result m) (sv-scalar (gethash "exp" (sv-hash sv-MATCH)))) m)))"974^213")))
 ))(if (sv-bool (not (sv-eq sv-ret "974^213"))) (progn (setf (sv-capture sv-MATCH ) sv-ret)(setf (sv-bool sv-MATCH ) 1)(return-from mp6-function sv-MATCH)) nil)1)))))))))) (progn (setf (sv-to sv-MATCH ) sv-pos1)(sv-and (if (sv-bool (sv-eq "r" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "e" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "t" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "u" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "r" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (sv-and (if (sv-bool (sv-eq "n" (sv-substr sv-str (sv-to sv-MATCH ) 1))) (+ 1 (setf (sv-to sv-MATCH ) (+ 1 (sv-to sv-MATCH )))) nil) (let ((sv-ret (sv-undef))) (setf sv-ret ((lambda  ()
  (block mp6-function (progn (progn (return-from mp6-function (let ((m (make-instance 'mp-Return))) (setf (sv-result m) (make-instance 'mp-Val-Undef)) m)))"974^213")))
 ))(if (sv-bool (not (sv-eq sv-ret "974^213"))) (progn (setf (sv-capture sv-MATCH ) sv-ret)(setf (sv-bool sv-MATCH ) 1)(return-from mp6-function sv-MATCH)) nil)1)))))))))))(return-from mp6-function sv-MATCH))))

(defmethod sv-perl ((self mp-MiniPerl6-Grammar))
  (mp-Main::sv-lisp_dump_object "::MiniPerl6::Grammar" (list )))




