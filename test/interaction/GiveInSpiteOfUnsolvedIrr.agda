-- {-# OPTIONS -v interaction.give:30 -v 10  #-}
-- {-# OPTIONS -v tc.conv.irr:20 #-}

module GiveInSpiteOfUnsolvedIrr where

postulate
  _≡_ : {A : Set} → A → A → Set
  funExt : ∀ {A : Set}{B : A → Set}{f g : (x : A) → B x} →
    (∀ x → f x ≡ g x) → f ≡ g

record MC (M : Set) (op : M → M → M) : Set where
  field
    elem   : M
    fun    : M → M
    .match : fun ≡ op elem

unitM : ∀ {M : Set} {op : M → M → M} → MC M op
unitM {M = M} = record
  { elem = {!!}
  ; fun  = λ x → x
  ; match = {!funExt ?!}  -- try give here
  }

{-
No variable of type
{M : Set} {.op : M → M → M} → (λ x → x) ≡ .op ?0 was found in
scope.
-}

-- This declaration needs to stay to trigger the error!
compM : ∀ {M : Set} {op : M → M → M} → MC M op → MC M op → MC M op
compM = {!!}
