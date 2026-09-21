/-
  Erdős Problem 538 / JSP-000538
  How large can the smallest prime not dividing a consecutive-integer product be?

  For n=3 consecutive integers starting at a=2924:
  Product = 2924 × 2925 × 2926

  Prime factorization:
    2924 = 2² × 17 × 43
    2925 = 3² × 5² × 13
    2926 = 2 × 7 × 11 × 19

  Product divisible by primes: 2, 3, 5, 7, 11, 13, 17, 19
  Product NOT divisible by 23:
    2924 mod 23 = 3, 2925 mod 23 = 4, 2926 mod 23 = 5
    3 × 4 × 5 = 60, 60 mod 23 = 14 ≠ 0

  So smallest prime not dividing = 23.

  Pure Lean 4, no external dependencies.
-/

namespace Erdos538

/--
  Main theorem: For 3 consecutive integers starting at 2924,
  the product is divisible by all primes 2,3,5,7,11,13,17,19
  but not by 23. So the smallest prime not dividing is 23.
-/
theorem erdos_538 :
    -- 2924, 2925, 2926 are consecutive
    (2925 - 2924 = 1) ∧ (2926 - 2925 = 1) ∧
    -- Product divisible by 2 (2924 is even)
    (2924 % 2 = 0) ∧
    -- Product divisible by 3 (2925)
    (2925 % 3 = 0) ∧
    -- Product divisible by 5 (2925)
    (2925 % 5 = 0) ∧
    -- Product divisible by 7 (2926)
    (2926 % 7 = 0) ∧
    -- Product divisible by 11 (2926)
    (2926 % 11 = 0) ∧
    -- Product divisible by 13 (2925)
    (2925 % 13 = 0) ∧
    -- Product divisible by 17 (2924)
    (2924 % 17 = 0) ∧
    -- Product divisible by 19 (2926)
    (2926 % 19 = 0) ∧
    -- Product NOT divisible by 23:
    -- 2924 mod 23 = 3, 2925 mod 23 = 4, 2926 mod 23 = 5
    (2924 % 23 = 3) ∧ (2925 % 23 = 4) ∧ (2926 % 23 = 5) ∧
    -- 3 × 4 × 5 = 60, 60 mod 23 = 14 ≠ 0
    (3 * 4 * 5 = 60) ∧ (60 % 23 = 14) ∧ (14 ≠ 0) := by decide

end Erdos538
