import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((dependente) => dependente.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((funcionario) => funcionario.toJson()).toList(),
    };
  }
}

void main() {
  
  Dependente dep1 = Dependente("Lucia");
  Dependente dep2 = Dependente("Carlos");
  Dependente dep3 = Dependente("Fabiana");
  
 
  Funcionario func1 = Funcionario("Tiago", [dep1, dep2]);
  Funcionario func2 = Funcionario("Fernanda", [dep3]);
  

  
 
  List<Funcionario> funcionarios = [func1, func2];
  
  
  EquipeProjeto equipe = EquipeProjeto("Projeto Vex", funcionarios);
  
 
  String json = jsonEncode(equipe.toJson());
  print(json);
}
