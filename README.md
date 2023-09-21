# OpenTimestamps: Scalable, Trust-Minimized, Distributed Timestamping with Bitcoin

OpenTimestamps è un progetto open-source che permette la creazione e la verifica di timestamp di file, utilizzando la blockchain Bitcoin.<br>
Un timestamp dimostra che un determinato dato esiste da un certo istante temporale in poi, infatti ci si riferisce spesso a una `"proofs-of-existence"`.<br>
Il concetto principale è quello di utilizzare una blockchain come un registro pubblico e immutabile per convalidare l'istante temporale (timestamp) in cui un determinato file è stato creato o modificato.<br>
Questo può essere utile in vari contesti, come la prova di esistenza di un documento in un momento specifico o la verifica dell'integrità di dati digitali nel tempo.

Le caratteristiche principali di OpenTimestamps sono:

-	Open-Source: Il progetto è open-source, quindi il codice sorgente è disponibile pubblicamente a tutti, per cui chiunque può ispezionare il codice e contribuire al progetto.
-	Decentralizzato: OpenTimestamps consente gratuitamente a chiunque di creare timestamp utilizzando la blockchain Bitcoin, senza la necessità di avere un'autorità esterna che confermi la transazione.
-	Interoperabilità: Gli orari generati da OpenTimestamps sono indipendenti dalla blockchain e possono essere verificati persino offline.
-	Flessibilità: È possibile utilizzare OpenTimestamps per creare timestamp di dati di qualsiasi tipo, inclusi file, documenti, transazioni Bitcoin e altro ancora.
-	Immutabilità: Una volta registrato un timestamp sulla blockchain, esso non può più essere modificato o cancellato, il che fornisce una prova pubblica dell'istante di tempo in cui i dati sono stati convalidati.

Per poter utilizzare OpenTimestamps, è necessario un client OpenTimestamps che può essere eseguito da riga di comando o utilizzato tramite librerie. Sono disponibili client realizzati con linguaggi di programmazione differenti (Python, Javascript e Java).

Opentimestamps utilizza quattro Calendar gratuiti per la gestione delle transazioni sulla blockchain. Per il supporto del progetto, sono accettate donazioni in Bitcoin o attraverso pagamenti sulla lightning network.

I Calendar disponibili sono i seguenti:
-   Alice : <a href="https://alice.btc.calendar.opentimestamps.org/" target="_blank">https://alice.btc.calendar.opentimestamps.org/</a>
-   Bob : <a href="https://bob.btc.calendar.opentimestamps.org/" target="_blank">https://bob.btc.calendar.opentimestamps.org/</a>
-   Finney : <a href="https://finney.calendar.eternitywall.com/" target="_blank">https://finney.calendar.eternitywall.com/</a>
-   Catallaxy : <a href="https://ots.btc.catallaxy.com/" target="_blank">https://ots.btc.catallaxy.com/</a>

Per altri dettagli sul progetto : <a href="https://petertodd.org/2016/opentimestamps-announcement" target="_blank">Click here</a>

## Come eseguire il Timestamping

In questo progetto verrà utilizzato il client realizzato in Python disponibile su Github al seguente link : <a href="https://github.com/opentimestamps/opentimestamps-client" target="_blank">https://github.com/opentimestamps/opentimestamps-client</a>

Requisiti : `Python` e `pip` (per installare il client)

Per poter installare il client, bisogna eseguire il comando:

```bash
pip3 install opentimestamps-client
```

A seguito dell'installazione, è possibile utilizzare il comando `ots`.<br>
Scegliere/creare un file per cui si vuole eseguire il `Timestamping` e eseguire il comando:

```bash
ots stamp NOME_FILE
```

Il comando riprodurrà in output su terminale le seguenti informazioni:
```
Submitting to remote calendar https://a.pool.opentimestamps.org
Submitting to remote calendar https://b.pool.opentimestamps.org
Submitting to remote calendar https://a.pool.eternitywall.com
Submitting to remote calendar https://ots.btc.catallaxy.com
```
A questo punto viene eseguito un algoritmo di `"hashing"` (sha256) sul file originale, il quale riproduce in output una stringa di lunghezza fissa (64 caratteri in esadecimale) chiamata `"hash"`, che rappresenta un'impronta digitale univoca del file.<br>
Per registrare il timestamp su una transazione sulla blockchain Bitcoin, viene generato un file con estensione `.ots`, che contiene le informazioni riguardo il timestamp.<br>
Con il comando:

```bash
ots verify NOME_FILE.ots
```

è possibile verificare lo stato attuale del `Timestamping` nei quattro Calendar.<br>
Inizialmente lo stato dell'operazione è `"Pending confirmation in Bitcoin blockchain"`, infatti compariranno le seguenti informazioni:
```
Calendar https://finney.calendar.eternitywall.com: Pending confirmation in Bitcoin blockchain
Calendar https://btc.calendar.catallaxy.com: Pending confirmation in Bitcoin blockchain
Calendar https://bob.btc.calendar.opentimestamps.org: Pending confirmation in Bitcoin blockchain
Calendar https://alice.btc.calendar.opentimestamps.org: Pending confirmation in Bitcoin blockchain
```
La conferma del timestamp sulla blockchain Bitcoin richiede alcune ore, perché Opentimestamps non esegue una transazione per timestamp, bensì combina un numero illimitato di timestamp in un unica transazione.<br>
Quando la transazione viene inclusa in un blocco valido e confermata sulla blockchain, il timestamp è considerato ufficialmente convalidato.<br>
Con il comando:

```bash
ots info NOME_FILE.ots
```

vengono mostrate ulteriori informazioni sul timestamp:
```
File sha256 hash: HASH_DEL_FILE
Timestamp:
append 342520a60108b9bb0e60e58ffe935028
sha256
 -> append 0d0ecc37d85914e56f7c2dfbfa70a393
    sha256
    append b940e77dc58d63bc3f0c55287675ea2a80705d621c5717898f1f5e3dcdce92e7
    sha256
    prepend 650c647c
    append 3bf4a8efa56973c9
    verify PendingAttestation('https://finney.calendar.eternitywall.com')
 -> append 3d073dd138ca5507fa96c927a28fa66a
    sha256
    prepend 650c647b
    append 07c5d73ea439a880
    verify PendingAttestation('https://btc.calendar.catallaxy.com')
 -> append 98760502f0e2d90937a14e3cd891c1b5
    sha256
    prepend 650c647c
    append 825ebdd65b77798c
    verify PendingAttestation('https://bob.btc.calendar.opentimestamps.org')
 -> append d1562fd14b867a97dce1e03453049da4
    sha256
    prepend c8def71aee9679cb6fbaef9863e8a15f0393ffc310e70ae683c1b36ad81d3bdb
    sha256
    append 72e15a4e4e5cf2b784915153eb67c269e9f13efcf0bc5fe5a9137f652d59c524
    sha256
    prepend 650c647c
    append bfd5269e6aac8cd0
    verify PendingAttestation('https://alice.btc.calendar.opentimestamps.org')
```
Se il timestamp è stato confermato dalla blockchain, compariranno anche le informazioni sul blocco e sulla transazione.<br>
Qui, è possibile verificare l'id della transazione e il numero del blocco, che hanno convalidato il timestamp.

Andando sul Calendar che ha gestito il `Timestamping` e cliccando sull'id della transazione corrispondente, si viene reindirizzati su una pagina web relativa al sito <a href="https://mempool.bullBitcoin.com/" target="_blank">mempool</a><br>
Nota: per saltare questo passaggio, andare direttamente all'url - https://mempool.bullBitcoin.com/it/tx/ID_TRANSACTION<br>
Nota 2: è comunque possibile verificare la transazione sulla blockchain Bitcoin su un qualsiasi explorer.

### Come possiamo capire se il timestamp del file ha avuto successo ?

Nelle informazioni precedenti è presente una sequenza di caratteri chiamata `merkle root`.<br>
Questa stringa è calcolata prendendo in considerazione tutte le transazioni presenti in un blocco e creando un `merkle-tree`.<br>
Viene eseguita una procedura di `hashing` a cascata, combinando gli `hash` delle singole transazioni e concatenandoli.<br>
Di seguito il link con una spiegazione più dettagliata : <a href="https://petertodd.org/2016/opentimestamps-announcement#merkle-trees" target="_blank">Click here</a>

Sostanzialmente, se l'`hash` del nostro file non fosse stato preso in considerazione durante questa procedura di `hashing`, allora il `merkle root` finale sarebbe stato completamente diverso.<br>
Questo è quindi la prova dell'esistenza del file quando il blocco è stato creato e validato sulla blockchain.

Per poter verificare tutto ciò, basta semplicemente ripetere tutte le operazioni presenti nella procedura di `hashing`.<br>
Il risultato finale sarà esattamente lo stesso valore definito precedentemente nel tempo dal `merkle root`.

## Utilizzo
In questo repository sono disponibili dei file di vario formato nella directory `src/`.<br>
Per ciascuno di essi, è stato eseguito il `Timestamping` e i file `.ots` si trovano nella directory `dist/`.<br>
Per ciascun file, sono state eseguite tutte le operazione precedentemente descritte con il client in `Python`.<br>
Tutti i file, quindi, sono stati convalidati con delle transazioni, per cui la creazione dei file e l'integrità di essi è confermata dalla blockchain.
