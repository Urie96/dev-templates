{
  description = "Ready-made templates for easily creating flake-driven environments";

  outputs =
    { ... }:
    {
      templates = rec {
        default = empty;

        bun = {
          path = ./bun;
          description = "Bun development environment";
        };

        c-cpp = {
          path = ./c-cpp;
          description = "C/C++ development environment";
        };

        empty = {
          path = ./empty;
          description = "Empty dev template that you can customize at will";
        };

        go = {
          path = ./go;
          description = "Go (Golang) development environment";
        };

        node = {
          path = ./node;
          description = "Node.js development environment";
        };

        python = {
          path = ./python;
          description = "Python development environment";
        };

        rust = {
          path = ./rust;
          description = "Rust development environment";
        };

        java-maven = {
          path = ./java-maven;
          description = "Java Maven development environment";
        };

        esp-idf = {
          path = ./esp-idf;
          description = "Esp-idf development environment";
        };

        esp-rust = {
          path = ./esp-rust;
          description = "Esp Rust development environment";
        };

        # Aliases
        c = c-cpp;
        cpp = c-cpp;
      };
    };
}
