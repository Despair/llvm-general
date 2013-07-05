-- | A 'Module' holds a C++ LLVM IR module. 'Module's may be converted to or from strings or Haskell ASTs, or
-- added to an 'LLVM.General.ExecutionEngine' and so JIT compiled to get function pointers.
module LLVM.General.Module (
    Module,
    withModuleFromAST,
    moduleAST,
    withModuleFromString,
    moduleString,

    writeBitcodeToFile,
    writeAssemblyToFile,
    writeObjectToFile
  ) where

import LLVM.General.Internal.Module
