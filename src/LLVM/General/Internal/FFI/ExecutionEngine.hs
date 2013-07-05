{-# LANGUAGE
  ForeignFunctionInterface
  #-}

module LLVM.General.Internal.FFI.ExecutionEngine where

import Foreign.Ptr
import Foreign.C

import LLVM.General.Internal.FFI.PtrHierarchy
import LLVM.General.Internal.FFI.LLVMCTypes
import LLVM.General.Internal.FFI.Module

data ExecutionEngine

foreign import ccall unsafe "LLVMCreateExecutionEngineForModule" createExecutionEngineForModule ::
  Ptr (Ptr ExecutionEngine) -> Ptr Module -> Ptr MallocedCString -> IO CUInt

foreign import ccall unsafe "LLVMCreateInterpreterForModule" createInterpreterForModule ::
  Ptr (Ptr ExecutionEngine) -> Ptr Module -> Ptr MallocedCString -> IO CUInt

foreign import ccall unsafe "LLVMCreateJITCompilerForModule" createJITCompilerForModule ::
  Ptr (Ptr ExecutionEngine) -> Ptr Module -> CUInt -> Ptr MallocedCString -> IO CUInt

foreign import ccall unsafe "LLVMDisposeExecutionEngine" disposeExecutionEngine ::
  Ptr ExecutionEngine -> IO ()

foreign import ccall unsafe "LLVMAddModule" addModule ::
  Ptr ExecutionEngine -> Ptr Module -> IO ()

foreign import ccall unsafe "LLVMRemoveModule" removeModule ::
  Ptr ExecutionEngine -> Ptr Module -> Ptr (Ptr Module) -> Ptr CString -> IO CUInt

foreign import ccall unsafe "LLVMFindFunction" findFunction ::
  Ptr ExecutionEngine -> CString -> Ptr (Ptr Function) -> IO CUInt

foreign import ccall unsafe "LLVMGetPointerToGlobal" getPointerToGlobal ::
  Ptr ExecutionEngine -> Ptr GlobalValue -> IO (Ptr ())

foreign import ccall unsafe "LLVMLinkInInterpreter" linkInInterpreter :: 
  IO ()

foreign import ccall unsafe "LLVMLinkInJIT" linkInJIT :: 
  IO ()
