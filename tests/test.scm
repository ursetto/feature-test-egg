;; csc -X feature-test-syntax test.scm

(use test)

(test "#+"
      '(a b)
      '(a #+foo SHOULD-NOT-APPEAR b))

(test-exit)
