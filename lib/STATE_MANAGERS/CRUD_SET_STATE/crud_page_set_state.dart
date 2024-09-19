import 'package:flutter/material.dart';
import 'package:skills/STATE_MANAGERS/CRUD_SET_STATE/controller_set_state.dart';

class CrudPageSetState extends StatefulWidget {
  const CrudPageSetState({super.key});

  @override
  State<CrudPageSetState> createState() => _CrudPageSetStateState();
}

class _CrudPageSetStateState extends State<CrudPageSetState> {
  final formKey = GlobalKey<FormState>();
  final formKeyEditPerson = GlobalKey<FormState>();
  final personFieldController = TextEditingController();
  final personEditFieldController = TextEditingController();
  final controller = ControllerSetState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crud Page Set State')),
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
                                controller.addPerson(personFieldController.text);
                                personFieldController.clear();
                                setState(() {});
                              }()
                            : null;
                      },
                      icon: const Icon(Icons.add)),
                  const SizedBox(width: 24.0),
                  TextButton(
                    onPressed: () => setState(() => controller.deleteSelected()),
                    child: const Text("Delete selected"),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              controller.listPerson.isEmpty ? const Text("No people added") : const SizedBox.shrink(),
              ...List.generate(
                controller.listPerson.length,
                (index) => Row(
                  children: [
                    Checkbox(
                      value: controller.listPerson[index].selected,
                      onChanged: (value) => setState(() => controller.selectedPerson(index, value!)),
                    ),
                    Text(controller.listPerson[index].name),
                    const Spacer(),
                    IconButton(
                      onPressed: () async {
                        personEditFieldController.text = controller.listPerson[index].name;
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
                                          controller.editPerson(index, personEditFieldController.text);
                                          Navigator.of(context).pop();
                                        }()
                                      : null;
                                },
                              ),
                            ],
                          ),
                        );
                        setState(() {});
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () => setState(() => controller.deletePerson(index)),
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
