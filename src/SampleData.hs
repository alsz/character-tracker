module SampleData
(
  sampleStats
) where

import Types

health = BoundedNumber "Health" 5 0 15
strength = ArbitraryNumber "Strength" 5 True
carry = StatBasedNumber "Carry" "Strength" (\strength -> strength * 2)

sampleStats = [[health, strength, carry]]
