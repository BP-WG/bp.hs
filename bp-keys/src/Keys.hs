{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE NumericUnderscores         #-}
{-|
Module      : Bp.Keys
License     : MIT
Maintainer  : Dr Maxim Orlovsky <orlovsky@lnp-bp.org>
Stability   : experimental
Portability : POSIX
Bitcoin private and public key library.
-}

module Keys
  ( -- * Scalars
    Scalar
  , scalar
  , orderN
  ) where

import           Numeric.Natural

data Scalar = Scalar Natural
  deriving (Eq, Ord)

orderN = 0xFFFFFFFF_FFFFFFFF_FFFFFFFF_FFFFFFFE_BAAEDCE6_AF48A03B_BFD25E8C_D0364141

scalar :: Natural -> Maybe Scalar
scalar val
  | val < orderN        = Just (Scalar val)
  | otherwise           = Nothing
