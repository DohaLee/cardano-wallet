{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Cardano.Wallet.Api.Types.WalletId where

import Prelude

import Data.Aeson
    ( FromJSON, ToJSON )
import Data.UUID.Types
    ( UUID )

newtype WalletId = WalletId
    { _uuid :: UUID }
    deriving stock (Eq, Show)
    deriving newtype (FromJSON, ToJSON)
