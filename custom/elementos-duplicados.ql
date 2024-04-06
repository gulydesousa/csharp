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

from Method m, MethodCall mc1, MethodCall mc2
where mc1.getTarget().hasQualifiedName("System.Collections.Generic.List", "Add") and
      mc2.getTarget().hasQualifiedName("System.Collections.Generic.List", "Add") and
      mc1.getEnclosingCallable() = m and
      mc2.getEnclosingCallable() = m and
      mc1.getArgument(0) = mc2.getArgument(0) and
      mc1 != mc2
select m, "Este método contiene múltiples llamadas a List<T>.Add con el mismo argumento."
