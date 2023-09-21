# OpenTimestamps

OpenTimestamps è un progetto open-source che permette la creazione e la verifica di timestamp di file, utilizzando la blockchain.
Il concetto principale è quello di utilizzare una blockchain come un registro pubblico e immutabile per convalidare l'istante temporale (timestamp) in cui un determinato file è stato creato o modificato.
Questo può essere utile in vari contesti, come la prova di esistenza di un documento in un momento specifico o la verifica dell'integrità di dati digitali nel tempo.

Le caratteristiche principali di OpenTimestamps sono:

-	Open-Source: Il progetto è open-source, quindi il codice sorgente è disponibile pubblicamente a tutti, per cui chiunque può ispezionare il codice e contribuire al progetto.
-	Decentralizzato: OpenTimestamps consente gratuitamente a chiunque di creare timestamp utilizzando una varietà di blockchain pubbliche e private.
-	Interoperabilità: Gli orari generati da OpenTimestamps sono indipendenti dalla blockchain specifica utilizzata e possono essere verificati su diverse blockchain o persino offline.
-	Flessibilità: È possibile utilizzare OpenTimestamps per creare timestamp di dati di qualsiasi tipo, inclusi file, documenti, transazioni Bitcoin e altro ancora.
-	Immutabilità: Una volta registrato un timestamp su una blockchain, esso non può più essere modificato o cancellato, il che fornisce una prova pubblica dell'istante di tempo in cui i dati sono stati convalidati.

Per poter utilizzare OpenTimestamps, è necessario un client OpenTimestamps che può essere eseguito da riga di comando o utilizzato tramite librerie. Sono disponibili client realizzati con linguaggi di programmazione differenti (Python, Javascript e Java).

Opentimestamps utilizza quattro Calendar gratuiti per la gestione delle transazioni sulla blockchain. Per il supporto del progetto, sono accettate donazioni in bitcoin o attraverso pagamenti sulla lightning network.

I Calendar disponibili sono i seguenti:
-   Alice : <a href="https://alice.btc.calendar.opentimestamps.org/" target="_blank">https://alice.btc.calendar.opentimestamps.org/</a>
-   Bob : <a href="https://bob.btc.calendar.opentimestamps.org/" target="_blank">https://bob.btc.calendar.opentimestamps.org/</a>
-   Finney : <a href="https://finney.calendar.eternitywall.com/" target="_blank">https://finney.calendar.eternitywall.com/</a>
-   Catallaxy : <a href="https://ots.btc.catallaxy.com/" target="_blank">https://ots.btc.catallaxy.com/</a>

## Come eseguire il timestamping

In questo progetto verrà utilizzato il client realizzato in Python disponibile su Github al seguente link : <a href="https://github.com/opentimestamps/opentimestamps-client" target="_blank">https://github.com/opentimestamps/opentimestamps-client</a>

Requisiti : Python e pip (per installare il client)

Per poter installare il client, bisogna eseguire il comando:
```bash
pip3 install opentimestamps-client
```
A seguito dell'installazione, è possibile utilizzare il comando ots.<br>
Scegliere/creare un file per cui si vuole eseguire il timestamping e eseguire il comando:
```bash
ots stamp NOME_FILE
```
A questo punto viene eseguito un algoritmo di `"hashing"` (sha256) sul file originale, il quale riproduce in output una stringa di lunghezza fissa (64 caratteri in esadecimale) chiamata `"hash"`, che rappresenta un'impronta digitale univoca del file.<br>
Per registrare il timestamp su una transazione sulla blockchain bitcoin, viene generato un file con estensione `.ots`, che contiene le informazioni riguardo il timestamp.

Con il comando:
```bash
ots verify NOME_FILE.ots
```
è possibile verificare lo stato attuale del timestamping nei quattro Calendar.<br>
Inizialmente lo stato dell'operazione è `"Pending confirmation in Bitcoin blockchain"`.<br>
La conferma del timestamp sulla blockchain Bitcoin richiede alcune ore, perché Opentimestamps non esegue una transazione per timestamp.<br>
Quando la transazione viene inclusa in un blocco valido e confermata sulla blockchain, il timestamp è considerato ufficialmente convalidato.

Con il comando:
```bash
ots info NOME_FILE.ots
```
vengono mostrate ulteriori informazioni sul timestamp.<br>
Se il timestamp è stato confermato dalla blockchain, compariranno anche le informazioni sul blocco e sulla transazione.<br>
Qui, è possibile verificare l'id della transazione e il numero del blocco, che hanno convalidato il timestamp.

Andando sul Calendar che ha gestito il timestamping e cliccando sull'id della transazione corrispondente, si viene reindirizzati su una pagina web relativa al sito <a href="https://mempool.bullbitcoin.com/" target="_blank">mempool</a><br>
Nota: per saltare questo passaggio, andare direttamente all'url - https://mempool.bullbitcoin.com/it/tx/ID_TRANSACTION

È comunque possibile verificare la transazione sulla blockchain su un qualsiasi explorer.
