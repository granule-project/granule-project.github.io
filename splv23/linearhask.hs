{-# LANGUAGE LinearTypes, DataKinds #-}

import GHC.Types

id :: a -> a
id x = x

copy :: a %Many -> (a, a)
copy x = (x, x)

drop :: a %Many -> ()
drop x = ()
