import 'dart:collection';

import 'package:flutter/material.dart';

void main() {
  runApp(RadioButton());
}

class RadioButton extends StatelessWidget {
  @override
  Widget build(Object context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Widgets de Inputs")),
        body: Column(
          children: [
            RadioButtonExample(),
            CheckBoxExample(),
            SliderExample(),
            SwitchExample(),
            DropdownButtonExample(),
            DropdownMenuExample(),
            DatePickerExample(),
            TimePickerExample()
          ],
        ),
      ),
    );
  }
}

//Radio button Começa aqui
enum SingingCharacter {
  lafayette,
  jefferson,
} //Enum para ser passado para os radios

class RadioButtonExample extends StatefulWidget {
  const RadioButtonExample({super.key});
  @override
  State<RadioButtonExample> createState() {
    return _RadioExampleState();
  }
}

class _RadioExampleState extends State<RadioButtonExample> {
  //Grupo dos radios
  SingingCharacter? _character =
      SingingCharacter.lafayette; //variavel que controla o que está selecionado

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          //Radio 1
          title: const Text('Lafayette'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          //Radio 1
          title: const Text('Jefferson'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged:
                (SingingCharacter? value) => {
                  print(
                    value,
                  ), //Value é o valor que o usuário deixou quando ele realiza uma açao no aplicativo
                  setState(() {
                    _character = value;
                  }),
                },
          ),
        ),
      ],
    );
  }
}

//CheckBOX
class CheckBoxExample extends StatefulWidget {
  @override
  State<CheckBoxExample> createState() {
    return _CheckBoxState();
  }
}

class _CheckBoxState extends State<CheckBoxExample> {
  bool isChecked = false;
  @override
  Widget build(Object context) {
    return Column(
      children: [
        Checkbox(
          checkColor: Colors.white, //Cor da check dentro do checkbox
          value: isChecked, //Define se está checado ou nao
          onChanged:
              (bool? value) => {
                print(
                  value,
                ), //Value é o valor que o usuário deixou quando ele realiza uma açao no aplicativo
                //Recebe o valor do checkbox
                setState(() {
                  isChecked = value!; //Altera o check
                }),
              },
        ),
      ],
    );
  }
}

//Slider
class SliderExample extends StatefulWidget {
  @override
  State<SliderExample> createState() {
    return _SlideExampleState();
  }
}

class _SlideExampleState extends State<SliderExample> {
  double _valorAtualSlider = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _valorAtualSlider,
      max: 100,
      onChanged:
          (double value) => {
            print(
              value,
            ), //Value é o valor que o usuário deixou quando ele realiza uma açao no aplicativo
            setState(() {
              _valorAtualSlider = value;
            }),
          },
    );
  }
}

//Switch
class SwitchExample extends StatefulWidget {
  @override
  State<SwitchExample> createState() {
    return _SwitchExampleState();
  }
}

class _SwitchExampleState extends State<SwitchExample> {
  bool estaAtivo = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Padding(padding: EdgeInsets.all(20)),
          Switch(
            value: estaAtivo,
            onChanged: (bool valor) {
              print(
                valor,
              ); //Valor é o valor que o usuário deixou quando ele realiza uma açao no aplicativo
              setState(() {
                estaAtivo = valor;
              });
            },
          ),
          Text("Deseja receber informaçoes sobre nossos serviços?"),
        ],
      ),
    );
  }
}

//DropDownButton

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      //Botao DropDOWN
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(height: 2, color: Colors.deepPurpleAccent),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
        print(value);
      },
      items:
          list.map<DropdownMenuItem<String>>((String value) {
            //Criando os DropdownItens
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
    );
  }
}

//Outro tipo de dropdown
class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  static final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  );
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: menuEntries,
    );
  }
}


//Date Picker
class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  DateTime? selectedDate;

  //Cria uma função assíncrona e tem seu retorno como Future, que é um valor
  //que fica em stand by esperando uma resposta
  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2021, 7, 25),
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 20,
      children: <Widget>[
        Text(
          selectedDate != null
              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
              : 'No date selected',
        ),
        OutlinedButton(onPressed: _selectDate, child: const Text('Select Date')),
      ],
    );
  }
}


//Time picker
class TimePickerExample extends StatefulWidget {
  @override
  _TimePickerExampleState createState() => _TimePickerExampleState();
}

class _TimePickerExampleState extends State<TimePickerExample> {
  TimeOfDay _selectedTime = TimeOfDay.now(); // Inicializa com o horário atual

  //Time Picker async function
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Text(
              'Horário selecionado: ${_selectedTime.format(context)}',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Selecionar Horário'),
            ),
          ],
        );
  }
}