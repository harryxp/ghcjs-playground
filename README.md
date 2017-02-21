As of now (20170220), using `ghcjs` to write a non-trivial program is still,
well, non-trivial.  This git repository demonstrates a repeatable process to
set up a small but workable (more than `hello, world`) `ghcjs` project using
`stack`.  This has only been tested on Linux.

The first step is to install `stack` using your favorate package manager.  Then:

    stack new ghcjs-playground
    cd ghcjs-playground

Follow [stack document](https://docs.haskellstack.org/en/stable/ghcjs/) from
here:

    vim stack.yaml  # replace the content
    stack setup

This is a slow process.  At the end you'll see this:

    ===========================================================================

       Boot libraries installation for GHCJS

    ===========================================================================

       ghcjs-boot has installed the libraries and runtime system for GHCJS


      boot program
      ------------

       ghcjs-boot program version   0.2.1.9007015 
                    file location   /home/harry/.stack/programs/x86_64-linux/ghcjs-0.2.1.9007015_ghc-8.0.1/src/.stack-work/install/x86_64-linux/lts-7.15/8.0.1/bin/ghcjs-boot-0.2.1.9007015-8.0.1
                    last modified   2017-02-03 01:50:52 UTC

         using configuration file   /home/harry/.stack/programs/x86_64-linux/ghcjs-0.2.1.9007015_ghc-8.0.1/src/.stack-work/install/x86_64-linux/lts-7.15/8.0.1/share/x86_64-linux-ghc-8.0.1/ghcjs-0.2.1.9007015/lib/etc/boot.yaml
                current directory   /home/harry/ghcjs-playground

      boot configuration
      ------------------

         installation directory   /home/harry/.ghcjs/x86_64-linux-0.2.1.9007015-8.0.1/ghcjs
              global package DB   /home/harry/.ghcjs/x86_64-linux-0.2.1.9007015-8.0.1/ghcjs/package.conf.d
       user package DB location   /home/harry/.ghcjs/x86_64-linux-0.2.1.9007015-8.0.1

                  GHCJS version   0.2.1.9007015   
               program location   /home/harry/.stack/programs/x86_64-linux/ghcjs-0.2.1.9007015_ghc-8.0.1/src/.stack-work/install/x86_64-linux/lts-7.15/8.0.1/bin/ghcjs
                   library path   /home/harry/.ghcjs/x86_64-linux-0.2.1.9007015-8.0.1/ghcjs
                  last modified   2017-02-03 01:50:52 UTC

                    GHC version   8.0.1           
                       location   /home/harry/.stack/programs/x86_64-linux/ghc-8.0.1/bin/ghc
                   library path   /home/harry/.stack/programs/x86_64-linux/ghc-8.0.1/lib/ghc-8.0.1

          cabal-install version   1.24.0.0        
                       location   /usr/bin/cabal  

              ghcjs-pkg version   0.2.1.9007015   
                       location   /home/harry/.stack/programs/x86_64-linux/ghcjs-0.2.1.9007015_ghc-8.0.1/src/.stack-work/install/x86_64-linux/lts-7.15/8.0.1/bin/ghcjs-pkg

                     quick boot   No              
               clean tree first   Yes             
               development boot   No              
                     native too   No              

      packages
      --------

       stage 1a

       - ./boot/base
       - ./boot/integer-gmp
       - ./boot/primitive
       - ./boot/transformers

       ghcjs-prim:  ../ghcjs-prim

       stage 1b

       - ./boot/array
       - ./boot/binary
       - ./boot/bytestring
       - ./boot/containers
       - ./boot/deepseq
       - ./boot/directory
       - ./boot/filepath
       - ./boot/ghc-boot
       - ./boot/ghc-boot-th
       - ./boot/ghci
       - ./boot/pretty
       - ./boot/template-haskell
       - ./boot/process
       - ./boot/time
       - ./boot/unix

       ghcjs-th:  ../ghcjs-th

       Cabal:  ./boot/cabal/Cabal

       stage 2

       - ./boot/async
       - ./boot/aeson
       - ./boot/attoparsec
       - ./boot/case-insensitive
       - ./boot/dlist
       - ./boot/extensible-exceptions
       - ./boot/fail
       - ./boot/hashable
       - ./boot/mtl
       - ./boot/parallel
       - ./boot/scientific
       - ./boot/stm
       - ./boot/syb
       - ./boot/transformers-compat
       - ./boot/tagged
       - ./boot/text
       - ./boot/unordered-containers
       - ./boot/vector
       - ./ghcjs/ghcjs-base




    ===========================================================================

       Configured programs

    ===========================================================================

       program         version         location   
                                                  
       ghcjs           0.2.1.9007015   /home/harry/.stack/programs/x86_64-linux/ghcjs-0.2.1.9007015_ghc-8.0.1/src/.stack-work/install/x86_64-linux/lts-7.15/8.0.1/bin/ghcjs
       ghcjs-pkg       0.2.1.9007015   /home/harry/.stack/programs/x86_64-linux/ghcjs-0.2.1.9007015_ghc-8.0.1/src/.stack-work/install/x86_64-linux/lts-7.15/8.0.1/bin/ghcjs-pkg
       ghcjs-run       -               /home/harry/.stack/programs/x86_64-linux/ghcjs-0.2.1.9007015_ghc-8.0.1/src/.stack-work/install/x86_64-linux/lts-7.15/8.0.1/bin/ghcjs-run
       ghc             8.0.1           /home/harry/.stack/programs/x86_64-linux/ghc-8.0.1/bin/ghc
       ghc-pkg         -               /home/harry/.stack/programs/x86_64-linux/ghc-8.0.1/bin/ghc-pkg
       cabal           1.24.0.0        /usr/bin/cabal
       node            v7.4.0          /usr/bin/node
       haddock-ghcjs   -               /home/harry/.stack/programs/x86_64-linux/ghcjs-0.2.1.9007015_ghc-8.0.1/src/.stack-work/install/x86_64-linux/lts-7.15/8.0.1/bin/haddock-ghcjs
       git             -               /usr/bin/git
       alex            -               /usr/bin/alex
       happy           -               /home/harry/.stack/snapshots/x86_64-linux/lts-7.15/8.0.1/bin/happy
       tar             -               /usr/bin/tar
       cpp             -               /usr/bin/cpp
       bash            -               /usr/bin/bash
       autoreconf      -               /usr/bin/autoreconf
       make            -               /usr/bin/make




    ===========================================================================

       Installation sources

    ===========================================================================

           shims (runtime system)                 
                                    /home/harry/.stack/programs/x86_64-linux/ghcjs-0.2.1.9007015_ghc-8.0.1/src/.stack-work/install/x86_64-linux/lts-7.15/8.0.1/share/x86_64-linux-ghc-8.0.1/ghcjs-0.2.1.9007015/lib/shims
                                    /home/harry/.stack/programs/x86_64-linux/ghcjs-0.2.1.9007015_ghc-8.0.1/src/.stack-work/install/x86_64-linux/lts-7.15/8.0.1/share/x86_64-linux-ghc-8.0.1/ghcjs-0.2.1.9007015/lib/cache/shims.tar
                                                  
                   boot libraries                 
                                    /home/harry/.stack/programs/x86_64-linux/ghcjs-0.2.1.9007015_ghc-8.0.1/src/.stack-work/install/x86_64-linux/lts-7.15/8.0.1/share/x86_64-linux-ghc-8.0.1/ghcjs-0.2.1.9007015/lib/ghcjs-boot
                                    /home/harry/.stack/programs/x86_64-linux/ghcjs-0.2.1.9007015_ghc-8.0.1/src/.stack-work/install/x86_64-linux/lts-7.15/8.0.1/share/x86_64-linux-ghc-8.0.1/ghcjs-0.2.1.9007015/lib/cache/boot.tar
                                                  
                       test suite                 
                                    /home/harry/.stack/programs/x86_64-linux/ghcjs-0.2.1.9007015_ghc-8.0.1/src/.stack-work/install/x86_64-linux/lts-7.15/8.0.1/share/x86_64-linux-ghc-8.0.1/ghcjs-0.2.1.9007015/test
                                    /home/harry/.stack/programs/x86_64-linux/ghcjs-0.2.1.9007015_ghc-8.0.1/src/.stack-work/install/x86_64-linux/lts-7.15/8.0.1/share/x86_64-linux-ghc-8.0.1/ghcjs-0.2.1.9007015/lib/cache/test.tar
                                                  
              configuration files                 
                                    /home/harry/.stack/programs/x86_64-linux/ghcjs-0.2.1.9007015_ghc-8.0.1/src/.stack-work/install/x86_64-linux/lts-7.15/8.0.1/share/x86_64-linux-ghc-8.0.1/ghcjs-0.2.1.9007015/lib/etc
                                                  
                    documentation                 
                                    /home/harry/.stack/programs/x86_64-linux/ghcjs-0.2.1.9007015_ghc-8.0.1/src/.stack-work/install/x86_64-linux/lts-7.15/8.0.1/share/x86_64-linux-ghc-8.0.1/ghcjs-0.2.1.9007015/doc
                                                  
       bootstrap GHC library path                 
                                    /home/harry/.stack/programs/x86_64-linux/ghc-8.0.1/lib/ghc-8.0.1

    /home/harry/ghcjs-playground$ writing /home/harry/.ghcjs/x86_64-linux-0.2.1.9007015-8.0.1/ghcjs/ghcjs_boot.completed
    GHCJS booted.
    stack will use a sandboxed GHCJS it installed
    For more information on paths, see 'stack path' and 'stack exec env'
    To use this GHCJS and packages outside of a project, consider using:
    stack ghc, stack ghci, stack runghc, or stack exec

I have a `app/Main.hs` ready to play with.  The code demonstrates:

* Dynamically generating HTML elements.
* Fetching a value from an input field.
* Showing that value on the page.

I have a more sophisticated `ghcjs` project
[here](https://github.com/harryxp/haskell-things/tree/master/MortgageCalc).

Build and run:

    stack build
    stack exec ghcjs-playground-exe     # this name is in ghcjs-playground-exe.cabal
    node ./.stack-work/dist/x86_64-linux/Cabal-1.24.2.0_ghcjs/build/ghcjs-playground-exe/ghcjs-playground-exe.jsexe/all.js

    OR

    open ./.stack-work/dist/x86_64-linux/Cabal-1.24.2.0_ghcjs/build/ghcjs-playground-exe/ghcjs-playground-exe.jsexe/index.html

This works.  Let's save everything in git...

    git init
    git add app/ ghcjs-playground.cabal LICENSE Setup.hs src/ stack.yaml test/
    git commit -m 'Initial commit.'

