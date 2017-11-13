! Copyright (C) 2017 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors command-line io io.directories io.files.types
    kernel namespaces sequences continuations ;
IN: ls

<PRIVATE

: list-files-dirs ( path -- files dirs )
    directory-entries [ type>> +regular-file+ = ] partition ;

: pprint-names ( seq str -- )
    write [ name>> write nl ] each ;

: check-args ( -- arg )
    [ command-line get first ]
    [ drop "No args passed, using current path\n" write "." ] recover ;

PRIVATE>

: ls ( path -- )
    list-files-dirs
    "DIRECTORIES:\n----------------\n" pprint-names
    "\nFILES:\n----------------\n"     pprint-names ;

: ls-run ( -- )
    check-args [ ls ] [ drop "Directory does not exist/not enough permissions" write ] recover ;

MAIN: ls-run
