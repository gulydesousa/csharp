import csharp

class DuplicatedElements extends Method {
  DuplicatedElements() {
    // Encuentra todas las funciones en el código
    this.getName() != ""
  }

  // Predicado para encontrar llamadas al método Add en listas
  predicate addCall(DataFlow::Node source, DataFlow::Node sink) {
    exists(MethodInvocation add | 
      source.asExpr() = add.getAnArgument() and
      sink.asExpr() = add and
      add.getTarget().getName() = "Add"
    )
  }

  // Predicado para encontrar elementos duplicados en una lista
  predicate findDuplicates(DataFlow::Node listNode) {
    exists(DataFlow::Node first, DataFlow::Node second |
      addCall(first, listNode) and
      addCall(second, listNode) and
      first.asExpr().getArgument(0).getValue() = second.asExpr().getArgument(0).getValue() and
      first != second
    )
  }

  // Encuentra llamadas al método en la función actual que contienen elementos duplicados
  from MethodInvocation call, DataFlow::Node sink
  where
    call.getEnclosingMethod().(DuplicatedElements) and
    addCall(call, sink) and
    findDuplicates(sink)
  select call, sink
}

// Esto vincula el predicado a la consulta en la base de código
predicate test() {
  exists(DuplicatedElements duplicatedElements | duplicatedElements.findDuplicates(_))
}

// Ejecutar la consulta
select test()
