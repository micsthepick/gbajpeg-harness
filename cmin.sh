([ ! -d /outs/seeds-$PGM ] || (rm -rf /outs/seeds-$PGM.bak && mv /outs/seeds-$PGM /outs/seeds-$PGM.bak)) && afl-cmin -i ./out-$PGM/$PGM-a/queue -o /outs/seeds-$PGM -- ./$PGM-afl
