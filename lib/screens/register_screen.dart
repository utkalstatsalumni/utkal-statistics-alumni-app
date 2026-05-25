import 'package:flutter/material.dart';
import '../models/alumni_user.dart';
import '../services/alumni_repository.dart';
import 'pending_approval_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passingYearController = TextEditingController();
  final TextEditingController currentJobController = TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController photoReferenceController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  DateTime? selectedDateOfBirth;
  final Set<String> selectedHobbies = <String>{};

  static const List<String> hobbyOptions = [
    'Teaching',
    'Research',
    'Data Science',
    'Public Service',
    'Mentoring',
    'Entrepreneurship',
    'Sports',
    'Music',
    'Travel',
    'Events',
  ];

  @override
  void dispose() {
    nameController.dispose();
    dobController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passingYearController.dispose();
    currentJobController.dispose();
    specializationController.dispose();
    photoReferenceController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _pickDateOfBirth() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(1995),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );

    if (selectedDate == null) return;

    setState(() {
      selectedDateOfBirth = selectedDate;
      dobController.text =
          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
    });
  }

  void _submitRegistration() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final user = AlumniUser(
      name: nameController.text.trim(),
      dateOfBirth: selectedDateOfBirth!,
      passingYear: passingYearController.text.trim(),
      currentJob: currentJobController.text.trim(),
      specialization: specializationController.text.trim(),
      hobbies: selectedHobbies.toList()..sort(),
      photoReference: photoReferenceController.text.trim(),
      address: addressController.text.trim(),
      mobileNumber: mobileController.text.trim(),
      email: emailController.text.trim(),
      status: ApprovalStatus.pending,
      createdAt: DateTime.now(),
    );

    AlumniRepository.registerUser(user);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PendingApprovalScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Create Your Account',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter your full name';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),
              TextFormField(
                controller: dobController,
                readOnly: true,
                onTap: _pickDateOfBirth,
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                  prefixIcon: Icon(Icons.cake),
                ),
                validator: (_) {
                  if (selectedDateOfBirth == null) {
                    return 'Select your date of birth';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  final email = value?.trim() ?? '';
                  if (email.isEmpty) {
                    return 'Enter your email';
                  }
                  if (!email.contains('@')) {
                    return 'Enter a valid email';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  final mobile = value?.trim() ?? '';
                  if (mobile.isEmpty) {
                    return 'Enter your mobile number';
                  }
                  if (mobile.length < 10) {
                    return 'Enter a valid mobile number';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: passingYearController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Passing Year',
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                validator: (value) {
                  final year = int.tryParse(value ?? '');
                  final currentYear = DateTime.now().year;
                  if (year == null) {
                    return 'Enter your passing year';
                  }
                  if (year < 1943 || year > currentYear + 5) {
                    return 'Enter a valid passing year';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),
              TextFormField(
                controller: currentJobController,
                decoration: const InputDecoration(
                  labelText: 'Current Job / Role',
                  prefixIcon: Icon(Icons.work),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter your current job or role';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),
              TextFormField(
                controller: specializationController,
                decoration: const InputDecoration(
                  labelText: 'Specialization',
                  prefixIcon: Icon(Icons.school),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter your specialization';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hobbies and Interests',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final hobby in hobbyOptions)
                    FilterChip(
                      label: Text(hobby),
                      selected: selectedHobbies.contains(hobby),
                      onSelected: (isSelected) {
                        setState(() {
                          if (isSelected) {
                            selectedHobbies.add(hobby);
                          } else {
                            selectedHobbies.remove(hobby);
                          }
                        });
                      },
                    ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: photoReferenceController,
                decoration: const InputDecoration(
                  labelText: 'Photo Reference',
                  helperText: 'For now, enter file name or leave blank.',
                  prefixIcon: Icon(Icons.photo_camera),
                ),
              ),

              const SizedBox(height: 20),
              TextFormField(
                controller: addressController,
                minLines: 2,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  prefixIcon: Icon(Icons.location_on),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter your address';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Use at least 6 characters';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitRegistration,
                child: const Text('Submit for Admin Approval'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
