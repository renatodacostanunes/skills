import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills/STATE_MANAGERS/CRUD_BLOC_CUBIT/controller_bloc_cubit.dart';
import 'package:skills/STATE_MANAGERS/CRUD_BLOC_CUBIT/person_states.dart';

class CrudPageBlocCubit extends StatelessWidget {
  CrudPageBlocCubit({super.key});

  final formKey = GlobalKey<FormState>();
  final formKeyEditPerson = GlobalKey<FormState>();
  final personFieldController = TextEditingController();
  final personEditFieldController = TextEditingController();
  final controller = ControllerBlocCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crud Page Bloc Cubit')),
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
                              }()
                            : null;
                      },
                      icon: const Icon(Icons.add)),
                  const SizedBox(width: 24.0),
                  TextButton(
                    onPressed: () => controller.deleteSelected(),
                    child: const Text("Delete selected"),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              BlocBuilder<ControllerBlocCubit, PersonStates>(
                bloc: controller,
                builder: (context, state) {
                  if (state is PersonInitialState) return const Text("No people added");
                  if (state is PersonLoaded) {
                    return Column(
                      children: [
                        ...List.generate(
                          controller.listPerson.length,
                          (index) => Row(
                            children: [
                              Checkbox(
                                value: controller.listPerson[index].selected,
                                onChanged: (value) => controller.selectedPerson(index, value!),
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
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () => controller.deletePerson(index),
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: Text("Unexpected error"));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
