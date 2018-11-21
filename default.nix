with import <nixpkgs> {};
stdenv.mkDerivation {
        name = "java-sandbox";
        JAVA_HOME="${jdk11}/lib/openjdk";
        buildInputs = [
                jdk11
                gradle
        ];
    }
