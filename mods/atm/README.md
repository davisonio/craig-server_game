# ATM mod for Minetest

This mod adds a faimly of ATM machines designed to work with the currency mod and its
minegeld banknotes. ATMs allow you to transfer money to your bank account and withdraw
various sums as needed.

There are 3 types of ATMs with different capabilities. The most basic version is grey and
only allows single banknote transactions.

```
[ steel ingot, mese wire, steel ingot ]
[ glass,       1 MG note, steel ingot ]
[ steel ingot, mese wire, steel ingot ]
```

The more advanced, green ATM, allows transactions in bundles of 10 notes.

```
[ steel ingot, mese wire,    steel ingot ]
[ glass,       5 MG note,    steel ingot ]
[ steel ingot, mese crystal, steel ingot ]
```

The most advanced ATM, the yellow one, allows to add and withdraw banknotes by hundreds.

```
[ steel ingot, mese crystal, steel ingot ]
[ glass,       10 MG note,   steel ingot ]
[ steel ingot, mese crystal, steel ingot ]
```

Goes without saying, all lower tier options are also available in a higher tier ATM.

If mesecons mod is not installed, then the mese wire in recipes is replaced by a copper ingot.

## Wire Transfer

An alternative system for transfering money from one player's account to another. The terminals
provide an interface for sending a specified amount (integer number) to a player (who must
have an existing banking account) and for checking the transfers to the account of the user of
the terminal. The history of transactions can be erased completely, and it is recommended to
clean it once the stored data are no longer of any relevance. Otherwise, the transaction history
is preserved indefinitely.

```
[ steel ingot, mese crystal, steel ingot ]
[ glass,       mese wire,    steel ingot ]
[ steel ingot, mese crystal, steel ingot ]
```

To complete a wire transfer a player must provide the name of the recipient with an
existing banking account, the desired amount to be transfered, and a description of the 
payment (optional, but strongly recommended).
After entering those parameters the terminal checks their validity and if there is no problem,
the player is shown the final confirmation window. If the player confirms the payment, the specified
amount will be transfered immediately. At this point the transaction is final.
If there are errors, a corresponding message is shown in the chat, and the transaction is aborted.

## Founder

This is a fork of gpcf's ATM mod: git://gpcf.eu/atm.git