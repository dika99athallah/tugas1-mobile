import 'package:flutter/material.dart';
import 'profile3.dart'; // Import profile3.dart

class Profile2 extends StatefulWidget {
  final int selectedWeight;
  const Profile2({super.key, required this.selectedWeight});

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize default values
    nameController.text = 'Ariane';
    emailController.text = 'ariane@mail.com';
    genderController.text = 'Female';
    dobController.text = '30 May 1994';
    heightController.text = '165';
    weightController.text = widget.selectedWeight.toString();
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the widget tree
    nameController.dispose();
    emailController.dispose();
    genderController.dispose();
    dobController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF20223F),
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileHeader(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 42.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileForm(
                      nameController: nameController,
                      emailController: emailController,
                      genderController: genderController,
                      dobController: dobController,
                      heightController: heightController,
                      weightController: weightController,
                    ),
                    const SizedBox(height: 20),
                    SaveButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => profile3(
                              selectedWeight: int.parse(weightController.text),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    const BottomNavigationWidget(),
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

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 61, bottom: 30),
      child: Center(
        child: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/Mask-group.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController genderController;
  final TextEditingController dobController;
  final TextEditingController heightController;
  final TextEditingController weightController;

  const ProfileForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.genderController,
    required this.dobController,
    required this.heightController,
    required this.weightController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(label: 'Nama', controller: nameController, icon: 'UserWhite.png'),
        const SizedBox(height: 20),
        _buildTextField(label: 'Email', controller: emailController, icon: 'Gmail.png'),
        const SizedBox(height: 20),
        _buildTextField(label: 'Gender', controller: genderController, icon: 'Gender.png'),
        const SizedBox(height: 20),
        _buildTextField(label: 'Date of Birth', controller: dobController, icon: 'calendar-event.png'),
        const SizedBox(height: 20),
        _buildTextField(label: 'Height', controller: heightController, icon: 'Rectangle.png', isNumber: true),
        const SizedBox(height: 20),
        _buildTextField(label: 'Weight', controller: weightController, icon: 'Rectangle.png', isNumber: true),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String icon,
    bool isNumber = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: ShapeDecoration(
            color: const Color(0xFF272E49),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                'images/$icon',
                width: 16,
                height: 16,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, color: Colors.white, size: 16);
                },
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: isNumber ? TextInputType.number : TextInputType.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
              if (label == 'Nama' || label == 'Email')
                Image.asset(
                  'images/pen.png',
                  width: 15,
                  height: 15,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.edit, color: Colors.white, size: 15);
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: ShapeDecoration(
          color: const Color(0xFF009090),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Center(
          child: Text(
            'Save',
            style: TextStyle(
              color: Color(0xFFFBFBFB),
              fontSize: 18,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xFF272E49),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 40,
            top: 20,
            child: _buildNavItem('Jurnal Tidur', 'Jurnal.png', const Color(0xFF627EAE)),
          ),
          Positioned(
            left: 190,
            top: 20,
            child: _buildNavItem('Sleep', 'Sleep.png', const Color(0xFF627EAE)),
          ),
          Positioned(
            left: 340,
            top: 20,
            child: _buildNavItem('Profile', 'UserYellow.png', const Color(0xFFFBFBFB)),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, String icon, Color textColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/$icon',
          width: 25,
          height: 25,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.image, size: 25, color: Colors.white);
          },
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 11,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}