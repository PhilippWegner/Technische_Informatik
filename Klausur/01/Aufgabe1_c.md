<h1>
    c) Array-Datentypen können in VHDL folgendermaßen definiert werden:<br>
    signal a: std_logic_vector (7 downto 0);<br>
    oder<br>
    signal b: std_logic_vector (0 to 7);<br>
    Was ist der Unterschied zwischen beiden Definitionen? Wann sollte welche Definition verwendet werden?<br>
<h1>
<p>
    Die beiden Definition unterscheiden sich in der Nutzung der jeweiligen Richtung der Vektorangaben.<br>
    "downto" steht hierbei für absteigend, bedeutet die Zahl 1 wird wie folgt dargestellt:<b>
    0000001<br>
    Diese Schreibweise wird in diesem Kontext auch "little endian" genannt, da das Ende des Vektor den niedrigstwertigsten Byte inne hat.<br>
    <br>
    "to" steht für eine aufsteigende Indizierung des Vektors. Um auch hier die Zahl 1 darzustellen, muss allerdings die Reihenfolge getauscht werden:<br>
    1000000<br>
    Diese Schreibweise wird in diesem Kontext auch "big endian" genannt, da das Ende des Vektor den höchstwertigsten Byte inne hat.<br>
    <br>
    Die Verwendung von Little und Big Endian hängt von der Wichtigkeit der Bitfolge ab, soll beispielweise bei einer Datenübertragung lieber das niedrigstwertigsten oder höchstwertigsten Bit zu erst übermittelt werden? Kommt während des Übertragungsvorgangs nun zu einem Fehler werden vielleicht nicht alle Bits übertragen.
</p>