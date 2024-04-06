/**
 * @name Empty block NUEVO
 * @description NUEVO CodeQL
 * @kind problem
 * @problem.severity error
 * @tags miPrueba
 * @precision high
 * @id csharp/example/emptyblock
 * @security-severity 1.0
 */

 import csharp
 from BlockStmt b
 where b.getNumberOfStmts() = 0
 select b, "This is an empty block."
 
