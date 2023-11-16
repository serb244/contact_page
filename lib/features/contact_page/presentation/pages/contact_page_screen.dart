import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/presentation/widgets/appbars/small_appbar.dart';
import '../../../../core/presentation/widgets/forms/form_button.dart';
import '../../../../core/presentation/widgets/forms/form_field.dart';
import '../../../../core/validators/validator.dart';
import '../../../../injector.dart';
import '../../domain/entities/contact_form_entity.dart';
import '../manager/contact_page_bloc.dart';

class ContactPageScreen extends StatelessWidget {
  const ContactPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactPageBloc>(
      create: (_) => injector<ContactPageBloc>(),
      child: const ContactForm(),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isButtonDisabled = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SmallAppBar(
        title: AppTexts.contactPageTitle,
        automaticallyImplyLeading: true,
      ),
      body: BlocConsumer<ContactPageBloc, ContactPageState>(
        listener: (context, state) {
          if (state is ContactPageErrorState || state is ContactPageSuccessState) {
            String? message = state.message;
            if (message != null) {
              _showSnackBar(message);
            }
          }
        },
        builder: (context, state) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.formMainPadding),
            child: Form(
              key: _formKey,
              onChanged: _onFormDataChanged,
              child: Column(
                children: [
                  AppFormField(
                    controller: _nameController,
                    validator: Validator.validateName,
                    labelText: AppTexts.contactName,
                    enabled: state is! ContactPageLoadingState,
                  ),
                  const Gap(AppSizes.formVerticalPadding),
                  AppFormField(
                    controller: _emailController,
                    validator: Validator.validateEmail,
                    labelText: AppTexts.contactEmail,
                    enabled: state is! ContactPageLoadingState,
                  ),
                  const Gap(AppSizes.formVerticalPadding),
                  AppFormField(
                    controller: _messageController,
                    validator: Validator.validateMessage,
                    labelText: AppTexts.contactMessage,
                    enabled: state is! ContactPageLoadingState,
                  ),
                  const Gap(AppSizes.formVerticalPadding),
                  AppFormButton(
                    onPressed:
                        _isButtonDisabled || state is ContactPageLoadingState ? null : _onSubmit,
                    text: state is ContactPageLoadingState
                        ? AppTexts.contactEnterWait
                        : AppTexts.contactSubmitButtonText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      ContactFormEntity contactFormData = ContactFormEntity(
        name: _nameController.text,
        email: _emailController.text,
        message: _messageController.text,
      );
      context.read<ContactPageBloc>().add(
            ContactPageSendFormEvent(contactFormData),
          );
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _onFormDataChanged() {
    setState(() {
      _isButtonDisabled = !_formKey.currentState!.validate();
    });
  }
}
