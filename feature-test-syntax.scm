(module feature-test-syntax ()
(import scheme)

(cond-expand
 (chicken-4
  (import chicken))
 (else
  (import (chicken base))
  (import (chicken read-syntax))
  (import (chicken platform))))

(let ((omit '(values)))   ;; (values) requires Chicken >= 4.6.7.
  (set-sharp-read-syntax!
   #\+ (lambda (p) (let ((ft (read p))
                    (body (read p)))
                (eval
                 `(cond-expand (,ft ',body)
                               (else ,omit)))
                )))
  (set-sharp-read-syntax!
   #\- (lambda (p) (let ((ft (read p))
                    (body (read p)))
                (eval
                 `(cond-expand (,ft ,omit)
                               (else ',body))))))
  (set-sharp-read-syntax!
   #\? (lambda (p) (let* ((test (read p))
                     (ft (car test))
                     (con (cadr test))
                     (alt (cddr test)))
                (eval
                 `(cond-expand (,ft ',con)
                               (else
                                ,(if (null? alt)
                                     omit
                                     (list 'quote (car alt))))))))))

)
