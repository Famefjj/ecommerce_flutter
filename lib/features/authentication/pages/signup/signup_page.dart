import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _acceptTerms = true;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Scaffold(
      appBar: AppBar(
        leading: _buildBackButton(context),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 28, 24, 28 + bottomInset),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: AutofillGroup(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 32),
                  _buildNameFields(context),
                  const SizedBox(height: 16),
                  _buildUsernameField(context),
                  const SizedBox(height: 16),
                  _buildEmailField(context),
                  const SizedBox(height: 16),
                  _buildPhoneField(context),
                  const SizedBox(height: 16),
                  _buildPasswordField(context),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Create Account'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () => Navigator.of(context).maybePop(),
        icon: const Icon(CupertinoIcons.chevron_back),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Text(
        "Create Account.",
        style: textTheme.headlineLarge,
      ),
    );
  }

  Widget _buildNameFields(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final firstNameField = _buildTextField(
          context,
          hintText: 'First Name',
          prefixIcon: CupertinoIcons.person,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.givenName],
        );
        final lastNameField = _buildTextField(
          context,
          hintText: 'Last Name',
          prefixIcon: CupertinoIcons.person,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.familyName],
        );

        if (constraints.maxWidth < 360) {
          return Column(
            children: [
              firstNameField,
              const SizedBox(height: 16),
              lastNameField,
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: firstNameField),
            const SizedBox(width: 14),
            Expanded(child: lastNameField),
          ],
        );
      },
    );
  }

  Widget _buildUsernameField(BuildContext context) {
    return _buildTextField(
      context,
      hintText: 'Username',
      prefixIcon: CupertinoIcons.person_badge_plus,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.username],
      autocorrect: false,
      enableSuggestions: false,
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return _buildTextField(
      context,
      hintText: 'Email',
      prefixIcon: CupertinoIcons.envelope,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.email],
      autocorrect: false,
      enableSuggestions: false,
      spellCheckConfiguration: const SpellCheckConfiguration.disabled(),
    );
  }

  Widget _buildPhoneField(BuildContext context) {
    return _buildTextField(
      context,
      hintText: 'Phone Number',
      prefixIcon: CupertinoIcons.phone,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.telephoneNumber],
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return _buildTextField(
      context,
      hintText: 'Password',
      prefixIcon: CupertinoIcons.lock,
      obscureText: _obscurePassword,
      textInputAction: TextInputAction.done,
      autofillHints: const [AutofillHints.newPassword],
      autocorrect: false,
      enableSuggestions: false,
      suffixIcon: IconButton(
        tooltip: _obscurePassword ? 'Show password' : 'Hide password',
        onPressed: _togglePasswordVisibility,
        icon: Icon(
          _obscurePassword
              ? CupertinoIcons.eye_slash
              : CupertinoIcons.eye,
          color: colorScheme.onSurfaceVariant,
          size: 22,
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required String hintText,
    required IconData prefixIcon,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    Iterable<String>? autofillHints,
    bool obscureText = false,
    bool autocorrect = true,
    bool enableSuggestions = true,
    SpellCheckConfiguration? spellCheckConfiguration,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      obscureText: obscureText,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      spellCheckConfiguration: spellCheckConfiguration,
      decoration: _inputDecoration(
        context,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  InputDecoration _inputDecoration(
    BuildContext context, {
    required String hintText,
    required IconData prefixIcon,
    Widget? suffixIcon,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: colorScheme.outlineVariant),
    );

    return InputDecoration(
      hintText: hintText,
      hintStyle: theme.textTheme.titleMedium?.copyWith(
        color: colorScheme.onSurface,
      ),
      prefixIcon: Icon(
        prefixIcon,
        color: colorScheme.onSurfaceVariant,
        size: 22,
      ),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: colorScheme.surface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 18,
      ),
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: BorderSide(color: colorScheme.primary, width: 1.4),
      ),
      errorBorder: border.copyWith(
        borderSide: BorderSide(color: colorScheme.error),
      ),
      focusedErrorBorder: border.copyWith(
        borderSide: BorderSide(color: colorScheme.error, width: 1.4),
      ),
    );
  }
}
