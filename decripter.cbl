      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FILEO ASSIGN "your-file.txt"
           ORGANISATION SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS FS-FILEO.
       DATA DIVISION.
       FILE SECTION.
       FD FILEO
           RECORDING MODE IS F.
       01 FILEO-REC        PIC S9(10) COMP-3.
       01 FILEO-REC1       PIC S9(09) COMP-3.
       01 FILEO-REC2       PIC  9(09) COMP-3.
       01 FILEO-REC3       PIC  9(10) COMP-3.
       01 FILEO-STRING     PIC  X(05).
       WORKING-STORAGE SECTION.
       01 FS-FILEO         PIC 9(02).
           88 FS-FILEO-OK              VALUE 00.
       01  WS-COUNT        PIC 9(02).
       01  WS-I            PIC 9(02).
       01 WS-MY-VAR OCCURS 0 TO 10 TIMES DEPENDING ON WS-COUNT
                           PIC S9(10) COMP-3.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           MOVE 4          TO WS-COUNT
           MOVE 0123456789 TO WS-MY-VAR(1)
           MOVE 123456789  TO WS-MY-VAR(2)
           MOVE ZEROES     TO WS-MY-VAR(3)
           MOVE -123456789 TO WS-MY-VAR(4)
           OPEN OUTPUT FILEO
           IF NOT FS-FILEO-OK
               DISPLAY "OPEN"
               DISPLAY FS-FILEO
               MOVE FS-FILEO TO RETURN-CODE
               DISPLAY "-"
           END-IF
           MOVE '-NXT-' TO FILEO-STRING
           WRITE FILEO-STRING
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-COUNT
               MOVE WS-MY-VAR(WS-I) TO FILEO-REC
               WRITE FILEO-REC
               IF NOT FS-FILEO-OK
                   DISPLAY "WRITE"
                   DISPLAY FS-FILEO
                   MOVE FS-FILEO TO RETURN-CODE
                   DISPLAY "-"
               END-IF
           END-PERFORM
           MOVE '-NXT-' TO FILEO-STRING
           WRITE FILEO-STRING
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-COUNT
               MOVE WS-MY-VAR(WS-I) TO FILEO-REC1
               WRITE FILEO-REC1
               IF NOT FS-FILEO-OK
                   DISPLAY "WRITE"
                   DISPLAY FS-FILEO
                   MOVE FS-FILEO TO RETURN-CODE
                   DISPLAY "-"
               END-IF
           END-PERFORM
           MOVE '-NXT-' TO FILEO-STRING
           WRITE FILEO-STRING
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-COUNT
               MOVE WS-MY-VAR(WS-I) TO FILEO-REC2
               WRITE FILEO-REC2
               IF NOT FS-FILEO-OK
                   DISPLAY "WRITE"
                   DISPLAY FS-FILEO
                   MOVE FS-FILEO TO RETURN-CODE
                   DISPLAY "-"
               END-IF
           END-PERFORM
           MOVE '-NXT-' TO FILEO-STRING
           WRITE FILEO-STRING
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-COUNT
               MOVE WS-MY-VAR(WS-I) TO FILEO-REC3
               WRITE FILEO-REC3
               IF NOT FS-FILEO-OK
                   DISPLAY "WRITE"
                   DISPLAY FS-FILEO
                   MOVE FS-FILEO TO RETURN-CODE
                   DISPLAY "-"
               END-IF
           END-PERFORM
           CLOSE FILEO
           IF NOT FS-FILEO-OK
               DISPLAY "CLOSE"
               DISPLAY FS-FILEO
               MOVE FS-FILEO TO RETURN-CODE
               DISPLAY "-"
           END-IF
           STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
