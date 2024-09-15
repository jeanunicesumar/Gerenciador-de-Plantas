import 'package:flutter/material.dart';
import 'package:gerenciador_planta/models/irrigacao.dart';
import 'package:gerenciador_planta/models/planta.dart';
import 'package:gerenciador_planta/utils/form_utils.dart';
import 'package:gerenciador_planta/utils/header.dart';
import 'package:provider/provider.dart';

class FormPlanta extends StatefulWidget {
  const FormPlanta({super.key});

  @override
  State<StatefulWidget> createState() => FormPlantaState();
}

class FormPlantaState extends State<FormPlanta> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController irrigationTimeController = TextEditingController();
  TextEditingController irrigationDurationController = TextEditingController();
  TextEditingController waterFlowController = TextEditingController();

  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        irrigationTimeController.text = _selectedTime.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          color: const Color.fromARGB(240, 22, 22, 22),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Header.buildTextWithContext(context),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      FormUtils.buildTitleForm(
                        "Informações da planta",
                        Icons.description_outlined,
                        Colors.green[100]!,
                      ),
                      FormUtils.buildDefaultInput(
                        'Informe um nome para planta',
                        'Nome',
                        Colors.green[100]!,
                        Colors.green[100]!,
                        Icons.forest_outlined,
                        nameController,
                      ),
                      FormUtils.buildDefaultInput(
                        'Informe uma descrição',
                        'Descrição',
                        Colors.green[100]!,
                        Colors.green[100]!,
                        Icons.description_outlined,
                        descriptionController,
                      ),
                      FormUtils.buildDefaultInput(
                        'Informe uma região',
                        'Região',
                        Colors.green[100]!,
                        Colors.green[100]!,
                        Icons.pin_drop_outlined,
                        regionController,
                      ),
                      FormUtils.buildDefaultInput(
                        'Informe um tipo',
                        'Tipo de planta',
                        Colors.green[100]!,
                        Colors.green[100]!,
                        Icons.type_specimen_outlined,
                        typeController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe uma imagem';
                            }
                            return null;
                          },
                          onChanged: (text) => setState(() {}),
                          controller: imageController,
                          style: TextStyle(color: Colors.green[100]),
                          decoration: FormUtils.buildDecoration(
                            'Imagem(URL)',
                            Colors.green[100]!,
                            Colors.green[100]!,
                            Icons.image_outlined,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              imageController.text,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Image.asset(
                                    "assets/images/no-image.png");
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      FormUtils.buildTitleForm(
                        "Informações de Irrigação",
                        Icons.description_outlined,
                        Colors.green[100]!,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TextFormField(
                          controller: irrigationTimeController,
                          readOnly: true,
                          style: TextStyle(color: Colors.green[100]),
                          decoration: InputDecoration(
                            labelText: 'Escolha o horário de Irrigação',
                            labelStyle: TextStyle(color: Colors.green[100]),
                            icon: IconButton(
                              icon: Icon(
                                Icons.access_time,
                                color: Colors.green[100],
                              ),
                              onPressed: () => _selectTime(context),
                            ),
                            hintStyle: TextStyle(color: Colors.green[100]),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green[100]!),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green[100]!),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green[100]!),
                            ),
                          ),
                        ),
                      ),
                      FormUtils.buildDefaultInput(
                        'Informe o tempo de irrigação',
                        'Tempo de irrigação',
                        Colors.green[100]!,
                        Colors.green[100]!,
                        Icons.water_drop_outlined,
                        irrigationDurationController,
                      ),
                      FormUtils.buildDefaultInput(
                        'Informe a vazão de água por minuto',
                        'Vazão de água',
                        Colors.green[100]!,
                        Colors.green[100]!,
                        Icons.tsunami_outlined,
                        waterFlowController,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final planta = Planta(
                                nome: nameController.text,
                                descricao: descriptionController.text,
                                regiao: regionController.text,
                                tipo: typeController.text,
                                url: imageController.text,
                                irrigacao: Irrigacao(
                                  horario: irrigationTimeController.text,
                                  tempo: int.tryParse(
                                          irrigationDurationController.text) ??
                                      0,
                                  vazao:
                                      int.tryParse(waterFlowController.text) ??
                                          0,
                                ),
                              );

                              Provider.of<PlantaProvider>(context, listen: false)
                                  .adicionarDados(planta);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  showCloseIcon: true,
                                  backgroundColor: Color.fromARGB(0, 147, 184, 148),
                                  content: Text("Planta salva"),
                                ),
                              );

                              Navigator.pop(context);
                            }
                          },
                          style: ButtonStyle(
                            maximumSize: WidgetStateProperty.all(
                              const Size(double.infinity, 40),
                            ),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.all(
                                    Radius.circular(10)),
                              ),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.send),
                              SizedBox(width: 5),
                              Text("Salvar")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
