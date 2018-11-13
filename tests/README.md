We can't test this automatically to my knowledge since it requires
a compile step, but you can run it manually with:

    csc -X feature-test-syntax test.scm
    ./test
