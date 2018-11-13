;; csc -X feature-test-syntax test.scm

(require-extension test)

(test "#+"
      '(a b)
      '(a #+foo SHOULD-NOT-APPEAR b))

(test-exit)
