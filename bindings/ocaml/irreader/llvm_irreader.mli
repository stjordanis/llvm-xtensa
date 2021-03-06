(*===-- llvm_irreader.mli - LLVM OCaml Interface --------------*- OCaml -*-===*
 *
 *                     The LLVM Compiler Infrastructure
 *
 * This file is distributed under the University of Illinois Open Source
 * License. See LICENSE.TXT for details.
 *
 *===----------------------------------------------------------------------===*)

(** IR reader.

    This interface provides an OCaml API for the LLVM assembly reader, the
    classes in the IRReader library. *)

exception Error of string

(** [parse_ir context mb] parses the IR for a new module [m] from the
    memory buffer [mb] in the context [context]. Returns [m] if successful, or
    raises [Error msg] otherwise, where [msg] is a description of the error
    encountered. See the function [llvm::ParseIR]. *)
val parse_ir : Llvm.llcontext -> Llvm.llmemorybuffer -> Llvm.llmodule
