module SampleData
(
  sampleStats
) where

import Types

health = BoundedNumber "Health" 5 0 15
str = ArbitraryNumber "Strength" 9 True
wil = ArbitraryNumber "Willpower" 3 True
int = ArbitraryNumber "Intelligence" 3 True
cha = ArbitraryNumber "Charisma" 3 True
carry = StatBasedNumber "Carry" "Strength" (\strength -> strength * 2)
hair = StatBasedNumber "Hair" "Charisma" (\cha -> cha * 200)

sampleStats = [[health], [str, wil, int, cha], [carry, hair]]
