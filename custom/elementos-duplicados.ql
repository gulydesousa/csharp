/**
 * @name Elementos duplicados
 * @description Funcion
 * @kind problem
 * @problem.severity error
 * @tags miPrueba
 * @precision high
 * @id csharp/example/funcion
 * @security-severity 1.0
 */
import csharp

from ArrayCreation ac
where exists(int i, int j |
  i != j and
  ac.getInitializer().getElement(i) = ac.getInitializer().getElement(j)
)
select ac, "Este array tiene elementos duplicados."
