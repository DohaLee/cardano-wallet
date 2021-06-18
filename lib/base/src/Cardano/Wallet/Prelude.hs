{-# OPTIONS_GHC -fno-warn-orphans #-}

-- |
-- Copyright: © 2018-2021 IOHK
-- License: Apache-2.0
--
-- Prelude for cardano-wallet.

module Cardano.Wallet.Prelude
    ( -- * Reexports from base
      module Prelude
    , idFunc
    , (&)
    , (<&>)
    , toList
    , bool
    , first
    , second
    , bimap
    , on
    , isNothing
    , isJust
    , fromMaybe
    , mapMaybe
    , guard
    , foldl'
    , fold
    , for
    , (<=<)
    , (>=>)
    , ($>)
    , fromRight
    , isRight
    , void
    , join
    , when
    , unless
    , forM
    , forM_
    , coerce
    , Generic
    , NFData
    , Natural
    , NonEmpty (..)
    , Word16
    , Word8
    , Word32
    , Word64
    , Alternative (..)
    , Coercible
    , Typeable
    , Proxy (..)
    , Type
    -- * Lens
    , Lens'
    , lens
    , (^.)
    , (^?)
    , view
    , (.~)
    , set
    , over
    -- * IO classes
    , MonadUnliftIO (..)
    , MonadIO (..)
    , lift
    -- * Exceptions
    , Exception
    , throwIO
    , throwString
    , HasCallStack
    -- * Text
    , Text
    , showText
    -- * Wallet text-class
    , ToText (..)
    , FromText (..)
    -- * Formatting
    , Buildable (..)
    , pretty
    , fmt
    , blockListF
    , ordinalF
    , (+|), (+||), (|+), (||+)

    -- * Extra
    , eitherToMaybe

    -- * Tracing
    , Tracer (..)
    , contramap
    , traceWith

    -- * Debugging
    , traceShowId
    , trace

    -- * GHCi
    , pPrint
    ) where

import Prelude

-- base packages
import Control.Applicative
    ( Alternative (..) )
import Control.DeepSeq
    ( NFData (..) )
import Control.Monad
    ( forM, forM_, guard, join, unless, void, when, (<=<), (>=>) )
import Control.Monad.Trans.Class
    ( lift )
import Data.Bifunctor
    ( bimap, first, second )
import Data.Bool
    ( bool )
import Data.Coerce
    ( Coercible, coerce )
import Data.Either
    ( fromRight, isRight )
import Data.Foldable
    ( fold, toList )
import Data.Function
    ( on, (&) )
import Data.Functor
    ( ($>), (<&>) )
import Data.Kind
    ( Type )
import Data.List
    ( foldl' )
import Data.List.NonEmpty
    ( NonEmpty (..) )
import Data.Maybe
    ( fromMaybe, isJust, isNothing, mapMaybe )
import Data.Proxy
    ( Proxy (..) )
import Data.Text
    ( Text )
import Data.Traversable
    ( for )
import Data.Typeable
    ( Typeable )
import Data.Word
    ( Word32, Word64, Word8 )
import Debug.Trace
import GHC.Generics
import GHC.Natural
    ( Natural )
import GHC.Stack
    ( HasCallStack )

import qualified Data.Text as T

-- other packages
import Control.Monad.IO.Unlift
    ( MonadIO (..), MonadUnliftIO (..) )
import Data.Either.Extra
    ( eitherToMaybe )
import Data.Generics.Internal.VL
    ( over, (.~) )
import Data.Generics.Internal.VL.Lens
    ( Lens', lens, set, view, (^.) )
import Data.Generics.Labels
    ()
import Fmt
    ( blockListF, fmt, ordinalF, pretty, (+|), (+||), (|+), (||+) )
import Formatting.Buildable
    ( Buildable (..) )
import Text.Pretty.Simple
    ( pPrint )
import UnliftIO.Exception
    ( Exception, throwIO, throwString )

-- iohk packages
import Control.Tracer
    ( Tracer (..), contramap, traceWith )

-- cardano-wallet packages
import Data.Text.Class

showText :: Show a => a -> Text
showText = T.pack . show

-- | Identity function. Use this when you need the name 'id' for another
-- variable.
--
-- > idFunc x = x
idFunc :: a -> a
idFunc x =  x
