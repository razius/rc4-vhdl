A hardware implementation of the RC4 cipher
===========================================

This is WIP and should not be used!

Known bugs
==========

Does not discard the initial portion of the keystream which makes it very insecure, see `Fluhrer, Mantin and Shamir attack <http://en.wikipedia.org/wiki/Rc4#Fluhrer.2C_Mantin_and_Shamir_attack>`_
