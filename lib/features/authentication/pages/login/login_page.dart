import 'package:ecommerce_flutter/features/authentication/pages/signup/signup_page.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = true;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
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
                    _buildEmailField(context),
                    const SizedBox(height: 16),
                    _buildPasswordField(context),
                    const SizedBox(height: 16),
                    _buildRememberForgotRow(context),
                    const SizedBox(height: 32),
                    _buildActionButtons(context),
                    const SizedBox(height: 36),
                    const _SocialDivider(label: 'Or Sign In With'),
                    const SizedBox(height: 16),
                    const Center(child: _GoogleSignInButton()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Text(
            'Welcome.',
            style: textTheme.headlineLarge,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Discover Limitless Choices and Unmatched Convenience.',
          style: textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.email],
      decoration: _inputDecoration(
        context,
        hintText: 'Email',
        prefixIcon: CupertinoIcons.envelope,
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      obscureText: _obscurePassword,
      textInputAction: TextInputAction.done,
      autofillHints: const [AutofillHints.password],
      decoration: _inputDecoration(
        context,
        hintText: 'Password',
        prefixIcon: CupertinoIcons.lock,
        suffixIcon: IconButton(
          tooltip: _obscurePassword ? 'Show password' : 'Hide password',
          onPressed: _togglePasswordVisibility,
          icon: Icon(
            _obscurePassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
            color: colorScheme.onSurfaceVariant,
            size: 22,
          ),
        ),
      ),
    );
  }

  Widget _buildRememberForgotRow(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: _rememberMe,
            activeColor: colorScheme.primary,
            checkColor: colorScheme.onPrimary,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: BorderSide(
              color: colorScheme.outlineVariant,
            ),
            onChanged: _setRememberMe,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'Remember Me',
          style: textTheme.labelLarge?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 32),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            textStyle: textTheme.labelLarge,
          ),
          child: const Text('Forgot Password?'),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Sign In'),
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupPage()),
            );
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: colorScheme.onSurface,
            side: BorderSide(
              color: colorScheme.outlineVariant,
            ),
          ),
          child: const Text('Create Account'),
        ),
      ],
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _setRememberMe(bool? value) {
    setState(() {
      _rememberMe = value ?? false;
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

class _SocialDivider extends StatelessWidget {
  const _SocialDivider({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Expanded(child: Divider(color: colorScheme.outlineVariant)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Expanded(child: Divider(color: colorScheme.outlineVariant)),
      ],
    );
  }
}

class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.surface,
      shape: CircleBorder(
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {},
        child: SizedBox.square(
          dimension: 56,
          child: Center(
            child: Text(
              'G',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: colorScheme.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
