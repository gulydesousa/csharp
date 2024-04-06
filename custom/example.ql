/**
 * @name Empty block
 * @description Descripcion aqui
 * @kind problem
 * @problem.severity error
 * @tags miPrueba
 * @precision medium
 * @id csharp/example/empty-block
 * @security-severity 1.0
 */

 import csharp
 from BlockStmt b
 where b.getNumberOfStmts() = 0
 select b, "This is an empty block."
 
