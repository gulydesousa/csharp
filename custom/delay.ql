 /**
 * @name Uso de Task.Delay en métodos
 * @description Encuentra los métodos que contienen llamadas a Task.Delay, lo que puede indicar un retraso artificial en la ejecución.
 * @kind problem
 * @problem.severity warning
 * @precision high
 * @id csharp/task-delay-in-methods
 * @tags efficiency
 *       maintainability
 */


 import csharp

 from Method m, MethodCall mc
 where mc.getTarget().hasFullyQualifiedName("System.Threading.Tasks.Task", "Delay")
   and mc.getEnclosingCallable() = m
 select m, "This method contains a delay."
 
