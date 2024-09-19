import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skills/STATE_MANAGERS/CRUD_PROVIDER/controller_provider.dart';

class CrudPageProvider extends StatelessWidget {
  CrudPageProvider({super.key});

  final formKey = GlobalKey<FormState>();
  final formKeyEditPerson = GlobalKey<FormState>();
  final personFieldController = TextEditingController();
  final personEditFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final providerRead = context.read<ControllerProvider>();
    final providerWatch = context.read<ControllerProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Crud Page Provider')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        controller: personFieldController,
                        validator: (value) {
                          if (value?.isEmpty ?? false) return "Field cannot be empty";
                          return null;
                        },
                        decoration: const InputDecoration(hintText: "Add a person"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24.0),
                  IconButton(
                      onPressed: () {
                        formKey.currentState?.validate() ?? false
                            ? () {
                                providerRead.addPerson(personFieldController.text);
                                personFieldController.clear();
                              }()
                            : null;
                      },
                      icon: const Icon(Icons.add)),
                  const SizedBox(width: 24.0),
                  TextButton(
                    onPressed: () => providerRead.deleteSelected(),
                    child: const Text("Delete selected"),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              providerWatch.listPerson.isEmpty ? const Text("No people added") : const SizedBox.shrink(),
              ...List.generate(
                providerWatch.listPerson.length,
                (index) => Row(
                  children: [
                    Checkbox(
                      value: providerWatch.listPerson[index].selected,
                      onChanged: (value) => providerRead.selectedPerson(index, value!),
                    ),
                    Text(providerWatch.listPerson[index].name),
                    const Spacer(),
                    IconButton(
                      onPressed: () async {
                        personEditFieldController.text = providerRead.listPerson[index].name;
                        await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Edit name"),
                            content: Form(
                              key: formKeyEditPerson,
                              child: TextFormField(
                                controller: personEditFieldController,
                                validator: (value) {
                                  if (value?.isEmpty ?? false) return "Field cannot be empty";
                                  return null;
                                },
                                decoration: const InputDecoration(hintText: "Add a person"),
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text("Cancel"),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text("Edit"),
                                onPressed: () {
                                  formKeyEditPerson.currentState?.validate() ?? false
                                      ? () {
                                          context
                                              .read<ControllerProvider>()
                                              .editPerson(index, personEditFieldController.text);
                                          Navigator.of(context).pop();
                                        }()
                                      : null;
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () => providerRead.deletePerson(index),
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
